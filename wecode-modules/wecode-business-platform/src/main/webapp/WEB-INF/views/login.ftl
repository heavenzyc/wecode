<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="login">
    <title>管理平台</title>
	<link rel="stylesheet" href="/assets/css/style.css">
	
</head>

<body>
  <#--<div class="login-header">
      <div class="logo">
          <img src="/assets/images/logo_login.png" alt="">
      </div>
  </div>-->
  <div class="login-main">
      <div class="login-wrap form-signin">
          <div class="login-box">
              <form method="post" action="/login">
                  <div class="login-title">登录</div>
                  <div class="login-user">
                      <i class="icon-user"></i><input class="text" name="username" id="username" type="text" placeholder="用户名">
                  </div>
                  <div class="login-pass">
                      <i class="icon-pass"></i><input class="text" type="password" name="password" id="password" placeholder="密码">
                  </div>
                  <div class="msg-tip error">${msg}</div>
                  <div class="login-bar">
                      <button class="login-btn" type="submit">登录</button>
                  </div>
              </form>
          </div>
      </div>
  </div>

  <!--[if !IE]> -->
  <script type="text/javascript">
      window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
  </script>
  <!-- <![endif]-->

  <!--[if IE]>
  <script type="text/javascript">
      window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
  </script>
  <![endif]-->

	<!--<script src="/resource/common/jquery/jquery-1.11.1.min.js"></script>-->
	<script src="/resource/common/bootstrap/3.1.1/js/bootstrap.min.js"></script>

	<!--[if lt IE 9]>
	<script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
	<script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
  <script>
      var resizeLogin = function(){
          var _w = $(window).width(),
                  _h = $(window).height();
          //_toth = $(".login-header").height() + $(".login-main").height() + $(".login-footer").height();
          _h = $(window).height();
          if(_h > 565){
              var pt = (_h - 565)/3;
              $("body").css("padding-top",pt);
          }else{
              $("body").css("padding-top","0");
          };
          $(".login-header,.login-main,.login-footer").show()
      };

      $(function(){
          $(window).on("resize",resizeLogin);
          resizeLogin()
      })
  </script>
  </body>
</html>
