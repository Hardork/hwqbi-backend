package com.hwq.dataloom.utils.datasource;

import cn.hutool.core.collection.CollUtil;
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.hwq.dataloom.constant.UserDataConstant;
import com.hwq.dataloom.framework.errorcode.ErrorCode;
import com.hwq.dataloom.framework.exception.BusinessException;
import com.hwq.dataloom.model.dto.datasource.TableFieldInfo;
import com.hwq.dataloom.model.enums.TableFieldTypeEnum;
import com.hwq.dataloom.mongo.entity.ChartData;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * @author HWQ
 * @date 2024/9/6 20:17
 * @description mongoDB执行引擎
 */
@Component
@Slf4j
public class MongoEngineUtils {


    @Resource
    private MongoTemplate mongoTemplate;

    /**
     * 将用户上传的Excel保存到Mongo中
     * @param multipartFile
     * @param id
     */
    @Deprecated
    public List<TableFieldInfo> saveDataToMongo(MultipartFile multipartFile, Long id) {
        // 读取数据
        List<Map<Integer, String>> list = null;
        try {
            list = EasyExcel.read(multipartFile.getInputStream())
                    .excelType(ExcelTypeEnum.XLSX)
                    .sheet()
                    .headRowNumber(0)
                    .doReadSync();
        } catch (IOException e) {
            log.error("表格处理错误", e);
        }
        if (CollUtil.isEmpty(list)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "表格数据为空");
        }
        LinkedHashMap<Integer, String> headerMap = (LinkedHashMap) list.get(0);
        // 取出表头
        List<String> headerList = new ArrayList<>(headerMap.values());
        // 校验表头是否包含特殊字符
        DBColumnValidator.validateColumnNames(headerList);
        // 存储字段头
        List<TableFieldInfo> fields = new ArrayList<>();
        // 初始化表头字段
        for (String s : headerList) {
            TableFieldInfo tableFiled = new TableFieldInfo();
            tableFiled.setFieldType(null);
            tableFiled.setName(s);
            tableFiled.setOriginName(s);
            fields.add(tableFiled);
        }

