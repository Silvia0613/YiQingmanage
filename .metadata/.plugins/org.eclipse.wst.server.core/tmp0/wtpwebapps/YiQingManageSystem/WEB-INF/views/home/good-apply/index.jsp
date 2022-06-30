<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>

<div class="layui-container fly-marginTop">
    <div class="fly-panel" pad20 style="padding-top: 5px;">
        <div class="layui-form layui-form-pane">
            <div class="layui-tab layui-tab-brief" lay-filter="user">
                <ul class="layui-tab-title">
                    <li class="layui-this">物资申请</li>
                </ul>
                <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                    <div class="layui-tab-item layui-show">
                        <input type="hidden" id="good-apply-id" value="${goodApply.id}">
                        <div class="layui-row layui-col-space15 layui-form-item">
                            <div class="layui-col-md12">
                                <label for="address" class="layui-form-label">配送地址</label>
                                <div class="layui-input-block">
                                    <input type="text" id="address" value="${goodApply.address}" name="address" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item layui-form-text">
                            <div class="layui-input-block">
                                <textarea id="name" name="name" placeholder="请输入您需要的物资内容..." class="layui-textarea" style="height: 260px;">${goodApply.name}</textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn" onclick="submitGoodApply()">立即申请</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../common/footer.jsp"%>
<script type="text/javascript">

    function submitGoodApply() {
        $.ajax({
            url:'../good-apply/save',
            dataType:'json',
            type:'post',
            data:{name: $("#name").val(), address: $("#address").val(), id: $("#good-apply-id").val()},
            success:function(result){
                if(result.code === 0){
                    layer.alert(result.msg, {icon: 6}, function () {
                        window.location.href = "../user/good-apply";
                    });
                }else{
                    layer.alert(result.msg, {icon: 5});
                }
            },
            error:function(){
                layer.alert("网络错误，物资申请失败！", {icon: 5});
            }
        });
    }

</script>
</body>
</html>
