package com.hwq.dataloom.service.impl.mongo;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hwq.dataloom.framework.errorcode.ErrorCode;
import com.hwq.dataloom.constant.UserDataConstant;
import com.hwq.dataloom.framework.exception.BusinessException;
import com.hwq.dataloom.framework.exception.ThrowUtils;
import com.hwq.dataloom.model.dto.datasource.TableFieldInfo;
import com.hwq.dataloom.framework.model.entity.User;
import com.hwq.dataloom.model.entity.UserData;
import com.hwq.dataloom.model.entity.UserDataPermission;
import com.hwq.dataloom.model.enums.UserDataPermissionEnum;
import com.hwq.dataloom.model.vo.DataPage;
import com.hwq.dataloom.mongo.entity.ChartData;
import com.hwq.dataloom.mongo.entity.OptionData;
import com.hwq.dataloom.service.MongoService;
import com.hwq.dataloom.service.UserDataPermissionService;
import com.hwq.dataloom.service.UserDataService;
import com.hwq.dataloom.service.UserService;
import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author HWQ
 * @date 2024/4/25 20:04
 * @description
 */
@Service
@Slf4j
public class MongoServiceImpl implements MongoService {
    @Resource
    private UserService userService;
    @Resource
    private UserDataService userDataService;
    @Resource
    private MongoTemplate mongoTemplate;

    @Resource
    private UserDataPermissionService userDataPermissionService;



    @Override
    public DataPage listByPage(Long dataId, ChartData chartData, HttpServletRequest request, long current, long size) {
        User loginUser = userService.getLoginUser(request);
        // 校验参数
        ThrowUtils.throwIf(dataId == null, ErrorCode.PARAMS_ERROR, "dataId不得为空");
        ThrowUtils.throwIf(loginUser == null, ErrorCode.NOT_LOGIN_ERROR);
        // 不可获取他人的数据
        UserData userData = userDataService.getById(dataId);
        ThrowUtils.throwIf(userData == null, ErrorCode.PARAMS_ERROR, "数据不存在");
        checkReadAuth(dataId, loginUser);
        // 转换TableField中的Str->JSON
        String fieldTypeInfo = userData.getFieldTypeInfo();
        List<TableFieldInfo> tableFieldInfos = new ArrayList<>();
        if (!fieldTypeInfo.isEmpty()) {
            tableFieldInfos = JSON.parseObject(fieldTypeInfo, new TypeReference<ArrayList<TableFieldInfo>>() {
            });
        }
        // 根据条件返回数据
        Pageable pageable = PageRequest.of((int) current, (int) size);
        Query query = new Query();
        if (chartData != null) {
            Map<String, Object> params = chartData.getData();
            for (Map.Entry<String, Object> entry : params.entrySet()) {
                if (StringUtils.isEmpty(entry.getKey()) || entry.getValue() == null) {
                    continue;
                }
                query.addCriteria(Criteria.where("data." + entry.getKey()).is(entry.getValue()));
            }
        }
        long total = mongoTemplate.count(query, ChartData.class,"chart_" + dataId);
        query.with(pageable);
        List<ChartData> dataList = mongoTemplate.find(query, ChartData.class, "chart_" + dataId);
        DataPage dataPage = new DataPage();
        dataPage.setTableFieldInfosList(tableFieldInfos);
        dataPage.setDataList(dataList);
        dataPage.setSize(size);
        dataPage.setCurrent(current);
        dataPage.setTotal(total);
        return dataPage;
    }

    @Override
    public Boolean deleteRecordById(Long dataId, String id, HttpServletRequest request) {
        ThrowUtils.throwIf(dataId == null, ErrorCode.PARAMS_ERROR, "数据集id为空");
        ThrowUtils.throwIf(StringUtils.isEmpty(id), ErrorCode.PARAMS_ERROR, "文档id为空");
        User loginUser = userService.getLoginUser(request);
        ThrowUtils.throwIf(loginUser == null, ErrorCode.NOT_LOGIN_ERROR, "未登陆");
        UserData userData = userDataService.getById(dataId);
        ThrowUtils.throwIf(userData == null, ErrorCode.PARAMS_ERROR, "不存在该数据集");
        // 鉴权
        checkWriteAuth(dataId, loginUser);
        // 删除数据
        Query query = new Query();
        query.addCriteria(Criteria.where("_id").is(id));
        DeleteResult remove = mongoTemplate.remove(query, "chart_" + dataId);
        ThrowUtils.throwIf(remove.getDeletedCount() == 0l, ErrorCode.PARAMS_ERROR, "不存在该记录");
        return true;
    }

