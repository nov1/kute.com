<?
	const DB_HOST = 'localhost';
	const DB_USER = 'first_store';
	const DB_PASSWORD = 'zenzen88';
	const DB_NAME = 'first_store';
	//соеднение с базой.	
	$dbc = mysqli_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME);

	if (!$dbc) {
		//код вывода ошибки!
		exit('WRONG CONNECTION');
	}




?>