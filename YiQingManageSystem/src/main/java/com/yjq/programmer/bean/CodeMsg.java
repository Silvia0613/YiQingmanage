package com.yjq.programmer.bean;



/**
 * 错误码统一处理类，所有的错误码统一定义在这里
 */
public class CodeMsg {

    private Integer code;//错误码

    private String msg;//错误信息

    /**
     * 构造函数私有化即单例模式
     * 该类负责创建自己的对象，同时确保只有单个对象被创建。这个类提供了一种访问其唯一的对象的方式，可以直接访问，不需要实例化该类的对象。
     * @param code
     * @param msg
     */
    private CodeMsg(Integer code, String msg){
        this.code = code;
        this.msg = msg;
    }

    public CodeMsg() {

    }

    public Integer getCode() {
        return code;
    }



    public void setCode(Integer code) {
        this.code = code;
    }



    public String getMsg() {
        return msg;
    }



    public void setMsg(String msg) {
        this.msg = msg;
    }

    //通用错误码定义
    //处理成功消息码
    public static CodeMsg SUCCESS = new CodeMsg(0, "success");
    //通用数据错误码
    public static CodeMsg DATA_ERROR = new CodeMsg(-1, "非法数据！");
    public static CodeMsg VALIDATE_ENTITY_ERROR = new CodeMsg(-2, "");
    public static CodeMsg CAPTCHA_EMPTY = new CodeMsg(-3, "验证码不能为空!");
    public static CodeMsg NO_PERMISSION = new CodeMsg(-4, "您没有当前操作的权限哦！");
    public static CodeMsg CAPTCHA_ERROR = new CodeMsg(-5, "验证码错误！");
    public static CodeMsg USER_SESSION_EXPIRED = new CodeMsg(-6, "还未登录或会话失效，请重新登录！");
    public static CodeMsg UPLOAD_PHOTO_SUFFIX_ERROR = new CodeMsg(-7, "图片格式不正确！");
    public static CodeMsg PHOTO_SURPASS_MAX_SIZE = new CodeMsg(-8, "上传的图片不能超过1MB！");
    public static CodeMsg PHOTO_FORMAT_NOT_CORRECT = new CodeMsg(-9, "上传的图片格式不正确！");
    public static CodeMsg SAVE_FILE_EXCEPTION = new CodeMsg(-10, "保存文件异常！");
    public static CodeMsg FILE_EXPORT_ERROR = new CodeMsg(-11, "文件导出失败！");
    public static CodeMsg SYSTEM_ERROR = new CodeMsg(-12, "系统出现了错误，请联系管理员！");
    public static CodeMsg NO_AUTHORITY = new CodeMsg(-13, "不好意思，您没有权限操作哦！");
    public static CodeMsg CAPTCHA_EXPIRED = new CodeMsg(-14, "验证码已过期，请刷新验证码！");
    public static CodeMsg COMMON_ERROR = new CodeMsg(-15, "");
    public static CodeMsg PHOTO_EMPTY = new CodeMsg(-16, "上传的图片不能为空！");
    public static CodeMsg EXPORT_EXCEL_ERROR = new CodeMsg(-17, "导出Excel文件失败，请联系管理员！");


    //用户管理类错误码
    public static CodeMsg USER_ADD_ERROR = new CodeMsg(-1000, "用户信息添加失败，请联系管理员！");
    public static CodeMsg USER_NOT_EXIST  = new CodeMsg(-1001, "该用户不存在！");
    public static CodeMsg USER_EDIT_ERROR = new CodeMsg(-1002, "用户信息修改失败，请联系管理员！");
    public static CodeMsg USER_DELETE_ERROR = new CodeMsg(-1003, "用户信息删除失败，请联系管理员！");
    public static CodeMsg USERNAME_EXIST = new CodeMsg(-1004, "该用户名称已存在，请换一个！");
    public static CodeMsg USERNAME_EMPTY = new CodeMsg(-1005, "用户名称不能为空！");
    public static CodeMsg PASSWORD_EMPTY = new CodeMsg(-1006, "用户密码不能为空！");
    public static CodeMsg USERNAME_PASSWORD_ERROR = new CodeMsg(-1007, "用户名称或用户密码错误！");
    public static CodeMsg REPASSWORD_EMPTY = new CodeMsg(-1008, "确认密码不能为空！");
    public static CodeMsg REPASSWORD_ERROR = new CodeMsg(-1009, "用户密码和确认密码不一致！");
    public static CodeMsg USER_REGISTER_ERROR = new CodeMsg(-1010, "注册用户失败，请联系管理员！");
    public static CodeMsg USER_NOT_IS_ADMIN = new CodeMsg(-1011, "只有管理员角色才能登录后台系统！");
    public static CodeMsg USER_PHONE_ERROR = new CodeMsg(-1012, "请输入11位手机号！");
    public static CodeMsg SAVE_USER_INFO_ERROR = new CodeMsg(-1013, "保存用户个人信息失败，请联系管理员！");

