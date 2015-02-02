//增加jquery.hiddenposition.1.1.min.js
(function($){var DEBUG=false;var version="1.1";$.fn.hiddenPosition=function(options){var opts=$.extend({},$.fn.hiddenPosition.defaults,options);return this.each(function(){var $this=$(this);var o=$.metadata?$.extend({},opts,$this.metadata()):opts;position($this,o);});};function position(element,options){var dims=getHiddenDims(element);var ofDims=getHiddenDims($(options.of));var my=getDirections(options.my);var at=getDirections(options.at);var offset=getOffset(options.offset);debugObject("my",my);debugObject("at",at);debugObject("myDims",dims);debugObject("targetDims",ofDims);var coord=getCoordinates(ofDims);switch(at.h){case"center":coord.left+=ofDims.width/2;break;case"right":coord.left+=ofDims.width;break;default:break;}switch(at.v){case"center":coord.top+=ofDims.height/2;break;case"bottom":coord.top+=ofDims.height;break;default:break;}switch(my.h){case"center":coord.left-=dims.width/2;break;case"right":coord.left-=dims.width;break;default:break;}switch(my.v){case"center":coord.top-=dims.height/2;break;case"bottom":coord.top-=dims.height;break;default:break;}coord.top+=offset.v;coord.left+=offset.h;coord=checkCollisions(element,coord,dims,my,at,options);if(dims.position=="relative"){coord=transformToRelative(element,coord,dims);}if(options.using){options.using(coord,element);}else{move(element,coord);}}function move(element,coord){element.css("left",coord.left+"px").css("top",coord.top+"px");}function transformToRelative(element,coord,dims){debugObject("to coordinates",coord);debugObject("dims",dims);coord.top-=dims.offsetTop-dims.top;coord.left-=dims.offsetLeft-dims.left;debugObject("transformed coordinates",coord);return coord;}function checkCollisions(element,coord,dims,my,at,options){if(options.collision.match(/flip|fit/g)){debug("CHECK COLLISION!",options.collision);var collisions={h:"none",v:"none"};var opts=options.collision.split(" ");if(opts.length==1){collisions.h=opts[0];collisions.v=opts[0];}else{if(opts.length>1){collisions.h=opts[0];collisions.v=opts[1];}}var viewport=null;if(options.viewport){viewport=getHiddenDims($(options.viewport));}else{viewport={position:"absolute",top:0,left:0,offsetTop:0,offsetLeft:0,width:$(window).width(),height:$(window).height(),innerWidth:$(window).width(),innerHeight:$(window).height()};}debugObject("viewport",viewport);coord=checkCollision(collisions.h,"h",element,coord,dims,viewport,my,at);coord=checkCollision(collisions.v,"v",element,coord,dims,viewport,my,at);}return coord;}function checkCollision(method,dir,element,coord,dims,viewport,my,at){if(method!="none"){var vcoord=getCoordinates(viewport);if(dir=="h"){if(coord.left<vcoord.left){if(method=="fit"){coord.left=vcoord.left;}else{if(method=="flip"){if(my.h=="right"&&(coord.left+dims.width>=vcoord.left)){coord.left+=dims.width;}}}}else{if(coord.left+dims.width>vcoord.left+viewport.innerWidth){if(method=="fit"){coord.left-=((coord.left+dims.width)-(vcoord.left+viewport.innerWidth));}else{if(method=="flip"){if(my.h=="left"&&(coord.left<=vcoord.left+viewport.innerWidth)){coord.left-=dims.width;}}}}}}else{if(dir=="v"){if(coord.top<vcoord.top){if(method=="fit"){coord.top=vcoord.top;}else{if(method=="flip"){if(my.v=="bottom"&&(coord.top+dims.height>=vcoord.top)){coord.top+=dims.height;}}}}else{if(coord.top+dims.height>vcoord.top+viewport.innerHeight){if(method=="fit"){coord.top-=((coord.top+dims.height)-(vcoord.top+viewport.innerHeight));}else{if(method=="flip"){if(my.v=="top"&&(coord.top<=vcoord.top+viewport.innerHeight)){coord.top-=dims.height;}}}}}}}}return coord;}function getCoordinates(dims){var coord={top:dims.offsetTop,left:dims.offsetLeft};if(dims.position=="absolute"||dims.position=="fixed"){if(dims.top){coord.top=dims.top;}if(dims.left){coord.left=dims.left;}}return coord;}function getOffset(option){var off={h:0,v:0};if(option){var opts=option.split(" ");if(opts.length>0){off.h=Number(opts[0]);}if(opts.length>1){off.v=Number(opts[1]);}}return off;}function getDirections(option){var dir={h:"center",v:"center"};if(option){var opts=option.split(" ");if(opts.length>0){dir=getDirection(opts[0],dir);}if(opts.length>1){dir=getDirection(opts[1],dir);}}return dir;}function getDirection(str,d){switch(str){case"top":d.v="top";break;case"bottom":d.v="bottom";break;case"left":d.h="left";break;case"right":d.h="right";break;default:break;}return d;}function getDims(elem){var offset=$(elem).offset();return{position:$(elem).css("position"),top:Number($(elem).css("top").replace(/[^\d\.-]/g,"")),left:Number($(elem).css("left").replace(/[^\d\.-]/g,"")),offsetTop:offset.top,offsetLeft:offset.left,width:$(elem).outerWidth(),height:$(elem).outerHeight(),innerWidth:$(elem).innerWidth(),innerHeight:$(elem).innerHeight()};}function getHiddenDims(elems){var dims=null,i=0,offset,elem;while((elem=elems[i++])){var hiddenElems=$(elem).parents().andSelf().filter(":hidden");if(!hiddenElems.length){dims=getDims(elem);}else{debug("hidden");var backupStyle=[];hiddenElems.each(function(){var style=$(this).attr("style");style=typeof style=="undefined"?"":style;debug("style",style);backupStyle.push(style);$(this).attr("style",style+" ; display: block !important;");debug("style",$(this).attr("style"));});var left=hiddenElems.eq(0).css("left");debug("left",left);hiddenElems.eq(0).css("left",-10000);dims=getDims(elem);hiddenElems.eq(0).css("top",-10000).css("left",left);dims.offsetLeft=getDims(elem).offsetLeft;dims.left=getDims(elem).left;hiddenElems.each(function(){$(this).attr("style",backupStyle.shift());});}}return dims;}$.fn.hiddenPosition.defaults={my:"center",at:"center",of:null,offset:null,using:null,collision:"flip",viewport:null};$.fn.hiddenPosition.getHiddenDimensions=function(element){return getHiddenDims(element);};$.fn.hiddenPosition.toggleDebug=function(){DEBUG=!DEBUG;};function debug(log,jQueryobj){try{if(DEBUG&&window.console&&window.console.log){window.console.log(log+": "+jQueryobj);}}catch(ex){}}function debugObject(log,jQueryobj){try{if(!jQueryobj){jQueryobj=log;}debug(log,jQueryobj);if(DEBUG&&window.console&&window.console.log&&($.browser.msie||$.browser.opera)){window.console.log($.param(jQueryobj));}else{if(DEBUG&&window.console&&window.console.debug){window.console.debug(jQueryobj);}}}catch(ex){}}})(jQuery);

