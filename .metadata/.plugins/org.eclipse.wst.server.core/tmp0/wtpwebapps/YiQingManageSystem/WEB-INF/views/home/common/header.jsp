<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>社区疫情管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../../resources/home/layui/css/layui.css">
    <link rel="stylesheet" href="../../resources/home/css/global.css">
</head>
<body>
<div class="fly-header layui-bg-black">
    <div class="layui-container">
        <a class="fly-logo" href="../system/index" style="top:12px;">
            <h3 style="color:white; padding-top:8px;">社区疫情管理系统</h3>          
        </a>
        <ul class="layui-nav fly-nav-user">
            <c:if test="${HOME_USER != null}">
                <li class="layui-nav-item">
                    <a class="fly-nav-avatar" href="../user/center">
                        <cite class="layui-hide-xs">欢迎您，${HOME_USER.username}</cite>
                        <img src="../../common/file/view_photo?filename=${HOME_USER.headPic}">
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="../user/center"><i class="layui-icon">&#xe68e;</i>用户中心</a></dd>
                        <hr style="margin: 5px 0;">
                        <dd><a href="javascript:void(0);" onclick="logout()" style="text-align: center;">退出</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item" style="padding-left: 30px;">
                    <a href="../../admin/user/login">后台</a>
                </li>
            </c:if>
            <c:if test="${HOME_USER == null}">
                <li class="layui-nav-item">
                    <a href="../system/login">登录</a>
                </li>
                <li class="layui-nav-item">
                    <a href="../system/register">注册</a>
                </li>
                <li class="layui-nav-item">
                    <a class="fly-nav-avatar" href="javascript:void(0);">
                        <cite class="layui-hide-xs"></cite>
                        <img src="../../common/file/view_photo?filename=../resources/upload/common/no_image.jpg">
                    </a>
                </li>
                <li class="layui-nav-item" style="padding-left: 30px;">
                    <a href="../../admin/user/login">后台</a>
                </li>
            </c:if>
        </ul>
    </div>

</div>



<div class="fly-panel fly-column">
    <div class="layui-container">
        <ul class="layui-clear">
            <li id="system" class="layui-hide-xs"><a href="../system/index">首页</a></li>
            <li id="map"><a href="../maps/index">疫情地图</a></li>
            <li id="daily-report"><a href="../daily-report/index">日常打卡</a></li>
            <li id="good-apply"><a href="../good-apply/index">物资申请</a></li>
            <li id="map"><a href="../maps/index">全国疫情</a></li>
        </ul>

        <div class="fly-column-right layui-hide-xs">
            <span class="fly-search"><i class="layui-icon"></i></span>
            <a href="../daily-report/index" class="layui-btn">日常打卡</a>
        </div>
    </div>
</div>

<script src="../../resources/home/layui/jquery.min.1.8.2.js"></script>
<script type="text/javascript">
    $(function () {
       var url = "${url}";
       switch (url) {
            case "system":
                $("#system").addClass("layui-this");
                break;
            case "map":
                $("#map").addClass("layui-this");
                break;
           case "clue":
               $("#clue").addClass("layui-this");
               break;
           case "daily-report":
               $("#daily-report").addClass("layui-this");
               break;
           case "good-apply":
               $("#good-apply").addClass("layui-this");
               break;
       }
    });

    function logout() {
        $.ajax({
            url:'../user/logout',
            dataType:'json',
            type:'post',
            data:{},
            success:function(result){
                if(result.code === 0){
                    window.location.href = "../system/index";
                }else{
                    layer.alert(result.msg, {icon: 5});
                }
            },
            error:function(){
                layer.alert("网络错误，退出登录失败！", {icon: 5});
            }
        });
    }

</script>
