<form class="formBigCheck" enctype="multipart/form-data" action="addcolors.php"  method="GET">
	<table class="puttable">
		<tr>
			<td>Отредактировать товар по ID</td>
			<td><input type="text" name="inputColor"></td>
			<td><button type="submit">++</button></td>
			<!--removed param  for POST name="do_editGood" -->
		</tr>
	</table>
</form>


<?
if (isset($_GET['inputColor'])) $inputColor = ($_GET['inputColor']); else die();

	include $_SERVER['DOCUMENT_ROOT'].'/config/db.php';

	$q = " 
	INSERT INTO `colors`(`color_name`)
	VALUES ('$inputColor')
	";

	$res = mysqli_query($dbc, $q);

	if (!$res) {
		echo 'SQL ERROR #'.mysqli_errno($dbc).' - '.mysqli_error($dbc).'<br>';
		var_dump($q);
		die();
	}else{
		echo $inputColor.' цвет - добавлен!';
	}



mysqli_close($dbc);




?>