<?
function uploadImage($input_name){
	$fileNameUniqulization = md5(microtime().uniqid().rand(0,9999));
	$upload_dir = '../db/img/';

	if ((int)$_FILES["$input_name"]["error"] == 0) {

		$mimeType = $_FILES["$input_name"]["type"];
		$extFile = explode(".",$_FILES["$input_name"]["name"]);
		$extFile = $extFile[count($extFile)-1];

		if ($mimeType === 'image/png' && $extFile === 'png' || $mimeType === 'image/jpeg' && $extFile === 'jpg'||$mimeType ==='image/jpeg' && $extFile === 'jpeg'|| $mimeType === 'image/gif' && $extFile === 'gif') {
			move_uploaded_file($_FILES["$input_name"]["tmp_name"], "$upload_dir".$fileNameUniqulization.".$extFile");
			return $upload_dir.$fileNameUniqulization.".$extFile";
		}else{
			return 'not supported MIME Type';
		}
	}else{
		return 'upload failed';
	}
}


function uploadMultipleImages($input_name, $name_id){
	$fileNameUniqulization = md5(microtime().uniqid().rand(0,9999));
	$upload_dir = '../db/img/';

	for ($i=0; $i < count($_FILES["$input_name"]["name"]); $i++) { 
		if ((int)$_FILES["$input_name"]["error"][$i] == 0) {

			$mimeType = $_FILES["$input_name"]["type"][$i];
			$extFile = explode(".",$_FILES["$input_name"]["name"][$i]);
			$extFile = $extFile[count($extFile)-1];

			if ($mimeType === 'image/png' && $extFile === 'png' || $mimeType === 'image/jpeg' && $extFile === 'jpg'||$mimeType === 'image/jpeg' && $extFile === 'jpeg'|| $mimeType === 'image/gif' && $extFile === 'gif') {
				move_uploaded_file($_FILES["$input_name"]["tmp_name"][$i], "$upload_dir".$fileNameUniqulization.".$extFile");
				return $upload_dir.$fileNameUniqulization.".$extFile";
			}else{
				return 'not supported MIME Type';
			}
		}else{
			return 'upload failed';
		}
	}
}

function checkMinMaxLenght($data,$min,$max){
	$lenght = strlen($data);
	if ($lenght<$min||$lenght>$max) {
		return false;
	}else{
		return true;
	}	
}

function checkLogin($data){
	if (empty($data)) {
		return 'Login is required';
	}elseif(!checkMinMaxLenght($data,6,32)){
			return 'Impossible login lenght';
		}else{
			if (preg_match('/^\w{6,32}$/i', $data)){
				return $data;
			}else{
					return 'Impossible login';
			}
		}
}

function checkPassword($data){
	if (empty($data)) {
		return 'Password is required';
	}elseif(!checkMinMaxLenght($data,8,128)){
			return 'Impossible password lenght';
		}else{
			if (preg_match('/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[~\!@#$%^&*?&\-\+\(\)])[A-Za-z\d~\!@#$%^&*?&\-\+\(\)]{8,128}$/i', $data)){
				return $data;
			}else{
					return 'Too weak password';
			}
		}
}


function checkEmail($data){
	if (empty($data)) {
		return 'Email is required';
	}elseif(!checkMinMaxLenght($data,8,254)){
			return 'Impossible email lenght';
		}else{
			if (preg_match('/^[a-z0-9.]+@(\w+\.)+[a-zA-Z]{2,}$/i', $data)){
				return $data;
			}else{
					return 'Invalid email';
			}
		}
}


function checkTel($data){
	if (empty($data)) {
		return 'Phone is required';
	}elseif(!checkMinMaxLenght($data,8,254)){
			return 'Impossible phone lenght';
		}else{
			if (preg_match('/^(\+\d{2})?(\d{10})$/i', $data)){
				return $data;
			}else{
					return 'Invalid phone';
			}
		}
}


function addToLog($errors) {
	foreach ($errors as $value) {
	$message = date("Y-m-d H:i:s").' '.$value . PHP_EOL;
	file_put_contents('../../logs/goods_logs.txt', $message, FILE_APPEND);
}
}
?>