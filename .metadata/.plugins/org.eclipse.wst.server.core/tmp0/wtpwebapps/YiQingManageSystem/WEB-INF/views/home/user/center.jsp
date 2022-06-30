<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../common/header.jsp"%>

<div class="layui-container fly-marginTop fly-user-main">
    <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
        <li class="layui-nav-item layui-this">
            <a href="../user/center">
                <i class="layui-icon">&#xe620;</i>
                基本设置
            </a>
        </li>
        <li class="layui-nav-item">
            <a href="../user/daily-report">
                <i class="layui-icon">&#x1005;</i>
                日常打卡
            </a>
        </li>
       
        <li class="layui-nav-item">
            <a href="../user/good-apply">
                <i class="layui-icon">&#xe60a;</i>
                物资申请
            </a>
        </li>
        <li class="layui-nav-item">
            <a href="../user/comment">
                <i class="layui-icon">&#xe611;</i>
                我的评论
            </a>
        </li>
    </ul>

    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>

    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>


    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title" id="LAY_mine">
                <li class="layui-this" lay-id="info">我的资料</li>
                <li lay-id="avatar">头像</li>
            </ul>
            <div class="layui-tab-content" style="padding: 20px 0;">
                <div class="layui-form layui-form-pane layui-tab-item layui-show">
                    <form id="user-info-form">
                        <input type="hidden" name="headPic" id="photo-val" value="" />
                        <input type="hidden" name="id" value="${HOME_USER.id}" />
                        <input type="hidden" name="roleId" value="${HOME_USER.roleId}" />
                        <div class="layui-form-item">
                            <label for="L_username" class="layui-form-label">用户名称</label>
                            <div class="layui-input-inline">
                                <input type="text" id="L_username" name="username" value="${HOME_USER.username}" autocomplete="off" value="" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label for="L_password" class="layui-form-label">用户密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="L_password" name="password" value="${HOME_USER.password}" autocomplete="off" value="" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label for="L_phone" class="layui-form-label">手机号码</label>
                            <div class="layui-input-inline">
                                <input type="text" id="L_phone" name="phone" value="${HOME_USER.phone}" autocomplete="off" value="" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label for="L_identify_card" class="layui-form-label">身份证号</label>
                            <div class="layui-input-inline">
                                <input type="text" id="L_identify_card" name="identifyCard" value="${HOME_USER.identifyCard}" autocomplete="off" value="" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label for="L_username" class="layui-form-label">用户性别</label>
                            <div class="layui-input-inline">
                                <div class="layui-input-inline" style="width: 250px;">
                                    <c:if test="${HOME_USER.sex == 1}">
                                        <input type="radio" name="sex" value="1" checked title="男">
                                        <input type="radio" name="sex" value="2" title="女">
                                        
                                    </c:if>
                                    <c:if test="${HOME_USER.sex == 2}">
                                        <input type="radio" name="sex" value="1" title="男">
                                        <input type="radio" name="sex" value="2" checked title="女">
                                        
                                    </c:if>
                                    <c:if test="${HOME_USER.sex == 3}">
                                        <input type="radio" name="sex" value="1" title="男">
                                        <input type="radio" name="sex" value="2" title="女">
                                        
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="layui-form-item">
                        <button class="layui-btn" key="set-mine" onclick="updateUserInfo()">确认修改</button>
                    </div>
                </div>
                <div class="layui-form layui-form-pane layui-tab-item">
                    <div class="layui-form-item">
                        <div class="avatar-add">
                            <p>支持jpg、png、gif，最大不能超过1MB</p>
                            <button type="button" class="layui-btn upload-img" onclick="uploadPhoto()">
                                <i class="layui-icon">&#xe67c;</i>上传头像
                            </button>
                            <c:if test="${HOME_USER.headPic != null}">
                                <img id="photo-view" src="../../common/file/view_photo?filename=${HOME_USER.headPic}">
                            </c:if>
                            <c:if test="${HOME_USER.headPic == null}">
                                <img id="photo-view" src="../../common/file/view_photo?filename=../resources/upload/common/no_image.jpg">
                            </c:if>
                            <span class="loading"></span>
                        </div>
                    </div>
                </div>
                <input type="file" id="photo-file" style="display:none;" onchange="upload()">


            </div>

        </div>


    </div>

</div>

<%@include file="../common/footer.jsp"%>
<script type="text/javascript">

    function upload(){
        if($("#photo-file").val() == '')return;
        var formData = new FormData();
        formData.append('photo',document.getElementById('photo-file').files[0]);
        $.ajax({
            url:'../../common/file/upload_photo',
            type:'post',
            data:formData,
            contentType:false,
            processData:false,
            success:function(result){
                if(result.code === 0){
                    $("#photo-view").attr('src','../../common/file/view_photo?filename='+result.data);
                    $("#photo-val").val(result.data);
                    layer.alert(result.msg, {icon: 6}, function () {
                        updateUserInfo();
                    });
                }else{
                    layer.alert(result.msg, {icon: 5});
                }
            },
            error:function(){
                layer.alert("网络错误，上传失败!", {icon: 5});
            }
        });
    }

    function uploadPhoto(){
        $("#photo-file").click();
    }

    function serializeRemoveNull(serStr){
        return serStr.split("&").filter(str => !str.endsWith("=")).join("&");
    }

    function updateUserInfo() {
        var data = serializeRemoveNull($("#user-info-form").serialize());
        $.ajax({
            url:'../user/update_info',
            dataType:'json',
            type:'post',
            data:data,
            success:function(result){
                if(result.code === 0){
                    layer.alert(result.msg, {icon: 6}, function () {
                        window.location.reload();
                    });
                }else{
                    layer.alert(result.msg, {icon: 5});
                }
            },
            error:function(){
                layer.alert("网络错误，修改个人信息失败！", {icon: 5});
            }
        });
    }

</script>

</body>
</html>
