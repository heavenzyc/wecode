<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=["${jspath}/common.js","${jspath}/jquery.checktextnumber.js","${jspath}/jquery.fancybox.min.js"]>
<@we.breadcrumb/>
<div class="page-content">
	<div class="page-header row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<ul class="nav nav-pills" style="margin-left:0">
				<li>
					<a href="/admin/settings/wechat">账号绑定</a>
				</li>
				<li class="active">
					<a href="#">命令设置</a>
				</li>
			</ul>
			<div class="hr"></div>
			<div class="space-8"></div>

			<div class="tabbable tabs-left">
				<ul class="nav nav-tabs">
					<li>
						<a href="/admin/settings/wechat/commandIndex"> 被添加自动回复 </a>
					</li>

					<li class="active">
						<a href="/admin/settings/wechat/commandAutoReplyIndex"> 消息自动回复 </a>
					</li>

					<li>
						<a href="/admin/settings/wechat/commandKeyReplyIndex"> 关键词自动回复 </a>
					</li>
				</ul>

				<div class="tab-content">
					<div class="tab-pane in active">
						<div class="tabbable">
							<ul class="nav nav-tabs" >
								<li <#if !content??>class="active"</#if>>
									<a data-toggle="tab" href="#words"> <i class="blue icon-edit bigger-110"></i>文字 </a>
								</li>
								<li <#if content??>class="active"</#if>>
									<a class="Js_select_pic" data-toggle="tab" href="#picture"> <i class="blue icon-camera-retro bigger-110"></i>图文 </a>
								</li>
							</ul>

							<div class="tab-content">
								<div id="words" class="tab-pane <#if !content??>in active</#if>">
									<form id="text_form" method="post" action="">
										<input type="hidden" id="textContentId" name="textContentId" value="${replyContent.id}" />
										<input type="hidden" name="msg_type" value="TEXT" />
										<textarea class="form-control Js_check_words" name="textContent" style="height:140px;" placeholder="">${replyContent.text_content!''}</textarea>
										<div class="textnumbox pull-right"></div>
										<div class="space-4"></div>
										<div class="btn-group">
											<button type="button" class="btn btn-sm btn-grey Js_delete_text">
												删除
											</button>
											<button class="btn btn-sm btn-success Js_submit_text" style="margin-left:10px;">
												保存
											</button>
										</div>
									</form>
								</div>

								<div id="picture" class="tab-pane <#if content??>in active</#if>">
									<form id="news_form" method="post" action="">
										<input type="hidden" id="textContentId" name="textContentId" value="${replyContent.id}" />
										<input type="hidden" name="msg_type" value="NEWS" />
										<div class="pic-area">
											<input type="hidden" name="wxContentId" value="">
										</div>
										<div class="space-4"></div>
										<div class="btn-group">
											<button type="button" class="btn btn-sm btn-grey Js_delete_news">
												删除
											</button>
											<button class="btn btn-sm btn-success Js_submit_news" style="margin-left:10px;">
												保存
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- PAGE CONTENT ENDS -->
		</div><!-- /.col -->
	</div><!-- /.page-header -->
</div>

