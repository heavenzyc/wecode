<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["/assets/css/uploadify.css","/assets/css/jquery.Jcrop.css","/assets/css/jquery.fancybox.css","/assets/css/style.css"] js=["${jspath}/sisyphus.min.js"]>
<@we.breadcrumb current="添加单图文"/>
<div class="page-content">
	<div class="row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<div class="material clearfix">
				<div class="pview">
					<div id="JS_pview_box">
						<div class="module" id="JS_pictxt_0">
							<div class="potion">
								<div class="shade">
									<div class="bj"></div>
									<div class="handle">
										<a class="modif" href="javascript:;"></a>
									</div>
								</div>
								<div class="heads val-title">
									标题
								</div>
								<div class="con-pic Js_context_pic">
									封面图片
								</div>
								<div class="digest val-digest">
									摘要
								</div>
							</div>
						</div>
					</div>
					<!--
					<div class="space-6"></div>
					<div class="pdt10">
						<a class="addmet" href="javascript:;" id="JS_add_material"> <img class="addicon" src="/assets/images/add.png"><span class="addtxt">增加一条</span> </a>
					</div>
					-->
				</div>
				<form id="form" name="form">
				<div class="manbox">
					<div id="JS_edit_conten">
							<div class="import" id="JS_conten_0" data="0">
								<span class="icons"></span>
								<div class="laytil">
									信息内容
								</div>
								<div class="conte">
									<div class="space-6"></div>
									<div>
										<label>标题</label>
										<input class="form-control txtinput tooltip-info" id="title_0" data-input="val-title"  name="title" type="text" placeholder="标题（30个字以内）" maxlength="30">
									</div>
									<div class="space-6"></div>
									<label>封面图片</label>
									<div class="clearfix"></div>
									<div class="ace-file-input ace-file-multiple pointer clearfix pull-left Js_upload_pics" data-obj="Js_context_pic" data-crop="true" data-crop-size="600*300" data-config-code="MEDIA" data-config-maxsize="10200000" data-config-type=".jpg|.bmp">
										<div class="nopic-box">
											<input class="picvalue" name="pic" type="hidden" value="">
											<input class="oldpicvalue" name="old-pic" type="hidden" value="">
											<label class="file-label" data-title="上传封面图"> <span class="file-name" data-title="No File ..."> <i class="icon-cloud-upload"></i> </span> </label>
										</div>
									</div>
									<div class="clearfix"></div>
									<div>
										<label>添加摘要</label>
										<textarea class="form-control limited txtinput" id="summary" name="summary" data-input="val-digest"  maxlength="120" placeholder="添加摘要"></textarea>
									</div>
									<div class="space-6"></div>
									<div>
										<label for="form-field-9">正文</label>
										<script class="JS_editor" type="text/plain" id="JS_editor_0"></script>
									</div>
									<div class="space-6"></div>
									<div>
										<label>添加原文链接</label>
										<input class="form-control" id=""  name="page-url" type="text" placeholder="添加原文链接">
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="saverow"></div>
				</div>
			</div>
			<div class="clearfix form-actions">
				<div class="col-md-12 text-center">
					<button class="btn btn-info Js_material_submit" type="button">
						<i class="icon-ok bigger-110"></i>
						保存
					</button>

					&nbsp; &nbsp; &nbsp;
					<button class="btn Js_material_cancel" type="button" onclick="cancel_form();">
						<i class="icon-undo bigger-110"></i>
						取消
					</button>
				</div>
			</div>
			<!-- PAGE CONTENT ENDS -->
		</div><!-- /.col -->
	</div><!-- /.row -->
</div><!-- /.page-content -->
</div><!-- /.main-content -->
</div><!-- /.main-container-inner -->

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"> <i class="icon-double-angle-up icon-only bigger-110"></i> </a>
</div><!-- /.main-container -->
<textarea style="display:none" id="JS_items_text">
	<div class="module">
		<div class="potion">
			<div class="shade">
				<div class="bj"></div>
				<div class="handle">
					<a class="modif" href="javascript:;"></a><a class="remov" href="javascript:;"></a>
				</div>
			</div>
			<span class="titxt val-title">
				标题						
			</span>
			<span class="imgbox">
				缩略图
			</span>
		</div>
	</div>
