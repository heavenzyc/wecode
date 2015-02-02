<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=["${jspath}/common.js","${jspath}/jquery.checktextnumber.js","${jspath}/jquery.fancybox.min.js"]>
<@we.breadcrumb/>
<div class="page-content">
	<div class="page-header row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<ul class="nav nav-pills" style="margin-left:0">
				<li>
					<a href="${base}/admin/settings/wechat">账号绑定</a>
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
						<a href="${base}/admin/settings/wechat/commandIndex"> 被添加自动回复 </a>
					</li>

					<li>
						<a href="${base}/admin/settings/wechat/commandAutoReplyIndex"> 消息自动回复 </a>
					</li>

					<li class="active">
						<a href="#"> 关键词自动回复 </a>
					</li>
				</ul>

				<div class="tab-content">
					<div class="tab-pane in active">
						<div class="tabbable">
							<div class="clearfix">
								<button type="button" class="btn btn-info btn-sm pull-right Js_add_rule">
									添加规则
								</button>
							</div>
							<div class="space-6"></div>
							<div class="widget-box new-rule" data-id="0">
								<div class="widget-header">
									<h4>新规则</h4>
									<div class="widget-toolbar">
										<a href="#" data-action="collapse"> <i class="icon-chevron-up"></i> </a>
									</div>
								</div>
								<div class="widget-body">
									<div class="widget-body-inner" style="display: block;">
										<div class="widget-main no-padding">
											<div class="gz-name pa">
												<label for="form-field-8">规则名</label>
												<input class="form-control" id="Js_ruleName_0" type="text" placeholder="">
												<div class="space-12"></div>
											</div>
											<div class="gz-keywords pa">
												<label>关键字</label>
												<a class="pull-right Js_add_words" href="javascript:">添加关键字</a>
											</div>
											<div class="gz-keywords-con">
												<ul class="f" id="Js_keywordList_0"></ul>
											</div>
											<!--
											<div class="gz-repeat pa">
												<label>回复</label>
												<span class="pull-right">
													<input id="c" type="checkbox" >
													<label for="c"> 全部回复</label></span>
											</div>
											-->
											<div class="gz-repeat-con">
												<span class="bl Js_add_words" data-types="words"><i class="gray icon-edit bigger-110"></i> 文字</span>
												<!--
												<span class="bl Js_add_pic" data-types="pics"><i class="gray icon-camera-retro bigger-110"></i> 图片</span>
												-->
												<span class="bl Js_add_wordspic"><i class="gray icon-credit-card bigger-110"></i> 图文</span>
											</div>
											<div class="gz-repeat-con-list">
												<ul id="Js_replyList_0"></ul>
											</div>
											<div class="form-actions text-right" style="margin:0">
												<input type="hidden" id="rule_type" value="" />
												<input type="hidden" id="reply_content" value="" />
												<input type="hidden" id="reply_content_id" value="" />
												<button type="button" data-id="0" class="btn btn-sm btn-success Js_newrepeat_save">
													<b>保存</b>
												</button>
												<button type="button" data-id="0" class="btn btn-sm btn-grey Js_newrepeat_del">
													删除
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="space-10"></div>
							<ul class="ruleitem-list">
								<#list replyRules as replyRule>
								<li>
									<div class="widget-box" data-id="1">
										<div class="widget-header">
											<h4>${replyRule.getStr("name")}</h4>
											<div class="widget-toolbar">
												<a href="/admin/settings/wechat/commandKeyReplyDelete/${replyRule.getId()}"> 删除 </a>
											</div>
										</div>
										<div class="widget-body">
											<div class="rule-prev">
												<div class="keyword-list">
													<label class="lt">关键词</label>
													<#list replyRule.replyKeywords as replyKeyword>
														<span>${replyKeyword.getStr("key")}</span>
													</#list>
												</div>
												<!--
												<div class="space-6"></div>
												<div class="reply-list">
													<label class="lt">回复</label>2条
												</div>
												-->
											</div>
										</div>
									</div>
								</li>
								</#list>
							</ul>
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
	$(function() {
		var ns, keywords_n = 0, contents_n = 0;

		var showAddPicbox = function() {
			var $this = $(this);
			var _html = ['<div class="widget-box no-border">', '	<div class="widget-header no-border">', '		<h4>选择素材</h4>', '	</div>', '	<div class="widget-body no-border">', '		<div class="widget-main no-padding">', '			<div class="material-list-wrap">', '			<form>', '				<ul>', '					<li>', '						<div class="media-info">', '							<label class="media-name" for="checkbox1">', '								<input id="checkbox1" name="media" type="radio" value="200776834">Tulips.jpg', '							</label>', '							<span class="media-size">339.8	K</span>', '							<span class="media-time">2014-02-09</span>', '						</div>', '						<div class="media-content">', '							<a href="#" target="_blank" class="">', '							    <img class="thumb-img" src="assets/images/gallery/image-2.jpg">', '							</a>', '						</div>', '					</li>', '					<li>', '						<div class="media-info">', '							<label class="media-name" for="checkbox2">', '								<input id="checkbox2" name="media" type="radio" value="200776834">Tulips.jpg', '							</label>', '							<span class="media-size">339.8	K</span>', '							<span class="media-time">2014-02-09</span>', '						</div>', '						<div class="media-content">', '							<a href="#" target="_blank" class="">', '							    <img class="thumb-img" src="assets/images/gallery/image-2.jpg">', '							</a>', '						</div>', '					</li>', '				</ul>', '			</form>', '			</div>', '			<div class="form-actions center" style="margin-bottom:0">', '				<button type="button" class="btn btn-sm btn-success Js_confirm">', '					<b>确定</b>', '				</button>', '				<button class="btn btn-sm btn-grey Js_fancybox_close">', '					取消', '				</button>', '			</div>', '		</div>', '	</div>', '</div>'].join("");

			$.fancybox({
				width : '800',
				height : 'auto',
				autoSize : false,
				padding : 0,
				scrolling : 'auto',
				content : _html,
				afterShow : function() {
					var tar = $this.attr("data-types");
					if (!tar) {
						ns = keywords_n;
					} else {
						ns = contents_n;
					};

					$(".Js_confirm").on("click", function() {
						showMediaContent($this, "pics", ns)
					});
				},
				afterClose : function() {
					$(".Js_confirm").off("click");
				}
			})
		};

		var showAddWordpicbox = function() {
			var $this = $(this);
			var _html = [].join("");
			
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
					var tar = $this.attr("data-types");
					if (!tar) {
						ns = keywords_n;
					} else {
						ns = contents_n;
					};

					$(".Js_confirm").on("click", function() {
						showMediaContent($this, "wordspics", ns)
					});
				},
				afterClose : function() {
					$(".Js_confirm").off("click");
				}
				});
			});
		};

		var showAddWordsBox = function(objs, text) {
			text = text || "";
			var $this = objs;
			var tar = $this.attr("data-types"), t;
			if (tar && tar == "words") {
				t = "添加回复文字";
			} else {
				t = "添加关键字";
			};
			var _html = ['<div class="widget-box no-border">', '	<div class="widget-header no-border">', '		<h4>' + t + '</h4>', '	</div>', '	<div class="widget-body no-border">', '		<div class="widget-main no-padding">', '			<div class="material-wrap" style="padding:20px;">', '			<form>', '				<textarea class="form-control Js_check_img_words" style="height:140px;" placeholder="">' + text + '</textarea>', '				<div class="textnumbox pull-right"></div>', '			</form>', '			</div>', '			<div class="form-actions center" style="margin-bottom:0">', '				<button type="button" class="btn btn-sm btn-success Js_confirm">', '					<b>确定</b>', '				</button>', '				<button class="btn btn-sm btn-grey Js_fancybox_close">', '					取消', '				</button>', '			</div>', '		</div>', '	</div>', '</div>'].join("");

			$.fancybox({
				width : '800',
				height : 'auto',
				autoSize : false,
				padding : 0,
				scrolling : 'no',
				content : _html,
				afterShow : function() {
					var tar = $this.attr("data-types");
					if (!tar) {
						ns = keywords_n;
					} else {
						ns = contents_n;
					};
					var action;
					//1：添加，2：修改
					if (text == "") {
						action = 1
					} else {
						action = 2
					}
					$(".Js_confirm").on("click", function() {
						showMediaContent($this, "words", ns, action)
					});
				}
			})
		};

		//添加关键字，添加回复文字
		$(".Js_add_words").on("click", function() {
			var $this = $(this)
			showAddWordsBox($this)
		});

		//添加图片自动回复
		$(".Js_add_pic").on("click", showAddPicbox);

		//添加图文自动回复
		$(".Js_add_wordspic").on("click", showAddWordpicbox);

		//修改关键字，修改回复文字
		$(document).on("click", ".Js_edit_words", function() {
			var $this = $(this)
			var _text = $this.parents("li").attr("data-content");
			showAddWordsBox($this, _text)
		});
		$(document).on("click", ".Js_del_words", function() {
			var $this = $(this)
			$this.parents("li").remove();
		});
		$(document).on("click", ".Js_del_reply", function() {
			var $this = $(this)
			$this.parents("li").remove();
		});

		/**
		 * [showMediaContent 显示添加内容]
		 * @param  {[type]} obj  [触发事件对象]
		 * @param  {[type]} type [事件类型]
		 * @param  {[type]} action [添加或修改 1：添加，2：修改]
		 * @param  {[type]} n    [序列]
		 * @return {[type]}      [description]
		 */
		var showMediaContent = function(obj, type, n, action) {
			clearContent();
			var $this = $(this);
			var tar = obj.attr("data-types");
			var itemid = obj.parents(".widget-box").attr("data-id");

			if (type === "words") {
				//回复-文字
				
				var sp = $(".Js_check_img_words").val();
				sp = WG.fn.htmlspecialchars(sp);
				
				$("#rule_type").val("TEXT");
				$("#reply_content").val(sp);
				if (tar && tar === "words") {
					//data-type 1：文字，2：图片，3：图文
					var rt = ['<li data-index="' + n + '" data-type="1" data-id="' + itemid + '" data-content="' + sp + '">', '	<div class="pull-left Js_media_content">' + sp + '</div>', '	<div class="pull-right ctr-btns action-buttons">', '		<a href="javascript:" class="Js_edit_words" data-types="words" title="编辑"><i class="icon-pencil blue bigger-125"></i></a>', '		<a href="javascript:" class="Js_del_words" title="删除"><i class="icon-remove red bigger-125"></i></a>', '	</div>', '</li>'].join("");
					if (action && action == 1) {
						$(".gz-repeat-con-list ul").append(rt);
						contents_n++;
					} else {
						obj.parents("li").attr("data-content", sp);
						obj.parents("li").find(".Js_media_content").text(sp)
					}
				} else {
					var rt = ['<li data-index="' + n + '" data-id="' + itemid + '" data-content="' + sp + '">', '	<div class="pull-left Js_keywords_val">' + sp + '</div>', '	<div class="pull-right ctr-btns action-buttons">', '		<a href="javascript:" class="Js_edit_words" title="编辑"><i class="icon-pencil blue bigger-125"></i></a>', '		<a href="javascript:" class="Js_del_reply" title="删除"><i class="icon-remove red bigger-125"></i></a>', '	</div>', '</li>'].join("");

					if (action && action == 1) {
						$(".gz-keywords-con ul").append(rt);
						keywords_n++;
					} else {
						obj.parents("li").attr("data-content", sp);
						obj.parents("li").find(".Js_keywords_val").text(sp)
					}
				}
			} else if (type === "pics") {
				//回复-图片
				$("#rule_type").val("IMG");
				var $obj = $(".material-list-wrap input:checked");
				var osrc = $obj.parents("li").find(".thumb-img").attr("src");
				if (tar && tar == "pics") {
					var rt = ['<li data-index="' + n + '" data-type="2" data-id="' + itemid + '">', '	<div class="pull-left"><img class="thumb-img" src="' + osrc + '"></div>', '	<div class="pull-right ctr-btns action-buttons">', '		<a href="javascript:" class="Js_del_reply" title="删除"><i class="icon-remove red bigger-125"></i></a>', '	</div>', '</li>'].join("");
					$(".gz-repeat-con-list ul").append(rt);
					contents_n++;
				}
			} else if (type === "wordspics") {
				//回复图文
				
				var $obj = $(".material-list-wrap input:checked").parent().parent().parent();
				var id = $(".material-list-wrap input:checked").val();
				var title = $obj.find(".title").text();
				var time = $obj.find(".media-time").text();
				var img = $obj.find(".thumb").attr("src");
				var des = $obj.find(".des").text();
				var rt = ['	<li>','<div class="pull-left Js_media_content">','<div class="wp-box">','<div class="title">',title,'</div>', '<div class="time">',time,'</div>', '<div class="pic">', '<img src="',img,'" alt="">', '</div>', '<div class="des">', des, '	</div>', '			</div>', '		</div>', '		<div class="pull-right ctr-btns action-buttons">', '			<a href="javascript:" class="Js_del_reply" title="删除"><i class="icon-remove red bigger-125"></i></a>', '		</div>', '	</li>'].join("");
				$(".gz-repeat-con-list ul").append(rt);
				contents_n++;
				
				$("#rule_type").val("NEWS");
				$("#reply_content").val("");
				$("#reply_content_id").val(id);
			};
			$.fancybox.close();
		};

		$(".Js_newrepeat_save").on("click", function() {
			var $this = $(this), _id = $this.attr("data-id");
			var $keywords_li = $("#Js_keywordList_" + _id).find("li");
			var $contents_li = $("#Js_replyList_" + _id).find("li");
			var _name = $("#Js_ruleName_" + _id).val();
			var _keywords = [];
			var _content = $("#reply_content").val();
			var _contentId = $("#reply_content_id").val();
			var _type=$("#rule_type").val();
			
			for (var i = 0; i < $keywords_li.length; i++) {
				_keywords.push($("#Js_keywordList_" + _id + " li").eq(i).attr("data-content"));
			};
			
			console.log("_keywords="+_keywords);
			console.log("_name="+_name);
			console.log("_content="+_content);
			console.log("_type="+_type);
			var posturl = "/admin/settings/wechat/commandKeyReply";
			var postdata = {
				type : _type,
				content : _content,
				contentId : _contentId,
				name : _name,
				keywords : _keywords
			};
			
			 WG.fn.ajax(posturl,postdata,function(data){
				window.location.reload();
			 })
			 
		});

		//新规则添加事件
		$(".Js_add_rule").on("click", function() {
			$(".new-rule").show()
		});
		//新规则删除事件
		$(".Js_newrepeat_del").on("click", function() {
			$(this).parents(".widget-box").hide();
			window.location.reload();
		})

		$(".Js_check_words").checkTextNumber({
			maxNum : 600//设置可输入最大文字
		});
		
	});
	
	function clearContent(){
		$("#Js_replyList_0 li").remove();
	}
</script>
</@we.html>