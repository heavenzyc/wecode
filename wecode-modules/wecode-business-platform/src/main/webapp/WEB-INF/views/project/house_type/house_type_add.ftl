<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html
css=["${csspath}/chosen.css",
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

<#--<div class="breadcrumbs" id="breadcrumbs">
    <script type="text/javascript">
        try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
    </script>

    <ul class="breadcrumb">
        <li>
            <i class="icon-home home-icon"></i>
            <a href="#">首页</a>
        </li>

        <li>
            <a href="#">Other Pages</a>
        </li>
        <li class="active">Blank Page</li>
    </ul><!-- .breadcrumb &ndash;&gt;
</div>-->
<@we.breadcrumb current="添加户型"/>
<div class="page-content">
    <div class="row">
        <div class="col-sm-12 col-md-8" >
            <!-- PAGE CONTENT BEGINS -->

            <form id="add_house_type_form" class="form-horizontal" houseType="form" action="${path}/admin/project/save_house_type" method="post">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 顶部图 </label>

                    <div class="col-sm-10">
                        <div id="top_pic_upload" class="ace-file-input ace-file-multiple pull-left Js_upload_pics" data-obj="Js_preview_toppic" data-crop="true" data-crop-size="600*400" data-config-code="201406091600" data-config-maxsize="10200000" data-config-type=".jpg|.bmp|.png">
                            <div class="nopic-box">
                                <input id="top_pic" class="picvalue" name="top_pic" type="hidden" value="" data-error-target="#top_pic_upload" data-error-pos-my="center left" data-error-pos-at="center right">
                                <label class="file-label" data-title="上传顶部图">
														<span class="file-name" data-title="No File ..."> <i class="icon-cloud-upload"></i>
														</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">户型名称</label>

                    <div class="col-sm-10">
                        <input type="text" id="house_type_name" class="col-xs-10 col-sm-5" name="name" maxlength="20" datatype="s2-20" nullmsg="请输入户型名称"/>
                    </div>
                </div>
                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">建筑面积</label>

                    <div class="col-sm-10">
                        <input type="text" id="area" placeholder="88平米..." class="col-xs-10 col-sm-5" name="area" step="0.01" maxlength="10" datatype="s" nullmsg="请输入建筑面积"/>
                    </div>
                </div>
                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">不计产权面积</label>

                    <div class="col-sm-10">
                        <input type="text" id="gift_area" placeholder="34平米，大空间赠送..." class="col-xs-10 col-sm-5" name="gift_area" step="0.01" maxlength="10" datatype="s" nullmsg="请输入建筑面积"/>
                    </div>
                </div>
                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">户型结构</label>

                    <div class="col-sm-10">
                        <input type="text" id="structure" placeholder="3室2厅2卫" class="col-xs-10 col-sm-5" name="structure" maxlength="20" nullmsg="请输入户型结构" datatype="s"/>
                    </div>
                </div>
                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">价格</label>

                    <div class="col-sm-10">
                        <input type="text" id="price" placeholder="90万，8000/平米，待定..." class="col-xs-10 col-sm-5" name="price" maxlength="20" nullmsg="请输入户型解析" datatype="s"/>
                    </div>
                </div>
                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">户型解析</label>
                    <div class="col-sm-10">
                        <input type="hidden" id="description" name="description"/>
                        <script class="JS_editor" type="text/plain" id="JS_editor_content"></script>
                    </div>
                </div>
                <div class="clearfix form-actions">
                    <div class="col-md-offset-2 col-md-9">
                        <button class="btn btn-info" type="submit">
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
                    <div class="picture-banner Js_preview_toppic">
                        
                    </div>
                    <div class="picture-info">
                        <div class="title"></div>
                        <div class="con">
                            <p class="text Js_area1"></p>
                            <p class="text Js_area2"></p>
                            <p class="text Js_price"></p>
                        </div>
                    </div>
                    <div class="picture-detail">
                        <div class="t">户型详解</div>
                        <div class="c Js_preview_des"></div>
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
        editor.addListener('contentChange', function() {
            editor.sync();
            $(".Js_preview_des").html(editor.getContent())
        });

        // 验证插件
        $("#add_house_type_form").validity(function(){
            var content = editor.getContent();
            $("#description").val(content);
        //    $("#list_pic").require("请上传列表图");
            $("#top_pic").require("请上传顶部图");
            $("#house_type_name").require("请输入户型名称");
            $("#area").require("请输入建筑面积");
            // $("#gift_area").match("number");
            $("#structure").require("请输入户型解析");
            $("#price").require("请输入价格");
        });

        //**
        $("#house_type_name").on("focusout",function(){
            var _val = $(this).val();
            $(".picture-info .title").text(_val)
        })
        $("#area").on("focusout",function(){
            var _val = $(this).val();
            $(".Js_area1").text(_val)
        })
        $("#gift_area").on("focusout",function(){
            var _val = $(this).val();
            $(".Js_area2").text(_val)
        })
        $("#price").on("focusout",function(){
            var _val = $(this).val();
            $(".Js_price").text(_val)
        })


    })
</script>

</@we.html>