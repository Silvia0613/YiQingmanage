<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../common/header.jsp"%>

<div class="layui-container fly-marginTop fly-user-main">
    <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
        <li class="layui-nav-item">
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
        <div class="layui-tab layui-tab-brief" lay-filter="user" id="LAY_msg" style="margin-top: 15px;">
            <div  id="LAY_minemsg" style="margin-top: 10px;">
                <!--<div class="fly-none">您暂时没有最新消息</div>-->
                <ul class="mine-msg">
                    <c:if test="${clueList != null and clueList.size() > 0}">
                        <c:forEach items="${clueList}" var="clue">
                            <li data-id="123">
                                <blockquote class="layui-elem-quote">
                                    线索内容：${clue.content}
                                </blockquote>
                                <p><span><fmt:formatDate  pattern="yyyy-MM-dd HH:mm:ss" value="${clue.createTime}"/></span>
                                    <a href="../clue/index?id=${clue.id}" class="layui-btn layui-btn-small layui-btn-warm fly-delete">编辑</a>
                                    <a href="javascript:void(0);" onclick='deleteClue("${clue.id}")' class="layui-btn layui-btn-small layui-btn-danger fly-delete">删除</a>
                                </p>
                            </li>
                        </c:forEach>
                    </c:if>

                    <c:if test="${clueList == null or clueList.size() == 0}">
                        <div class="fly-none">您暂时没有线索上报信息~</div>
                    </c:if>

                </ul>
            </div>
        </div>
    </div>

</div>


<%@include file="../common/footer.jsp"%>
<script type="text/javascript">

    function deleteClue(id) {
        $.ajax({
            url:'../clue/delete',
            dataType:'json',
            type:'post',
            data:{id:id},
            success:function(result){
                if(result.code === 0){
                    layer.alert("删除线索信息成功！", {icon: 6}, function () {
                        window.location.reload();
                    });
                }else{
                    layer.alert(result.msg, {icon: 5});
                }
            },
            error:function(){
                layer.alert("网络错误，删除线索信息失败！", {icon: 5});
            }
        });
    }

</script>


</body>
</html>
