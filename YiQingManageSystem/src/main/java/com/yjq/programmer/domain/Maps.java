package com.yjq.programmer.domain;

import com.yjq.programmer.annotation.ValidateEntity;

import java.math.BigDecimal;
import java.util.Date;

public class Maps {
    private String id;

    @ValidateEntity(required=true,requiredMaxLength=true,requiredMinLength=true,maxLength=128,minLength=1,errorRequiredMsg="疫情发生位置不能为空！",errorMaxLengthMsg="疫情发生位置长度不能大于128！",errorMinLengthMsg="疫情发生位置不能为空！")
    private String location;

    private BigDecimal lng;

    private BigDecimal lat;

    private Date createTime;

    @ValidateEntity(required=true,requiredMinValue=true,requiredMaxValue=true,minValue= 1, maxValue=999999,errorRequiredMsg="确诊人数不能为空！",errorMaxValueMsg="确诊人数不能大于999999人！",errorMinValueMsg="确诊人数不能小于1人！")
    private Integer count;

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

    public BigDecimal getLng() {
        return lng;
    }

    public void setLng(BigDecimal lng) {
        this.lng = lng;
    }

    public BigDecimal getLat() {
        return lat;
    }

    public void setLat(BigDecimal lat) {
        this.lat = lat;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", location=").append(location);
        sb.append(", lng=").append(lng);
        sb.append(", lat=").append(lat);
        sb.append(", createTime=").append(createTime);
        sb.append(", count=").append(count);
        sb.append("]");
        return sb.toString();
    }
}
