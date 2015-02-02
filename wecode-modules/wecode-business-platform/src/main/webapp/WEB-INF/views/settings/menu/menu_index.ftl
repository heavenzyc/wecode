<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=["${jspath}/jquery.nestable.js","${jspath}/jquery.dataTables.min.js","${jspath}/jquery.dataTables.bootstrap.js"]>
<@we.breadcrumb/>
<div class="page-content">
	<div class="row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<div class="col-sm-3">
				<div class="widget-box">
					<div class="widget-header">
						<h4 class="smaller">全部栏目</h4>
					</div>
					<div class="widget-body">
						<div class="widget-main">
							<div class="dd-system" id="allnavs">
								<ol class="dd-list">
									<#list sysMenus as menu>
									<li class="dd-item" data-index='${menu_index}' data-name='${menu.getStr("name")}' data-type='${menu.getStr("type")}' data-key='${menu.getStr("key")}' data-link='${menu.getStr("link")}' data-code='${menu.getStr("code")}' data-ruletype='${menu.getStr("rule_type")}' data-ruleid='${menu.getStr("rule_id")}' data-url='' data-id='${menu.getId()}' data-custom='${menu.getInt("custom")}'>
										<div class="dd-handle clearfix">
											<span class="nav-title pull-left">${menu.getStr("name")}</span>
											<div class="pull-right action-buttons">
												<!--
												<a class="blue link Js_nav_link" href="javascript:"> <i class="icon-link bigger-130"></i> </a>
												-->
												<a class="blue edit Js_nav_edit" href="javascript:"> <i class="icon-pencil bigger-130"></i> </a>
												<a class="red del Js_nav_del" href="javascript:"> <i class="icon-trash bigger-130"></i> </a>
											</div>
											<div class="edit-box text-right pull-left">
												<input type="text" class="form-control nav-input">
												<div class="space-2"></div>
												<button type="button" class="btn btn-xs Js_edit_cancel">
													取消
												</button>
												<button type="button" class="btn btn-info btn-xs Js_edit_confirm">
													确定
												</button>
											</div>
										</div>
									</li>
									</#list>
								</ol>
							</div>
						</div>
					</div>
				</div>
				<div class="space-6"></div>
				<div class="widget-box">
					<div class="widget-header">
						<h4 class="smaller">自定义栏目</h4>
					</div>
					<div class="widget-body">
						<div class="widget-main">
							<div class="dd-custom" id="customnavs">
								<ol class="dd-list">
									<#list customerMenus as menu>
									<li class="dd-item" data-index='${menu_index}' data-name='${menu.getStr("name")}' data-type='${menu.getStr("type")}' data-key='${menu.getStr("key")}' data-link='${menu.getStr("link")}' data-code='${menu.getStr("code")}' data-ruletype='${menu.getStr("rule_type")}' data-ruleid='${menu.getStr("rule_id")}'  data-url='' data-id='${menu.getId()}' data-custom='${menu.getInt("custom")}' data-rel="custom">
										<div class="dd-handle clearfix">
											<span class="nav-title pull-left">${menu.getStr("name")}</span>
											<div class="pull-right action-buttons">
												<!--
												<a class="blue link Js_nav_link" href="javascript:"> <i class="icon-link bigger-130"></i> </a>
												-->
												<a class="blue edit Js_nav_edit" href="javascript:"> <i class="icon-pencil bigger-130"></i> </a>

												<a class="red del Js_nav_del" href="javascript:"> <i class="icon-trash bigger-130"></i> </a>
											</div>
											<div class="edit-box text-right pull-left">
												<input type="text" class="form-control nav-input">
												<div class="space-2"></div>
												<button type="button" class="btn btn-xs Js_edit_cancel">
													取消
												</button>
												<button type="button" class="btn btn-info btn-xs Js_edit_confirm">
													确定
												</button>
											</div>
										</div>
									</li>
									</#list>
								</ol>
							</div>
							<div class="text-right">
								<button type="button" class="btn btn-info btn-xs Js_create_customenav">
									新建
								</button>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="well">
					<div class="dd" id="navItem1">
						<#if menus_one??>
						<ol class="dd-list">
							<#list menus_one as menu>
							<li class="dd-item" data-index='${menu_index}' data-name='${menu.getStr("name")}' data-type='${menu.getStr("type")}' data-key='${menu.getStr("key")}' data-link='${menu.getStr("link")}'  data-url='' data-id='${menu.getId()}' data-code='${menu.getStr("code")}' data-ruletype='${menu.getStr("rule_type")}' data-ruleid='${menu.getStr("rule_id")}'  data-custom='${menu.getInt("custom")}' <#if menu.getInt("custom")==1>data-rel="custom"</#if>>
								<div class="dd-handle clearfix">
									<span class="nav-title pull-left">${menu.getStr("name")}</span>
									<div class="pull-right action-buttons">
										<!--
										<a class="blue link Js_nav_link" href="javascript:"> <i class="icon-link bigger-130"></i> </a>
										-->
										<a class="blue edit Js_nav_edit" href="javascript:"> <i class="icon-pencil bigger-130"></i> </a>

										<a class="red del Js_nav_del" href="javascript:"> <i class="icon-trash bigger-130"></i> </a>
									</div>
									<div class="edit-box text-right pull-left">
										<input type="text" class="form-control nav-input">
										<div class="space-2"></div>
										<button type="button" class="btn btn-xs Js_edit_cancel">
											取消
										</button>
										<button type="button" class="btn btn-info btn-xs Js_edit_confirm">
											确定
										</button>
									</div>
								</div>
							</li>
							</#list>
						</ol>
						<#else>
						<div class="dd-empty"></div>
						</#if>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="well">
					<div class="dd" id="navItem2">
						<#if menus_two??>
						<ol class="dd-list">
							<#list menus_two as menu>
							<li class="dd-item" data-index='${menu_index}' data-name='${menu.getStr("name")}' data-type='${menu.getStr("type")}' data-key='${menu.getStr("key")}' data-link='${menu.getStr("link")}'  data-url='' data-id='${menu.getId()}' data-code='${menu.getStr("code")}' data-ruletype='${menu.getStr("rule_type")}' data-ruleid='${menu.getStr("rule_id")}'  data-custom='${menu.getInt("custom")}' <#if menu.getInt("custom")==1>data-rel="custom"</#if>>
								<div class="dd-handle clearfix">
									<span class="nav-title pull-left">${menu.getStr("name")}</span>
									<div class="pull-right action-buttons">
										<!--
										<a class="blue link Js_nav_link" href="javascript:"> <i class="icon-link bigger-130"></i> </a>
										-->
										<a class="blue edit Js_nav_edit" href="javascript:"> <i class="icon-pencil bigger-130"></i> </a>

										<a class="red del Js_nav_del" href="javascript:"> <i class="icon-trash bigger-130"></i> </a>
									</div>
									<div class="edit-box text-right pull-left">
										<input type="text" class="form-control nav-input">
										<div class="space-2"></div>
										<button type="button" class="btn btn-xs Js_edit_cancel">
											取消
										</button>
										<button type="button" class="btn btn-info btn-xs Js_edit_confirm">
											确定
										</button>
									</div>
								</div>
							</li>
							</#list>
						</ol>
						<#else>
						<div class="dd-empty"></div>
						</#if>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="well">
					<div class="dd" id="navItem3">
						<#if menus_three??>
						<ol class="dd-list">
							<#list menus_three as menu>
							<li class="dd-item" data-index='${menu_index}' data-name='${menu.getStr("name")}' data-type='${menu.getStr("type")}' data-key='${menu.getStr("key")}' data-link='${menu.getStr("link")}'  data-url='' data-id='${menu.getId()}' data-custom='${menu.getInt("custom")}' data-code='${menu.getStr("code")}' data-ruletype='${menu.getStr("rule_type")}' data-ruleid='${menu.getStr("rule_id")}'  <#if menu.getInt("custom")==1>data-rel="custom"</#if>>
								<div class="dd-handle clearfix">
									<span class="nav-title pull-left">${menu.getStr("name")}</span>
									<div class="pull-right action-buttons">
										<!--
										<a class="blue link Js_nav_link" href="javascript:"> <i class="icon-link bigger-130"></i> </a>
										-->
										<a class="blue edit Js_nav_edit" href="javascript:"> <i class="icon-pencil bigger-130"></i> </a>

										<a class="red del Js_nav_del" href="javascript:"> <i class="icon-trash bigger-130"></i> </a>
									</div>
									<div class="edit-box text-right pull-left">
										<input type="text" class="form-control nav-input">
										<div class="space-2"></div>
										<button type="button" class="btn btn-xs Js_edit_cancel">
											取消
										</button>
										<button type="button" class="btn btn-info btn-xs Js_edit_confirm">
											确定
										</button>
									</div>
								</div>
							</li>
							</#list>
						</ol>
						<#else>
						<div class="dd-empty"></div>
						</#if>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-info Js_save_nav" type="button">
						<i class="icon-ok bigger-110"></i>
						保存
					</button>

					&nbsp; &nbsp; &nbsp;
					<button class="btn" type="reset">
						<i class="icon-undo bigger-110"></i>
						恢复默认
					</button>
					&nbsp; &nbsp; &nbsp;
					<button class="btn btn-info Js_create_nav" type="button">
						<i class="icon-ok bigger-110"></i>
						生成菜单
					</button>
				</div>
			</div>
			<!-- PAGE CONTENT ENDS -->
		</div><!-- /.col -->
	</div><!-- /.row -->