(function($){
	/**
	 * 初始化验证框架的错误提示输出方法
	 */

	if(!$.validity){
		return;
	}
	$.validity.settings.scrollTo = $.validity.settings.scrollTo || true;//默认滚动到错误地方
    $.validity.settings.defaultFieldName = "";
    $.validity.settings.useInfer = false;

	//自定义消息提示文本
	$.extend($.validity.messages, {
	    require:"请填写#{field}.",

	    // Format validators:
	    match:"#{field}格式不正确.",
	    integer:"请填写整数.",
	    date:"请填写日期.",
	    email:"请填写正确的email格式.",
	    usd:"#{field} must be formatted as a US Dollar amount.", //TODO 完善提示信息
	    url:"#{field} must be formatted as a URL.",
	    number:"请填写数字.",
	    zip:"#{field} must be formatted as a zipcode ##### or #####-####.",
	    phone:"#{field} must be formatted as a phone number ###-###-####.",
	    guid:"#{field} must be formatted as a guid like {3F2504E0-4F89-11D3-9A0C-0305E82C3301}.",
	    time24:"#{field} must be formatted as a 24 hour time: 23:00.",
	    time12:"#{field} must be formatted as a 12 hour time: 12:00 AM/PM",

	    // Value range messages:
	    lessThan:"#{field}需小于#{max}.",
	    lessThanOrEqualTo:"#{field} must be less than or equal to #{max}.",
	    greaterThan:"#{field} 需大于 #{min}.",
	    greaterThanOrEqualTo:"#{field} 需大于或等于 #{min}.",
	    range:"#{field} 必须在 #{min} -- #{max}之间.",

	    // Value length messages:
	    tooLong:"#{field} cannot be longer than #{max} characters.",
	    tooShort:"#{field} cannot be shorter than #{min} characters.}",

	    // Aggregate validator messages:
	    equal:"Values don't match.",
	    distinct:"A value was repeated.",
	    sum:"Values don't add to #{sum}.",
	    sumMax:"The sum of the values must be less than #{max}.",
	    sumMin:"The sum of the values must be greater than #{min}.",

	    nonHtml:"#{field} cannot contain Html characters.",

	    generic:"Invalid."
	});

    //自定义字段类型
    $.extend($.validity.patterns, {
        phone: /^1\d{10}$/
    });
    

    var errorClass = "x-error";
    $.fn.qtip.zindex = 7000;//z-index小于facnybox的8000

    $.validity.outputs.myValidateTip = {

        start:function(){
        	// Remove all the existing errors.
        	// $("." + errorClass).qtip("destroy");
        	// $("." + errorClass).remove();
            $(".we-error").qtip("destroy");
        },

        // The end function is called when validation has concluded.
        // This allows you to flush any buffers or do anything you need to
        // after all of the validators have been called.
        // results will be the results object.
        // results.valid is a boolean representing whether the form is valid.
        // results.errors is an integer of how many errors there are.
        end:function(results) {
//			if (!results.valid && $.validity.settings.scrollTo) {
//                location.hash = $("." + errorClass + ":eq(0)").attr('id');
//            }
            // If not valid and scrollTo is enabled, scroll the page to the first error.
            if (!results.valid && $.validity.settings.scrollTo) {
                document.body.scrollTop = $(".we-error").offset().top  - 200;
            }
        },

        // The raise function is called to raise an error for a specific input.
        // The first argument is a jQuery object of the input to raise the error message for.
        // The second argument is the string of the error message.
        raise:function($obj, msg){
        	if($.validity.settings.onRaise){
        		$.validity.settings.onRaise($obj,msg);
        	}
			// var labelSelector = "." + errorClass;

        	var basepath = $.validity.settings.basepath || "/assets/js/jquery.validity";

        	//绘制错误提示信息的小红点
        	//检查有无errorTarget属性(比如hidden元素，就需要指定该属性)
        	var errorTarget;
        	var errorTargetExpr = $obj.attr("data-error-target");
        	if(errorTargetExpr){
        		try{
//        			console.debug("1" + errorTargetExpr)
        			var targetFn = eval("" + errorTargetExpr + "");	//作为函数执行
        			errorTarget = $(targetFn);
//        			console.debug("2")
        		}catch(e){
        			try{
//        				console.debug("3")
        				errorTarget = $(errorTargetExpr); 	//直接作为jquery的selector
//        				console.debug("4")
        			}catch(e){
        				try{
//        					console.debug("5")
        					errorTarget = $("#" + errorTargetExpr);  	//id
//        					console.debug("6")
        				}catch(e){
//        					console.debug("7")
        					errorTarget = $obj; //fallback
//        					console.debug("8")
        				}
        			}
        		}
        	}else{
        		errorTarget = $obj;
        	}
        	// var oldPoint = errorTarget.data("errorPoint");
        	// if(oldPoint){
        	// 	oldPoint.qtip("destroy");
        	// 	oldPoint.remove();
        	// 	errorTarget.removeData("errorPoint");
        	// }

//     		var errorPoint = $('<div></div>').addClass(errorClass);
//         	if(errorTarget.is(":input") || errorTarget.is(":password")){
// 				errorPoint.css("position","relative")
// 						.insertAfter(errorTarget);
//         	}else{
//         		errorPoint.css("position","relative")
// 						.insertAfter(errorTarget);
// //	         	errorPoint.css("position","absolute")
// //	         			.appendTo(document.body);//如果是普通的DIV之类的，就用绝对定位，避免显示不出来
//         	}
//         	errorTarget.data("errorPoint", errorPoint);

        	//错误提示的红点
//        	var errorPoint = $('<img src="' + basepath + '/i_ts.png" style="z-index:1009;"/>')//对应于崇文项目底栏的z-index:1010
//        					.addClass(errorClass);
            // errorPoint.hiddenPosition({
            // 	my: 'left top',
            // 	at: 'right top',
            // 	offset: '2 0',
            // 	collision: 'flip flip',
            // 	of: errorTarget
            // });
            //显示提示信息
            errorTarget.addClass('we-error');
            errorTarget.qtip({
                content:msg,
                position: {
		        	my: $obj.attr("data-error-pos-my") || 'center left',
			        at: $obj.attr("data-error-pos-at") || 'center right',
					target: errorTarget
		        },
                show: {
                    ready: true
                },
                //hide: false,
		        style: {
		          classes: 'ui-tooltip-yellow ui-tooltip-shadow ui-tooltip-rounded'
		        }
            });

            /*
            //如果存在
            if ($(labelSelector).length) {
                //$(labelSelector).text(msg);
            }
            // Otherwize create a new one and stick it after the input:
            else {
                var tip = $('<img src="/backend/img/i_ts.png"/>')
                    .addClass(errorClass)
                    .insertAfter($obj);
                 tip.qtip({content:msg});
            }*/
        },

        // The raiseAggregate function is similar to the raise function, except that
        // the $obj argument will be a jQuery object of several inputs,
        // all of which are invalid aggregately.
        raiseAggregate:function($obj, msg){
			// Just raise the error on the last input.
            if ($obj.length) {
                this.raise($($obj.get($obj.length - 1)), msg);
            }
        }
    };

	// Now enable the output mode we just installed.
	$.validity.setup({ outputMode:'myValidateTip' });
})(jQuery);