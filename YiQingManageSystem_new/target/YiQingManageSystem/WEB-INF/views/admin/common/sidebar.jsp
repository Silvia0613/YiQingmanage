<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script type="text/javascript">
    try{ace.settings.check('main-container' , 'fixed')}catch(e){}
</script>
<script src="../../resources/admin/assets/js/jquery.2.1.1.min.js"></script>

<div id="sidebar" class="sidebar                  responsive">
    <script type="text/javascript">
        try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
    </script>


    <ul class="nav nav-list" id="nav-list">
        <li class="active" id="system">
            <a href="../system/index">
                <i class="menu-icon fa fa-home"></i>
                <span class="menu-text"> 首页 </span>
            </a>

            <b class="arrow"></b>
        </li>

        <li class="" id="user">
            <a href="javascript:void(0);" class="dropdown-toggle">
                <i class="menu-icon fa fa-user"></i>
                <span class="menu-text">
                    用户管理
                </span>
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li id="user-index">
                    <a href="../user/index">
                        <i class="menu-icon fa fa-caret-right"></i>
                        用户列表
                        <b class="arrow"></b>
                    </a>
                </li>
            </ul>
        </li>

        <li class="" id="news">
            <a href="javascript:void(0);" class="dropdown-toggle">
                <i class="menu-icon fa fa-globe"></i>
                <span class="menu-text">
                    新闻管理
                </span>
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li id="news-index">
                    <a href="../news/index">
                        <i class="menu-icon fa fa-caret-right"></i>
                        新闻列表
                        <b class="arrow"></b>
                    </a>
                </li>
            </ul>
        </li>

        <li class="" id="daily-report">
            <a href="javascript:void(0);" class="dropdown-toggle">
                <i class="menu-icon fa fa-check-square-o"></i>
                <span class="menu-text">
                    日常打卡管理
                </span>
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li id="daily-report-index">
                    <a href="../daily-report/index">
                        <i class="menu-icon fa fa-caret-right"></i>
                        日常打卡列表
                        <b class="arrow"></b>
                    </a>
                </li>
            </ul>
        </li>

        <li class="" id="maps">
            <a href="javascript:void(0);" class="dropdown-toggle">
                <i class="menu-icon fa fa-map-marker"></i>
                <span class="menu-text">
                    疫情地图管理
                </span>
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li id="maps-index">
                    <a href="../maps/index">
                        <i class="menu-icon fa fa-caret-right"></i>
                        疫情地图列表
                        <b class="arrow"></b>
                    </a>
                </li>
            </ul>
        </li>

        <li class="" id="comment">
            <a href="javascript:void(0);" class="dropdown-toggle">
                <i class="menu-icon fa fa-comment"></i>
                <span class="menu-text">
                    评论管理
                </span>
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li id="comment-index">
                    <a href="../comment/index">
                        <i class="menu-icon fa fa-caret-right"></i>
                        评论列表
                        <b class="arrow"></b>
                    </a>
                </li>
            </ul>
        </li>


    </ul><!-- /.nav-list -->

    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>

    <script type="text/javascript">
        $(function(){
            $("#nav-list").children("li").removeClass('active');
            $("#nav-list").children("li").removeClass('open');
            $(".submenu").children("li").removeClass('active');
            clickChange("${firstMenu}", "${secondMenu}");
        });
        try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
        function clickChange(firstMenu, secondMenu) {
            if(secondMenu !== ''){
                $("#"+firstMenu).addClass('active open');
                $("#"+secondMenu).addClass('active');
            }else {
                $("#"+firstMenu).addClass('active');
            }
        }
    </script>
</div>
