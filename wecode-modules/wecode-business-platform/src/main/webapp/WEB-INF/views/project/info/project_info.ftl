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
"${jspath}/upload.config.js",
"http://api.map.baidu.com/api?v=2.0&ak=C442db13ee343023e84546b6765dfcff&services=&t=20131216074619"]>


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
                <div class="form-group" data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">楼盘名称</label>
                    <div class="col-sm-10">
                        <input type="text" id="project_name" class="col-xs-10 col-sm-5" name="name"  value="${project.name!?html}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 楼盘logo </label>

                    <div class="col-sm-10">
                        <div id="logo_upload" class="ace-file-input ace-file-multiple pointer pull-left Js_upload_pics" data-obj="Js_preview_toppic" data-crop="true" data-crop-size="100*100" data-config-code="201406091600" data-config-maxsize="10200000" data-config-type=".jpg|.bmp|.png">
                            <#if (project.logo)?? && project.logo!= "">

                                <div class="nopic-box" style="display: none">
                                    <input id="edit_logo" class="picvalue" name="logo" type="hidden" value="${project.logo}"
                                           data-error-target="#logo_upload" data-error-pos-my="center left" data-error-pos-at="center right">
                                    <label class="file-label" data-title="上传楼盘logo">
                                <span class="file-name" data-title="No File ..."> <i class="icon-cloud-upload"></i>
                                </span>
                                    </label>
                                </div>
                                <div class="pic-con">
                                    <img src="${kit.url('COMMON',project.logo)}" style="width:150px;">
                                    <a class="remove-btn Js_remove_pic" href="javascript:">
                                        <i class="icon-remove"></i>
                                    </a>
                                </div>
                            <#else >
                                <div class="nopic-box">
                                    <input id="edit_logo" class="picvalue" name="logo" type="hidden" value=""
                                           data-error-target="#logo_upload" data-error-pos-my="center left" data-error-pos-at="center right">
                                    <label class="file-label" data-title="上传楼盘logo">
                                    <span class="file-name" data-title="No File ..."> <i class="icon-cloud-upload"></i>
                                    </span>
                                    </label>
                                </div>
                            </#if>
                        </div>
                    </div>
                </div>

                <div class="form-group" data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">楼盘简介</label>
                    <div class="col-sm-10">
                        <input type="hidden" id="introduction" name="introduction"/>
                        <script class="JS_editor" type="text/plain" id="JS_editor_introduction">${project.introduction!}</script>
                    </div>
                </div>
                <div class="form-group" data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">销售热线</label>
                    <div class="col-sm-10">
                        <input type="text" id="sales_phone" class="col-xs-10 col-sm-5" name="sales_phone"  value="${project.sales_phone!?html}"/>
                    </div>
                </div>
                <div class="form-group" data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">城市</label>
                    <div class="col-sm-10">
                        <input type="text" id="city" class="col-xs-10 col-sm-5" name="city" maxlength="10"  value="${project.city!?html}"/>
                    </div>
                </div>
                <div class="form-group" data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">楼盘地址</label>
                    <div class="col-sm-10">
                        <input type="text" id="address" class="col-xs-10 col-sm-5" name="address" maxlength="50"  value="${project.address!?html}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 地理位置 </label>

                    <div class="col-sm-10">
                        <div id="allmap" class="well no-padding no-margin" style="width:530px; height:400px;">

                        </div>
                        <div style="border:1px solid #ddd; width:530px; padding:10px;">
                            <p>GPS数据：经度 <input id="gpsx" type="text" readonly="readonly" name="gps_x" value="${project.gps_x}" />
                                纬度 <input id="gpsy" type="text" readonly="readonly" name="gps_y"  value="${project.gps_y}" /></p>
                            <p>请在地图上标注楼盘地理位置</p>
                        </div>
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
                    <div class="preview-wrap" style="position:relative">
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
        uploadPic().init();


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

        var intro_editor = UE.getEditor('JS_editor_introduction', options);

        intro_editor.addListener('contentChange', function() {
            intro_editor.sync();
            var $this = $(".form-group");
            var cbox = $this.data("rel");
            if(cbox && cbox !== ""){
                var previewobj = cbox;
                $("."+previewobj).html(intro_editor.getContent())
            } 
        });



        $("#btnSubmit").click(function(){
            var intro_content = intro_editor.getContent();
            $("#introduction").val(intro_content);
            //var around_content = around_editor.getContent();
            //$("#around").val(around_content);

            $.validity.start();
            $("#project_name").require("请输入楼盘名称");
            $("#sales_phone").require("请输入销售热线");
            $("#city").require("请输入城市");
            $("#address").require("请输入楼盘地址");
            $("#edit_logo").require("请上传楼盘logo");
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
        initMap();
    })

    var x = $("#gpsx").val();
    var y = $("#gpsy").val();
    if(x==null || x=='') x = 104.072227;
    if(y==null || y=='') y = 30.663456;
    function initMap(){
        var marker1 = new BMap.Marker(new BMap.Point(x, y));  // 创建标注
        map.addOverlay(marker1);
        settingGps(x,y);
    }

    var map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(x, y), 12);
    map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();
    map.addControl(new BMap.NavigationControl());  //添加默认缩放平移控件

    map.addEventListener("click", createMarker);

    function createMarker(e){
        map.clearOverlays();
        var marker1 = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));  // 创建标注
        map.addOverlay(marker1);
        settingGps(e.point.lng,e.point.lat);
    }
    function settingGps(gpsx,gpsy){
        $("#gpsx").val(gpsx);
        $("#gpsy").val(gpsy);
    }

</script>

</@we.html>