</textarea>
<textarea style="display:none" id="JS_edit_text">
	<span class="icons"></span>
	<div class="laytil">信息内容</div>
	<div class="conte">
		<div class="space-6"></div>
		<div>
			<label for="form-field-8">标题</label>
			<input class="form-control txtinput" id=""  name="title" type="text" data-input="val-title" placeholder="标题（30个字以内）" maxlength="30">
		</div>

		<div class="space-6"></div>
		<label>封面图片</label>
		<div class="clearfix"></div>
		<div class="ace-file-input ace-file-multiple pointer clearfix pull-left Js_upload_pics" data-obj="" data-crop="true" data-crop-size="200*200" data-config-code="MEDIA" data-config-maxsize="10200000" data-config-type=".jpg|.bmp">
			<div class="nopic-box">
				<input class="picvalue" name="pic" type="hidden" value="">
				<input class="oldpicvalue" name="old-pic" type="hidden" value="">
				<label class="file-label" data-title="上传封面图">
					<span class="file-name" data-title="No File ..."> <i class="icon-cloud-upload"></i>
					</span>
				</label>
			</div>
		</div>
		<div class="clearfix"></div>
		<div>
			<label for="form-field-9">正文</label>
			<script class="JS_editor" type="text/plain" id="JS_editor_0"></script>
		</div>
		<div class="space-6"></div>
		<div>
			<label>添加原文链接</label>
			<input class="form-control" id=""  name="page-url" type="text" placeholder="添加原文链接">
		</div>
	</div>
</textarea>
<!-- basic scripts -->
<!-- page specific plugin scripts -->
<script src="/assets/js/common.js"></script>
<script src="/assets/js/ueditor/ueditor.config.js"></script>

<script src="/assets/js/ueditor/ueditor.all.min.js"></script>
<!--
<script src="/assets/js/ueditor/ueditor.all.js"></script>
-->
<script src="/assets/js/jquery.fancybox.min.js"></script>
<script src="/assets/js/jquery.uploadify.js"></script>
<script src="/assets/js/jquery.Jcrop.min.js"></script>
<script src="/assets/js/uploadavatar.js"></script>
<script src="/assets/js/upload.config.js"></script>
<!-- ace scripts -->

