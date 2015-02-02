<#import "/WEB-INF/views/common/include.ftl" as we/>

<@we.html css=["/assets/css/colorbox.css",
"/assets/css/jquery.fancybox.css",
"/assets/css/uploadify.css",
"/assets/css/jquery.Jcrop.css",
"/assets/css/jquery.fancybox.css"]
js=["${jspath}/project/consultant/consultant.js",
"/assets/js/common.js",
"/assets/js/jquery.colorbox-min.js",
"/assets/js/jquery.fancybox.min.js",
"/assets/js/common.js",
"/assets/js/jquery.fancybox.min.js",
"/assets/js/jquery.uploadify.js",
"/assets/js/jquery.Jcrop.min.js",
"/assets/js/uploadavatar.js",
"/assets/js/upload.config.js",
"/assets/js/validform.min.js",
"/assets/js/ace-elements.min.js",
"/assets/js/ace.min.js"]>

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
    &lt;#&ndash;<div class="nav-search" id="nav-search">
        <form class="form-search">
			<span class="input-icon">
				<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
				<i class="icon-search nav-search-icon"></i>
			</span>
        </form>
    </div>&ndash;&gt;
</div>-->
    <@we.breadcrumb/>
<div class="page-content">
    <div class="page-header">
        <h1>
            楼盘相册
            <small>
                <i class="icon-double-angle-right"></i>
                相册列表
            </small>
        </h1>
    </div>

        <div class="col-xs-12">
            <button class="btn btn-primary Js_upload_pics" data-config-code="201406091600" data-config-maxsize="10200000" data-config-type=".jpg|.bmp|.png">上传图片</button>
            <div class="hr"></div>

            <!-- PAGE CONTENT BEGINS -->
            <form action="/admin/project/album/add_pic" method="post">
                <input type="hidden" name="albumId" value="${albumId}">
            <div class="row-fluid">
                <ul class="ace-thumbnails clearfix Js_thumbs">
                    <#list picList as pic>
                        <li>
                            <a href="${kit.url('COMMON',pic.getPicUrl())}" data-rel="colorbox" class="cboxElement">
                                <img alt="150x150" src="${kit.url('COMMON',pic.getPicUrl())}">
                                <input type="hidden" name="picurl" value=""/>
                                <input type="hidden" name="picid" value="${pic.pic_id}"/>
                                <div class="text">
                                    <div class="inner">${pic.getPicRemark()}</div>
                                    <input class="picdes" type="hidden" name="picdes" value="${pic.getPicRemark()}" />
                                    <input class="sorts" type="hidden" name="sorts" value="${pic.sort}" />
                                </div>
                            </a>
                            <div class="tools tools-top">
                                <a class="Js_edit_pic" href="javascript:">
                                    <i class="icon-pencil" title="编辑"></i>
                                </a>
                                <a href="/admin/project/album/delete_album_pic?albumId=${albumId}&picId=${pic.id}">
                                    <i class="icon-remove red" title="删除"></i>
                                </a>
                            </div>
                        </li>
                    </#list>
                </ul>
            </div>
            <div class="clearfix"></div>
            <div class="clearfix form-actions">
                <div class=" col-md-9">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok bigger-110"></i>
                        保存
                    </button>
                    &nbsp; &nbsp;
                    <a href="/admin/project/album/" class="btn" type="reset">
                        <i class="icon-undo bigger-110"></i>
                              返回
                    </a>
                </div>
            </div>
            </form>
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->

</div><!-- /.page-content -->


