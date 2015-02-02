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


<@we.breadcrumb current="编辑户型"/>
<div class="page-content">
    <div class="row">
        <div class="col-sm-12 col-md-8" >
            <!-- PAGE CONTENT BEGINS -->

            <form id="edit_house_type_form" class="form-horizontal" houseType="form" action="${path}/admin/project/house_type/modify_house_type" method="post">
                <input type="hidden" name="id" value="${houseType.id}">
                <input type="hidden" name="curPage" value="${curPage}">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 顶部图 </label>

                    <div class="col-sm-10">
                        <div id="top_upload" class="ace-file-input ace-file-multiple pointer pull-left Js_upload_pics" data-obj="Js_preview_toppic" data-crop="true" data-crop-size="600*400" data-config-code="201406091600" data-config-maxsize="10200000" data-config-type=".jpg|.bmp|.png">
                            <#if (houseType.top_pic_url)?? && houseType.top_pic_url!= "">

                                <div class="nopic-box" style="display: none">
                                    <input id="edit_top_pic" class="picvalue" name="top_pic" type="hidden" value="${houseType.top_pic_url}"
                                           data-error-target="#top_upload" data-error-pos-my="center left" data-error-pos-at="center right">
                                    <label class="file-label" data-title="上传户型图片">
                                <span class="file-name" data-title="No File ..."> <i class="icon-cloud-upload"></i>
                                </span>
                                    </label>
                                </div>
                                <div class="pic-con">
                                    <img src="${kit.url('COMMON',houseType.top_pic_url)}" style="width:300px;">
                                    <a class="remove-btn Js_remove_pic" href="javascript:">
                                        <i class="icon-remove"></i>
                                    </a>
                                </div>
                            <#else >
                                <div class="nopic-box">
                                    <input id="edit_top_pic" class="picvalue" name="top_pic" type="hidden" value=""
                                           data-error-target="#top_upload" data-error-pos-my="center left" data-error-pos-at="center right">
                                    <label class="file-label" data-title="上传户型图片">
                                    <span class="file-name" data-title="No File ..."> <i class="icon-cloud-upload"></i>
                                    </span>
                                    </label>
                                </div>
                            </#if>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">户型名称</label>

                    <div class="col-sm-10">
                        <input type="text" id="edit_name" placeholder="户型名称" class="col-xs-10 col-sm-5" name="name" value="${houseType.name!}" maxlength="20" datatype="s2-20" nullmsg="请输入户型名称"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">建筑面积</label>

                    <div class="col-sm-10">
                        <input type="text" id="edit_area" placeholder="88平米..." class="col-xs-10 col-sm-5" name="area" step="0.01" value="${houseType.area!}" maxlength="10" datatype="s" nullmsg="请输入建筑面积"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">不计产权面积</label>

                    <div class="col-sm-10">
                        <input type="text" id="edit_gift_area" placeholder="34平米，大空间赠送..." class="col-xs-10 col-sm-5" name="gift_area" step="0.01" value="${houseType.gift_area!}" maxlength="10" datatype="s" nullmsg="请输入建筑面积"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">户型结构</label>

                    <div class="col-sm-10">
                        <input type="text" id="edit_structure" placeholder="3室2厅2卫" class="col-xs-10 col-sm-5" name="structure" value="${houseType.structure!}" maxlength="20" nullmsg="请输入户型结构" datatype="s"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">价格</label>

                    <div class="col-sm-10">
                        <input type="text" id="edit_price" placeholder="90万，8000/平米，待定..." class="col-xs-10 col-sm-5" name="price"  value="${houseType.price}"  maxlength="20" nullmsg="请输入户型解析" datatype="s"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">户型解析</label>
                    <div class="col-sm-10">
                        <input type="hidden" id="description" name="description"/>
                        <script class="JS_editor" type="text/plain" id="JS_editor_content">${houseType.description!}</script>
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
                        <img src="${kit.url('COMMON',houseType.top_pic_url)}" alt="">
                    </div>
                    <div class="picture-info">
                        <div class="title">${houseType.name!}</div>
                        <div class="con">
                            <p class="text Js_area1">建筑面积：${houseType.area!}</p>
                            <p class="text Js_area2">不计产权面积：${houseType.gift_area!}</p>
                            <p class="text Js_price">总价：${houseType.price}</p>
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
        $("#edit_house_type_form").validity(function(){
            var content = editor.getContent();
            $("#description").val(content);
        //    $("#edit_list_pic").require("请上传列表图");
            $("#edit_top_pic").require("请上传顶部图");
            $("#edit_name").require("请输入户型名称");
            $("#edit_area").require("请输入建筑面积");
            // $("#edit_gift_area").match("number");
            $("#edit_structure").require("请输入户型解析");
            $("#edit_price").require("请输入户型解析");
        });

        //**
        $("#edit_name").on("focusout",function(){
            var _val = $(this).val();
            $(".picture-info .title").text(_val)
        })
        $("#edit_area").on("focusout",function(){
            var _val = $(this).val();
            $(".Js_area1").text(_val)
        })
        $("#edit_gift_area").on("focusout",function(){
            var _val = $(this).val();
            $(".Js_area2").text(_val)
        })
        $("#edit_price").on("focusout",function(){
            var _val = $(this).val();
            $(".Js_price").text(_val)
        })
    })

</script>

</@we.html>