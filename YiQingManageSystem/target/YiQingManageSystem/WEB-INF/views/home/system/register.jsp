<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>

<div class="layui-container fly-marginTop">
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title">
                <li><a href="login">登录</a></li>
                <li class="layui-this">注册</li>
            </ul>
            <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                    <div class="layui-form layui-form-pane">
                        <form id="register-form">
                            <div class="layui-form-item">
                                <label for="L_username" class="layui-form-label">用户名称</label>
                                <div class="layui-input-inline" style="width: 250px;">
                                    <input type="text"  id="L_username" name="username" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_password" class="layui-form-label">用户密码</label>
                                <div class="layui-input-inline" style="width: 250px;">
                                    <input type="password" id="L_password" name="password" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_phone" class="layui-form-label">手机号码</label>
                                <div class="layui-input-inline" style="width: 250px;">
                                    <input type="text" id="L_phone" name="phone" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_identifyCard" class="layui-form-label">身份证号</label>
                                <div class="layui-input-inline" style="width: 250px;">
                                    <input type="text" id="L_identifyCard" name="identifyCard" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">用户性别</label>
                                <div class="layui-input-inline" style="width: 250px;">
                                    <input type="radio" name="sex" value="1" title="男" autocomplete="off" class="layui-input">
                                    <input type="radio" name="sex" value="2" title="女" autocomplete="off" class="layui-input">
                                    
                                </div>
                            </div>
                        </form>
                        <div class="layui-form-item">
                            <button class="layui-btn" onclick="submitRegister()">立即注册</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<%@include file="../common/footer.jsp"%>
<script type="text/javascript">

    function serializeRemoveNull(serStr){
        return serStr.split("&").filter(str => !str.endsWith("=")).join("&");
    }

    function submitRegister(){
        var data = serializeRemoveNull($("#register-form").serialize());
        $.ajax({
            url:'../user/register',
            dataType:'json',
            type:'post',
            data:data,
            success:function(result){
                if(result.code === 0){
                    layer.alert("注册成功，快去登录体验吧！", {icon: 6}, function () {
                        window.location.href = "../system/login";
                    });
                }else{
                    layer.alert(result.msg, {icon: 5});
                }
            },
            error:function(){
                layer.alert("网络错误，注册失败！", {icon: 5});
            }
        });
    }

</script>

</body>
</html>
