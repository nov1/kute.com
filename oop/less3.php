	<?

	class User
	{
		public $name;
		public $email;
		public $passwd;
		public $age;

		public function showInfo(){
			echo '<b>name:</b> '.$this->name.'<br>';
			echo '<b>email:</b> '.$this->email.'<br>';
			echo '<b>passwd:</b> '.$this->passwd.'<br>';
			echo '<b>age:</b> '.$this->age.'<br><br>';
		}
	}

	$john = new User();
	$smith = new User();
	$ivan = new User();

	$john->name = 'john';
	$john->email = 'john@gmail.com';
	$john->passwd = '12345';
	$john->age = 18;

	$smith->name = 'smith';
	$smith->email = 'smith@gmail.com';
	$smith->passwd = 'qwerty';
	$smith->age = 20;

	$ivan->name = 'ivan';
	$ivan->email = 'ivan@gmail.com';
	$ivan->passwd = '6s61h&s9';
	$ivan->age = 22;


	$john->showInfo();
	$smith->showInfo();
	$ivan->showInfo();

	?>