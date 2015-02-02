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
    <div class="row">
        <div class="col-sm-12 col-md-8" >
            <!-- PAGE CONTENT BEGINS -->

            <form id="edit_info_form" class="form-horizontal" houseType="form" action="${path}/admin/active/help/save" method="post">
                <div class="form-group" data-rel="Js_preview_help">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">活动说明</label>
                    <div class="col-sm-10">
                        <input type="hidden" id="active_help" name="active_help" data-error-target="#JS_editor_active_help" data-error-pos-my="bottom center" data-error-pos-at="top center"/>
                        <script class="JS_editor" type="text/plain" id="JS_editor_active_help">${project.active_help!}</script>
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
                    <div class="Js_preview_help">
                       
                        <#--<div class="form-top">
                           <div>
                               <p class="lg text-center">手指点一点，一起找房币</p>
                               <p class="height_10"></p>
                               <p class="sm text-right">抵房款、换礼品、兑物业</p>
                               <p class="sm text-right">轻松又好玩</p>
                           </div>
                        </div>-->
                        <div class="form-content" style=" overflow-y:auto; position: relative;">
                           <div class="form-box" style="padding-bottom:20px;">
                               
                           </div>
                        </div>

                  </div>
                </div>
            </div>
           <#-- <div class="space-12"></div>-->
            <!-- PAGE CONTENT ENDS -->
        </div>
    </div><!-- /.row -->
</div><!-- /.page-content -->
<style type="text/css">
.form-content { padding: 10px 12px; }
.form-content .form-msg { padding: 5px 0; }
.ft14 {font-size: 14px;}
.blue {color: #2ab8c6 !important;}
.form-top { padding: 15px 15px 10px; background: #2AB8C6; border-top-left-radius: 4px; border-top-right-radius: 4px; }
.form-top p { color: #fff }
.form-top .lg { font-size: 21px; font-weight: 700 }
.form-top .sm { font-size: 15px; }
</style>
<script type="text/javascript">
    $(function(){
        //调用上传图片
        uploadPic().init();

        var options = {
            initialFrameWidth : 555,
            initialFrameHeight : 370,
            focus : true,
            autosave : false,
            param : "UEDITOR",
            imgtype : ".jpg|.bmp",
            elementPathEnabled : false,
            toolbars : [["bold", "italic", "underline", "|", "insertorderedlist", "insertunorderedlist", "|", "insertimage", "|", "removeformat", "forecolor", "backcolor", "insertvideo"]]
        };

        var editor = UE.getEditor('JS_editor_active_help', options);

        editor.addListener('contentChange', function() {
            editor.sync();
            var $this = $(".form-group");
            var cbox = $this.data("rel");
            if(cbox && cbox !== ""){
                var previewobj = cbox;
                $("."+previewobj).find(".form-box").html(editor.getContent())
            } 
        });

        $("#btnSubmit").click(function(){
            var content = editor.getContent();
            $("#active_help").val(content);

            $.validity.start();
            $("#active_help").require("请输入活动说明");
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