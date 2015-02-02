<?php
// $src = $_SERVER['SERVER_NAME'].'/uploadfiles/Lady.jpg';
// echo '<img src="http://'.$src.'">';
if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
	$targetFolder = 'uploadfiles'; 
	//设置裁剪后的宽高
	$targ_w = $_POST['tw'];
	$targ_h = $_POST['th'];

	//裁剪时页面显示图片的最大宽高
	$max_width = 388;
	$max_height = 388;
	$jpeg_quality = 100;
	$tn_x = "";
	$tn_y = "";
	$tn_w = "";
	$tn_h = "";

	$filename = 'avatar-' . date('YmdHis') . '.jpg';
	$src = $_SERVER['DOCUMENT_ROOT'].$_POST['pic'];
	list($width, $height, $image_type) = getimagesize($src);


	$x_ratio = $max_width / $width;
	$y_ratio = $max_height / $height;

	if( ($width <= $max_width) && ($height <= $max_height) ){
		//$tn_width = $width;
		//$tn_height = $height;
		$tn_x = $_POST['x'];
		$tn_y = $_POST['y'];
		$tn_w = $_POST['w'];
		$tn_h = $_POST['h'];
	}elseif (($x_ratio * $height) < $max_height){
		//$tn_height = ceil($x_ratio * $height);
		//$tn_width = $max_width;
		$tn_x = ceil($_POST['x'] / $x_ratio);
		$tn_y = ceil($_POST['y'] / $x_ratio);
		$tn_w = ceil($_POST['w'] / $x_ratio);
		$tn_h = ceil($_POST['h'] / $x_ratio);
	}else{
		//$tn_width = ceil($y_ratio * $width);
		//$tn_height = $max_height;
		$tn_x = ceil($_POST['x'] / $y_ratio);
		$tn_y = ceil($_POST['y'] / $y_ratio);
		$tn_w = ceil($_POST['w'] / $y_ratio);
		$tn_h = ceil($_POST['h'] / $y_ratio);
	};

	switch ($image_type)
	{
		case 1: $img_r = imagecreatefromgif($src); break;
		case 2: $img_r = imagecreatefromjpeg($src);  break;
		case 3: $img_r = imagecreatefrompng($src); break;
		default: return '';  break;
	};

	//$img_r = imagecreatefromjpeg($src);
	$dst_r = ImageCreateTrueColor( $targ_w, $targ_h );

	imagecopyresampled($dst_r,$img_r,0,0,$tn_x,$tn_y,$targ_w,$targ_h,$tn_w,$tn_h);

	//header('Content-type: image/jpeg');
	switch ($image_type)
	{
		case 1: imagegif($dst_r, $targetFolder.$filename ); break;
		case 2: imagejpeg($dst_r, $targetFolder. '/' .$filename ,$jpeg_quality);  break;
		case 3: imagepng($dst_r, $targetFolder.$filename ); break;
		default: return '';  break;
	};

	//imagejpeg($dst_r, $targetFolder.$filename ,$jpeg_quality);
	imagedestroy($dst_r);
	$filecallback = array('src'=>$targetFolder . '/' . $filename);
	echo json_encode($filecallback);
}
?>