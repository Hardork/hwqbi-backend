package com.hwq.dataloom.model.dto.datasource;

import lombok.Data;

/**
 * @author HWQ
 * @date 2024/5/24 00:16
 * @description 表结构信息
 */
@Data
public class SchemaStructure {
    /**
     * 对应的数据源id
     */
    private Integer datasourceId;
    /**
     * 列名
     */
    private String columnName;
    /**
     * 注释
     */
    private String comment;
    /**
     * 类型
     */
    private String type;
}
