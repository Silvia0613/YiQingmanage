/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.50
 * Generated at: 2022-06-13 11:28:23 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.admin.comment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(6);
    _jspx_dependants.put("/WEB-INF/views/admin/comment/../common/footer.jsp", Long.valueOf(1655087338957L));
    _jspx_dependants.put("/WEB-INF/views/admin/comment/../common/sidebar.jsp", Long.valueOf(1655087143996L));
    _jspx_dependants.put("/WEB-INF/views/admin/comment/../common/header.jsp", Long.valueOf(1655117363074L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1655038649769L));
    _jspx_dependants.put("/WEB-INF/views/admin/comment/../common/url.jsp", Long.valueOf(1642736697920L));
    _jspx_dependants.put("jar:file:/E:/eclipse_project/YiQingManageSystem/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/YiQingManageSystem/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153356282000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\" />\r\n");
      out.write("    <meta charset=\"utf-8\" />\r\n");
      out.write("    <title>社区疫情管理系统</title>\r\n");
      out.write("\r\n");
      out.write("    <meta name=\"description\" content=\"overview &amp; stats\" />\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0\" />\r\n");
      out.write("\r\n");
      out.write("    <!-- bootstrap & fontawesome -->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../../resources/admin/assets/css/bootstrap.min.css\" />\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../../resources/admin/assets/font-awesome/4.2.0/css/font-awesome.min.css\" />\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../../resources/admin/assets/css/bootstrap-datetimepicker.min.css\" />\r\n");
      out.write("\r\n");
      out.write("    <!-- page specific plugin styles -->\r\n");
      out.write("\r\n");
      out.write("    <!-- text fonts -->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../../resources/admin/assets/fonts/fonts.googleapis.com.css\" />\r\n");
      out.write("\r\n");
      out.write("    <!-- ace styles -->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../../resources/admin/assets/css/ace.min.css\" class=\"ace-main-stylesheet\" id=\"main-ace-style\" />\r\n");
      out.write("\r\n");
      out.write("    <!--[if lte IE 9]>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../../resources/admin/assets/css/ace-part2.min.css\" class=\"ace-main-stylesheet\" />\r\n");
      out.write("    <![endif]-->\r\n");
      out.write("\r\n");
      out.write("    <!--[if lte IE 9]>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../../resources/admin/assets/css/ace-ie.min.css\" />\r\n");
      out.write("    <![endif]-->\r\n");
      out.write("\r\n");
      out.write("    <!-- inline styles related to this page -->\r\n");
      out.write("\r\n");
      out.write("    <!-- ace settings handler -->\r\n");
      out.write("    <script src=\"../../resources/admin/assets/js/ace-extra.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->\r\n");
      out.write("\r\n");
      out.write("    <!--[if lte IE 8]>\r\n");
      out.write("    <script src=\"../../resources/admin/assets/js/html5shiv.min.js\"></script>\r\n");
      out.write("    <script src=\"../../resources/admin/assets/js/respond.min.js\"></script>\r\n");
      out.write("    <![endif]-->\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"no-skin\">\r\n");
      out.write("<div id=\"navbar\" class=\"navbar navbar-default\">\r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("        try{ace.settings.check('navbar' , 'fixed')}catch(e){}\r\n");
      out.write("    </script>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"navbar-container\" id=\"navbar-container\">\r\n");
      out.write("        <button type=\"button\" class=\"navbar-toggle menu-toggler pull-left\" id=\"menu-toggler\" data-target=\"#sidebar\">\r\n");
      out.write("            <span class=\"sr-only\">Toggle sidebar</span>\r\n");
      out.write("\r\n");
      out.write("            <span class=\"icon-bar\"></span>\r\n");
      out.write("\r\n");
      out.write("            <span class=\"icon-bar\"></span>\r\n");
      out.write("\r\n");
      out.write("            <span class=\"icon-bar\"></span>\r\n");
      out.write("        </button>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"navbar-header pull-left\">\r\n");
      out.write("            <a href=\"../system/index\" class=\"navbar-brand\">\r\n");
      out.write("                <small>\r\n");
      out.write("                    社区疫情管理系统\r\n");
      out.write("                </small>\r\n");
      out.write("            </a>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"navbar-buttons navbar-header pull-right\" role=\"navigation\">\r\n");
      out.write("            <ul class=\"nav ace-nav\">\r\n");
      out.write("                <li class=\"light-blue\">\r\n");
      out.write("                    <a data-toggle=\"dropdown\" href=\"#\" class=\"dropdown-toggle\">\r\n");
      out.write("                        <img class=\"nav-user-photo\" src=\"../../common/file/view_photo?filename=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ADMIN_USER.headPic}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" alt=\"Jason's Photo\" />\r\n");
      out.write("                        <span class=\"user-info\">\r\n");
      out.write("                            <small>欢迎您：</small>\r\n");
      out.write("                            ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ADMIN_USER.username}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\r\n");
      out.write("                        </span>\r\n");
      out.write("\r\n");
      out.write("                        <i class=\"ace-icon fa fa-caret-down\"></i>\r\n");
      out.write("                    </a>\r\n");
      out.write("\r\n");
      out.write("                    <ul class=\"user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close\">\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"javascript:void(0)\" onclick=\"logout()\">\r\n");
      out.write("                                <i class=\"ace-icon fa fa-power-off\"></i>\r\n");
      out.write("                                退出登录\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div><!-- /.navbar-container -->\r\n");
      out.write("</div>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/alert.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("    // 退出登录\r\n");
      out.write("    function logout() {\r\n");
      out.write("        $.ajax({\r\n");
      out.write("            url:'../user/logout',\r\n");
      out.write("            dataType:'json',\r\n");
      out.write("            type:'post',\r\n");
      out.write("            data:{},\r\n");
      out.write("            success:function(result){\r\n");
      out.write("                if(result.code === 0){\r\n");
      out.write("                    window.location.href = '../user/login';\r\n");
      out.write("                }\r\n");
      out.write("            },\r\n");
      out.write("            error:function () {\r\n");
      out.write("                commonUtil.message(\"网络错误！\", 'danger');\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"../../resources/admin/assets/css/jquery-ui.min.css\" />\r\n");
      out.write("<div class=\"main-container\" id=\"main-container\">\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    try{ace.settings.check('main-container' , 'fixed')}catch(e){}\r\n");
      out.write("</script>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/jquery.2.1.1.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<div id=\"sidebar\" class=\"sidebar                  responsive\">\r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("        try{ace.settings.check('sidebar' , 'fixed')}catch(e){}\r\n");
      out.write("    </script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <ul class=\"nav nav-list\" id=\"nav-list\">\r\n");
      out.write("        <li class=\"active\" id=\"system\">\r\n");
      out.write("            <a href=\"../system/index\">\r\n");
      out.write("                <i class=\"menu-icon fa fa-home\"></i>\r\n");
      out.write("                <span class=\"menu-text\"> 首页 </span>\r\n");
      out.write("            </a>\r\n");
      out.write("\r\n");
      out.write("            <b class=\"arrow\"></b>\r\n");
      out.write("        </li>\r\n");
      out.write("\r\n");
      out.write("        <li class=\"\" id=\"user\">\r\n");
      out.write("            <a href=\"javascript:void(0);\" class=\"dropdown-toggle\">\r\n");
      out.write("                <i class=\"menu-icon fa fa-user\"></i>\r\n");
      out.write("                <span class=\"menu-text\">\r\n");
      out.write("                    用户管理\r\n");
      out.write("                </span>\r\n");
      out.write("                <b class=\"arrow fa fa-angle-down\"></b>\r\n");
      out.write("            </a>\r\n");
      out.write("            <b class=\"arrow\"></b>\r\n");
      out.write("            <ul class=\"submenu\">\r\n");
      out.write("                <li id=\"user-index\">\r\n");
      out.write("                    <a href=\"../user/index\">\r\n");
      out.write("                        <i class=\"menu-icon fa fa-caret-right\"></i>\r\n");
      out.write("                        用户列表\r\n");
      out.write("                        <b class=\"arrow\"></b>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </li>\r\n");
      out.write("\r\n");
      out.write("        <li class=\"\" id=\"good-apply\">\r\n");
      out.write("            <a href=\"javascript:void(0);\" class=\"dropdown-toggle\">\r\n");
      out.write("                <i class=\"menu-icon fa fa-gift\"></i>\r\n");
      out.write("                <span class=\"menu-text\">\r\n");
      out.write("                    物资申请管理\r\n");
      out.write("                </span>\r\n");
      out.write("                <b class=\"arrow fa fa-angle-down\"></b>\r\n");
      out.write("            </a>\r\n");
      out.write("            <b class=\"arrow\"></b>\r\n");
      out.write("            <ul class=\"submenu\">\r\n");
      out.write("                <li id=\"good-apply-index\">\r\n");
      out.write("                    <a href=\"../good-apply/index\">\r\n");
      out.write("                        <i class=\"menu-icon fa fa-caret-right\"></i>\r\n");
      out.write("                        物资申请列表\r\n");
      out.write("                        <b class=\"arrow\"></b>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </li>\r\n");
      out.write("\r\n");
      out.write("        <li class=\"\" id=\"news\">\r\n");
      out.write("            <a href=\"javascript:void(0);\" class=\"dropdown-toggle\">\r\n");
      out.write("                <i class=\"menu-icon fa fa-globe\"></i>\r\n");
      out.write("                <span class=\"menu-text\">\r\n");
      out.write("                    新闻管理\r\n");
      out.write("                </span>\r\n");
      out.write("                <b class=\"arrow fa fa-angle-down\"></b>\r\n");
      out.write("            </a>\r\n");
      out.write("            <b class=\"arrow\"></b>\r\n");
      out.write("            <ul class=\"submenu\">\r\n");
      out.write("                <li id=\"news-index\">\r\n");
      out.write("                    <a href=\"../news/index\">\r\n");
      out.write("                        <i class=\"menu-icon fa fa-caret-right\"></i>\r\n");
      out.write("                        新闻列表\r\n");
      out.write("                        <b class=\"arrow\"></b>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </li>\r\n");
      out.write("\r\n");
      out.write("        <li class=\"\" id=\"daily-report\">\r\n");
      out.write("            <a href=\"javascript:void(0);\" class=\"dropdown-toggle\">\r\n");
      out.write("                <i class=\"menu-icon fa fa-check-square-o\"></i>\r\n");
      out.write("                <span class=\"menu-text\">\r\n");
      out.write("                    日常打卡管理\r\n");
      out.write("                </span>\r\n");
      out.write("                <b class=\"arrow fa fa-angle-down\"></b>\r\n");
      out.write("            </a>\r\n");
      out.write("            <b class=\"arrow\"></b>\r\n");
      out.write("            <ul class=\"submenu\">\r\n");
      out.write("                <li id=\"daily-report-index\">\r\n");
      out.write("                    <a href=\"../daily-report/index\">\r\n");
      out.write("                        <i class=\"menu-icon fa fa-caret-right\"></i>\r\n");
      out.write("                        日常打卡列表\r\n");
      out.write("                        <b class=\"arrow\"></b>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </li>\r\n");
      out.write("\r\n");
      out.write("        <li class=\"\" id=\"maps\">\r\n");
      out.write("            <a href=\"javascript:void(0);\" class=\"dropdown-toggle\">\r\n");
      out.write("                <i class=\"menu-icon fa fa-map-marker\"></i>\r\n");
      out.write("                <span class=\"menu-text\">\r\n");
      out.write("                    疫情地图管理\r\n");
      out.write("                </span>\r\n");
      out.write("                <b class=\"arrow fa fa-angle-down\"></b>\r\n");
      out.write("            </a>\r\n");
      out.write("            <b class=\"arrow\"></b>\r\n");
      out.write("            <ul class=\"submenu\">\r\n");
      out.write("                <li id=\"maps-index\">\r\n");
      out.write("                    <a href=\"../maps/index\">\r\n");
      out.write("                        <i class=\"menu-icon fa fa-caret-right\"></i>\r\n");
      out.write("                        疫情地图列表\r\n");
      out.write("                        <b class=\"arrow\"></b>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </li>\r\n");
      out.write("\r\n");
      out.write("        <li class=\"\" id=\"comment\">\r\n");
      out.write("            <a href=\"javascript:void(0);\" class=\"dropdown-toggle\">\r\n");
      out.write("                <i class=\"menu-icon fa fa-comment\"></i>\r\n");
      out.write("                <span class=\"menu-text\">\r\n");
      out.write("                    评论管理\r\n");
      out.write("                </span>\r\n");
      out.write("                <b class=\"arrow fa fa-angle-down\"></b>\r\n");
      out.write("            </a>\r\n");
      out.write("            <b class=\"arrow\"></b>\r\n");
      out.write("            <ul class=\"submenu\">\r\n");
      out.write("                <li id=\"comment-index\">\r\n");
      out.write("                    <a href=\"../comment/index\">\r\n");
      out.write("                        <i class=\"menu-icon fa fa-caret-right\"></i>\r\n");
      out.write("                        评论列表\r\n");
      out.write("                        <b class=\"arrow\"></b>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </ul><!-- /.nav-list -->\r\n");
      out.write("\r\n");
      out.write("    <div class=\"sidebar-toggle sidebar-collapse\" id=\"sidebar-collapse\">\r\n");
      out.write("        <i class=\"ace-icon fa fa-angle-double-left\" data-icon1=\"ace-icon fa fa-angle-double-left\" data-icon2=\"ace-icon fa fa-angle-double-right\"></i>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("        $(function(){\r\n");
      out.write("            $(\"#nav-list\").children(\"li\").removeClass('active');\r\n");
      out.write("            $(\"#nav-list\").children(\"li\").removeClass('open');\r\n");
      out.write("            $(\".submenu\").children(\"li\").removeClass('active');\r\n");
      out.write("            clickChange(\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${firstMenu}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\", \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${secondMenu}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\");\r\n");
      out.write("        });\r\n");
      out.write("        try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}\r\n");
      out.write("        function clickChange(firstMenu, secondMenu) {\r\n");
      out.write("            if(secondMenu !== ''){\r\n");
      out.write("                $(\"#\"+firstMenu).addClass('active open');\r\n");
      out.write("                $(\"#\"+secondMenu).addClass('active');\r\n");
      out.write("            }else {\r\n");
      out.write("                $(\"#\"+firstMenu).addClass('active');\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("    </script>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"main-content\">\r\n");
      out.write("        <div class=\"main-content-inner\">\r\n");
      out.write("            <div class=\"breadcrumbs\" id=\"breadcrumbs\">\r\n");
      out.write("                <script type=\"text/javascript\">\r\n");
      out.write("                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}\r\n");
      out.write("                </script>\r\n");
      out.write("\r\n");
      out.write("                <ul class=\"breadcrumb\">\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <i class=\"ace-icon fa fa-home home-icon\"></i>\r\n");
      out.write("                        系统\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"active\">评论列表</li>\r\n");
      out.write("                </ul><!-- /.breadcrumb -->\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"page-content\">\r\n");
      out.write("                <div class=\"page-header\">\r\n");
      out.write("                    <button class=\"btn btn-sm btn-danger\" style=\"margin-bottom: 4px;\" onclick=\"openConfirm()\">\r\n");
      out.write("                        <i class=\"ace-icon fa fa-trash-o bigger-120\"></i>\r\n");
      out.write("                        删除\r\n");
      out.write("                    </button>\r\n");
      out.write("                    <input type=\"text\" id=\"search-name\" placeholder=\"请输入评论内容...\" style=\"width: 200px; float: none\">\r\n");
      out.write("                    <button class=\"btn btn-sm btn-info\" onclick=\"searchName(1);\" style=\"margin-bottom: 4px; padding-left: 5px;\">\r\n");
      out.write("                        <i class=\"ace-icon fa fa-search nav-search-icon\"></i>\r\n");
      out.write("                        搜索\r\n");
      out.write("                    </button>\r\n");
      out.write("                </div><!-- /.page-header -->\r\n");
      out.write("\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-xs-12\">\r\n");
      out.write("                        <!-- PAGE CONTENT BEGINS -->\r\n");
      out.write("                        <div class=\"row\">\r\n");
      out.write("                            <div class=\"col-xs-12\">\r\n");
      out.write("                                <table id=\"table\">\r\n");
      out.write("                                </table>\r\n");
      out.write("                            </div><!-- /.span -->\r\n");
      out.write("                        </div><!-- /.row -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    </div><!-- /.col -->\r\n");
      out.write("                </div><!-- /.row -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                <div id=\"pagination\">\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("            </div><!-- /.page-content -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </div><!-- /.main-content -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <div id=\"confirm-message\" class=\"hide\">\r\n");
      out.write("        <p style=\"margin-top:10px;\">确定要删除此条数据吗？</p>\r\n");
      out.write("    </div><!-- #dialog-confirm -->\r\n");
      out.write("\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("<div class=\"footer\">\r\n");
      out.write("    <div class=\"footer-inner\">\r\n");
      out.write("        <div class=\"footer-content\">\r\n");
      out.write("                <span class=\"bigger-120\">\r\n");
      out.write("                    <span class=\"blue bolder\"></span>\r\n");
      out.write("              \r\n");
      out.write("                </span>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</div><!-- /.main-container -->\r\n");
      out.write("\r\n");
      out.write("<!-- basic scripts -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/jquery.2.1.1.min.js\"></script>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/alert.js\"></script>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/bootstrap.min.js\"></script>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/bootstrap-table.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/excanvas.min.js\"></script>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/jquery-ui.min.js\"></script>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/jquery-ui.custom.min.js\"></script>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/jquery.ui.touch-punch.min.js\"></script>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/jquery.easypiechart.min.js\"></script>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/jquery.sparkline.min.js\"></script>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/jquery.flot.min.js\"></script>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/jquery.flot.pie.min.js\"></script>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/jquery.flot.resize.min.js\"></script>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/moment.min.js\"></script>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/bootstrap-datetimepicker.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/ace-elements.min.js\"></script>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/ace.min.js\"></script>\r\n");
      out.write("<script src=\"../../resources/admin/assets/js/bootstrap-table-zh-CN.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" charset=\"UTF-8\" src=\"../../resources/admin/assets/js/common.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    $(function(){\r\n");
      out.write("        getPage(1, $(\"#search-name\").val());\r\n");
      out.write("        $('#table').bootstrapTable({\r\n");
      out.write("            url: 'list',\r\n");
      out.write("            method: 'post',\r\n");
      out.write("            columns: [{\r\n");
      out.write("                checkbox: true,\r\n");
      out.write("            },{\r\n");
      out.write("                field: 'id',\r\n");
      out.write("                title: '评论编号',\r\n");
      out.write("                width: '100px'\r\n");
      out.write("            },{\r\n");
      out.write("                field: 'user.username',\r\n");
      out.write("                title: '评论用户',\r\n");
      out.write("                width: '150px'\r\n");
      out.write("            },{\r\n");
      out.write("                field: 'news.title',\r\n");
      out.write("                title: '新闻标题',\r\n");
      out.write("                width: '150px'\r\n");
      out.write("            }\r\n");
      out.write("            ,{\r\n");
      out.write("                field: 'content',\r\n");
      out.write("                title: '评论内容',\r\n");
      out.write("                width: '300px'\r\n");
      out.write("            },\r\n");
      out.write("            {\r\n");
      out.write("                field: 'createTime',\r\n");
      out.write("                title: '评论时间',\r\n");
      out.write("                width: '150px',\r\n");
      out.write("                formatter: function(value,row,index){\r\n");
      out.write("                    return formatYMDHMS(value);\r\n");
      out.write("                }\r\n");
      out.write("            }]\r\n");
      out.write("        })\r\n");
      out.write("    });\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("    .ui-dialog-buttonpane {\r\n");
      out.write("        position: absolute;\r\n");
      out.write("        width: 100%;\r\n");
      out.write("        bottom: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .table {table-layout:fixed;word-break:break-all;}\r\n");
      out.write("</style>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