</div><!-- /.page-content -->
<div id="modal-table" style="display:none">
	<div class="modal-body no-padding">
		<table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
			<thead>
				<tr>
					<th>序列</th>
					<th>素材名称</th>
					<th>类别</th>
					<th>操作</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td><a href="#">ace.com</a></td>
					<td>$45</td>
					<td>3,330</td>
					<td><a href="javascript:">绑定</a></td>
				</tr>

				<tr>
					<td><a href="#">base.com</a></td>
					<td>$35</td>
					<td>2,595</td>
					<td><a href="javascript:">绑定</a></td>
				</tr>

				<tr>
					<td><a href="#">max.com</a></td>
					<td>$60</td>
					<td>4,400</td>
					<td><a href="javascript:">绑定</a></td>
				</tr>

				<tr>
					<td><a href="#">best.com</a></td>
					<td>$75</td>
					<td>6,500</td>
					<td><a href="javascript:">绑定</a></td>
				</tr>

				<tr>
					<td><a href="#">pro.com</a></td>
					<td>$55</td>
					<td>4,250</td>
					<td><a href="javascript:">绑定</a></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="modal-footer no-margin-top">
		<ul class="pagination pull-right no-margin">
			<li class="prev disabled">
				<a href="#"> <i class="icon-double-angle-left"></i> </a>
			</li>

			<li class="active">
				<a href="#">1</a>
			</li>

			<li>
				<a href="#">2</a>
			</li>

			<li>
				<a href="#">3</a>
			</li>

			<li class="next">
				<a href="#"> <i class="icon-double-angle-right"></i> </a>
			</li>
		</ul>
	</div>
