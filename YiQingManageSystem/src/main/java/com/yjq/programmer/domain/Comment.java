package com.yjq.programmer.domain;

import com.yjq.programmer.annotation.ValidateEntity;

import java.util.Date;

public class Comment {
    private String id;

    private String newsId;

    private News news;

    private String userId;

    private User user;

    @ValidateEntity(required=true,requiredMaxLength=true,requiredMinLength=true,maxLength=256,minLength=1,errorRequiredMsg="评论内容不能为空！",errorMaxLengthMsg="评论内容长度不能大于256！",errorMinLengthMsg="评论内容不能为空！")
    private String content;

    private Date createTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNewsId() {
        return newsId;
    }

    public void setNewsId(String newsId) {
        this.newsId = newsId;
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

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
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
        sb.append(", newsId=").append(newsId);
        sb.append(", userId=").append(userId);
        sb.append(", content=").append(content);
        sb.append(", createTime=").append(createTime);
        sb.append(", user=").append(user);
        sb.append(", news=").append(news);
        sb.append("]");
        return sb.toString();
    }
}
