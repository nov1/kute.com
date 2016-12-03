<?
session_start();
include '../../lib/functions.php';

$user_email = trim(htmlspecialchars(strip_tags(checkEmail($_POST['email']))));
$user_password = htmlspecialchars(strip_tags(checkPassword($_POST['passwd'])));

if ($user_email==$_POST['email']&&$user_password==$_POST['passwd']) {
	$users = unserialize(file_get_contents('../../db/users.base'));
		for ($i=0; $i < count($users); $i++) {
			if (($user_email==$users[$i][user_email])&&(password_verify("$user_password", $users[$i][user_password]))) {
					$_SESSION['email'] = $user_email;
					$_SESSION['auth'] = true;
					$_SESSION['id'] = $i;
		}else{
			echo "нет такого пользователя или неправильный пароль";
		}
	}
}
header("location: /index.php");

?>