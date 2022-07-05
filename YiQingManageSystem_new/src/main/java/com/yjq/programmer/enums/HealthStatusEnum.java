package com.yjq.programmer.enums;


public enum HealthStatusEnum {

    HEALTH(1,"健康"),

    FEVER(2,"有发烧、咳嗽等症状"),

    OTHER(3,"其他症状"),

    ;

    Integer code;

    String desc;

    HealthStatusEnum(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
