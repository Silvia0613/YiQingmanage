<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="fly-footer">
    <p> 2021-2022 &copy; 社区疫情管理系统</p>
</div>
<script src="../../resources/home/layui/jquery.min.1.8.2.js"></script>
<script src="../../resources/home/layui/layui.js"></script>
<script>
    layui.cache.page = '';
    layui.cache.user = {
        username: '游客'
        ,uid: -1
        ,avatar: '../../resources/blog/images/avatar/00.jpg'
        ,experience: 83
        ,sex: '男'
    };
    layui.config({
        version: "3.0.0"
        ,base: '../../resources/home/mods/'
    }).extend({
        fly: 'index'
    }).use('fly');
</script>
