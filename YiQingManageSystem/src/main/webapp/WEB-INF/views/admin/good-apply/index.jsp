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
                    <li class="active">物资申请列表</li>
                </ul><!-- /.breadcrumb -->

            </div>
            <div class="page-content">
                <div class="page-header">
                    <button class="btn btn-sm btn-warning" style="margin-bottom: 4px;" onclick="openDialog('添加物资申请信息', 'add')">
                        <i class="ace-icon glyphicon glyphicon-plus"></i>
                        添加
                    </button>
                    <button class="btn btn-sm btn-info" style="margin-bottom: 4px;" onclick="openDialog('修改物资申请信息', 'edit')">
                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                        修改
                    </button>
                    <button class="btn btn-sm btn-danger" style="margin-bottom: 4px;" onclick="openConfirm()">
                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        删除
                    </button>
                    <button class="btn btn-sm btn-success" style="margin-bottom: 4px;" onclick="openAudit()">
                        <i class="ace-icon fa fa-check-square-o"></i>
                        审核
                    </button>
                    <input type="text" id="search-name" placeholder="请输入物资内容..." style="width: 200px; float: none">
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
            <div style="margin: 10px 0px;position: relative">
                <label style="width: 100px;position: absolute;left: 10px;top:50px;">物资内容：</label>
                <textarea type="text" id="name" name="name" placeholder="请输入物资内容..." style="width: 250px; height: 100px; position: absolute;left:100px;top:10px;"></textarea>
            </div>
            <div style="margin: 10px 0px;position: relative">
                <label style="width: 100px;position: absolute;left: 10px;top:120px;">配送地址：</label>
                <input type="text" id="address" name="address" placeholder="请输入配送地址..." style="width: 250px; position: absolute;left:100px;top:120px;" />
            </div>
            <div style="margin: 10px 0px;position: relative">
                <label style="width: 100px;position: absolute;left: 10px;top:175px;">物资申请者：</label>
                <select name="userId" id="userId" style="width: 250px;position: absolute;left:100px;top:170px;">
                    <c:forEach var="user" items="${userList}" varStatus="vs">
                        <option value="${user.id}">${user.username}</option>
                    </c:forEach>
                </select>
            </div>
        </form>

    </div><!-- #dialog-message -->

    <div id="audit-message" class="hide">
        <form id="audit-form" style="margin-left: 40px;">
            <input type="hidden" id="audit-id" name="id" />
            <div style="margin: 10px 0px;">
                <label style="width: 100px;">审核状态：</label>
                <select name="state" id="state" style="width: 250px;float: none">
                    <option value="1">待审核</option>
                    <option value="2">审核通过</option>
                    <option value="3">审核不通过</option>
                </select>
            </div>
            <div style="margin: 10px 0px;">
                <label style="width: 100px;">审核回复：</label>
                <input type="text" id="reply" name="reply" placeholder="请输入审核回复..." style="width: 250px;float: none" />
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
                title: '申请编号',
                width: '100px'
            },{
                field: 'name',
                title: '物资内容',
                width: '300px'
            },{
                field: 'user.username',
                title: '物资申请者',
                width: '150px'
            },{
                field: 'address',
                title: '配送地址',
                width: '150px'
            },{
                field: 'state',
                title: '审核状态',
                width: '100px',
                formatter: function(value,row,index){
                    return filterGoodApplyState(value);
                }
            },{
                field: 'reply',
                title: '审核回复',
                width: '150px'
            },{
                field: 'createTime',
                title: '申请时间',
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
            $("#name").val('');
            $("#address").val('');
        } else if(type === 'edit') {
            let selectRow = $('#table').bootstrapTable('getSelections');
            if(selectRow.length !== 1){
                commonUtil.message('请选择一条数据进行修改！', 'danger');
                return false;
            }else {
                let row = selectRow[0];
                $("#id").val(row.id);
                $("#name").val(row.name);
                $("#address").val(row.address);
                $("#userId").val(row.userId);
            }
        }
        dialog = $("#dialog-message").removeClass('hide').dialog({
            modal: true,
            width: '400',
            height: '350',
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

    var audit;
    function openAudit() {
        let selectRow = $('#table').bootstrapTable('getSelections');
        if(selectRow.length !== 1){
            commonUtil.message('请选择一条数据进行审核！', 'danger');
            return false;
        }else {
            let row = selectRow[0];
            $("#audit-id").val(row.id);
            $("#state").val(row.state);
            $("#reply").val(row.reply);
            audit = $("#audit-message").removeClass('hide').dialog({
                modal: true,
                width: '360',
                height: '280',
                title: "审核申请",
                buttons: [
                    {
                        text: "取消",
                        "class": "btn btn-minier",
                        click: function () {
                            $(this).dialog("close");
                        }
                    },
                    {
                        text: "确定",
                        "class": "btn btn-primary btn-minier",
                        click: function () {
                            $(this).dialog("close");
                            auditApply();
                        }
                    }
                ]
            });
        }
    }

    /**
     * 审核申请
     */
    function auditApply() {
        var data = serializeRemoveNull($("#audit-form").serialize());
        $.ajax({
            url:'audit',
            dataType:'json',
            type:'post',
            data:data,
            success:function(result){
                if(result.code === 0){
                    commonUtil.message('保存成功！', 'success');
                    audit.dialog("close");
                    $("#table").bootstrapTable('refresh');
                    getPage(1, $("#search-name").val());
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
    .ui-dialog-buttonpane {
        position: absolute;
        width: 100%;
        bottom: 0;
    }
    .table {table-layout:fixed;word-break:break-all;}
</style>
</body>
</html>
