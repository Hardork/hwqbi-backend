package com.hwq.dataloom.model.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * table数据集
 * @TableName core_dataset_table
 */
@TableName(value ="core_dataset_table")
@Data
public class CoreDatasetTable implements Serializable {
    /**
     * ID
     */
    @TableId
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 物理表名
     */
    private String tableName;

    /**
     * 数据源ID
     */
    private Long datasourceId;

    /**
     * 数据集ID
     */
    private Long datasetGroupId;

    /**
     * db,sql,union,excel,api
     */
    private String type;

    /**
     * 表原始信息,表名,sql等
     */
    private String info;

    /**
     * SQL参数
     */
    private String sqlVariableDetails;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}