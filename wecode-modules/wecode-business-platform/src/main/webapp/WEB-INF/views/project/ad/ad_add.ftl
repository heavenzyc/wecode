<#import "/WEB-INF/views/common/include.ftl" as we/>

<@we.html
css=[
	"/assets/css/uploadify.css",
	"/assets/css/jquery.Jcrop.css",
	"/assets/css/jquery.fancybox.css"
]
js=[
	"/assets/js/common.js",
	"/assets/js/jquery.fancybox.min.js",
	"/assets/js/jquery.uploadify.js",
	"/assets/js/jquery.Jcrop.min.js",
	"/assets/js/uploadavatar.js",
	"/assets/js/upload.config.js",
	"/assets/js/validform.min.js"
]>

<@we.breadcrumb current="添加图片"/>
<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <form class="form-horizontal" consultant="form" action="${path}/admin/project/ad/save" method="post" id="formAdd">
				
				<div class="space-8"></div>
				<div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-name">上传图片</label>
                    <div class="col-sm-9">
                        <div class="ace-file-input ace-file-multiple pointer pull-left Js_upload_pics" data-crop="true" data-crop-size="640*960" data-config-code="COMMON" data-config-maxsize="1024000" data-config-type=".jpg|.png|.jpeg|.bmp">
                            <div class="nopic-box">
                                <input class="picvalue" name="pic" type="hidden" value="">
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
                    <label class="col-sm-3 control-label no-padding-right">是否跳转页面</label>

                    <div class="col-sm-9">
                        <input type="radio" name="is_redirect" value="1">是&nbsp;&nbsp;
                        <input type="radio" name="is_redirect" value="0" checked="checked">否
                    </div>
                </div>
				<div class="space-4"></div>

				<div class="form-group" id="JS_redirect_url" style="display:none;">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-redirect">页面地址：</label>
					<div class="col-sm-9">
						<input type="text" id="form-field-redirect" placeholder="要跳转的页面地址" class="col-xs-10 col-sm-5" name="redirect" datatype="url" ignore="ignore" errormsg="请输入要跳转的页面地址" nullmsg="请输入要跳转的页面地址" disabled/>
					</div>
				</div>

				<div class="clearfix form-actions">
					<div class="col-md-offset-3 col-md-9">
						<button class="btn btn-info no-border" type="submit">
							<i class="icon-ok bigger-110"></i>
							保存
						</button>

						&nbsp; &nbsp; &nbsp;
        				<a class="btn no-border btn-primary" href="${path}/admin/project/ad/">
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
	    uploadPic().init();

	    $(":input[name='is_redirect']").change(function(event) {
	    	var val = $(this).val();
	    	if(val == 1){
	    		$("#JS_redirect_url").show();
	    		$("#form-field-redirect").attr("disabled", false);
	    	}else{
	    		$("#JS_redirect_url").hide();
	    		$("#form-field-redirect").attr("disabled", true);
	    	}
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