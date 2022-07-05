<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../common/header.jsp"%>



<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">
            <div class="fly-panel" style="margin-bottom: 0;">

                <div class="fly-panel-title fly-filter">
                    <a href="" class="layui-this">新闻</a>
                </div>

                <ul class="fly-list" id="news-list">
                    <c:forEach items="${newsList.list}" var="news">
                        <li>
                            <a href="javascript:void(0);" class="fly-avatar">
                                <img src="../../common/file/view_photo?filename=${news.user.headPic}" alt="">
                            </a>
                            <h2>
                                <a class="layui-badge">文章</a>
                                <a href="../news/detail?id=${news.id}">${news.title}</a>
                            </h2>
                            <div class="fly-list-info">
                                <a href="javascript:void(0);" link>
                                    <cite>${news.user.username}</cite>
                                </a>
                                <span><fmt:formatDate  pattern="yyyy-MM-dd HH:mm:ss" value="${news.createTime}"/></span>

                                <span class="fly-list-nums">
                                <i class="iconfont icon-pinglun1" title="评论量"></i> ${news.commentNum}
                                <i class="iconfont" title="浏览量">&#xe60b;</i> ${news.viewNum}
                            </span>
                            </div>
                            <div class="fly-list-badge">
                            </div>
                        </li>

                    </c:forEach>

                </ul>
                <div style="text-align: center">
                    <div class="laypage-main">
                        <a href="javascript:void(0)" id="more-news" onclick="moreNews()" class="laypage-next">更多内容...</a>
                        <a href="javascript:void(0)" style="display: none" id="no-more-news" class="laypage-next">已无更多内容...</a>
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

    //时间格式显示
    function add0(m){return m<10?'0'+m:m }
    function format(shijianchuo){
        //shijianchuo是整数，否则要parseInt转换
        var time = new Date(shijianchuo);
        var y = time.getFullYear();
        var m = time.getMonth()+1;
        var d = time.getDate();
        var h = time.getHours();
        var mm = time.getMinutes();
        var s = time.getSeconds();
        return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
    }

    var currentPage = "${newsList.page}";
    var totalPage = "${newsList.totalPage}";
    function moreNews(){
        currentPage = parseInt(currentPage);
        totalPage = parseInt(totalPage);
        if(currentPage === totalPage){
            $("#more-news").text("已无更多内容...");
            return false;
        }
        $.ajax({
            url:'../news/more',
            dataType:'json',
            type:'post',
            data:{page:currentPage+1},
            success:function(result){
                if(result.code === 0){
                    var newList = result.data.list;
                    currentPage =  result.data.page;
                    for(var i=0; i<newList.length; i++){
                        var html = '<li><a href="javascript:void(0);" class="fly-avatar">'+
                            '<img src="../../common/file/view_photo?filename='+ newList[i].user.headPic +'" alt=""></a>'+
                            '<h2><a class="layui-badge">文章</a><a href="../news/detail?id='+newList[i].id+'">'+newList[i].title+'</a></h2>'+
                            '<div class="fly-list-info"><a href="javascript:void(0);" link><cite>'+ newList[i].user.username+'</cite></a>'+
                            '<span>'+format(newList[i].createTime)+'</span>'+
                            '<span class="fly-list-nums"><i class="iconfont icon-pinglun1" title="评论量"></i> '+newList[i].commentNum +
                            '<i class="iconfont" title="浏览量">&#xe60b;</i> '+newList[i].viewNum +
                            '</span> </div><div class="fly-list-badge"></div></li>';
                        $("#news-list").append(html);
                    }
                }else{
                    layer.alert(result.msg, {icon: 5});
                }
            },
            error:function(){
                layer.alert("网络错误，获取更多内容失败！", {icon: 5});
            }
        });
    }


</script>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>

</body>
</html>
