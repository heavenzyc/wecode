/**
 * [UploadAvatar 图片上传]
 * @param {[type]} obj  [当前触发事件对象]
 * @param {[type]} pbox [需要预览的容器对象]
 * @param {[type]} crop [是否需要剪切]
 */
 function getImgCropSize(cropSizeStr){
	var cropSize = {w: 300, h: 200};
	if(cropSizeStr){
		cropSize.w = cropSizeStr.split("*")[0];
		cropSize.h = cropSizeStr.split("*")[1];
	}
	var oldw = cropSize.w;
	cropSize.w = cropSize.w > 300? 300: cropSize.w;
	if(oldw > 300){
		cropSize.h = cropSize.h * (cropSize.w/oldw);
	}
	return cropSize;
}
var UploadAvatar = function(obj, pbox, crop, callback) {
	crop = crop || false;
	function checkhHtml5() {
		if ( typeof (Worker) !== "undefined") {
			alert("支持HTML5");
		} else {
			alert("不支持HTML5");
		}
	}

	//checkhHtml5()
	var jcrop_api, boundx, boundy;
	$(".Js_avatar_shot").hide();
	$(".avatar-reshot").hide();
	$(".Js_avatar_confirm").hide();
	$('#file_upload').uploadify({
		'fileTypeDesc' : '支持jpg,gif,png图片文件',
		'fileTypeExts' : '*.gif; *.jpg; *.png',
		'fileSizeLimit' : '50MB',
		'buttonText' : "本地上传",
		'buttonClass' : "avatar-btn",
		'width' : 158,
		'height' : 32,
		'multi' : false,
		'swf' : '/assets/js/uploadimg/uploadify.swf', //上传组件
		'uploader' : '/admin/file/uploadCropImg',
		'onSelect' : function(file) {
			//alert('The file ' + file.name + ' was added to the queue.');
		},
		'onUploadSuccess' : function(file, data, response) {
			data = JSON.parse(data);
            //console.log(data);
            if(data.state != 'SUCCESS'){
            	$(".avatar-viewbox .js_pic_msg").text(data.state);
            	return;
            }
            $(".avatar-viewbox").html('<img id="upload-thumborg" data-id="'+data.id+'" src="' + data.url + '">');
			$("#avatar-pic").val(data.url);
			$("#avatar-id").val(data.id);
			$("#avatar-path").val(data.path);
			$(".Js_avatar_shot").hide();
			$(".avatar-reshot").hide();
			$(".Js_avatar_confirm").show();
			if (crop){
				UP.initJcrop(data);
			}
		},
		'onUploadStart' : function(file) {
			var code = obj.data("config-code");
			var maxsize = obj.data("config-maxsize");
			var type = obj.data("config-type");
			if (code) {
				$("#file_upload").uploadify("settings", "formData", {
					'code' : code,
					'maxsize' : maxsize,
					'type' : type,
					'width': UP.opt().tw,
					'height': UP.opt().th
				});
			}
		}
	});

	var UP = {
		opt : function() {
			var sizeArr, toWidth, toProportion, prew, preh;
			if (obj.data("crop-size") && obj.data("crop-size") !== "") {
				sizeArr = obj.data("crop-size").split("*");
				toWidth = sizeArr[0];
				//目标宽度
				toHeight = sizeArr[1];
				//目标高度
				toProportion = (toWidth / toHeight).toFixed(2);
				//宽高比
				prew = 200;
				//预览宽度
				preh = 200 / toProportion;
				//预览高度
			} else {
				toWidth = 100;
				//目标宽度
				toHeight = 300;
				//目标高度
				toProportion = (toWidth / toHeight).toFixed(2);
				//宽高比
				prew = 200;
				//预览宽度
				preh = 200 / toProportion;
				//预览高度
			}
			return {
				tw : toWidth,
				th : toHeight,
				tp : toProportion,
				pw : prew,
				ph : preh
			}
		},
		initJcrop : function(data) {
			//alert(data)
			var T = UP.opt();
			var sw,sh;
			if(data.width / data.height > 1){
				var bw = data.width / T.tw;
				sw = Math.round($(".avatar-viewbox").outerWidth() / bw);
				sh = Math.round(sw / T.tp);
				//console.debug("情况1:viewbox=" + $(".avatar-viewbox").width() + ",bw=" + bw + ",sw=" + sw+ ",sh=" + sh);
			}else{
				var bh = data.height / T.th;
				sh = Math.round($(".avatar-viewbox").outerHeight() / bh);
				sw = Math.round(sh * T.tp);
				//console.debug("情况2:viewbox=" + $(".avatar-viewbox").width() + ",bh=" + bh + ",sw=" + sw + ",sh=" + sh);
			}
			//386是上传框的宽度
			//var sh = Math.round(sw / T.tp);
			$('.avatar-preview').html('<img src="' + data.url + '">');
			$('#upload-thumborg').Jcrop({
				minSize : [sw, sh],
				onChange : UP.updatePreview,
				onSelect : UP.updatePreview,
				onRelease : UP.canclePreview,
				setSelect : [0, 0, sw, sh],
				aspectRatio : T.tp//选取框的比例
			}, function() {
				// Use the API to get the real image size
				var bounds = this.getBounds();
				boundx = bounds[0];
				boundy = bounds[1];
				// Store the API in the jcrop_api variable
				jcrop_api = this;

				UP.updatePreview({
					w : sw,
					h : sh,
					x : 0,
					x2 : sw,
					y : 0,
					y2 : sh
				});

				if ($(".jcrop-holder").length > 0) {
					var co = $(".jcrop-holder");
					var jh = co.height(), jw = co.width(), ah = co.parent().height(), aw = co.parent().width();
					$("#jw").val(jw);
					$("#jh").val(jh);
					//if(jh < ah) $(".jcrop-holder").css("top",(ah-jh)/2);
					//if(jw < aw) $(".jcrop-holder").css("left",(aw-jw)/2);
					co.parent().css({
						"border" : "none",
						"height" : "auto"
					});
				}
				//this.release()
			});
		},
		updatePreview : function(c) {
			var T = UP.opt();
			var preview_width = T.pw, preview_height = T.ph;
			$(".avatar-preview").height(preview_height).width(preview_width);
			if (parseInt(c.w) > 0) {
				var rx = preview_width / c.w;
				var ry = preview_height / c.h;
				$('.avatar-preview > img').css({
					width : Math.round(rx * boundx) + 'px',
					height : Math.round(ry * boundy) + 'px',
					marginLeft : '-' + Math.round(rx * c.x) + 'px',
					marginTop : '-' + Math.round(ry * c.y) + 'px'
				});
			};

			$('#x').val(c.x);
			$('#y').val(c.y);
			$('#w').val(Math.round(c.w));
			$('#h').val(Math.round(c.h));
			$('#tw').val(T.tw);
			//目标要剪切的宽度
			$('#th').val(T.th);
			//目标要剪切的高度
		},
		canclePreview : function() {
			$('#x,#y,#w,#h').removeAttr("value");
		},
		camera : function() {

		},
		checkCoords : function() {
			if (parseInt($('#w').val())) {
				return true;
			} else {
				var _msg = "请先选择图片区域";
				this.showTip(_msg);
				return false;
			}
		},
		updateAvatarSuccess : function() {
			var _msg = "保存成功";
			this.showTip(_msg)
		},
		showTip : function(msg) {
			$(".avatar-viewbox").append("<div class='shot-tip'>" + msg + "</div>");
			setTimeout(function() {
				$(".shot-tip").fadeOut("1000", function() {
					$(this).remove();
				})
			}, 800);
		}
	};

	var saveAvatar = function() {
		var T = UP.opt();
		if (crop) {
			var _cr = UP.checkCoords();
			if (_cr) {
				$(".Js_avatar_confirm").addClass("disable").text("保存中").off("click", saveAvatar)
				$.ajax({
					url : "/admin/file/cropImg",
					dataType : "json",
					type : "POST",
					data : $("#cropform").serialize(),
					success : function(data) {
						//console.debug(data);
						var show_W;
						UP.updateAvatarSuccess();
						T.tw > 300 ? show_W = 300 : show_W = T.tw;
						var url = data.src;
						obj.find(".pic-con").remove();
						
						obj.append('<div class="pic-con"><img src="' + url + '" style="width:' + show_W + 'px;"><a class="remove-btn Js_remove_pic" href="javascript:"><i class="icon-remove"></i></a></div>');
						obj.find(".nopic-box").find(".picvalue").val(data.path);//图片相对路径
						obj.find(".nopic-box").find(".picid").val(data.id);//图片文件ID
						obj.find(".nopic-box").find(".picurl").val(url);//完整url

						obj.find(".nopic-box").find(".oldpicvalue").val($("#avatar-pic").val());
						if (pbox && pbox !== "") {
							var previewobj = pbox;
							var $obj = $("." + previewobj);
							$obj.find('img').remove();
							$obj.append('<img src="' + url + '" style="width:100%;">')
						}
						//TODO 后面删除掉，都保存在.picvalue、.picid、.picurl里面
                        obj.append('<input type="hidden" name="picId" value="'+data.id+'">');
                        obj.append('<input type="hidden" name="path" value="'+ url +'">');//改为相对路径
                        obj.append('<input type="hidden" name="pic_path" value="'+ data.path +'">');//相对路径
						obj.find(".nopic-box").hide();
						$.fancybox.close();

						//$(".Js_avatar_confirm").removeClass("disable").text("保存").on("click", saveAvatar)
					}
				})
			}
		} /*else {
			var url = $("#upload-thumborg").attr("src");
			obj.find(".pic-con").remove();
			obj.append('<div class="pic-con"><img src="' + url + '" style="width:300px; height:150px"><a class="remove-btn Js_remove_pic" href="javascript:"><i class="icon-remove"></i></a></div>');
			obj.find(".nopic-box").find(".picvalue").val(url);
			//console.log("2====="+$("#avatar-pic").val());
			obj.find(".nopic-box").find(".oldpicvalue").val($("#avatar-pic").val());
			if (pbox && pbox !== "") {
				var previewobj = pbox;
				$("." + previewobj).html('<img src="' + url + '" style="width:100%;">')
			}
			obj.find(".nopic-box").hide();
			$.fancybox.close();
		}*/
        else{
            var url = $("#upload-thumborg").attr("src");
            callback = callback || "";
            //判断是否是相册图片上传
            if(typeof(callback) == "function"){
                callback.call();
            }else{
                obj.find(".pic-con").remove();
                obj.append('<div class="pic-con"><img src="'+url+'" style="width:300px; height:150px"><a class="remove-btn Js_remove_pic" href="javascript:"><i class="icon-remove"></i></a></div>');
                obj.find(".nopic-box").find(".picvalue").val(url);
            };

            //判断是否有预览
            if(pbox && pbox !== ""){
                var previewobj = pbox;
                $("."+previewobj).html('<img src="'+url+'" style="width:100%;">')
            }
            obj.find(".nopic-box").hide();
            $.fancybox.close();
        }
	};

	//保存已经选择区域的头像
	$(".Js_avatar_confirm").on("click", saveAvatar)

	//拍照上传
	$(".Js_camera_btn").on("click", function() {
		$(".avatar-viewbox").css({
			"border" : "none",
			"height" : "auto"
		});
		$(".avatar-reshot").hide();
		$(".Js_avatar_confirm").hide();
		webcam.set_api_url('u2/test.php');
		webcam.set_quality(100);
		// JPEG quality (1 - 100)
		webcam.set_shutter_sound(true);
		// play shutter click sound
		$(".avatar-viewbox").html(webcam.get_html(388, 280));

		webcam.set_hook('onComplete', function(msg) {
			// extract URL out of PHP output
			if (msg.match(/(http\:\/\/\S+)/)) {
				var image_url = RegExp.$1;
				// show JPEG image in page
				var t = '<img id="upload-thumborg" src="' + image_url + '">';
				$(".avatar-viewbox").append(t);
				// reset camera for another shot
				webcam.reset();
				$("#webcam_movie").remove();
				$(".shot-tip").remove();
				$(".Js_avatar_shot").hide();
				$(".avatar-reshot").show();
				$(".Js_avatar_confirm").show();
				UP.initJcrop(msg)
			} else
				alert("Error: " + msg);
		});
		webcam.set_hook('onLoad', function(msg) {
			$(".Js_avatar_shot").show();
		});

		webcam.set_hook('onError', function(msg) {
			$(".Js_avatar_shot").hide();
			$(".avatar-viewbox").append("<div class='shot-tip'>没有找到摄像头</div>");
		});
	});

	$(".Js_avatar_shot").on("click", function() {
		// take snapshot and upload to server
		$(".avatar-viewbox").append("<div class='shot-tip'>拍照中</div>");
		webcam.snap();
	});
}