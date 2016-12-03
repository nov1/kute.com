<?
	session_start();


		$data = $_POST;
		if (isset($data['do_signup'])) {

			//здесь будет регистрация

			$errors = [];
			if (trim(htmlspecialchars(strip_tags($data['email']))) == '') {
				$errors[] = 'Введите Email!';
			}

			if ($data['password'] == '') {
				$errors[] = 'Введите пароль!';
			}

			if ($data['password_2'] != $data['password']) {
				$errors[] = 'Повторный пароль введен не верно!';
			}

			if (empty($errors)) {
				$users = unserialize(file_get_contents('../../db/users.base'));
				for ($i=0; $i < count($users); $i++) {
					if ($data['email']==$users[$i]['user_email']) {
						$errors[] = 'Пользователь с таким Email уже существует!';
					}
				}
			}

			if (empty($errors)) {
				//всё хорошо регистрируем
				$users[] = [
				'user_email' => $data['email'],
				'user_password' => password_hash("$user_password",PASSWORD_DEFAULT)
				];
				file_put_contents('../../db/users.base', serialize($users));

				// установка сессии свежезарегистрированному юзеру
				$_SESSION['email']=$data['email'];
				$_SESSION['auth']=true;
				$_SESSION['id']=count($users);


				echo '<div id="errors" style="color: green;">Вы успешно зарегистрированы</div><hr>';
			}else{
				echo '<div id="errors" style="color: red;">'.array_shift($errors).'</div><hr>';
			}
		}

?>

<?
	if ($_SESSION['auth']==true) {
	echo "Вы уже зарегистрированы";
	}else{
?>

<form action="/process/user/registration2.php" method="POST">


	<p>
		<p><strong>Ваш Email</strong>:</p>
		<input type="email" name="email" value="<?=@$data['email']?>">
	</p>

	<p>
		<p><strong>Ваш пароль</strong>:</p>
		<input type="password" name="password" value="<?=@$data['password']?>">
	</p>

	<p>
		<p><strong>Ваш пароль еще раз</strong>:</p>
		<input type="password" name="password_2" value="<?=@$data['password_2']?>">
	</p>

	<p>
		<button type="submit" name="do_signup">Зарегистрироваться</button>
	</p>

</form>
<?}?>