<#import "/WEB-INF/views/common/include.ftl" as we/>

<@we.html
css=[
	"/assets/css/uploadify.css",
	"/assets/css/jquery.Jcrop.css",
	"/assets/css/jquery.fancybox.css",
	"${jspath}/jquery.validity/jquery.validity.css",
	"${jspath}/qTip2/jquery.qtip.min.css"
]
js=[
	"/assets/js/My97DatePicker/WdatePicker.js",
	"/assets/js/common.js",
	"/assets/js/jquery.fancybox.min.js",
	"/assets/js/jquery.uploadify.js",
	"/assets/js/jquery.Jcrop.min.js",
	"/assets/js/uploadavatar.js",
	"/assets/js/upload.config.js",
	"/assets/js/ueditor/ueditor.config.js",
	"/assets/js/ueditor/ueditor.all.min.js",
	"${jspath}/jquery.validity/jquery.validity.js",
	"${jspath}/qTip2/jquery.qtip.min.js",
	"${jspath}/jquery.validity/jquery.validity.extend.js"
]>

<@we.breadcrumb current="创建活动"/>
<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <form class="form-horizontal" consultant="form" action="${path}/admin/active/dynamic_task/save" method="post" id="formAdd">
				
				<div class="space-8"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-title">任务名称*：</label>
					<div class="col-sm-9">
						<input type="text" id="form-field-title" placeholder="" class="col-xs-10 col-sm-5" name="title" datatype="s2-50" errormsg="分享给朋友或朋友圈后，TA看到的标题" nullmsg="分享给朋友或朋友圈后，TA看到的标题"/>
					</div>
				</div>

				<div class="space-4"></div>
				<div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-name">封面图*：</label>
                    <div class="col-sm-9">
                        <div class="ace-file-input ace-file-multiple pointer pull-left Js_upload_pics" data-crop="true" data-crop-size="320*200" data-config-code="COMMON" data-config-maxsize="1024000" data-config-type=".jpg|.png|.jpeg|.bmp" id="js_upload">
                            <div class="nopic-box">
                                <input class="picvalue" name="cover_pic_path" type="hidden" value="" id="js_pic_url" data-error-target="#js_upload" data-error-pos-my="center left" data-error-pos-at="center right">
                                <label class="file-label" data-title="上传图片">
                                    <span class="file-name" data-title="No File ..."> <i class="icon-cloud-upload"></i>
                                    </span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="space-4"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">文章详情*：</label>
					<div class="col-sm-9">
						<input type="hidden" id="content" name="content" data-error-target="#JS_editor_content" data-error-pos-my="bottom center" data-error-pos-at="top center"/>
						<input type="hidden" id="contentTxt" name="contentTxt" />
						<script class="JS_editor" type="text/plain" id="JS_editor_content"></script>
					</div>
				</div>

                <div class="space-4"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-title">任务时间：</label>
					<div class="col-sm-9">
						<input type="text" style="width:150px;" id="startTime" name="startTime"
                               onclick="WdatePicker({startDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'endTime\')}',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true,skin:'twoer', readOnly: true})" class="Wdate"/>&nbsp;至&nbsp;
                        <input type="text" style="width:150px;" id="endTime" name="endTime"
                               onclick="WdatePicker({startDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'startTime\')}',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true,skin:'twoer', readOnly: true})" class="Wdate"/>
					</div>
				</div>

				<div class="space-4"></div>
				<div class="form-group no-margin-bottom">
					<label class="col-sm-3 control-label no-padding-right">任务奖励：</label>
					<label class="col-sm-9">完成分享任务</label>
				</div>

				<div class="form-group no-margin-bottom">
					<label class="col-sm-3 control-label no-padding-right"></label>
					<div class="col-sm-9">
						<div class="well col-sm-8 no-padding-left no-margin-bottom">
						<div>
							<label class="col-sm-3 control-label no-padding-right no-padding-left text-left">可获得${kit.dictValue(current_project.id,'point_name')}：</label>
							<input type="text" placeholder="" class="col-xs-10 col-sm-5" name="complete_gold" id="complete_gold"/>
                        </div>
						<div class="space-4 clear"></div>
						<div>
							<label class="col-sm-3 control-label no-padding-right text-left">奖励刮奖次数：</label>
							<input type="text" placeholder="" class="col-xs-10 col-sm-5" name="complete_lottery" id="complete_lottery"/>
                           </div>
                        </div>
					</div>
				</div>

				<div class="form-group no-margin-bottom">
					<label class="col-sm-3 control-label no-padding-right"></label>
					<label class="col-sm-9">分享后每带来一个关注客户</label>
				</div>

				<div class="form-group no-margin-bottom">
					<label class="col-sm-3 control-label no-padding-right"></label>
					<div class="col-sm-9">
						<div class="well col-sm-8 no-padding-left no-margin-bottom">
						<div>
							<label class="col-sm-3 control-label no-padding-right no-padding-left text-left">可获得${kit.dictValue(current_project.id,'point_name')}：</label>
							<input type="text" placeholder="" class="col-xs-10 col-sm-5" name="attention_reward_gold" id="attention_reward_gold"/>
                        </div>
						<div class="space-4 clear"></div>
						<div>
							<label class="col-sm-3 control-label no-padding-right text-left">奖励刮奖次数：</label>
							<input type="text" placeholder="" class="col-xs-10 col-sm-5" name="attention_reward_lottery" id="attention_reward_lottery"/>
                           </div>
                        </div>
					</div>
				</div>

				<div class="form-group no-margin-bottom">
					<label class="col-sm-3 control-label no-padding-right"></label>
					<label class="col-sm-9">分享后每带来一个意向购房客户</label>
				</div>

				<div class="form-group no-margin-bottom">
					<label class="col-sm-3 control-label no-padding-right"></label>
					<div class="col-sm-9">
						<div class="well col-sm-8 no-padding-left">
						<div>
							<label class="col-sm-3 control-label no-padding-right no-padding-left text-left">可获得${kit.dictValue(current_project.id,'point_name')}：</label>
							<input type="text" placeholder="" class="col-xs-10 col-sm-5" name="intention_reward_gold" id="intention_reward_gold"/>
                        </div>
						<div class="space-4 clear"></div>
						<div>
							<label class="col-sm-3 control-label no-padding-right text-left">奖励刮奖次数：</label>
							<input type="text" placeholder="" class="col-xs-10 col-sm-5" name="intention_reward_lottery" id="intention_reward_lottery"/>
                           </div>
                        </div>
					</div>
				</div>

				<div class="clearfix form-actions">
					<div class="col-md-offset-3 col-md-9">
						<button class="btn btn-info no-border" type="submit">
							<i class="icon-ok bigger-110"></i>
							保存
						</button>

						&nbsp; &nbsp; &nbsp;
        				<a class="btn no-border btn-primary" href="${path}/admin/active/dynamic_task/">
        					<i class="icon-undo bigger-110"></i>
        					返回
        				</a>
					</div>
				</div>

			</form>
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->

