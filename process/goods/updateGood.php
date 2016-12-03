<?
//берем значения из полей + Безопасность
if ($_POST['nameGood']&&is_numeric($_POST['idGood'])) {
	$nameGood = trim(htmlspecialchars(strip_tags($_POST['nameGood'])));
	$price = trim(htmlspecialchars(strip_tags($_POST['price'])));
	$description = trim(htmlspecialchars(strip_tags($_POST['description'])));
	$public = trim(htmlspecialchars(strip_tags($_POST['public'])));
	if ($public!=1) $public	= 0;
	$idGood = trim(htmlspecialchars(strip_tags($_POST['idGood'])));

	include $_SERVER['DOCUMENT_ROOT'].'/config/db.php';

	//заптисываем в базу с тем же ID
	$q = "
	UPDATE `goods` SET
	`name` = '$nameGood',
	`price` = $price,
	`public` = '$public',
	`description` = '$description'
	WHERE `id` = $idGood
	";

	$res = mysqli_query($dbc, $q);

	if (!$res) {
		echo 'SQL ERROR #'.mysqli_errno($dbc).' - '.mysqli_error($dbc).'<br>';
		var_dump($q);
		die();
	}else{
		// echo 'Товар ID #'.$idGood.' успешно обновлён';
		header("Location: /index.php?route=editGood&idGood=$idGood");
	}

}else{
	echo "Не указано имя товара или не получен ID товара";
}




//кнопка удалить товар
//(temp) грохнуть строку по ID
//кнопка [опубликовать | убрать с витрины]
?>