package com.yjq.programmer.domain;

import com.yjq.programmer.annotation.ValidateEntity;

import java.util.Date;

public class GoodApply {
    private String id;

    @ValidateEntity(required=true,requiredMaxLength=true,requiredMinLength=true,maxLength=512,minLength=1,errorRequiredMsg="物资内容不能为空！",errorMaxLengthMsg="物资内容长度不能大于512！",errorMinLengthMsg="物资内容不能为空！")
    private String name;

    @ValidateEntity(required=true,requiredMaxLength=true,requiredMinLength=true,maxLength=128,minLength=1,errorRequiredMsg="配送地址不能为空！",errorMaxLengthMsg="配送地址长度不能大于128！",errorMinLengthMsg="配送地址不能为空！")
    private String address;

    private Date createTime;

    private Integer state;

    private String reply;

    private String userId;

    private User user;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", address=").append(address);
        sb.append(", createTime=").append(createTime);
        sb.append(", state=").append(state);
        sb.append(", reply=").append(reply);
        sb.append(", userId=").append(userId);
        sb.append(", user=").append(user);
        sb.append("]");
        return sb.toString();
    }
}
