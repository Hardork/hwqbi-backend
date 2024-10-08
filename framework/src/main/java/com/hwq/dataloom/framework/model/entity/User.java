package com.hwq.dataloom.framework.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 用户
 *
 * @author <a href="https://github.com/Hardork">老山羊</a>
 * 
 */
@TableName(value = "user")
@Data
public class User implements Serializable {

    /**
     * id
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 账号
     */
    @TableField(value = "userAccount")
    private String userAccount;

    /**
     * 密码
     */
    @TableField(value = "userPassword")
    private String userPassword;

    /**
     * 用户昵称
     */
    @TableField(value = "userName")
    private String userName;

    /**
     * 邮箱
     */
    @TableField(value = "email")
    private String email;

    /**
     * 邀请码
     */
    @TableField(value = "invitationCode")
    private String invitationCode;

    /**
     * 用户头像
     */
    @TableField(value = "userAvatar")
    private String userAvatar;

    /**
     * 用户角色：user/admin
     */
    @TableField(value = "userRole")
    private String userRole;

    /**
     * 奖励积分(用户调用免费次数的)
     */
    @TableField(value = "totalRewardPoints")
    private Integer totalRewardPoints;

    @TableField(value = "VIPExpirationTime")
    private Date VIPExpirationTime;

    @TableField(value = "SVIPExpirationTime")
    private Date SVIPExpirationTime;

    /**
     * 创建时间
     */
    @TableField(value = "createTime")
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField(value = "updateTime")
    private Date updateTime;

    /**
     * 是否删除
     */
    @TableLogic
    private Integer isDelete;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

}