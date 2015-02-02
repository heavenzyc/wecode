<#macro html nosidebar=false title="管理平台" js=[] css=[]>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="keywords" content="后台管理" />
		<meta name="description" content="后台管理系统" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!-- basic styles -->
		
		<#list css as cssfile>
		<link rel="stylesheet" type="text/css" href="${cssfile}?ver=${static_ver}" />
		</#list>
		<!-- 表单验证 -->
		<link rel="stylesheet" href="${jspath}/qTip2/jquery.qtip.min.css?ver=${static_ver}" />
		<link rel="stylesheet" href="${jspath}/jquery.validity/jquery.validity.css?ver=${static_ver}" />
		<!-- 表单验证end -->

		<link rel="stylesheet" href="${csspath}/bootstrap.min.css?ver=${static_ver}" />
		<link rel="stylesheet" href="${csspath}/font-awesome.min.css?ver=${static_ver}" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="${csspath}/font-awesome-ie7.min.css?ver=${static_ver}" />
		<![endif]-->

		<!-- page specific plugin styles -->
        <link rel="stylesheet" href="${csspath}/jquery.gritter.css?ver=${static_ver}" />
		<link rel="stylesheet" href="${csspath}/style.css?ver=${static_ver}" />
		<link rel="stylesheet" href="${csspath}/jquery.fancybox.css?ver=${static_ver}" />
		<!-- fonts -->

		<link rel="stylesheet" href="${csspath}/jquery.gritter.css?ver=${static_ver}" />

		<!-- ace styles -->

		<link rel="stylesheet" href="${csspath}/ace.min.css?ver=${static_ver}" />
		<link rel="stylesheet" href="${csspath}/ace-rtl.min.css?ver=${static_ver}" />
		<link rel="stylesheet" href="${csspath}/ace-skins.min.css?ver=${static_ver}" />

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="${csspath}/ace-ie.min.css?ver=${static_ver}" />
		<![endif]-->



		<!-- inline styles related to this page -->
		<!-- ace settings handler -->

		<script src="${jspath}/ace-extra.min.js?ver=${static_ver}"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="${jspath}/html5shiv.js?ver=${static_ver}"></script>
		<script src="${jspath}/respond.min.js?ver=${static_ver}"></script>
		<![endif]-->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="${jspath}/jquery-2.0.3.min.js?ver=${static_ver}"></script>
		<!-- <![endif]-->

		<!--[if IE]>
			<script src="${jspath}/jquery-1.10.2.min.js?ver=${static_ver}"></script>
		<![endif]-->

		<!--[if !IE]> -->
		<script type="text/javascript">
			//window.jQuery || document.write("<script src='${jspath}/jquery-2.0.3.min.js?ver=${static_ver}'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->

		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='${jspath}/jquery-1.10.2.min.js?ver=${static_ver}'>"+"<"+"/script>");
		</script>
		<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${jspath}/jquery.mobile.custom.min.js?ver=${static_ver}'>"+"<"+"/script>");
		</script>
		<script src="${jspath}/bootstrap.min.js?ver=${static_ver}"></script>
		<script src="${jspath}/typeahead-bs2.min.js?ver=${static_ver}"></script>

		<!-- page specific plugin scripts -->
        <script src="${jspath}/jquery.gritter.min.js?ver=${static_ver}"></script>
        <script src="${jspath}/jquery.fancybox.min.js?ver=${static_ver}"></script>
		<!-- ace scripts -->

		<script src="${jspath}/ace-elements.min.js?ver=${static_ver}"></script>
		<script src="${jspath}/ace.min.js?ver=${static_ver}"></script>
		<script src="${jspath}/jquery.gritter.min.js?ver=${static_ver}"></script>
		<script src="${jspath}/admin/common/admin_header.js?ver=${static_ver}"></script>
		<script src="${jspath}/common.js?ver=${static_ver}"></script>
		<!-- 表单验证 -->
		<script src="${jspath}/jquery.validity/jquery.validity.js?ver=${static_ver}"></script>
		<script src="${jspath}/qTip2/jquery.qtip.min.js?ver=${static_ver}"></script>
		<script src="${jspath}/jquery.validity/jquery.validity.extend.js?ver=${static_ver}"></script>
		<!-- 表单验证 end -->
		
		<#list js as jsfile>
  		<script src="${jsfile}?ver=${static_ver}"></script>
  		</#list>

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
							找房通微信营销平台
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->
				<div class="navbar-menu pull-left" id="menu1">
					<#list menuList1 as menu1>
						<a href="${menu1.entry_url}" <#if currentmenu1.id=menu1.id>class="current"</#if>>${menu1.name}</a>
					</#list>
				</div>
				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="${assetspath}/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>${user.name!?html},</small>
									<span id="currentProjectName">${(currentProject.name)!?html}</span>
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="javascript:changepwd();">
										<i class="icon-cog"></i>
										修改密码
									</a>
								</li>

								<li class="divider"></li>
								<#list projectList as project>
								<li>
									<a href="javascript:;" class="btnProjectSelect" __project_id="${project.id}">
										<i class="icon-user"></i>
										${project.name!?html}
									</a>
								</li>
								</#list>
								<li class="divider"></li>

								<li>
									<a href="/logout">
										<i class="icon-off"></i>
										退出
									</a>
								</li>
							</ul>
						</li>
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

                <#if nosidebar>
                <#else>
				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>

					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<!--
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<button class="btn btn-success">
								<i class="icon-signal"></i>
							</button>

							<button class="btn btn-info">
								<i class="icon-pencil"></i>
							</button>

							<button class="btn btn-warning">
								<i class="icon-group"></i>
							</button>

							<button class="btn btn-danger">
								<i class="icon-cogs"></i>
							</button>
						</div>-->

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>

							<span class="btn btn-info"></span>

							<span class="btn btn-warning"></span>

							<span class="btn btn-danger"></span>
						</div>
					</div><!-- #sidebar-shortcuts -->

					<ul class="nav nav-list">
						<#list menuList2 as menu2>
						<li <#if currentmenu2.id=menu2.id>class="active"</#if>>
							<#if menu2.menuList3?has_content>
							<a href="#" class="dropdown-toggle">
								<i class="${menu2.icon_class}"></i>
								<span class="menu-text">${menu2.name}</span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<#list menu2.menuList3 as menu3>
								<li>
									<a href="${menu3.entry_url}">
										<i class="icon-double-angle-right"></i>
										${menu3.name}
									</a>
								</li>
								</#list>
							</ul>
							<#else>
							<a href="${menu2.entry_url}">
								<i class="${menu2.icon_class}"></i>
								<span class="menu-text">${menu2.name}</span>
							</a>
							</#if>
						</li>
						</#list>
					</ul><!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>

					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>
                </#if>

                <div class="main-content <#if nosidebar>no-margin</#if>">
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