        // 统计字数
        try {
            List<ChartData> insertData = new ArrayList<>();
            // 获取封装后的数据
            for (int i = 1; i < list.size(); i++) {
                LinkedHashMap<Integer, String> dataMap = (LinkedHashMap) list.get(i); // [1, 2]
                // dataList存储当前行所有列的数据
                List<String> dataList = new ArrayList<>(dataMap.values());
                // 校验数据类型
                // 遍历每一个元素
                for (int j = 0; j < dataList.size(); j++) {
                    if (j < headerList.size()) {
                        cellType(dataList.get(j), fields.get(j));
                    }
                }
                ChartData chartData = getDataMap(headerList, dataList);
                if (chartData != null) insertData.add(chartData);
            }
            // 插入数据
            insertMongoDB(id, insertData);
        } catch (Exception e) {
            log.error(e.getMessage());
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "请根据文件规范，检查上传文件是否正常");
        }
        return fields;
    }

    /**
     * 存储数据源数据到MongoDB
     * @param inputStream
     * @param id
     * @return
     */
    @Deprecated
    public Long saveDataToMongo(InputStream inputStream, Long id) {
        // 读取数据
        List<Map<Integer, String>> list = null;
        list = EasyExcel.read(inputStream)
                .excelType(ExcelTypeEnum.XLSX)
                .sheet()
                .headRowNumber(0)
                .doReadSync();
        if (CollUtil.isEmpty(list)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "表格数据为空");
        }
        LinkedHashMap<Integer, String> headerMap = (LinkedHashMap) list.get(0);
        // 取出表头
        List<String> headerList = new ArrayList<>(headerMap.values());

        // 统计字数
        List<ChartData> insertData = new ArrayList<>();
        // 获取封装后的数据
        for (int i = 1; i < list.size(); i++) {
            LinkedHashMap<Integer, String> dataMap = (LinkedHashMap) list.get(i);
            // dataList存储当前行所有列的数据
            List<String> dataList = new ArrayList<>(dataMap.values());
            ChartData chartData = getDataMap(headerList, dataList);
            if (chartData != null) insertData.add(chartData);
        }
        // 插入数据
        insertMongoDB(id, insertData);
        return id;
    }

    @Deprecated
    public void insertMongoDB(Long chartId, List<ChartData> chartDataList) {
        mongoTemplate.insert(chartDataList, "chart_" + chartId);
    }


    /**
     * 将mongo中的数据转为CSV格式（节约token）
     * @param chartId
     * @return
     */
    @Deprecated
    public String mongoToCSV(Long chartId) {
        List<ChartData> dataList = mongoTemplate.findAll(ChartData.class, UserDataConstant.USER_CHART_DATA_PREFIX + chartId);
        if (dataList.isEmpty()) {
            return "";
        }
        // 获取表头
        ChartData chartData = dataList.get(0);
        Map<String, Object> data = chartData.getData();
        List<String> headerList = new ArrayList<>(data.keySet());
        StringBuilder csvData = new StringBuilder();
        csvData.append(StringUtils.join(headerList, ",")).append("\n");
        for (int i = 0; i < dataList.size(); i++) {
            Map<String, Object> curData = dataList.get(i).getData();
            for (int j = 0; j < headerList.size(); j++) {
                if (j == headerList.size() - 1) {
                    csvData.append(curData.get(headerList.get(j)));
                } else {
                    csvData.append(curData.get(headerList.get(j)));
                    csvData.append(",");
                }
            }
            csvData.append("\n");
        }
        return csvData.toString();
    }

    /**
     * 封装一行的数据成ChartData
     * @param header 标题行
     * @param data 数据行
     * @return
     */
    private ChartData getDataMap(List<String> header, List<String> data) {
        if (header.size() != data.size()) {
            return null;
        }
        HashMap<String, Object> map = new HashMap<>();
        for (int i = 0; i < header.size(); i++) {
            map.put(header.get(i), data.get(i));
        }
        return new ChartData()
                .setData(map);
    }

    /**
     * 表字段类型推断
     * @param value
     * @param tableFieldInfo
     * @return
     */
    private void cellType(String value, TableFieldInfo tableFieldInfo) {
        if (StringUtils.isEmpty(value)) {
            return;
        }
        String type = cellType(value);
        if (tableFieldInfo.getFieldType() == null) {
            tableFieldInfo.setFieldType(type);
        } else {
            if (type.equalsIgnoreCase(TableFieldTypeEnum.TEXT.getValue())) {
                tableFieldInfo.setFieldType(TableFieldTypeEnum.TEXT.getValue());
            }
            if (type.equalsIgnoreCase(TableFieldTypeEnum.DOUBLE.getValue()) && tableFieldInfo.getFieldType().equalsIgnoreCase(TableFieldTypeEnum.BIGINT.getValue())) {
                tableFieldInfo.setFieldType(TableFieldTypeEnum.DOUBLE.getValue());
            }
        }
    }

    /**
     * 表字段类型推断
     * @param value
     * @return
     */
    private String cellType(String value) {
        if(value.length() > 19){
            return TableFieldTypeEnum.TEXT.getValue();
        }
        if (DateTimeValidator.isDateTime(value)) {
            return TableFieldTypeEnum.DATETIME.getValue();
        }
        try {
            Double d = Double.valueOf(value);
            double eps = 1e-10;
            if (d - Math.floor(d) < eps) {
                return TableFieldTypeEnum.BIGINT.getValue();
            } else {
                return TableFieldTypeEnum.DOUBLE.getValue();
            }
        } catch (Exception e2) {
            return TableFieldTypeEnum.TEXT.getValue();
        }
    }
}