<script>
	function showSelectWordpic(id, title, img, time, des){
	var rt = ['<div class="Js_wordpic">', '<div class="wp-box">', '<div class="title">',title ,'</div>', '<div class="time">', time ,'</div>', '<div class="pic">', '<img src="',img,'" alt="',title,'">', '</div>', '<div class="des">',des, '</div>', '</div>','</div>'].join("");
	//$(".gz-repeat-con-list ul").append(rt);
	$(".pic-area .Js_wordpic").remove();
	$(".pic-area").append(rt);
	$(".pic-area input").val(id);
	//设置图文id
	$.fancybox.close();
	}
	function showSelectWordpicForInit(id, title, img, time, des){
	var rt = ['<div class="Js_wordpic">', '<div class="wp-box">', '<div class="title">',title ,'</div>', '<div class="time">', time ,'</div>', '<div class="pic">', '<img src="',img,'" alt="',title,'">', '</div>', '<div class="des">',des, '</div>', '</div>','</div>'].join("");
	//$(".gz-repeat-con-list ul").append(rt);
	$(".pic-area .Js_wordpic").remove();
	$(".pic-area").append(rt);
	$(".pic-area input").val(id);
	//设置图文id
	}
	$(function() {
	$(document).on('click','.Js_page', function() {
	var $this = $(this)
	var page = $this.text();
		var posturl = "/admin/settings/wechat/getContent";
		var postdata = {"page":page};
		WG.fn.ajax(posturl, postdata, function(data) {
		$.fancybox({
		width : '800',
		height : 'auto',
		autoSize : false,
		padding : 0,
		scrolling : 'auto',
		content : data.html,
		afterShow : function() {
			$(".Js_confirm").on("click", function() {
			var obj = $("input[name='media']:checked").parent().parent().parent();
			var id = $("input[name='media']:checked").val();
			var title = obj.find(".title").html();
			var img = obj.find(".thumb").attr("src");
			var time = obj.find(".media-time").html();
			var des = obj.find(".des").html();
			showSelectWordpic(id, title, img, time, des);
			});
		},
		afterClose : function() {
			$(".Js_confirm").off("click");
		}
		})
		$.fancybox.hideLoading()
		});
	});

	//$(".Js_select_pic").on("click",selectWordpic);
	$(".Js_select_pic").on("click", function() {
	$.fancybox.showLoading();
	$(".pic-area .Js_mwordpic").remove();
	var posturl = "/admin/settings/wechat/getContent";
	var postdata = {};
	WG.fn.ajax(posturl, postdata, function(data) {
	$.fancybox({
	width : '800',
	height : 'auto',
	autoSize : false,
	padding : 0,
	scrolling : 'auto',
	content : data.html,
	afterShow : function() {
	$(".Js_confirm").on("click", function() {
	var obj = $("input[name='media']:checked").parent().parent().parent();
	var id = $("input[name='media']:checked").val();
	var title = obj.find(".title").html();
	var img = obj.find(".thumb").attr("src");
	var time = obj.find(".media-time").html();
	var des = obj.find(".des").html();
	showSelectWordpic(id, title, img, time, des);
	});
	},
	afterClose : function() {
	$(".Js_confirm").off("click");
	}
	})
	$.fancybox.hideLoading()
	});
	});

	$(".Js_delete_text").on("click", function() {
	$("#text_form").attr("action", "/admin/settings/wechat/deleteContentReply");
	$("#text_form").submit();
	});

	$(".Js_delete_news").on("click", function() {
	$("#news_form").attr("action", "/admin/settings/wechat/deleteContentReply");
	$("#news_form").submit();
	});

	$(".Js_submit_news").on("click", function() {
	$("#news_form").attr("action", "/admin/settings/wechat/commandAutoReply");
	$("#news_form").submit();
	});

	$(".Js_submit_text").on("click", function() {
	$("#text_form").attr("action", "/admin/settings/wechat/commandAutoReply");
	$("#text_form").submit();
	});

	/**
	* [selectPic 选择图片]
	* @return {[type]} [description]
	*/
	/*
	var selectPic = function(){
	var _html = [
	'<div class="widget-box no-border">',
	'	<div class="widget-header no-border">',
	'		<h4>选择素材</h4>',
	'	</div>',
	'	<div class="widget-body no-border">',
	'		<div class="widget-main no-padding">',
	'			<div class="material-list-wrap">',
	'			<form>',
	'				<ul>',
	'					<li>',
	'						<div class="media-info">',
	'							<label class="media-name" for="checkbox1">',
	'								<input id="checkbox1" name="media" type="radio" value="200776834">Tulips.jpg',
	'							</label>',
	'							<span class="media-size">339.8	K</span>',
	'							<span class="media-time">2014-02-09</span>',
	'						</div>',
	'						<div class="media-content">',
	'							<a href="#" target="_blank" class="">',
	'							    <img class="thumb-img" src="assets/images/gallery/image-2.jpg">',
	'							</a>',
	'						</div>',
	'					</li>',
	'					<li>',
	'						<div class="media-info">',
	'							<label class="media-name" for="checkbox2">',
	'								<input id="checkbox2" name="media" type="radio" value="200776834">Tulips.jpg',
	'							</label>',
	'							<span class="media-size">339.8	K</span>',
	'							<span class="media-time">2014-02-09</span>',
	'						</div>',
	'						<div class="media-content">',
	'							<a href="#" target="_blank" class="">',
	'							    <img class="thumb-img" src="assets/images/gallery/image-2.jpg">',
	'							</a>',
	'						</div>',
	'					</li>',
	'				</ul>',
	'			</form>',
	'			</div>',
	'			<div class="form-actions center">',
	'				<button type="button" class="btn btn-sm btn-success Js_confirm">',
	'					<b>确定</b>',
	'				</button>',
	'				<button class="btn btn-sm btn-grey Js_fancybox_close">',
	'					取消',
	'				</button>',
	'			</div>',
	'		</div>',
	'	</div>',
	'</div>'].join("");

	$.fancybox({
	width : '800',
	height : '605',
	autoSize : false,
	padding : 0,
	scrolling : 'auto',
	content: _html,
	afterShow : function(){
	$(".Js_confirm").on("click", showSelectPic);
	}
	})
	};

	var showSelectPic = function(){
	var $obj = $(".material-list-wrap input:checked");
	var osrc = $obj.parents("li").find(".thumb-img").attr("src");
	$(".pic-area img").remove();
	$(".pic-area").append('<img class="thumb-img" src="'+osrc+'">');
	$(".pic-area input").val(osrc);
	$.fancybox.close();
	};
	*/

	$(".Js_check_words").checkTextNumber({
	maxNum : 600//设置可输入最大文字
	});

	<#if content??>
	showSelectWordpicForInit('${content.getId()}','${content.getStr("title")}','${content.getStr("small_pic_url")}','${content.getDate("create_time")}','${content.getStr("summary")}');
	</#if>
	});</script>

</@we.html>