<script type="text/javascript">
    $(".Js_create_album").on("click",function(){
        var _html = [
            '<div class="widget-box no-border">',
            '	<div class="widget-header no-border">',
            '		<h4>创建相册</h4>',
            '	</div>',
            '	<div class="widget-body no-border">',
            '		<div class="widget-main no-padding">',
            '			<form>',
            '				<fieldset>',
            '					<div class="form-group">',
            '						<label>相册名：</label>',
            '						<input type="text" placeholder="" class="form-control">',
            '					</div>',
            '					<div class="space-6"></div>',
            '					<div class="form-group">',
            '						<label>相册描述：</label>',
            '						<textarea class="form-control" id="" style="height:100px" placeholder=""></textarea>',
            '					</div>',
            '				</fieldset>',
            '				<div class="form-actions center">',
            '					<button type="button" class="btn btn-sm btn-success">',
            '						<b>提交</b>',
            '						<i class="icon-arrow-right icon-on-right bigger-110"></i>',
            '					</button>',
            '				</div>',
            '			</form>',
            '		</div>',
            '	</div>',
            '</div>'].join("");

        $.fancybox({
            width : 400,
            height : 'auto',
            autoSize : false,
            padding : 0,
            scrolling : 'no',
            content: _html
        })
    });

    var colorbox_params = {
        reposition:true,
        scalePhotos:true,
        scrolling:false,
        previous:'<i class="icon-arrow-left"></i>',
        next:'<i class="icon-arrow-right"></i>',
        close:'&times;',
        current:'{current} of {total}',
        maxWidth:'100%',
        maxHeight:'100%',
        onOpen:function(){
            document.body.style.overflow = 'hidden';
        },
        onClosed:function(){
            document.body.style.overflow = 'auto';
        },
        onComplete:function(){
            $.colorbox.resize();
        }
    };

    jQuery(function($) {
        $('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
        $("#cboxLoadingGraphic").append("<i class='icon-spinner orange'></i>");//let's add a custom loading icon

        //调用上传图片
        uploadPic("Js_upload_pics",function(data){
            var url = $("#upload-thumborg").attr("src");
            var id = $("#upload-thumborg").attr("data-id");

            var _h = [
                '	<li>',
                '		<a href="'+url+'" data-rel="colorbox" class="cboxElement">',
                '			<img alt="150x150" src="'+url+'">',
                '			<input type="hidden" name="picurl" value="'+url+'"/>',
                '			<input type="hidden" name="picid" value="'+id+'"/>',
                '			<div class="text">',
                '				<div class="inner">请填写图片描述</div>',
                '				<input class="picdes" type="hidden" name="picdes" value="" />',
                '			</div>',
                '			<div class="text">',
                '				<div>排序序号</div>',
                '				<input class="sorts" type="hidden" name="sorts" value="1" />',
                '			</div>',
                '		</a>',
                '		<div class="tools tools-top">',
                '			<a href="javascript:" class="Js_edit_pic">',
                '				<i class="icon-pencil" title="编辑"></i>',
                '			</a>',
                '			<a href="javascript:" class="Js_del_pic">',
                '				<i class="icon-remove red" title="删除"></i>',
                '			</a>',
                '		</div>',
                '	</li>'].join("");
            $(".Js_thumbs").append(_h);
            $('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
        }).init();



        var editpic = function(obj,$this){
            var _text = WG.fn.htmlspecialchars($this.parents(".widget-body").find(".Js_pic_des").val());
            var _sort = WG.fn.htmlspecialchars($this.parents(".widget-body").find(".Js_sort").val());
            obj.parents("li").find(".inner").text(_text);
            obj.parents("li").find(".picdes").val(_text);
            obj.parents("li").find(".sorts").val(_sort);
            $.fancybox.close()
        };

        //修改图片描述
        $(document).on("click",".Js_edit_pic",function(){
            var $this = $(this);
            var _val = $this.parents("li").find('.inner').text();
            var _sort = $this.parents("li").find('.sorts').val();
            _val == "请填写图片描述" ? _val = "" : _val;
            var _html = [
                '<div class="widget-box no-border">',
                '	<div class="widget-header no-border">',
                '		<h4>修改图片描述</h4>',
                '	</div>',
                '	<div class="widget-body no-border">',
                '		<div class="widget-main no-padding">',
                '			<form class="album_form">',
                '				<fieldset>',
                '					<div class="form-group">',
                '						<label>相片描述：</label>',
                '						<textarea class="form-control Js_pic_des" id="" maxlength="20" style="height:100px" placeholder="20个字以内">'+_val+'</textarea>',
                '					</div>',
                '					<div class="form-group">',
                '						<label>排序序号：</label>',
                '						<input type="text" class="form-control Js_sort" placeholder="默认为1，排在第一位"  id="" maxlength="2" value="'+_sort+'">',
                '					</div>',
                '				</fieldset>',
                '				<div class="form-actions center">',
                '					<button type="button" class="btn btn-sm btn-success Js_edit_pic_save" >',
                '						<b>确定</b>',
                '						<i class="icon-arrow-right icon-on-right bigger-110"></i>',
                '					</button>',
                '				</div>',
                '			</form>',
                '		</div>',
                '	</div>',
                '</div>'].join("");

            $.fancybox({
                width : 400,
                height : 'auto',
                autoSize : false,
                padding : 0,
                scrolling : 'no',
                content: _html,
                afterShow : function(){
                    $(".Js_edit_pic_save").on("click", function(){
                        editpic($this,$(this))
                    });
                }
            })
        });

        $(document).on("click",".Js_del_pic",function(){
            $(this).parents("li").remove()
        })
    });


</script>

</@we.html>