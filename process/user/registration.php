<?
session_start();
include '../../lib/functions.php';

if ($_SESSION['auth']==true) {
	echo "вы уже зарегистрированы";
}else{
	//получаем данные от клиента
	$user_email = trim(htmlspecialchars(strip_tags(checkEmail($_POST['email']))));
	$user_password = htmlspecialchars(strip_tags(checkPassword($_POST['passwd'])));

	//АЛЬТЕРНАТИВА: if fuctions back TRUE (valid result - not error);	
	//делаем проверку на валидные данные перед записью в базу
	if ($user_email==$_POST['email']&&$user_password==$_POST['passwd']) {
		//уже после валидации данных дабы не тратить ресурсы - подключаем базу
		$users = unserialize(file_get_contents('../../db/users.base'));

	if(count($users)==0){
		$mailFreeForReg = true; //на случай если база пустая
	}else{
		// тут уже сравниваем мыло есть ли мыло в базе (циклом) или простой поиск
		for ($i=0; $i < count($users); $i++) {
			if ($user_email!=$users[$i]['user_email']) {
				$mailFreeForReg = true;
				var_dump($mailFreeForReg);
			}else{
				$mailFreeForReg = false;
				var_dump($mailFreeForReg);
			}
		}
}
			if ($mailFreeForReg==true) {
				// запись в базу
				$users[] = [
				'user_email' => $user_email,
				'user_password' => password_hash("$user_password",PASSWORD_DEFAULT)
				];
				file_put_contents('../../db/users.base', serialize($users));

				// установка сессии свежезарегистрированному юзеру
				$_SESSION['email']=$user_email;
				$_SESSION['auth']=true;
				$_SESSION['id']=count($users);
				header("location: /index.php");
			}else{
				echo "<h3>Account already exists with this email address.</h3>";
			}

	}else{
			//иначе выведем причину непринятия данных
			// echo $user_login.'<br>';
			echo $user_email.'<br>';
			echo $user_password.'<br>';

			// echo $user_tel.'<br>';
	}

}



?>