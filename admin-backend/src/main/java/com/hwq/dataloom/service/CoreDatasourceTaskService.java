package com.hwq.dataloom.service;

import com.hwq.dataloom.model.dto.newdatasource.ApiDefinition;
import com.hwq.dataloom.model.dto.newdatasource.DatasourceDTO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hwq.dataloom.model.entity.CoreDatasourceTask;

/**
* @author 25020
* @description 针对表【core_datasource_task(数据源定时同步任务)】的数据库操作Service
* @createDate 2024-08-13 14:45:00
*/
public interface CoreDatasourceTaskService extends IService<CoreDatasourceTask> {

    /**
     * 添加数据源同步任务
     * @param datasourceDTO
     * @return
     */
    Long addTask(DatasourceDTO datasourceDTO,Long datasetTableId,Integer xxlJobId);

    /**
     * 添加Xxl Job定时任务
     *
     * @param datasourceDTO
     * @param apiDefinition
     * @return
     */
    int addXxlJob(DatasourceDTO datasourceDTO, ApiDefinition apiDefinition);

    /**
     * 删除Xxl Job定时任务
     * @param xxlJobId
     * @return
     */
    int deleteXxlJob(Integer xxlJobId);
}
