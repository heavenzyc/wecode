var uploadPic = function(obj,callback){
	return {
		init : function(){
			obj = obj || "Js_upload_pics";
			$("."+obj).on('click', this.showUpload);

			//初始化已有图片
			var root = $('.' + obj);
			root.each(function(index,item){
				var item = $(item);
				var imgurl = item.find(".picurl").val();
				//console.debug(imgurl);
				var cropSize = getImgCropSize(item.data("crop-size"));
				if(imgurl){
					//console.debug("imgurl[" + imgurl + "]");
					//console.debug(cropSize);
					item.find(".nopic-box").hide();
					item.find(".pic-con").remove();
					item.append('<div class="pic-con"><img src="' + imgurl + '" style="width:' + cropSize.w + 'px;height:' + cropSize.h + '"><a class="remove-btn Js_remove_pic" href="javascript:"><i class="icon-remove"></i></a></div>');
				}else{
					// item.find(".file-label").css({
					// 	width: cropSize.w,
					// 	height: cropSize.h
					// });
					var fileDescription = '<span>文件尺寸:' + item.data("crop-size") + '</span>';
					item.find(".file-name").find("span").remove();
					item.find(".file-name").css("text-align","center").append(fileDescription);
					//console.debug("cropsize:" + cropSize);
				}
			});

			$(".Js_upload_pics").on('click', '.Js_remove_pic' ,this.delUpload);
		},
		//触发点击事件
		showUpload: function(){
			var html = [
				'<div class="avatar-upload-wrap clearfix" style="display:none">',
				'	<div class="avatar-preview pull-right">',
				'		<!--默认头像图片-->',
				'	</div>',
				'	<div class="avatar-upload pull-left">',
				'		<div class="pull-left">',
				'			<input class="pull-left" id="file_upload" name="file_upload" type="file">',
				'		</div>',
				'		<div class="avatar-viewbox clear">',
				'			<p class="s-text">请选择一张<span class="js_pic_size"></span>图片，编辑后保存<br />（仅支持小于1M的jpg，gif，png格式图片）</p><p class="js_pic_msg" style="text-align:center;color:#f00;"></p>',
				'		</div>',
				'		<div class="avatar-btnarea">',
				'			<span class="Js_avatar_shot avatar-sbtn">拍照</span><span class="Js_camera_btn avatar-reshot avatar-sbtn">重新拍照</span><span class="Js_avatar_confirm avatar-sbtn">保存</span>',
				'		</div>',
				'		<form id="cropform" action="upload-avatar.php" method="post">',
				'			<input type="hidden" id="x" name="x" />',
				'			<input type="hidden" id="y" name="y" />',
				'			<input type="hidden" id="w" name="w" />',
				'			<input type="hidden" id="h" name="h" />',
				'			<input type="hidden" id="tw" name="tw" />',
				'			<input type="hidden" id="th" name="th" />',
				'			<input type="hidden" id="jw" name="jw" />',
				'			<input type="hidden" id="jh" name="jh" />',
				'			<input type="hidden" id="avatar-pic" name="avatar-pic" value="">',
				'			<input type="hidden" id="avatar-id" name="avatar-id" value="">',
				'			<input type="hidden" id="avatar-path" name="avatar-path" value="">',//图片相对路径
				'		</form>',
				'		<div id="avatar-camera"></div>',
				'	</div>',
				'</div>'].join("");

			var $this = $(this);
			//需要预览的对象class名
			var _crop = false, _w;
			if($this.data("crop") == true) {
				_crop = true;
				_w = 640;
			}else{
				_w = 405;
			};
			var previewobj = $this.data("obj");
			$.fancybox({
				minWidth : _w,
				minHeight : 480,
				autoSize : true,
				scrolling : 'no',
				content: html,
				afterShow: function(obj){
					$(".avatar-upload-wrap").show();
					if(!$this.data("crop")) {
						$(".avatar-preview").remove()
					};
					//图片尺寸提示信息
					var size = $this.data("crop-size") || "";
					$(".avatar-viewbox .s-text .js_pic_size").text(size + "的");
					UploadAvatar($this , previewobj , _crop, callback);
				}
			})
		},
		//上传后的删除事件
		delUpload: function(e){
			if(e && e.stopPropagation){
				//W3C取消冒泡事件
				e.stopPropagation();
			}else{
				//IE取消冒泡事件
				window.event.cancelBubble = true;
			};
			var tobj = $(this).parent().parent();
			var rel = tobj.attr("data-obj");
			tobj.find('img').remove();
			tobj.find(".nopic-box").show();
			tobj.find(".nopic-box").find(".picvalue").val("");
			tobj.find(".nopic-box").find(".picurl").val("");
			tobj.find(".nopic-box").find(".picid").val("");
			$(this).remove();
			if(rel && rel !== ""){
				$("."+rel+" img" ).remove();
			}
		}
	}
}
