<?
	echo '<pre>';
	print_r($_POST);
	echo '</pre>';


$errors = [];
include $_SERVER['DOCUMENT_ROOT'].'/lib/functions.php';
//1) если имя не введено - не пускаем дальше.
//

if ($_POST['nameGood']) {
//2) принимаем данные с формы с проверкой
$nameGood = htmlspecialchars(strip_tags($_POST['nameGood']));
$priceGood = htmlspecialchars(strip_tags($_POST['price']));
$descriptionGood = htmlspecialchars(strip_tags($_POST['description']));
$publicGood = htmlspecialchars(strip_tags($_POST['public']));
foreach ($_POST['colors'] as $key => $value){ 
    $colorsGood[$key] = htmlspecialchars(strip_tags($value)); 
}
	echo '<pre>';
	var_dump($colorsGood);
	echo '</pre>';

//Б - безопасность!
// if (
// 	($nameGood!=$_POST['nameGood'])||
// 	($priceGood!=$_POST['price'])||
// 	($descriptionGood!=$_POST['description'])||
// 	($publicGood!=$_POST['public'])||
// 	($colorsGood!=$_POST['colors'])
// 	) {
// 	$errors[] = 'HACKING ATTEMPT Попытка взлома! '.$_SERVER['REMOTE_HOST'].' '.$_SERVER['REMOTE_ADDR'];
// 	addToLog($errors);
// 	echo 'Попытка взлома!<br>'.$_SERVER['REMOTE_HOST'].' '.$_SERVER['REMOTE_ADDR'].' — Оставайтесь на месте, за вами уже выехали.';
// 	die();
// }

//убираем ошибочные пробелы
$nameGood = trim($nameGood);
$priceGood = trim($priceGood);
$descriptionGood = trim($descriptionGood);

//правки
//в базе разделителем служит . точка
$priceGood = str_replace(',', '.', $priceGood);
//если Public не указан, запишем 0
$publicGood ? $publicGood = (int)$publicGood : $publicGood = 0;

//3) ложим записи в базу
include $_SERVER['DOCUMENT_ROOT'].'/config/db.php';

	$query = "
	INSERT INTO `goods`(`name`, `price`, `description`,`public`)
	VALUES ('$nameGood','$priceGood','$descriptionGood','$publicGood')
	";

	$res = mysqli_query($dbc, $query);

	if (!$res) {
		$errors[] = 'SQL ERROR #'.mysqli_errno($dbc).' - '.mysqli_error($dbc).'<br>';
		addToLog($errors);
		echo 'SQL ERROR #'.mysqli_errno($dbc).' - '.mysqli_error($dbc).'<br>';
		var_dump($query);
		die();
	}else{
		$lastId = mysqli_insert_id($dbc);
		$errors[] = 'ADDED GOOD ID #'.$lastId.' - товар добавлен в базу!';
		addToLog($errors);
		// echo 'всё хорошо! товар с ID#'.$lastId.' добавлен в базу';
	}


	for ($i=0; $i < count($colorsGood); $i++) { 
		$queryAddColors = "
		INSERT INTO `goods_colors`(`g_id`, `c_id`)
		VALUES ('$lastId','".$colorsGood[$i]."')
		";

		$resAddColors = mysqli_query($dbc, $queryAddColors);

		if (!$resAddColors) {
			$errors[] = 'SQL ERROR #'.mysqli_errno($dbc).' - '.mysqli_error($dbc).'<br>';
			addToLog($errors);
			echo 'SQL ERROR #'.mysqli_errno($dbc).' - '.mysqli_error($dbc).'<br>';
			var_dump($query);
			die();
		}else{
			$errors[] = 'ADDED GOOD ID #'.$lastId.' - товар добавлен в базу!';
			addToLog($errors);
			// echo 'всё хорошо! товар с ID#'.$lastId.' и цветом '.$colorsGood[$i].' добавлен в базу<br>';
		}

	}

	mysqli_close($dbc);

	//редиректим обратно
	// header("Location: /index.php?route=addNewGood");
}else{
	exit('введите имя товара');
}


?>