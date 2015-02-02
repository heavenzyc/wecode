<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>头像剪切上传（视频拍照）</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/uploadify.css">
	<link rel="stylesheet" type="text/css" href="css/jquery.Jcrop.css">
</head>
<body>
<div class="wrap w1200">
	<div class="container w1160">
		<div class="avatar-upload-wrap clearfix">
			<div class="avatar-preview fl">
				<!--默认头像图片-->
				<img alt="" src="images/default_avatar.png">
			</div>
			<div class="avatar-upload fl">
				<div class="fl">
					<form>
						<input class="fl" id="file_upload" name="file_upload" type="file">
					</form>
				</div>
				<div class="Js_camera_btn avatar-btn fr">拍照上传</div>
				<div class="avatar-viewbox clear">
					<p class="s-text">请选择一张图片，编辑后保存为头像<br />（仅支持小于5M的jpg，gif，png格式图片）</p>
				</div>
				<div class="avatar-btnarea">
					<span class="Js_avatar_shot avatar-sbtn">拍照</span><span class="Js_camera_btn avatar-reshot avatar-sbtn">重新拍照</span><span class="Js_avatar_confirm avatar-sbtn">保存</span>
				</div>
				<form id="cropform" action="upload-avatar.php" method="post">
					<input type="hidden" id="x" name="x" />
					<input type="hidden" id="y" name="y" />
					<input type="hidden" id="w" name="w" />
					<input type="hidden" id="h" name="h" />
					<input type="hidden" id="avatar-pic" name="pic" value="">
				</form>
				<div id="avatar-camera"></div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="js/jquery.uploadify.js"></script>
<script type="text/javascript" src="js/jquery.Jcrop.min.js"></script>
<script type="text/javascript" src="js/webcam.js"></script>
<script type="text/javascript" src="js/uploadavatar.js"></script>
</body>
</html>