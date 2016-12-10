<?
class User //класс
{
		public $name = "John"; //св-во и значение -- задают если нужны по-умолчанию прям в классе.
		public $email; //св-во
}

		$john = new User(); //объект

// echo "<pre>";
// 		var_dump($john);
// echo "</pre>";

		// echo $john->name; //объект и его св-во
		// echo $john->email; //объект и его св-во
	
	// $vasya = "name";
	// echo $john->$vasya;

		//если ошибка Fatal Error Cannot acces empty property in PATH...
		//значит где-то впихнул не реальное св-во, а переменную.

	// echo $john->name;
	// echo "<br>";
	// $john->name = "vasya";
	// echo $john->name;
	// echo "<br>";

	$smith = new User(); //объект
	echo $smith->name."<br>";
	echo $smith->email = "tipa-email";
?>