    @Override
    public Boolean editRecordById(Long dataId, String id, Map<String, Object> data, HttpServletRequest request) {
        ThrowUtils.throwIf(dataId == null, ErrorCode.PARAMS_ERROR, "数据集id为空");
        ThrowUtils.throwIf(StringUtils.isEmpty(id), ErrorCode.PARAMS_ERROR, "文档id为空");
        ThrowUtils.throwIf(data == null, ErrorCode.PARAMS_ERROR, "修改数据不得为空");
        User loginUser = userService.getLoginUser(request);
        ThrowUtils.throwIf(loginUser == null, ErrorCode.NOT_LOGIN_ERROR);
        UserData userData = userDataService.getById(dataId);
        ThrowUtils.throwIf(userData == null, ErrorCode.PARAMS_ERROR, "不存在该数据集");
        // 校验权限
        checkWriteAuth(dataId, loginUser);
        // 删除数据
        Query query = new Query();
        query.addCriteria(Criteria.where("_id").is(id));
        Update update = generateUpdate(data);
        UpdateResult updateResult = mongoTemplate.updateFirst(query, update, "chart_" + dataId);
        if (updateResult.getMatchedCount() == 0l) { // 说明为新增操作
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "数据不存在");
        }
        return true;
    }

    @Override
    public Boolean addOneRecord(Long dataId, Map<String, Object> data, HttpServletRequest request) {
        ThrowUtils.throwIf(dataId == null, ErrorCode.PARAMS_ERROR, "数据集id为空");
        ThrowUtils.throwIf(data == null, ErrorCode.PARAMS_ERROR, "修改数据不得为空");
        User loginUser = userService.getLoginUser(request);
        ThrowUtils.throwIf(loginUser == null, ErrorCode.NOT_LOGIN_ERROR);
        UserData userData = userDataService.getById(dataId);
        ThrowUtils.throwIf(userData == null, ErrorCode.PARAMS_ERROR, "不存在该数据集");
        // 校验权限
        checkWriteAuth(dataId, loginUser);
        // 添加数据
        addOneRecord(data, dataId);
        return true;
    }

    public void checkReadAuth(Long dataId, User loginUser) {
        QueryWrapper<UserDataPermission> qw = new QueryWrapper<>();
        qw.eq("userId", loginUser.getId());
        qw.eq("dataId", dataId);
        UserDataPermission permission = userDataPermissionService.getOne(qw);
        ThrowUtils.throwIf(permission == null || permission.getPermission() < UserDataPermissionEnum.READ.getValue(), ErrorCode.NO_AUTH_ERROR);
    }

    public void checkWriteAuth(Long dataId, User loginUser) {
        QueryWrapper<UserDataPermission> qw = new QueryWrapper<>();
        qw.eq("userId", loginUser.getId());
        qw.eq("dataId", dataId);
        UserDataPermission permission = userDataPermissionService.getOne(qw);
        ThrowUtils.throwIf(permission == null || permission.getPermission() < UserDataPermissionEnum.WRITE.getValue(), ErrorCode.NO_AUTH_ERROR);
    }

    @Override
    public Boolean deleteUserData(Long id) {
        ThrowUtils.throwIf(id == null || id < 0, ErrorCode.PARAMS_ERROR);
        // 删除mongoDB中的数据
        mongoTemplate.dropCollection(UserDataConstant.USER_CHART_DATA_PREFIX + id);
        return true;
    }

    @Override
    public Boolean copyDataToNewCollection(String sourceCollectionName, User user) {
        try {
            Long dataId = userDataService.save(user, "示例数据", "空气质量");
            List<ChartData> dataList = mongoTemplate.findAll(ChartData.class, sourceCollectionName);
            mongoTemplate.insert(dataList, UserDataConstant.USER_CHART_DATA_PREFIX + dataId);
        } catch (Exception e) {
            log.error(e.getMessage());
        }
        return true;
    }

    @Override
    public Boolean saveChartOptionToMongo(Long chartId, String option) {
        ThrowUtils.throwIf(chartId == null, ErrorCode.PARAMS_ERROR, "chartId不得为空");
        OptionData optionData = new OptionData();
        optionData.setChartId(chartId);
        optionData.setOption(option);
        try {
            mongoTemplate.insert(optionData, "chart_option");
        } catch (Exception e) {
            throw new BusinessException(ErrorCode.SYSTEM_ERROR, "插入图表配置失败");
        }
        return true;
    }

    public void addOneRecord(Map<String, Object> data, Long dataId) {
        ChartData chartData = new ChartData();
        chartData.setData(data);
        ChartData insert = mongoTemplate.insert(chartData, "chart_" + dataId);
        System.out.println(insert);
    }

    public Update generateUpdate(Map<String, Object> map) {
        Update update = new Update();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (StringUtils.isEmpty(entry.getKey())) {
                continue;
            }
            update.set("data." + entry.getKey(), entry.getValue());
        }
        return update;
    }
}
