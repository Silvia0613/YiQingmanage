package com.yjq.programmer.domain;

import com.yjq.programmer.annotation.ValidateEntity;

import java.util.Date;

public class News {
    private String id;

    private String content;

    private Date createTime;

    @ValidateEntity(required=true,requiredMaxLength=true,requiredMinLength=true,maxLength=64,minLength=1,errorRequiredMsg="新闻标题不能为空！",errorMaxLengthMsg="新闻标题长度不能大于64！",errorMinLengthMsg="新闻标题不能为空！")
    private String title;

    private String userId;

    private User user;

    private Integer viewNum;

    private Integer commentNum;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getViewNum() {
        return viewNum;
    }

    public void setViewNum(Integer viewNum) {
        this.viewNum = viewNum;
    }

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
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
        sb.append(", content=").append(content);
        sb.append(", createTime=").append(createTime);
        sb.append(", title=").append(title);
        sb.append(", userId=").append(userId);
        sb.append(", viewNum=").append(viewNum);
        sb.append(", commentNum=").append(commentNum);
        sb.append(", user=").append(user);
        sb.append("]");
        return sb.toString();
    }
}
