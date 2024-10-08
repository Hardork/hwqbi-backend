package com.hwq.dataloom.mapper;

import com.hwq.dataloom.model.dto.datasource.TableFieldInfo;
import com.hwq.dataloom.model.entity.Chart;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author HWQ
* @description 针对表【chart(图表信息表)】的数据库操作Mapper
* @createDate 2023-09-01 23:03:32
* @Entity com.hwq.springbootinit.model.entity.Chart
*/

public interface ChartMapper extends BaseMapper<Chart> {

    void genChartDataTable(@Param("id") Long id, @Param("headerList") List<TableFieldInfo> headerList);

    void insertDataToChartDataTable(@Param("id") Long id, @Param("headerList") List<String> headerList, @Param("dataList") List<String> dataList);

    void DropTableAfterException(@Param("id") Long id);
}




