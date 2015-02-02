/**
 * checkTextNumber
 * 计算文本框还可输入多少文字
 * 尾调用办法：$(element).checkTextNumber();
 * http://www.ancelee.com
 */

;(function($) {
	$.fn.checkTextNumber = function(options) {
		var $this = $(this);
		var opts = $.extend($.fn.checkTextNumber.defaults, options);
		this.each(function(){
			$.fn.checkTextNumber.init($this, opts);
		})
	};

	$.fn.checkTextNumber.init = function($obj, opts) {
		var setNum,showOpts = new Object;
		for(var op in opts){
			showOpts[op] = opts[op]
		};
		$obj.removeAttr("disabled");
		$obj.on("focus", function() {
			setNum = setInterval(function() {
				$.fn.checkTextNumber.numChange($obj, showOpts)
			}, 200);
		});
		$obj.on("focusout", function() {
			setNum = clearInterval(setNum)
		});
	};

	$.fn.checkTextNumber.numChange = function($obj, showOpts) {
		var strlen = 0; //初始定义长度为0
		var st;
		var textcon = $.trim($obj.val());
		for (var i = 0; i < textcon.length; i++) {
			if (textcon.charCodeAt(i) > 255) {
				strlen = strlen + 2; //中文为2个字符
			} else {
				strlen = strlen + 1; //英文一个字符
			}
		}
		strlen = Math.ceil(strlen / 2); //中英文相加除2取整数

		if (showOpts.maxNum - strlen < 0) {
			st = "超出<b style='color:#f00; padding:0 3px;' class='"+ showOpts.numClassName + " Js_num_error'>"+ Math.abs(showOpts.maxNum - strlen) +"</b>字"; //超出的样式
		} else {
			st = "可输入<b class="+ showOpts.numClassName + " style='padding:0 3px;'>"+ (showOpts.maxNum - strlen) +"</b>字"; //正常时候
		};
		var tc = showOpts.textClassName.split(" ");
		var textObj = "." + tc[0];
			$cbox = $obj.parent().find(textObj);
		if (showOpts.textClassName && $cbox.length > 0) {
			$cbox.html(st)
		} else {
			var numHtml = $('<div class="' + showOpts.textClassName+'"></div>');
			numHtml.html(st);
			$obj.after(numHtml);
		}
	};

	$.fn.checkTextNumber.defaults = {
		maxNum: 140, //可输入的最大字符
		numClassName: "numbox", //显示字数的样式名称
		textClassName: "textnumbox", //绑定显示数字的元素的样式名称，可以是多个，用空格隔开
		btnObj: null, //绑定按钮对象，可以是jquery对象，$(document)
	};
})(jQuery);