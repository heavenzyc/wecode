<#macro html nosidebar=false title="平台" js=[] css=[]>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>后台管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- basic styles -->
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/assets/css/font-awesome.min.css" />

    <!--[if IE 7]>
    <link rel="stylesheet" href="/assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!-- ace styles -->
    <link rel="stylesheet" href="/assets/css/jquery-ui-1.10.3.full.min.css" />
    <link rel="stylesheet" href="/assets/css/ui.jqgrid.css"/>
    <link rel="stylesheet" href="/assets/css/chosen.css" />
    <link rel="stylesheet" href="/assets/css/datepicker.css" />
    <link rel="stylesheet" href="/assets/css/bootstrap-timepicker.css" />
    <link rel="stylesheet" href="/assets/css/daterangepicker.css" />
    <link rel="stylesheet" href="/assets/css/colorpicker.css" />
    <link rel="stylesheet" href="/assets/css/jquery.fancybox.css" />
    <link rel="stylesheet" href="/assets/css/style.css" />
    <link rel="stylesheet" href="/assets/css/jquery.gritter.css"/>

    <link rel="stylesheet" href="/assets/css/ace.min.css" />
    <link rel="stylesheet" href="/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="/assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="/assets/js/jquery.validity/jquery.validity.css" />
    <link rel="stylesheet" href="/assets/js/qTip2/jquery.qtip.min.css" />
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="/assets/css/ace-ie.min.css" />
    <![endif]-->

    <#--<script src="/assets/js/jquery-2.0.3.min.js"></script>-->
    <script src="/assets/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="/assets/js/html5shiv.js"></script>
    <script src="/assets/js/respond.min.js"></script>


    <![endif]-->

    <!--[if !IE]> -->

    <script type="text/javascript">
    window.jQuery || document.write("<script src='/assets/js/jquery-2.0.3.min.js'>"+"<"+"script>");
</script>

    <!-- <![endif]-->

    <!--[if IE]>
    <script type="text/javascript">
    window.jQuery || document.write("<script src='/assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");
</script>
    <![endif]-->

    <script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='/assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
</script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/typeahead-bs2.min.js"></script>
<#--############################################################-->
    <script src="/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="/assets/js/jquery.ui.touch-punch.min.js"></script>
    <script src="/assets/js/chosen.jquery.min.js"></script>
    <script src="/assets/js/fuelux/fuelux.spinner.min.js"></script>
    <script src="/assets/js/date-time/bootstrap-datepicker.min.js"></script>
    <script src="/assets/js/date-time/bootstrap-timepicker.min.js"></script>
    <script src="/assets/js/date-time/moment.min.js"></script>
    <script src="/assets/js/date-time/daterangepicker.min.js"></script>
    <script src="/assets/js/bootstrap-colorpicker.min.js"></script>
    <script src="/assets/js/jquery.knob.min.js"></script>
    <script src="/assets/js/jquery.autosize.min.js"></script>
    <script src="/assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
    <script src="/assets/js/jquery.maskedinput.min.js"></script>
    <script src="/assets/js/bootstrap-tag.min.js"></script>
    <script src="/assets/js/jquery.fancybox.min.js"></script>
    <script src="/assets/js/jquery.gritter.min.js"></script>
    <script src="/assets/js/ajaxfileupload.js"></script>
    <script src="/assets/js/bootbox.min.js"></script>
<#--############################################################-->
    <!--[if lte IE 8]>
    <script src="/assets/js/excanvas.min.js"></script>
    <![endif]-->
    <script src="/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
    <script src="/assets/js/jqGrid/i18n/grid.locale-en.js"></script>

    <script src="/assets/js/ace-elements.min.js"></script>
    <script src="/assets/js/ace.min.js"></script>
    <script src="/assets/js/jquery.validity/jquery.validity.js"></script>
    <script src="/assets/js/qTip2/jquery.qtip.min.js"></script>
    <script src="/assets/js/jquery.validity/jquery.validity.extend.js"></script>


</head>

<body>
<div class="navbar navbar-default" id="navbar">
<script type="text/javascript">
    try{ace.settings.check('navbar' , 'fixed')}catch(e){}
</script>

<div class="navbar-container" id="navbar-container">
<div class="navbar-header pull-left">
    <a href="#" class="navbar-brand">
        <small>
            <i class="icon-leaf"></i>
            套账管理系统
        </small>
    </a><!-- /.brand -->
</div><!-- /.navbar-header -->

