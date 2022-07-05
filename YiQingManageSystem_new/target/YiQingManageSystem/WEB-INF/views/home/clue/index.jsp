<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>

<div class="layui-container fly-marginTop">
    <div class="fly-panel" pad20 style="padding-top: 5px;">
        <div class="layui-form layui-form-pane">
            <div class="layui-tab layui-tab-brief" lay-filter="user">
                <ul class="layui-tab-title">
                    <li class="layui-this">线索上报</li>
                </ul>
                <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                    <div class="layui-tab-item layui-show">
                        <input type="hidden" id="clue-id" value="${clue.id}" />
                        <div class="layui-form-item layui-form-text">
                            <div class="layui-input-block">
                                <textarea id="content" name="content" placeholder="详细描述您发现的线索内容吧..." class="layui-textarea" style="height: 260px;">${clue.content}</textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn" onclick="submitClue()">立即上报</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../common/footer.jsp"%>
<script type="text/javascript">

    function submitClue() {
        $.ajax({
            url:'../clue/save',
            dataType:'json',
            type:'post',
            data:{content: $("#content").val(), id: $("#clue-id").val()},
            success:function(result){
                if(result.code === 0){
                    layer.alert(result.msg, {icon: 6}, function () {
                        window.location.href = "../user/clue";
                    });
                }else{
                    layer.alert(result.msg, {icon: 5});
                }
            },
            error:function(){
                layer.alert("网络错误，线索上报失败！", {icon: 5});
            }
        });
    }

</script>
</body>
</html>
