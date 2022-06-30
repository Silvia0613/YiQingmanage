<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>

<div class="layui-container fly-marginTop">
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title">
                <li class="layui-this">登录</li>
                <li><a href="register">注册</a></li>
            </ul>
            <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                    <div class="layui-form layui-form-pane">
                        <div class="layui-form-item">
                            <label for="L_username" class="layui-form-label">用户名称</label>
                            <div class="layui-input-inline" style="width: 250px;">
                                <input type="text" id="L_username" name="username" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label for="L_password" class="layui-form-label">用户密码</label>
                            <div class="layui-input-inline" style="width: 250px;">
                                <input type="password" id="L_password" name="password" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn" onclick="submitLogin();">立即登录</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../common/footer.jsp"%>
<script type="text/javascript">

    function submitLogin() {
        var username = $("#L_username").val();
        var password = $("#L_password").val();
        $.ajax({
            url:'../user/login',
            dataType:'json',
            type:'post',
            data:{username:username,password:password},
            success:function(result){
                if(result.code === 0){
                    layer.alert(result.msg, {icon: 6}, function () {
                        window.location.href = "../system/index";
                    });
                }else{
                    layer.alert(result.msg, {icon: 5});
                }
            },
            error:function(){
                layer.alert("网络错误，登录失败！", {icon: 5});
            }
        });
    }

</script>

</body>
</html>
