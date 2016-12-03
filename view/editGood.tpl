<?
//принять ID + проверка на Б
$idGood = trim(htmlspecialchars(strip_tags($_GET[idGood])));

//получаем ID товара
if (!empty($idGood)) {
	echo 'Редактирование товара ID #'.$idGood.'<br>';
	include $_SERVER['DOCUMENT_ROOT'].'/config/db.php';

	$q = "SELECT *
	FROM `goods`
	WHERE id = ".$idGood.";
	";
	$res = mysqli_query($dbc, $q);
	
	if (!$res) {
		echo 'SQL ERROR #'.mysqli_errno($dbc).' - '.mysqli_error($dbc).'<br>';
		var_dump($q);
		die();
	}
	//все поля товара ложим в массив
	$row = mysqli_fetch_array($res, MYSQLI_ASSOC);

	//проверка на существование продукта по переданному ID
	if ($row===NULL) {
		echo "нет товара c таким ID";
	}else{
	//форма редактирования товара
	//выводим все поля ID товара с заполненными значениеми из селекта
?>

<form class="formBigCheck" enctype="multipart/form-data" action="/process/goods/updateGood.php"  method="POST">
	<table class="puttable">
		<tr>
			<td>Название продукта</td>
			<td><input type="text" name="nameGood" value="<?=$row['name']?>"></td>
		</tr>

		<tr>
			<td>Цена</td>
			<td><input type="text" name="price" pattern="\d+(\.\d{2})?" value="<?=$row['price']?>"></td>
		</tr>

		<tr>
			<td>Описание</td>
			<td><input type="text" name="description" value="<?=$row['description']?>"></td>
		</tr>

		<tr>
			<td>Публиковать?</td>
			<td class="puttable-left" style="text-align: left;"><label><input type="checkbox" name="public" value="1"<?if ($row['public']==1) echo ' checked';?>
			></label></td>
		</tr>
	</table>
	 <input type="hidden" name="idGood" value="<?=$idGood?>" /> 
	<button type="submit" name="do_saveGood">Сохранить</button>
</form>

<div style="float: left;"><a href="<?=$_SERVER['PHP_SELF'].'?route=editGood&idGood='.($row['id']-1)?>"><?if ($row['id']-1) echo 'Ред. пред. ID #'.($row['id']-1);?></a></div>
<div style="float: right;"><a href="<?=$_SERVER['PHP_SELF'].'?route=editGood&idGood='.($row['id']+1)?>"><?if ($row['id']+1) echo 'Ред. пред. ID #'.($row['id']+1);?></a></div>
<?
	}
}else{
	echo "введите ID товара.";
}

?>