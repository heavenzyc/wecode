<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/chosen.css",
"/assets/css/uploadify.css",
"/assets/css/jquery.Jcrop.css",
"/assets/css/jquery.fancybox.css",
"${jspath}/jquery.validity/jquery.validity.css",
"${jspath}/qTip2/jquery.qtip.min.css"]
js=["${jspath}/chosen.jquery.min.js",
"/assets/js/common.js",
"/assets/js/jquery.fancybox.min.js",
"/assets/js/jquery.uploadify.js",
"/assets/js/jquery.Jcrop.min.js",
"/assets/js/ueditor/ueditor.config.js",
"/assets/js/ueditor/ueditor.all.min.js",
"/assets/js/uploadavatar.js",
"/assets/js/upload.config.js",
"/assets/js/validform.min.js",
"/assets/js/ace-elements.min.js",
"/assets/js/ace.min.js",
"${jspath}/jquery.validity/jquery.validity.js",
"${jspath}/qTip2/jquery.qtip.min.js",
"${jspath}/jquery.validity/jquery.validity.extend.js"]>

<@we.breadcrumb current="编辑置业顾问"/>
<div class="page-content">
	<div class="row">
		<div class="col-xs-12">
			<form id="edit_consultant_form" class="form-horizontal" consultant="form" action="${path}/admin/project/consultant/modify_consultant" method="post">
				<input type="hidden" name="id" value="${consultant.id}"/>
				<input type="hidden" name="curPage" value="${curPage}"/>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-name">姓名</label>
					<div class="col-sm-9">
						<input type="text" id="edit-consultant-name" class="col-xs-10 col-sm-5" name="name" value="${consultant.name!}" datatype="s2-20" errormsg="请输入正确的姓名" nullmsg="请输入姓名"/>
					</div>
				</div>

				<div class="space-4"></div>


                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-name">上传头像</label>

                    <div class="col-sm-9">
                        <div id="js_upload" class="ace-file-input ace-file-multiple pointer pull-left Js_upload_pics" data-crop="true" data-crop-size="180*180" data-config-code="201406091600" data-config-maxsize="10200000" data-config-type=".jpg|.bmp|.png">
                            <#if (consultant.pic_url)?? && consultant.pic_url!="">
                                <div class="nopic-box" style="display: none">
                                    <input id="edit_js_pic_url" class="picvalue" name="path" type="hidden" value="${consultant.pic_url}" datatype="s" errormsg="请上传头像" nullmsg="请上传头像" data-error-target="#js_upload" data-error-pos-my="center left" data-error-pos-at="center right">
                                    <label class="file-label" data-title="上传头像">
                                    <span class="file-name" data-title="No File ..."> <i class="icon-cloud-upload"></i>
                                    </span>
                                    </label>
                                </div>

                                <div class="pic-con">
                                    <img src="${kit.url('COMMON',consultant.pic_url)}" style="width:300px;">
                                    <a class="remove-btn Js_remove_pic" href="javascript:">
                                        <i class="icon-remove"></i>
                                    </a>
                                </div>
                             <#else >
                                 <div class="nopic-box">
                                     <input id="edit_js_pic_url" class="picvalue" name="path" type="hidden" value="" datatype="s" errormsg="请上传头像" nullmsg="请上传头像" data-error-target="#js_upload" data-error-pos-my="center left" data-error-pos-at="center right">
                                     <label class="file-label" data-title="上传头像">
                                    <span class="file-name" data-title="No File ..."> <i class="icon-cloud-upload"></i>
                                    </span>
                                     </label>
                                 </div>
                            </#if>

                        </div>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-account">电话</label>
					<div class="col-sm-9">
						<input type="text" id="edit-consultant-tel" class="col-xs-10 col-sm-5" name="tel"  value="${consultant.tel!}" datatype="m" errormsg="请输入正确的电话号" nullmsg="请输入电话号码"/>
					</div>
				</div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-roles">是否展示</label>

                    <div class="col-sm-9">
                        <input type="radio" name="is_visiable" value="1" <#if consultant.is_visiable==1>checked="checked" </#if>>是&nbsp;&nbsp;
                        <input type="radio" name="is_visiable" value="0" <#if consultant.is_visiable==0>checked="checked" </#if>>否
                    </div>
                </div>

                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-projects">说明</label>

                    <div class="col-sm-9">
                        <textarea cols="45" rows="5" name="intro">${consultant.intro}</textarea>
                    </div>
                </div>

				<div class="clearfix form-actions">

					<div class="col-md-offset-3 col-md-9">
						<button class="btn btn-info no-border" type="submit">
							<i class="icon-ok bigger-110"></i>
							保存
						</button>

						&nbsp; &nbsp; &nbsp;
						<a class="btn no-border" href="${path}/admin/project/consultant/" id="btnCancel">
							<i class="icon-undo bigger-110"></i>
							取消
						</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	jQuery(function($){

		uploadPic().init();
        // 验证插件
        $("#edit_consultant_form").validity(function(){
            $("#edit-consultant-name").require("请输入姓名");
            $("#edit_js_pic_url").require("请上传头像");
            $("#edit-consultant-tel").require("请输入电话号码").match(/^1\d{10}$/,"手机号码格式错误");
        });
	});
</script>

</@we.html>