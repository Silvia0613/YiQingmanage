package com.yjq.programmer.domain;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelTarget;
import com.yjq.programmer.annotation.ValidateEntity;

import java.util.Date;

@ExcelTarget("DailyReport")
public class DailyReport {

    @Excel(name="打卡编号",orderNum="1",width=20.0)
    private String id;

    @Excel(name="打卡位置",orderNum="2",width=20.0)
    @ValidateEntity(required=true,requiredMaxLength=true,requiredMinLength=true,maxLength=128,minLength=1,errorRequiredMsg="打卡位置不能为空！",errorMaxLengthMsg="打卡位置长度不能大于128！",errorMinLengthMsg="打卡位置不能为空！")
    private String location;

    @Excel(name="打卡时间",orderNum="6", width=20.0, format="yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @Excel(name="打卡用户编号",orderNum="3", width=20.0)
    private String userId;

    private User user;

    @Excel(name="打卡用户名称",orderNum="4", width=20.0)
    private String username;

    @Excel(name="打卡备注",orderNum="7", width=20.0)
    @ValidateEntity(requiredMaxLength=true,maxLength=512,errorMaxLengthMsg="备注长度不能大于512！")
    private String note;

    @ValidateEntity(required=true,errorRequiredMsg="健康状态不能为空！")
    private Integer healthStatus;

    @Excel(name="健康状态",orderNum="5", width=20.0)
    private String stringHealthStatus;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Integer getHealthStatus() {
        return healthStatus;
    }

    public void setHealthStatus(Integer healthStatus) {
        this.healthStatus = healthStatus;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStringHealthStatus() {
        return stringHealthStatus;
    }

    public void setStringHealthStatus(String stringHealthStatus) {
        this.stringHealthStatus = stringHealthStatus;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", location=").append(location);
        sb.append(", createTime=").append(createTime);
        sb.append(", userId=").append(userId);
        sb.append(", note=").append(note);
        sb.append(", healthStatus=").append(healthStatus);
        sb.append(", user=").append(user);
        sb.append(", username=").append(username);
        sb.append(", stringHealthStatus=").append(stringHealthStatus);
        sb.append("]");
        return sb.toString();
    }
}
