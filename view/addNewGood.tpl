<h2>Admin Panel</h2>

<h3>Добавить новый товар</h3>

<form class="formBigCheck" enctype="multipart/form-data" action="/process/goods/AddNewGood.php"  method="POST">
	<table class="puttable">
		<tr>
			<td>Название продукта</td>
			<td><input type="text" name="nameGood"></td>
		</tr>

		<tr>
			<td>Цена</td>
			<td><input type="text" name="price" pattern="\d+(\.\d{2})?"></td>
		</tr>

		<tr>
			<td>Описание</td>
			<td><input type="text" name="description"></td>
		</tr>

		<tr>
			<td>Публиковать?</td>
			<td class="puttable-left" style="text-align: left;"><label><input type="checkbox" name="public" value="1"></label></td>
		</tr>
		<tr>
			<td>Выберите цвет(а):<td>
			<?
			include $_SERVER['DOCUMENT_ROOT'].'/config/db.php';

			$q = "SELECT *
				FROM `colors`
				";
			$res = mysqli_query($dbc, $q);
	
			if (!$res) {
				echo 'SQL ERROR #'.mysqli_errno($dbc).' - '.mysqli_error($dbc).'<br>';
				var_dump($q);
				die();
			}
			$AllColors = [];
			while ($rowAllColors = mysqli_fetch_array($res, MYSQLI_NUM)) {
				$AllColors[] = $rowAllColors;
			}
				for ($i=0; $i < count($AllColors); $i++) { 
					echo '<td><input type="checkbox" name="colors[]" value="'.$AllColors[$i][0].'">'.$AllColors[$i][1].'</td>';
				}
			?>
		</tr>
	</table>
	<button type="submit" name="do_addNewGood">Добавить товар в базу</button>
</form>