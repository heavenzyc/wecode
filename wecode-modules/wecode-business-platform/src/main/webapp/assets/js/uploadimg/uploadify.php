<?php
/*
Uploadify
Copyright (c) 2012 Reactive Apps, Ronnie Garcia
Released under the MIT License <http://www.opensource.org/licenses/mit-license.php> 
*/

// Define a destination
$targetFolder = '/uploadfiles';
$filename = date('YmdHis') . '.jpg';

//$verifyToken = md5('unique_salt' . $_POST['timestamp']);

if (!empty($_FILES) /*&& $_POST['token'] == $verifyToken*/) {
	$tempFile = $_FILES['Filedata']['tmp_name'];
	$targetPath = $_SERVER['DOCUMENT_ROOT'] . $targetFolder;
	$targetFile = rtrim($targetPath,'/') . '/' . $filename;
	
	// Validate the file type
	$fileTypes = array('jpg','jpeg','gif','png'); // File extensions
	$fileParts = pathinfo($_FILES['Filedata']['name']);
	
	if (in_array($fileParts['extension'],$fileTypes)) {
		move_uploaded_file($tempFile,$targetFile);
		$result = array(
			'status' => 'ok',
		    'width' => '750',
		    'height' => '750',
			'url' => $targetFolder . '/' . $filename
		);
		echo json_encode($result);


	} else {
		echo '不支持的上传格式';
	}
}
?>