	<?

	class User
	{	
		public $foo;
		public $name;
		public $email;
		public $passwd;
		public $age;

		public function __construct($name,$email,$passwd,$age){ //конструктор вызывается по умолчанию.
			
			// echo "creating object".$foo."<br>";
			$this->name = $name;
			$this->email = $email;
			$this->passwd = $passwd;
			$this->age = $age;
		}


		public function showInfo(){ //метод
			// echo "creating object ".$foo."<br>";
			echo '<b>name:</b> '.$this->name.'<br>';
			echo '<b>email:</b> '.$this->email.'<br>';
			echo '<b>passwd:</b> '.$this->passwd.'<br>';
			echo '<b>age:</b> '.$this->age.'<br><br>';
		}
	}

	$john = new User("john","john@gmail.com","12345","18"); //объект
	$smith = new User("smith","smith@gmail.com","qwerty","20");
	$ivan = new User("ivan","ivan@gmail.com","6s61h&s9","22");

	$john->showInfo();
	$smith->showInfo();
	$ivan->showInfo();

	// $john = new __construct1("john","john@gmail.com","12345","18");

	?>