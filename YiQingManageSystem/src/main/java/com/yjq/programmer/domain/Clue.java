package com.yjq.programmer.domain;

import com.yjq.programmer.annotation.ValidateEntity;

import java.util.Date;

public class Clue {
    private String id;

    private String userId;

    private User user;

    @ValidateEntity(required=true,requiredMaxLength=true,requiredMinLength=true,maxLength=512,minLength=1,errorRequiredMsg="线索内容不能为空！",errorMaxLengthMsg="线索内容长度不能大于512！",errorMinLengthMsg="线索内容不能为空！")
    private String content;

    private Date createTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
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
        sb.append(", userId=").append(userId);
        sb.append(", content=").append(content);
        sb.append(", createTime=").append(createTime);
        sb.append(", user=").append(user);
        sb.append("]");
        return sb.toString();
    }
}