</div><!-- /.page-content -->

<script type="text/javascript">
   jQuery(function($){
   		//初始化图片上传
	    uploadPic().init();

	    var options = {
			initialFrameWidth : 555,
			initialFrameHeight : 190,
			focus : true,
			autosave : false,
			param : "UEDITOR",
			imgtype : ".jpg|.bmp",
			elementPathEnabled : false,
			toolbars : [["bold", "italic", "underline", "|", "insertorderedlist", "insertunorderedlist", "|", "insertimage", "|", "removeformat", "forecolor", "backcolor", "insertvideo"]]
		};

		var editor = UE.getEditor('JS_editor_content', options);

		$("#formAdd").validity(function(){
			var content = editor.getContent();
            var contentTxt = editor.getContentTxt();
			$("#content").val(content);
			$("#contentTxt").val(contentTxt);
			$("#form-field-title").require("请填写任务名称");
			$("#content").require("请填写文章内容");
			$("#js_pic_url").require("请上传封面图");
			// $("#complete_gold,#complete_lottery").sumMin(0,"需设置完成分享任务后的奖励.");
			//$("#complete_gold").assert($("#complete_gold").val() + $("#complete_lottery").val() > 0,"需设置完成分享任务后的奖励.");
			$("#startTime").require("请选择任务开始时间");
			$("#endTime").require("请选择任务结束时间");
			$("#complete_gold,#complete_lottery,#intention_reward_gold,#intention_reward_lottery,#attention_reward_gold,#attention_reward_lottery").match("integer");
		});

	    // 验证插件
		// $("#formAdd").Validform({
		// 	tiptype:3,
		// 	showAllError:true,
		// 	ajaxPost:false
		// })

	});
</script>
</@we.html>
