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


<@we.breadcrumb current="排行页面配置"/>
<div class="page-content">
    <div class="row">
        <div class="col-sm-12 col-md-8" >
            <!-- PAGE CONTENT BEGINS -->

            <form id="ac_form" class="form-horizontal" >
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">顶部标题及广告图配置</label>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 广告图片 </label>

                    <div class="col-sm-10">
                        <div class="ace-file-input ace-file-multiple pointer pull-left Js_upload_pics" data-crop="true" data-crop-size="330*110" data-obj="Js_success_logo" id="js_upload" data-config-code="COMMON" >
                            <div class="nopic-box">
                                <input id="rank_ad_pic" class="picvalue" name="rank_ad_pic" type="hidden" value="${rank_ad_pic.dict_value}" data-error-target="#js_upload" data-error-pos-my="center left" data-error-pos-at="center right">
                                <input class="picurl" type="hidden" value="<#if rank_ad_pic.dict_value?has_content>${kit.url('COMMON',rank_ad_pic.dict_value)}<#else></#if>">
                                <label class="file-label" data-title="上传广告图片">
									<span class="file-name" data-title="No File ..."> <i class="icon-cloud-upload"></i>
									</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="clearfix form-actions">
                    <div class="col-md-offset-2 col-md-9">
                        <button class="btn btn-info" type="button" onclick="saveRule()">
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
    })

    function saveRule(){
        $.validity.start();
        $("#rank_ad_pic").require("请上传广告图片");
        var result = $.validity.end().valid;
        if(result == false){
            return false;
        }

        if(rank_ad_pic==null) return;
        var data = $("#ac_form").serialize();
        $.ajax({
            url:'/admin/project/common_dict/rank_edit',
            type:'post',
            data:data,
            success:function(json){
                if(json.success){
                    completeTips();
                }
            }
        });
    }

    function completeTips(){
        $.gritter.add({
            title : '信息提示',
            time : 1000,
            text : '保存成功！',
            class_name : 'gritter-info gritter-center '
        });
    }
</script>

</@we.html>