    //线索管理类错误码
    public static CodeMsg CLUE_ADD_ERROR = new CodeMsg(-2000, "线索信息添加失败，请联系管理员！");
    public static CodeMsg CLUE_EDIT_ERROR = new CodeMsg(-2001, "线索信息修改失败，请联系管理员！");
    public static CodeMsg CLUE_DELETE_ERROR = new CodeMsg(-2002, "线索信息删除失败，请联系管理员！");

    //角色管理类错误码
    public static CodeMsg ROLE_ADD_ERROR = new CodeMsg(-3000, "角色信息添加失败，请联系管理员！");
    public static CodeMsg ROLE_EDIT_ERROR = new CodeMsg(-3001, "角色信息修改失败，请联系管理员！");
    public static CodeMsg ROLE_DELETE_ERROR = new CodeMsg(-3002, "角色信息删除失败，请联系管理员！");
    public static CodeMsg ROLE_NAME_EXIST = new CodeMsg(-3003, "该角色名称已存在，请换一个！");

    //物资申请管理类错误码
    public static CodeMsg GOOD_APPLY_ADD_ERROR = new CodeMsg(-4000, "物资申请信息添加失败，请联系管理员！");
    public static CodeMsg GOOD_APPLY_EDIT_ERROR = new CodeMsg(-4001, "物资申请信息修改失败，请联系管理员！");
    public static CodeMsg GOOD_APPLY_DELETE_ERROR = new CodeMsg(-4002, "物资申请信息删除失败，请联系管理员！");
    public static CodeMsg GOOD_APPLY_AUDIT_ERROR = new CodeMsg(-4003, "物资申请信息审核失败，请联系管理员！");

    //新闻管理类错误码
    public static CodeMsg NEWS_ADD_ERROR = new CodeMsg(-5000, "新闻信息添加失败，请联系管理员！");
    public static CodeMsg NEWS_EDIT_ERROR = new CodeMsg(-5001, "新闻信息修改失败，请联系管理员！");
    public static CodeMsg NEWS_DELETE_ERROR = new CodeMsg(-5002, "新闻信息删除失败，请联系管理员！");

    //日常打卡管理类错误码
    public static CodeMsg DAILY_REPORT_ADD_ERROR = new CodeMsg(-6000, "日常打卡信息添加失败，请联系管理员！");
    public static CodeMsg DAILY_REPORT_EDIT_ERROR = new CodeMsg(-6001, "日常打卡信息修改失败，请联系管理员！");
    public static CodeMsg DAILY_REPORT_DELETE_ERROR = new CodeMsg(-6002, "日常打卡信息删除失败，请联系管理员！");
    public static CodeMsg USER_DAILY_REPORT_EXIST = new CodeMsg(-6003, "当前用户今日已打卡！");

    //疫情地图管理类错误码
    public static CodeMsg MAP_ADD_ERROR = new CodeMsg(-7000, "疫情地图记录信息添加失败，请联系管理员！");
    public static CodeMsg MAP_EDIT_ERROR = new CodeMsg(-7001, "疫情地图记录信息修改失败，请联系管理员！");
    public static CodeMsg MAP_DELETE_ERROR = new CodeMsg(-7002, "疫情地图记录信息删除失败，请联系管理员！");
    public static CodeMsg LOCATION_NOT_EXIST = new CodeMsg(-7003, "位置不存在，请输入正确的位置信息！");
    public static CodeMsg LOCATION_EXIST = new CodeMsg(-7004, "位置已存在，请换个位置！");
    public static CodeMsg LOCATION_GET_ERROR = new CodeMsg(-7005, "位置信息获取失败，请稍后重试！");

    // 评分管理类错误码
    public static CodeMsg RATE_REPEAT = new CodeMsg(-8000, "不能重复评分！");
    public static CodeMsg RATE_ADD_ERROR = new CodeMsg(-8001, "评分失败，请联系管理员！");

    // 评论管理类错误码
    public static CodeMsg COMMENT_ADD_ERROR = new CodeMsg(-9000, "发表评论失败，请联系管理员！");
    public static CodeMsg COMMENT_DELETE_ERROR = new CodeMsg(-9001, "删除评论失败，请联系管理员！");
}