<div class="navbar-header pull-right" role="navigation">
<ul class="nav ace-nav">
<#--<li class="light-blue">
    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
            <span class="user-info">
                <small>欢迎光临,</small>
                admin
            </span>

        <i class="icon-caret-down"></i>
    </a>
    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
        <li class="divider"></li>

        <li>
            <a href="#">
                <i class="icon-off"></i>
                退出
            </a>
        </li>
    </ul>
</li>-->
</ul><!-- /.ace-nav -->
</div><!-- /.navbar-header -->
</div><!-- /.container -->
</div>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>

<div class="main-container-inner">
<a class="menu-toggler" id="menu-toggler" href="#">
    <span class="menu-text"></span>
</a>

<div class="sidebar" id="sidebar">
<script type="text/javascript">
    try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
</script>

    <div class="sidebar-shortcuts" id="sidebar-shortcuts">
        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div><!-- #sidebar-shortcuts -->

<ul class="nav nav-list">
    <li class="active">
        <a href="javascript:void(0)">
            <i class="icon-dashboard"></i>
            <span class="menu-text"> 套账管理系统 </span>
        </a>
    </li>
    <li>
        <a href="#" class="dropdown-toggle">
            <i class="icon-list"></i>
            <span class="menu-text"> 入库管理 </span>
            <b class="arrow icon-angle-down"></b>
        </a>

        <ul class="submenu">
            <li>
                <a href="/input">
                    <i class="icon-double-angle-right"></i>
                    入库单
                </a>
            </li>
        </ul>
    </li>
    <li>
        <a href="#" class="dropdown-toggle">
            <i class="icon-list"></i>
            <span class="menu-text"> 出库管理 </span>
            <b class="arrow icon-angle-down"></b>
        </a>
        <ul class="submenu">
            <li>
                <a href="/output">
                    <i class="icon-double-angle-right"></i>
                    出库单
                </a>
            </li>
        </ul>
    </li>
    <li>
        <a href="#" class="dropdown-toggle">
            <i class="icon-list"></i>
            <span class="menu-text"> 运输管理 </span>
            <b class="arrow icon-angle-down"></b>
        </a>
        <ul class="submenu">
            <li>
                <a href="/transport">
                    <i class="icon-double-angle-right"></i>
                    承运单
                </a>
            </li>
        </ul>
    </li>
    <li>
        <a href="#" class="dropdown-toggle">
            <i class="icon-list"></i>
            <span class="menu-text"> 费用管理 </span>
            <b class="arrow icon-angle-down"></b>
        </a>
        <ul class="submenu">
            <li>
                <a href="/loan">
                    <i class="icon-double-angle-right"></i>
                    借款单
                </a>
            </li>
            <li>
                <a href="/receive">
                    <i class="icon-double-angle-right"></i>
                    收款单
                </a>
            </li>
        </ul>
    </li>
    <#--<li>
        <a href="#" class="dropdown-toggle">
            <i class="icon-list"></i>
            <span class="menu-text"> 结算管理 </span>
            <b class="arrow icon-angle-down"></b>
        </a>
        <ul class="submenu">
            <li>
                <a href="#">
                    <i class="icon-double-angle-right"></i>
                    材料结算清单
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="icon-double-angle-right"></i>
                    运费结算清单
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="icon-double-angle-right"></i>
                    矿石加工及运费结算清单
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="icon-double-angle-right"></i>
                    利润结算清单
                </a>
            </li>
        </ul>
    </li>
    <li>
        <a href="#" class="dropdown-toggle">
            <i class="icon-list"></i>
            <span class="menu-text"> 统计查询 </span>
            <b class="arrow icon-angle-down"></b>
        </a>
        <ul class="submenu">
            <li>
                <a href="#">
                    <i class="icon-double-angle-right"></i>
                    统计1
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="icon-double-angle-right"></i>
                    统计2
                </a>
            </li>
        </ul>
    </li>-->
</ul><!-- /.nav-list -->

<div class="sidebar-collapse" id="sidebar-collapse">
    <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
</div>

<script type="text/javascript">
    try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
</script>
</div>

<div class="main-content">
<div class="breadcrumbs" id="breadcrumbs">
    <script type="text/javascript">
        try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
    </script>

    <ul class="breadcrumb">
        <li>
            <i class="icon-home home-icon"></i>
            <a href="#">首页</a>
        </li>
        <li class="active">控制台</li>
    </ul><!-- .breadcrumb -->
</div>
    <#nested>
</div><!-- /.main-content -->
</div><!-- /.main-container-inner -->

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="icon-double-angle-up icon-only bigger-110"></i>
</a>
</div><!-- /.main-container -->
</body>
</html>
</#macro>
