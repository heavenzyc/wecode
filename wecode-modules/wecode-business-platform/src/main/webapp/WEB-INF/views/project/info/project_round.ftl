<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[
"/assets/css/uploadify.css",
"/assets/css/jquery.Jcrop.css",
"/assets/css/jquery.fancybox.css"]
js=["${jspath}/chosen.jquery.min.js",
"${jspath}/common.js",
"${jspath}/jquery.fancybox.min.js",
"${jspath}/jquery.uploadify.js",
"${jspath}/jquery.Jcrop.min.js",
"${jspath}/ueditor/ueditor.config.js",
"${jspath}/ueditor/ueditor.all.min.js",
"${jspath}/uploadavatar.js",
"${jspath}/upload.config.js"]>


    <@we.breadcrumb/>
<div class="page-content">
	<div class="page-header row">
		<div class="col-xs-1">
			<a class="btn no-border btn-primary pull-left" href="/admin/project/info">楼盘概况</a>
		</div>
		<div class="col-xs-1">
			<a class="btn no-border btn-primary pull-left" href="/admin/project/info/round">周边配套</a>
		</div>
		<div class="col-xs-8"></div>
	</div>
    <div class="row">
        <div class="col-sm-12 col-md-8" >
            <!-- PAGE CONTENT BEGINS -->

            <form id="edit_info_form" class="form-horizontal" houseType="form" action="${path}/admin/project/info/save" method="post">
                <div class="form-group" data-obj="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">周边配套</label>
                    <div class="col-sm-10">
                        <input type="hidden" id="around" name="around"/>
                        <script class="JS_editor" type="text/plain" id="JS_editor_around">${project.around!}</script>
                    </div>
                </div>
                <div class="clearfix form-actions" data-rel="Js_preview_des">
                    <div class="col-md-offset-2 col-md-9">
                        <button class="btn btn-info" type="button" id="btnSubmit">
                            <i class="icon-ok bigger-110"></i>
                            保存
                        </button>

                        &nbsp; &nbsp; &nbsp;
                        <a href="javascript:history.go(-1);" class="btn" type="reset">
                            <i class="icon-undo bigger-110"></i>
                            取消
                        </a>
                    </div>
                </div>
            </form>
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
        <div class="col-sm-12 col-md-4">
            <!-- PAGE CONTENT BEGINS -->
            <div class="phone-preview">
                <div class="preview-content Js_preview">
                    <div class="preview-wrap">
                        <div class="Js_preview_toppic"></div>
                        <div class="Js_preview_des"></div>
                    </div>
                </div>
            </div>
           <#-- <div class="space-12"></div>-->
            <!-- PAGE CONTENT ENDS -->
        </div>
    </div><!-- /.row -->
</div><!-- /.page-content -->

<script type="text/javascript">
    $(function(){
        //调用上传图片

        var options = {
            initialFrameWidth : 555,
            initialFrameHeight : 170,
            focus : true,
            autosave : false,
            param : "UEDITOR",
            imgtype : ".jpg|.bmp",
            elementPathEnabled : false,
            toolbars : [["bold", "italic", "underline", "|", "insertorderedlist", "insertunorderedlist", "|", "insertimage", "|", "removeformat", "forecolor", "backcolor", "insertvideo"]]
        };

        //var intro_editor = UE.getEditor('JS_editor_introduction', options);
        var around_editor = UE.getEditor('JS_editor_around', options);
        around_editor.addListener('contentChange', function() {
            around_editor.sync();
            var $this = $(".form-group");
            var cbox = $this.data("obj");
            if(cbox && cbox !== ""){
                var previewobj = cbox;
                $("."+previewobj).html(around_editor.getContent())
            } 
        });


        $("#btnSubmit").click(function(){
            //var intro_content = intro_editor.getContent();
            //$("#introduction").val(intro_content);
            var around_content = around_editor.getContent();
            $("#around").val(around_content);

            $.validity.start();
            var result = $.validity.end().valid;
            if(result == false){
                return false;
            }

            var data = $("#edit_info_form").serialize();
            $.ajax({
                url: $("#edit_info_form").attr("action"),
                type:'post',
                data: data,
                success:function(json){
                    if(json.success){
                        showToast("保存成功");
                    }else{
                        showToast(json.message || "保存失败");
                    }
                }
            });
        });

        function showToast(text,title,time){
            $.gritter.add({
                title : title || '信息提示',
                time : time || 1000,
                text : text,
                class_name : 'gritter-info gritter-center'
            });
        }
    })

</script>

</@we.html>