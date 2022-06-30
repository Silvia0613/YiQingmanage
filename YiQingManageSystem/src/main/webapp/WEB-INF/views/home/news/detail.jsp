<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../common/header.jsp"%>

<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8 content detail">
            <div class="fly-panel detail-box">
                <h1>${news.title}</h1>
                <div class="fly-detail-info">
                    <div class="fly-admin-box" data-id="123">
                        <span class="layui-btn layui-btn-xs jie-admin" type="del">文章</span>
                    </div>
                    <span class="fly-list-nums">
                        <a href="#comment"><i class="iconfont" title="评论量">&#xe60c;</i> ${news.commentNum}</a>
                        <i class="iconfont" title="浏览量">&#xe60b;</i> ${news.viewNum}
                    </span>
                </div>
                <div class="detail-about">
                    <a class="fly-avatar" href="javascript:void(0);">
                        <img src="../../common/file/view_photo?filename=${news.user.headPic}" alt="">
                    </a>
                    <div class="fly-detail-user">
                        <a href="javascript:void(0);" class="fly-link">
                            <cite>${news.user.username}</cite>
                        </a>
                        <span><fmt:formatDate  pattern="yyyy-MM-dd HH:mm:ss" value="${news.createTime}"/></span>
                    </div>
                    <div class="detail-hits" id="LAY_jieAdmin" data-id="123">
                        <span class="jie-admin" type="edit"><a href="javascript:void(0);"></a></span>
                    </div>
                </div>
                <div class="detail-body photos">
                    ${news.content}
                </div>
            </div>

            <div class="fly-panel detail-box" id="flyReply">
                <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
                    <legend>评论区</legend>
                </fieldset>

                <ul class="jieda" id="jieda">


                    <c:forEach items="${commentList}" var="comment">
                        <li data-id="111" class="jieda-daan">
                            <a name="item-1111111111"></a>
                            <div class="detail-about detail-about-reply">
                                <a class="fly-avatar" href="javascript:void(0);">
                                    <img src="../../common/file/view_photo?filename=${comment.user.headPic}" alt=" ">
                                </a>
                                <div class="fly-detail-user">
                                    <a href="javascript:void(0);" class="fly-link">
                                        <cite>${comment.user.username}</cite>
                                    </a>

                                </div>

                                <div class="detail-hits">
                                    <span><fmt:formatDate  pattern="yyyy-MM-dd HH:mm:ss" value="${comment.createTime}"/></span>
                                </div>
                            </div>
                            <div class="detail-body jieda-body photos">
                                <p>${comment.content}</p>
                            </div>
                        </li>
                    </c:forEach>

                </ul>

                <div class="layui-form layui-form-pane">
                    <div class="layui-form-item layui-form-text">
                        <a name="comment"></a>
                        <div class="layui-input-block">
                            <textarea id="L_content" name="content" placeholder="请输入评论内容..."  class="layui-textarea" style="height: 150px;"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <input type="hidden" name="jid" value="123">
                        <button class="layui-btn" onclick="submitComment()">发表评论</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-md4">
            <dl class="fly-panel fly-list-one">
                <dt class="fly-panel-title">热门新闻</dt>
                <c:forEach items="${hotNewsList}" var="hotNews">
                    <dd>
                        <a href="../news/detail?id=${hotNews.id}" title="${hotNews.title}" style="max-width: 75%">${hotNews.title}</a>
                        <span><i class="iconfont" title="浏览量">&#xe60b;</i>${hotNews.viewNum}</span>
                        <span><i class="iconfont icon-pinglun1"></i> ${hotNews.commentNum}</span>
                    </dd>
                </c:forEach>
            </dl>
        </div>
        <div class="layui-col-md4">
            <dl class="fly-panel fly-list-one">
                <img src="../../resources/home/images/1.png" style="width: 380px; height:220px;">
            </dl>
        </div>
    </div>
</div>

<%@include file="../common/footer.jsp"%>
<script type="text/javascript">

    function submitComment() {
        var newsId = "${news.id}";
        var content = $("#L_content").val();
        $.ajax({
            url:'../comment/add',
            dataType:'json',
            type:'post',
            data:{newsId:newsId,content:content},
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
                layer.alert("网络错误，评论失败！", {icon: 5});
            }
        });
    }
</script>
</body>
</html>
