<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>
<link rel="stylesheet" href="../../resources/admin/assets/css/jquery-ui.min.css" />
<div class="main-container" id="main-container">
    <%@include file="../common/sidebar.jsp"%>
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        系统
                    </li>
                    <li class="active">修改新闻</li>
                </ul><!-- /.breadcrumb -->

            </div>
            <div class="page-content">
                <div class="page-header">
                    <button class="btn btn-sm btn-grey" style="margin-bottom: 4px;" onclick="toBack()">
                        <i class="ace-icon glyphicon glyphicon-arrow-left"></i>
                        返回
                    </button>
                    <button class="btn btn-sm btn-success" style="margin-bottom: 4px;" onclick="saveNews()">
                        <i class="ace-icon glyphicon glyphicon-check"></i>
                        保存
                    </button>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="row">
                            <div class="col-xs-12">
                                <div style="margin: 10px 0px;">
                                    <label style="width: 100px;">新闻标题：</label>
                                    <input id="title" value="${news.title}" name="title" style="width: 600px;" />
                                </div>
                                <div style="margin: 10px 0px;position: relative;">
                                    <label style="width: 100px;position: absolute;top:30px;left:0px">新闻内容：</label>
                                    <textarea id="content" name="content" style="width: 850px;height:300px;position: absolute;top:30px;left:100px">
                                        ${news.content}
                                    </textarea>
                                </div>

                            </div><!-- /.span -->
                        </div><!-- /.row -->
                    </div><!-- /.col -->
                </div><!-- /.row -->


                <div id="pagination">

                </div>

            </div><!-- /.page-content -->


        </div>
    </div><!-- /.main-content -->



    <%@include file="../common/footer.jsp"%>
</div><!-- /.main-container -->

<!-- basic scripts -->

<%@include file="../common/url.jsp"%>
<script type="text/javascript" src="../../resources/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="../../resources/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="../../resources/ueditor/lang/zh-cn/zh-cn.js"></script>

<script type="text/javascript">


    var ue = UE.getEditor('content');

    function toBack() {
        window.history.go(-1);
    }

    function saveNews() {
        $.ajax({
            url:'save',
            dataType:'json',
            type:'post',
            data:{title: $("#title").val(), content: ue.getContent(), id: "${news.id}"},
            success:function(result){
                if(result.code === 0){
                    commonUtil.message('保存成功！', 'success');
                    window.location.href = "index";
                }else {
                    commonUtil.message(result.msg, 'danger');
                }
            },
            error:function () {
                commonUtil.message('网络错误！', 'danger');
            }
        });
    }
</script>
<style type="text/css">

</style>
</body>
</html>