<script>

	function cancel_form(){
		window.location.href="${base}/admin/project/media/";
	}
	
	//实例化编辑器
	var ue = [];
	//编辑器数组
	var a = [];
	var options = {
		initialFrameWidth : 465,
		initialFrameHeight : 190,
		focus : false,
		autosave : false,
		param : "UEDITOR",
		imgtype : ".jpg|.bmp",
		elementPathEnabled : false,
		toolbars : [["bold", "italic", "underline", "|", "insertorderedlist", "insertunorderedlist", "|", "insertimage", "|", "removeformat", "forecolor", "backcolor", "insertvideo"]]
	};

	$(function() {
		//调用上传图片
		uploadPic().init();
		//初始化tooltip
		$('[data-rel=tooltip]').tooltip({
			container : 'body'
		});

		ue[0] = UE.getEditor('JS_editor_0', options);
		//初始化第一个编辑器
		a[0] = 0;
		synChronize(0);
		//同步第一个新闻数据
		addEditevent(0);
		//添加第一个编辑事件
		var flag = 1;
		$('#JS_add_material').click(function(event) {//添加一条图文消息
			if ($('.module').length >= 8) {
				alert("最多只能添加8条图文消息！");
			} else {
				var items = '<div class="pdt10 JS_pictxt_' + flag + '" id="JS_pictxt_' + flag + '" data="' + flag + '">' + $('#JS_items_text').val() + '</div>';
				var edit = '<div class="import hide" id="JS_conten_' + flag + '" data="' + flag + '">' + $('#JS_edit_text').val() + '</div>';
				$('#JS_pview_box').append(items);
				$('#JS_edit_conten').append(edit);
				$('.JS_editor', '#JS_conten_' + flag).attr('id', 'JS_editor_' + flag);
				$('#JS_conten_' + flag + ' .ace-file-input').attr('data-obj', 'JS_pictxt_' + flag + ' .imgbox');
				ue[flag] = UE.getEditor('JS_editor_' + flag, options);
				//初始化编辑器
				synChronize(flag);
				//同步左右数据
				addEditevent(flag);
				//添加编辑事件
				addDelectevent(flag);
				//添加删除事件
				a.push(flag);
				flag += 1;
			}
		})
		$('#JS_save_btn').click(function() {//保存按钮
			var data = 0, data1 = 0;
			$('#JS_edit_conten input').each(function() {
				if (!$(this).val() || $(this).val() == '') {
					data = $(this).parents('.import').attr('data');
					return false;
				}
			})
			for (var i = 0, ii = ue.length; i < ii; i++) {
				if (ue[i] != undefined && ue[i].getContent() == '') {
					data1 = i;
					break;
				}
			};
			var show = Math.min(parseInt(data), parseInt(data1));
			editboxSite(show);
			$('#JS_edit_conten .import').addClass('hide').eq(show).removeClass('hide');
		});

		$(".Js_material_submit").on("click", function() {
			var _id = [], _title = [], _small_pic_url = [], _description = [], _url = [], _org_pic_url = [], _summary = $("#summary").val();
			
			$.validity.start();
			
            $('[name=title]').each(function() {
				$(this).require("请输入标题（30个字以内）").maxLength(30);				            
			});
			
			$("#summary").require("请输入摘要").maxLength(50);	
			
            var result = $.validity.end().valid;
            if(result == false){
               return false;
            }
			
			
			$('[name=title]').each(function() {
				_title.push($(this).val());
			});
			$('[name=page-url]').each(function() {
				_url.push($(this).val());
			});
			$('[name=pic]').each(function() {
				_small_pic_url.push($(this).val());
			});
			$('[name=old-pic]').each(function() {
				_org_pic_url.push($(this).val());
			});
			if (ue.length > 0) {
				for (var k = 0; k < ue.length; k++) {
					if (ue[k] != undefined) {
						_description.push(ue[k].getContent());
					}
				}
			};
			var posturl = "${base}/admin/project/media/add", postdata = {
				"titles" : _title,
				"small_pic_url" : _small_pic_url,
				"descriptions" : _description,
				"urls" : _url,
				"org_pic_url" : _org_pic_url,
				"summary" : _summary
			};
			
			WG.fn.ajax(posturl, postdata, function(data) {
				if (data.success == true) {
					window.location.href="${base}/admin/project/media";
				} else if (data.status == "param_error") {
					
				}
			})
		})
	});

	function synChronize(id) {//同步左右数据
		$('.txtinput', '#JS_conten_' + id).keyup(function() {
			var wapClass = $(this).attr("data-input");
			var wapVal = $(this).val();
			wapVal = wapVal ? wapVal : $(this).attr('placeholder');
			$('.' + wapClass, '#JS_pictxt_' + id).text(wapVal);
		});
	}

	function addEditevent(id) {//添加编辑事件
		$('.modif', '#JS_pictxt_' + id).click(function() {
			$('#JS_edit_conten .import').addClass('hide');
			$('#JS_conten_' + id).removeClass('hide');
			editboxSite(id);
			uploadPic().init();
		})
	}

	function addDelectevent(id) {//添加删除事件
		$('.remov', '#JS_pictxt_' + id).click(function() {
			$('#JS_pictxt_' + id).remove();
			$('#JS_conten_' + id).remove();
			ue[id] = undefined;
			for (var i = 0; i < a.length; i++) {
				if (a[i] == id) {
					a.splice(i, 1);
					break;
				}
			};
			$('#JS_edit_conten').css('padding-top', '0px');
			$('#JS_edit_conten .import').addClass('hide').eq(0).removeClass('hide');
		})
	}

	function editboxSite(id) {//计算编辑框位置
		for (var i = 0; i < a.length; i++) {
			if (a[i] == id) {
				var j = i;
				break;
			}
		};
		if (j == 0) {
			$('#JS_edit_conten').css('padding-top', '0px');
		} else {
			var pt = $('#JS_pictxt_0')[0].offsetHeight;
			var pdt = 122 * parseInt(j) + parseInt(pt) - 85;
			$('#JS_edit_conten').css('padding-top', pdt + 'px');
		}
	};

</script>

</@we.html>