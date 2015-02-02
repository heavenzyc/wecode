$(document).ready(function(){
    $(".form-signin").submit(function(){
        var flag = true;
        $("div.form-group").removeClass("has-error");
        $("span.help-block").text("");
        if($.trim($("#username").val())==""){
            $("#username").parent().parent().addClass("has-error");
            $("#username").val("");
            $("#username").next().text("请输入用户名.");
            flag = false;
        }
        if($.trim($("#password").val())==""){
            $("#password").parent().parent().addClass("has-error");
            $("#password").val("");
            $("#password").next().text("请输入密码.");
            flag = false;
        }
        // if($.trim($("#username").val()) != "" && $.trim($("#password").val()) != "") {
            // $("div.alert").remove();
            // var alertdiv = $("<div>");
            // alertdiv.addClass("alert alert-danger");
            // var btn = $("<button>");
            // btn.addClass("close").attr("data-dismiss","alert").html("×");
            // var msg = $("<span>");
            // msg.html("<h4>警告!</h4>用户名或密码错误.");
            // alertdiv.append(btn).append(msg);
            // $("h2.form-signin-heading").after(alertdiv);
        // }
        var key = RSAUtils.getKeyPair($('#exponent').val(), '',$('#modulus').val());
	   	var key2="username="+ encodeURIComponent($('#username').val())+"&password="+ encodeURIComponent($('#password').val());
			
	    $('#key').val(RSAUtils.encryptedString(key, key2));
	    
        return flag;
    });
});