</div>
<script>
WG.customMenu = {
init: function(){
this.bindFun();
},
bindFun: function(){
//拖拽
$('.dd,.dd-system,.dd-custom').nestable({
maxDepth:1
});
$("#allnavs").on("change",function(){
$('#allnavs').nestable("reset")
})
},

};

$(function($){
$('.dd,.dd-system,.dd-custom').nestable({
maxDepth:1
});

$("#allnavs").on("change",function(){
$('#allnavs').nestable("reset")
})

$('.dd-handle a,.dd-handle input,.dd-handle button').on('mousedown', function(e){
e.stopPropagation();
});
// $('[data-rel="tooltip"]').tooltip();

//保存栏目序列按钮事件
$(".Js_save_nav").on("click",function(){
	
$(".Js_save_nav").attr("disabled",true);

var a = $('#navItem1').nestable('serialize'),
b = $('#navItem2').nestable('serialize'),
c = $('#navItem3').nestable('serialize');
all = $('#allnavs').nestable('serialize');

var one = JSON.stringify(a);
var two = JSON.stringify(b);
var three = JSON.stringify(c);

var posturl = "/admin/settings/menu/saveMenu";
var postdata = {one:one,two:two,three:three};
WG.fn.ajax(posturl, postdata, function(data) {
	$(".Js_save_nav").attr("disabled",false);
	if(data.success){
		showToast("自定义菜单保存成功","提示",1500);
	}
});
});

//保存栏目序列按钮事件
$(".Js_create_nav").on("click",function(){
	
$(".Js_create_nav").attr("disabled",true);

var posturl = "/admin/settings/menu/createMenu";
var postdata = {};
WG.fn.ajax(posturl, postdata, function(data) {
	$(".Js_create_nav").attr("disabled",false);
	if(data.success){
		showToast("自定义菜单生成成功","提示",1500);
	}
});
});

//单栏目关联事件
$(document).on("click",".Js_nav_link", function(){
var s = ['<button class="btn btn-app btn-danger btn-sm"><i class="icon-trash bigger-200"></i>Delete</button>&nbsp;&nbsp;&nbsp;&nbsp;',
'<button class="btn btn-app btn-purple btn-sm"><i class="icon-cloud-upload bigger-200"></i>Upload</button>&nbsp;&nbsp;&nbsp;&nbsp;',
'<button class="btn btn-app btn-pink btn-sm"><i class="icon-share-alt bigger-200"></i>Share</button>',].join("");
$.fancybox({
width: 600,
autoHeight : true,
content: $("#modal-table"),
afterShow : function(){
//弹出后的事件
}
})
});

//单栏目编辑事件
$(document).on("click",".Js_nav_edit", function(){
var $this = $(this),
$hobj = $this.parents(".dd-handle");
var temptext =  $hobj.find(".nav-title").text();
$hobj.find(".edit-box").show();
$hobj.find(".edit-box").attr("data-edit-type","name")
$hobj.find(".nav-title").hide();
$hobj.find(".edit-box").find(".nav-input").val(temptext).select();
$this.parent().hide();
});

//单栏目删除事件
$(document).on("click",".Js_nav_del", function(){
var th = $(this).parents(".dd-item");
if($(this).parents(".dd-list").find("li").length == 1){
$(this).parents(".dd-list").parent().append('<div class="dd-empty"></div>');
//th.remove();
};

if($(this).parents("#allnavs").length > 0 || $(this).parents("#customnavs").length > 0){
if($(this).parents(".dd-list").find("li").length == 1){
$(this).parents(".dd-list").remove();
}else{
th.remove();
};
}else{
var rel = $(this).parents(".dd-item").data("rel");
var objs;
if(rel && rel == "custom"){
objs = "customnavs";
}else{
objs = "allnavs";
};

if(!$("#"+objs).find('ol').length > 0){
$("#"+objs).html($('<ol class="dd-list"></ol>'));
}
$("#"+objs).find('ol').append(th)

}
});

//单栏目编辑确定按钮事件
$(document).on("click",".Js_edit_confirm",function(){
var $this = $(this),
$hobj = $this.parents(".dd-handle");
var tcon =  $hobj.find(".edit-box").find(".nav-input").val();
var _type = $hobj.find(".edit-box").attr("data-edit-type");
if(_type == 'name'){
$hobj.find(".nav-title").text(tcon).show();
$hobj.parent().attr("data-name",tcon);
}else{
$hobj.find(".nav-title").show();
$hobj.parent().attr("data-url",tcon);
};
$hobj.find(".edit-box").find(".nav-input").val("");
$hobj.find(".edit-box").hide();
$hobj.find(".action-buttons").show();
});

//单栏目编辑取消按钮事件
$(document).on("click",".Js_edit_cancel",function(){
var $this = $(this),
$hobj = $this.parents(".dd-handle");
$hobj.find(".nav-title").show();
$hobj.find(".edit-box").find(".nav-input").val("");
$hobj.find(".edit-box").hide();
$hobj.find(".action-buttons").show();
});

// 创建栏目
$(".Js_create_customenav").on("click",function(){
showToast('自定义菜单功能，稍后提供...','提示',2000);
return;
var $this = $(this);
var _html = [
'<div class="widget-box no-border">',
'	<div class="widget-header no-border">',
'		<h4>新建自定义栏目</h4>',
'	</div>',
'	<div class="widget-body no-border">',
'		<div class="widget-main no-padding">',
'			<div class="modal-body">',
'				<div>',
'					<label>标题：</label>',
'					<input class="form-control txtinput tooltip-info" id="" data-input="val-title" name="title" type="text" placeholder="" maxlength="30">',
'				</div>',
'				<div class="space-6"></div>',
'				<div>',
'					<label>链接地址：</label>',
'					<input class="form-control txtinput tooltip-info" id="" data-input="val-title" name="title" type="text" placeholder="" maxlength="30">',
'				</div>',
'			</div>',
'			<div class="modal-footer">',
'				<button data-bb-handler="cancel" type="button" class="btn btn-default Js_fancybox_close">取消</button>',
'				<button data-bb-handler="confirm" type="button" class="btn btn-primary Js_create_nav_submit">确定</button>',
'			</div>',
'		</div>',
'	</div>',
'</div>'].join("");
$.fancybox({
width : 400,
height : 'auto',
autoSize : false,
padding : 0,
content: _html,
afterShow : function(){
$(".Js_create_nav_submit").on("click", function(){
var _newitem = [
'<li class="dd-item" data-id="21" data-rel="custom">',
'	<div class="dd-handle clearfix">',
'		<span class="nav-title pull-left">Item 21</span>',
'		<div class="pull-right action-buttons">',
'			<a class="blue link Js_nav_link" href="javascript:">',
'				<i class="icon-link bigger-130"></i>',
'			</a>',
'			<a class="blue edit Js_nav_edit" href="javascript:">',
'				<i class="icon-pencil bigger-130"></i>',
'			</a>',
'			<a class="red del Js_nav_del" href="javascript:">',
'				<i class="icon-trash bigger-130"></i>',
'			</a>',
'		</div>',
'		<div class="edit-box text-right pull-left">',
'			<input type="text" class="form-control nav-input">',
'			<div class="space-2"></div>',
'			<button type="button" class="btn btn-xs Js_edit_cancel">取消</button>',
'			<button type="button" class="btn btn-info btn-xs Js_edit_confirm">确定</button>',
'		</div>',
'	</div>',
'</li>'].join("")
$this.parents(".widget-main").find(".dd-list").append(_newitem);
$('.dd-handle a,.dd-handle input,.dd-handle button').on('mousedown', function(e){
e.stopPropagation();
});
$.fancybox.close();
});
}
})
})
});
</script>
</@we.html>