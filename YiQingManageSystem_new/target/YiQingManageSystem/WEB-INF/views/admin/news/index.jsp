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
                    <li class="active">新闻列表</li>
                </ul><!-- /.breadcrumb -->

            </div>
            <div class="page-content">
                <div class="page-header">
                    <button class="btn btn-sm btn-warning" style="margin-bottom: 4px;" onclick="openDialog('添加新闻信息', 'add')">
                        <i class="ace-icon glyphicon glyphicon-plus"></i>
                        添加
                    </button>
                    <button class="btn btn-sm btn-info" style="margin-bottom: 4px;" onclick="openDialog('修改新闻信息', 'edit')">
                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                        修改
                    </button>
                    <button class="btn btn-sm btn-danger" style="margin-bottom: 4px;" onclick="openConfirm()">
                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        删除
                    </button>
                    <button class="btn btn-sm btn-success" style="margin-bottom: 4px;" onclick="openView()">
                        <i class="ace-icon fa fa-eye bigger-120"></i>
                        查看详情
                    </button>
                    <input type="text" id="search-name" placeholder="请输入新闻标题..." style="width: 200px; float: none">
                    <button class="btn btn-sm btn-info" onclick="searchName(1);" style="margin-bottom: 4px; padding-left: 5px;">
                        <i class="ace-icon fa fa-search nav-search-icon"></i>
                        搜索
                    </button>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="row">
                            <div class="col-xs-12">
                                <table id="table">
                                </table>
                            </div><!-- /.span -->
                        </div><!-- /.row -->
                    </div><!-- /.col -->
                </div><!-- /.row -->


                <div id="pagination">

                </div>

            </div><!-- /.page-content -->


        </div>
    </div><!-- /.main-content -->

    <div id="dialog-message" class="hide">
        <form id="dialog-form">
            <input type="hidden" id="id" name="id" />
            <div style="margin: 10px 0px;">
                <label style="width: 100px;">新闻内容：</label>
                <textarea id="news-content" name="content" style="width: 450px; height: 300px"></textarea>
            </div>

        </form>

    </div><!-- #dialog-message -->

    <div id="view-dialog-message" class="hide">
        <form id="view-dialog-form">
            <div style="margin: 10px 0px;">
                <label style="width: 70px;">新闻标题：</label>
                <span id="view-title"></span>
            </div>
            <div style="margin: 10px 0px 20px 0px;">
                <label style="width: 70px;">新闻内容：</label>
                <div id="view-content"></div>
            </div>
        </form>
    </div><!-- #view-dialog-message -->

    <div id="confirm-message" class="hide">
        <p style="margin-top:10px;">确定要删除此条数据吗？</p>
    </div><!-- #dialog-confirm -->

    <%@include file="../common/footer.jsp"%>
</div><!-- /.main-container -->

<!-- basic scripts -->

<%@include file="../common/url.jsp"%>
<script type="text/javascript" src="../../resources/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="../../resources/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="../../resources/ueditor/lang/zh-cn/zh-cn.js"></script>

<script type="text/javascript">

    $(function(){
        getPage(1, $("#search-name").val());
        $('#table').bootstrapTable({
            url: 'list',
            method: 'post',
            columns: [{
                checkbox: true,
            },{
                field: 'id',
                title: '新闻编号',
                width: '100px'
            },{
                field: 'title',
                title: '新闻标题',
                width: '300px'
            },{
                field: 'user.username',
                title: '新闻发布者',
                width: '150px'
            },{
                field: 'viewNum',
                title: '新闻浏览量',
                width: '100px'
            },{
                field: 'commentNum',
                title: '新闻评论量',
                width: '100px'
            },
            {
                field: 'createTime',
                title: '发布时间',
                width: '150px',
                formatter: function(value,row,index){
                    return formatYMDHMS(value);
                }
            }]
        })
    });
    function openDialog(title, type) {
        if(type === 'add'){
            window.location.href = 'add'
        } else if(type === 'edit') {
            let selectRow = $('#table').bootstrapTable('getSelections');
            if(selectRow.length !== 1){
                commonUtil.message('请选择一条数据进行修改！', 'danger');
                return false;
            }else {
                let row = selectRow[0];
                window.location.href = 'edit?id=' + row.id;
            }
        }
    }

    function openView() {
        let selectRow = $('#table').bootstrapTable('getSelections');
        if(selectRow.length !== 1){
            commonUtil.message('请选择一条数据进行查看！', 'danger');
            return false;
        }else {
            let row = selectRow[0];
            $("#view-title").html(row.title);
            console.log(JSON.stringify(row));
            $("#view-content").html(row.content);
        }
        dialog = $("#view-dialog-message").removeClass('hide').dialog({
            modal: true,
            width: '800',
            height: '650',
            title: "查看详情",
            buttons: [
                {
                    text: "确定",
                    "class": "btn btn-primary btn-minier",
                    click: function () {
                        $(this).dialog("close");
                    }
                }
            ]
        });
    }


</script>
<style type="text/css">
    .ui-dialog-buttonpane {
        position: absolute;
        width: 100%;
        bottom: 0;
    }
    .table {table-layout:fixed;word-break:break-all;}
</style>
</body>
</html>
