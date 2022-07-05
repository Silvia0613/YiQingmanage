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
                    <li class="active">疫情地图列表</li>
                </ul><!-- /.breadcrumb -->

            </div>
            <div class="page-content">
                <div class="page-header">
                    <button class="btn btn-sm btn-warning" style="margin-bottom: 4px;" onclick="openDialog('添加疫情地图记录信息', 'add')">
                        <i class="ace-icon glyphicon glyphicon-plus"></i>
                        添加
                    </button>
                    <button class="btn btn-sm btn-info" style="margin-bottom: 4px;" onclick="openDialog('修改疫情地图记录信息', 'edit')">
                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                        修改
                    </button>
                    <button class="btn btn-sm btn-danger" style="margin-bottom: 4px;" onclick="openConfirm()">
                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        删除
                    </button>
                    <input type="text" id="search-name" placeholder="请输入疫情发生位置..." style="width: 200px; float: none">
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
                <label style="width: 100px;">疫情发生位置：</label>
                <input type="text" id="location" name="location" placeholder="请输入疫情发生位置..." style="width: 250px;" />
            </div>
            <div style="margin: 10px 0px;">
                <label style="width: 100px;">确诊人数：</label>
                <input type="number" id="count" name="count" min="1" oninput="this.value=this.value.replace(/\D/g);" placeholder="请输入确诊人数..." style="width: 250px; float: none">
            </div>

        </form>

    </div><!-- #dialog-message -->

    <div id="confirm-message" class="hide">
        <p style="margin-top:10px;">确定要删除此条数据吗？</p>
    </div><!-- #dialog-confirm -->

    <%@include file="../common/footer.jsp"%>

</div><!-- /.main-container -->

<!-- basic scripts -->

<%@include file="../common/url.jsp"%>


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
                title: '记录编号',
                width: '100px'
            },{
                field: 'location',
                title: '疫情发生位置',
                width: '200px'
            },{
                field: 'lng',
                title: '位置经度',
                width: '150px'
            },
            {
                field: 'lat',
                title: '位置纬度',
                width: '150px'
            },
            {
                field: 'count',
                title: '确诊人数',
                width: '100px'
            },
            {
                field: 'createTime',
                title: '登记时间',
                width: '150px',
                formatter: function(value,row,index){
                    return formatYMDHMS(value);
                }
            }]
        })
    });
    var dialog;
    function openDialog(title, type) {
        if(type === 'add'){
            $("#id").val('');
            $("#location").val('');
            $("#count").val('');
        } else if(type === 'edit') {
            let selectRow = $('#table').bootstrapTable('getSelections');
            if(selectRow.length !== 1){
                commonUtil.message('请选择一条数据进行修改！', 'danger');
                return false;
            }else {
                let row = selectRow[0];
                $("#id").val(row.id);
                $("#location").val(row.location);
                $("#count").val(row.count);
            }
        }
        dialog = $("#dialog-message").removeClass('hide').dialog({
            modal: true,
            width: '400',
            height: '220',
            title: title,
            buttons: [
                {
                    text: "取消",
                    "class": "btn btn-minier",
                    click: function () {
                        $(this).dialog("close");
                    }
                },
                {
                    text: "保存",
                    "class": "btn btn-primary btn-minier",
                    click: function () {
                        save();
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
