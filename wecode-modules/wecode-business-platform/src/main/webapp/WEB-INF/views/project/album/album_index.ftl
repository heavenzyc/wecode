<#import "/WEB-INF/views/common/include.ftl" as we/>

<@we.html css=["/assets/css/colorbox.css","/assets/css/jquery.fancybox.css"] js=["${jspath}/project/consultant/consultant.js",
"/assets/js/common.js",
"/assets/js/jquery.colorbox-min.js",
"/assets/js/jquery.fancybox.min.js"]>

<@we.breadcrumb/>
<div class="page-content">
    <#--<div class="page-header">
        <h1>
            楼盘相册
            <small>
                <i class="icon-double-angle-right"></i>
                相册列表
            </small>
        </h1>
    </div>-->
    <div class="row">

        <div class="col-xs-12">
            <button class="btn btn-primary Js_create_album">创建相册</button>
            <div class="hr"></div>

            <!-- PAGE CONTENT BEGINS -->
            <div class="row-fluid">
                <ul class="Js_album_list ace-thumbnails album-thumb clearfix">
                    <#list albumList as album>
                    <li class="no-border">
                        <a href="/admin/project/album/album_info?albumId=${album.id}" class="cboxElement">
                            <#--<img alt="150x150" src="${kit.url('COMMON',album.getFirstPicPath())}">-->
                                <#if album.getFirstPicPath()==''>
                                    <img alt="150x150" src="/assets/images/gallery/image-2.jpg">
                                <#else >
                                    <img alt="150x150" src="${kit.url('COMMON',album.getFirstPicPath())}">
                                </#if>

                            <div class="text">
                                <div class="inner">${album.description}</div>
                            </div>
                        </a>
                        <div class="text-center album-title"><a href="/admin/project/album/album_info?albumId=${album.id}">${album.name}</a></div>
                        <div class="tools tools-top">
                            <a href="javascript:" class="Js_edit_album" data-options="${album.id}">
                                <i class="icon-pencil" title="编辑"></i>
                            </a>

                            <a href="javascript:" class="Js_remove_album" data-options="${album.id}">
                                <i class="icon-remove red" title="删除"></i>
                            </a>
                        </div>
                    </li>
                    </#list>
                </ul>
            </div>
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->

</div><!-- /.page-content -->

<script type="text/javascript">
    $(function(){
        $(document).on("click", ".Js_fancybox_close", function(){
            $.fancybox.close()
        });
        //添加相册
        $(".Js_create_album").on("click",function(){
            var _html = [
                '<div class="widget-box no-border">',
                '	<div class="widget-header no-border">',
                '		<h4>创建相册</h4>',
                '	</div>',
                '	<div class="widget-body no-border">',
                '		<div class="widget-main no-padding">',
                '			<form class="album_form" id="add_album_form">',
                '				<fieldset>',
                '					<div class="form-group">',
                '						<label>相册名：</label>',
                '						<input type="text" class="form-control" name="name" maxlength="10">',
                '					</div>',
                '					<div class="space-6"></div>',
                '					<div class="form-group">',
                '						<label>相册描述：</label>',
                '						<textarea class="form-control" id="" maxlength="20" style="height:100px" placeholder="" name="description"></textarea>',
                '					</div>',
                '					<div class="space-6"></div>',
                '					<div class="form-group">',
                '						<label>排序序号：</label>',
                '						<input type="text" class="form-control" name="sort" maxlength="2">',
                '					</div>',
                '				</fieldset>',
                '				<div class="form-actions center">',
                '					<button type="button" class="btn btn-sm btn-success Js_create_album_submit" >',
                '						<b>保存</b>',
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
                    $(".Js_create_album_submit").on("click", create_album);
                }
            })
        });

        var create_album = function(){
            var postdata = $(".album_form").serialize();
            $.ajax({
                url:'/admin/project/album/save_album',
                asnyc:'false',
                type:'post',
                data:postdata,
                success:function(data){
                    if(data.success){
                        window.location.reload();
                    }
                }
            });
            $.fancybox.close()
        };

        //编辑相册
        $(".Js_edit_album").on("click",function(){
            var id = $(this).attr("data-options");
            $.ajax({
                url:'/admin/project/album/edit_album',
                asnyc:'false',
                type:'get',
                data:{id:id},
                success:function(data){
                    var _html = [
                        '<div class="widget-box no-border">',
                        '	<div class="widget-header no-border">',
                        '		<h4>编辑相册</h4>',
                        '	</div>',
                        '	<div class="widget-body no-border">',
                        '		<div class="widget-main no-padding">',
                        '			<form class="edit_album_form">',
                        '				<input type="hidden" name="id" value="'+data.album.id+'">',
                        '				<fieldset>',
                        '					<div class="form-group">',
                        '						<label>相册名：</label>',
                        '						<input type="text" placeholder="10个字以内" class="form-control" name="name" maxlength="10" value="'+data.album.name+'">',
                        '					</div>',
                        '					<div class="space-6"></div>',
                        '					<div class="form-group">',
                        '						<label>相册描述：</label>',
                        '						<textarea class="form-control" id="" maxlength="20" style="height:100px" placeholder="20个字以内" name="description">'+data.album.description+'</textarea>',
                        '					</div>',
                        '					<div class="space-6"></div>',
                        '					<div class="form-group">',
                        '						<label>排序序号：</label>',
                        '						<input type="text" class="form-control" name="sort" maxlength="2" value="'+data.album.sort+'">',
                        '					</div>',
                        '				</fieldset>',
                        '				<div class="form-actions center">',
                        '					<button type="button" class="btn btn-sm btn-success Js_edit_album_submit" >',
                        '						<b>保存</b>',
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
                            $(".Js_edit_album_submit").on("click", edit_album);
                        }
                    })
                }
            });

        });

        var edit_album = function(){
            var postdata = $(".edit_album_form").serialize();
            $.ajax({
                url:'/admin/project/album/modify_album',
                asnyc:'false',
                type:'post',
                data:postdata,
                success:function(data){
                    if(data.success){
                        window.location.reload();
                    }
                }
            });
            $.fancybox.close()
        };

        var remove_album = function(){
            var $this = $(this);
            var albumId = $this.attr("data-options");
            var _html = [
                '<div class="widget-box no-border">',
                '	<div class="widget-header no-border">',
                '		<h4>提示</h4>',
                '	</div>',
                '	<div class="widget-body no-border">',
                '		<div class="widget-main no-padding">',
                '			<div class="modal-body"><h5>删除相册以及相册内的所有图片？</h5></div>',
                '			<div class="modal-footer">',
                '				<button data-bb-handler="cancel" type="button" class="btn btn-default Js_fancybox_close">取消</button>',
                '				<button data-bb-handler="confirm" type="button" class="btn btn-primary Js_remove_album_submit">确定</button>',
                '			</div>',
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
                    $(".Js_remove_album_submit").on("click", function(){
                        /*$this.parents("li").remove();*/
                        var id = albumId;
                        $.ajax({
                            url:'/admin/project/album/delete_album',
                            asnyc:'false',
                            type:'get',
                            data:{id:id},
                            success:function(data){
                                if(data.success){
                                    window.location.reload();
                                }
                            }
                        });
                        $.fancybox.close();
                    });
                }
            })
        };

        $(document).on("click",".Js_remove_album", remove_album);


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

        //$('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
        $("#cboxLoadingGraphic").append("<i class='icon-spinner orange'></i>");//let's add a custom loading icon


    })
</script>
</@we.html>