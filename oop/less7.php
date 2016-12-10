	<?

	class User
	{	
		public $foo;
		public $name;
		public $email;
		public $passwd;
		public $age;

		public function __construct($name,$email,$passwd,$age){
			$this->name = $name;
			$this->email = $email;
			$this->passwd = $passwd;
			$this->age = $age;
		}

		public function showInfo(){
			echo '<b>name:</b> '.$this->name.'<br>';
			echo '<b>email:</b> '.$this->email.'<br>';
			echo '<b>passwd:</b> '.$this->passwd.'<br>';
			echo '<b>age:</b> '.$this->age.'<br><br>';
		}

		public function __clone() {
			
		}

		public function __destruct() {
			$this->name;
		}
	}

	$john = new User("john","john@gmail.com","12345","18");
	$john->showInfo();


	$foo = clone $john;

	  echo '<pre>';
	  var_dump($foo);
	  echo '</pre>';

	?>