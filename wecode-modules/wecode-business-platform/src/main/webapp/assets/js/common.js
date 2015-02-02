/**
 * [WG 主对象]
 */
window.WG = {
	init : function(T) {
		T = T || this;
		for (var p in T) {
			T[p] && T[p].init && T[p].init();
		};
	},
	stopBubble : function(e) {
		// 如果传入了事件对象，那么就是非ie浏览器
		if (e && e.stopPropagation) {
			//因此它支持W3C的stopPropagation()方法
			e.stopPropagation();
		} else {
			//否则我们使用ie的方法来取消事件冒泡
			window.event.cancelBubble = true;
		}
	},
	baseUrl : "" //网站主域名配置，修改成自己的根域名（目录）
};

/**
 * [closefancybox 全局关闭fancybox]
 * @type {Object}
 */
WG.closefancybox = {
	init : function() {
		$(document).on("click", ".Js_fancybox_close", this.hide);
	},
	//关闭fancybox
	hide : function() {
		$.fancybox.close();
	}
}

/**
 * [fn 通用函数]
 * @type {Object}
 */
WG.fn = {
	ajax : function(businessInterface, data, successFunction, completeFun, property, object) {
		request = {
			url : WG.baseUrl + businessInterface,
			data : data,
			dataType : "json",
			type : "POST",
			success : function(data) {
				if (data.status == "not_login") {
					window.location.href = baseUrl + 'user/login';
				} else {
					successFunction(data, object)
				}
			},
			complete : function(a, b) {
				if (completeFun)
					completeFun(a, b);
			}
		};

		$.extend(request, property);
		var r_ajax = $.ajax(request);
		return r_ajax;
	},
	checkError : function(error, previousStep, steps, stepPage) {
		var hasError = false;
		for (var i in steps) {
			id = steps[i];
			if (error.hasOwnProperty(id)) {
				//$('#' + id + ' .tools').addClass('error');
				var errhtml = ''
				if ($('#' + id + " .Validform_checktip").length > 0) {
					$('#' + id + " .Validform_checktip").addClass('Validform_wrong').show().text(error[id])
				} else {
					$('#' + id).append('<span class="Validform_checktip Validform_wrong">' + error[id] + '</span>');
				}
				hasError = true;
			} else {
				$('#' + id).find(".Validform_checktip").hide();
			}
		}

		if (previousStep != '') {
			return previousStep;
		}

		return hasError ? stepPage : '';
	},
	htmlspecialchars : function(str) {
		str = str.replace(/&/g, '&amp;');
		str = str.replace(/</g, '&lt;');
		str = str.replace(/>/g, '&gt;');
		str = str.replace(/"/g, '&quot;');
		str = str.replace(/'/g, '&#039;');
		return str;
	}
};

$(function() {
	WG.init();
});
//浏览器版本判断
/*
 WG.Version = {
 init: function(){
 if (!$.support.leadingWhitespace) { //判断到IE9及以上
 //alert("请使用最新浏览器")
 var W_width = $(window).width();
 if(W_width < 1290){
 $(".leftnav_small_wraper").css({ opacity: .7 });
 $(".posttrend_btn").css({ opacity: .7 })
 $(".side_tools").css({ opacity: .7 })
 }
 }
 }
 }
 */

function changepwd() {
	var _html = [
	'<div class="widget-box no-border">',
	'	<div class="widget-header no-border">',
	'		<h4>修改密码</h4>',
	'	</div>',
	'	<div class="widget-body no-border">',
	'		<div class="widget-main no-padding">',
	'			<form id="edit_pwd_form" class="form-horizontal" action="/changePwd" method="post">',
	'    <div class="form-group"><div class="space-10"></div>',
	'        <label class="col-sm-4 control-label no-padding-right" for="form-field-1">旧密码</label>',
	'        <div class="col-sm-8">',
	'            <input type="password" id="oldpwd" class="col-xs-10 col-sm-8" name="oldpwd" />',
	'        </div>',
	'    </div>',
	'    <div class="form-group">',
	'        <label class="col-sm-4 control-label no-padding-right" for="form-field-1">新密码</label>',
	'        <div class="col-sm-8">',
	'            <input type="password" id="newpwd" name="newpwd" class="col-xs-10 col-sm-8"/>',
	'        </div>',
	'    </div>',
	'    <div class="form-group">',
	'        <label class="col-sm-4 control-label no-padding-right" for="form-field-1">确认新密码</label>',
	'        <div class="col-sm-8">',
	'            <input type="password" id="newpwd2" class="col-xs-10 col-sm-8" name="newpwd2" />',
	'        </div>',
	'    </div>',
	'    <div class="clearfix form-actions">',
	'        <div class="col-md-offset-2 col-md-9">',
	'            <button class="btn btn-info" type="button" id="btnSubmit" onclick="changeUserPwd();">',
	'                <i class="icon-ok bigger-110"></i>',
	'                保存',
	'            </button>',
	'',
	'            &nbsp; &nbsp; &nbsp;',
	'            <a href="javascript:$.fancybox.close();" class="btn" type="reset">',
	'                <i class="icon-undo bigger-110"></i>',
	'                取消',
	'            </a>',
	'        </div>',
	'    </div>',
	'</form>',
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
            $.fn.qtip.zindex = 9000;
        },
        beforeClose:function(){
        	$(".we-error").qtip("destroy");
        }
    })
}

function changeUserPwd(){
	$.validity.start();
    $("#oldpwd").require("请输入旧密码!");
    $("#newpwd").require("请输入新密码!");
    $("#newpwd2").require("请输入确认密码!");
    $("#newpwd,#newpwd2").equal("两次输入的密码不相同！");
    
    var result = $.validity.end().valid;
    if(result == false){
        return false;
    }
    
    var data = $("#edit_pwd_form").serialize();
    $.ajax({
        url: $("#edit_pwd_form").attr("action"),
        type:'post',
        data: data,
        success:function(json){
            if(json.success){
                showToast("保存成功");
            }else{
                showToast(json.message || "保存失败");
            }
            $.fn.qtip.zindex = 7000;
            $.fancybox.close();
        }
    });
}

/**
 * 显示提示信息
 */
function showToast(text, title, time) {
	if (jQuery && jQuery.gritter) {
		$.gritter.add({
			title : title || '信息提示',
			time : time || 1000,
			text : text,
			class_name : 'gritter-info gritter-center'
		});
	} else {
		alert(text);
	}
}