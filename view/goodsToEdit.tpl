<form class="formBigCheck" enctype="multipart/form-data" action="/process/goods/editGood.php"  method="GET">
	<table class="puttable">
		<tr>
			<td>Отредактировать товар по ID</td>
			<td><input type="text" name="idGood"></td>
			<td><button type="submit">Редактировать товар</button></td>
			<!--removed param  for POST name="do_editGood" -->
		</tr>
	</table>
</form>

<hr>
	<?
	include $_SERVER['DOCUMENT_ROOT'].'/config/db.php';

	if (isset($_GET['page'])) $page = ($_GET['page']-1); else $page = 0; 		//num получаем номер страницы и подставлять в выборку
	$per_page = 20; //количество выводимых на странице записей.
	$start = abs($page * $per_page);

	$q = "SELECT `id`, `name`,`price`,`public`
	FROM `goods`
	ORDER BY `ID`
	LIMIT $start, $per_page;";

	$res = mysqli_query($dbc, $q);

	if (!$res) {
		echo 'SQL ERROR #'.mysqli_errno($dbc).' - '.mysqli_error($dbc).'<br>';
		var_dump($q);
		die();
	}
?>
	<table class="table">
		<tr style="font-weight: 600;">
			<td>№</td>
			<td>id</td>
			<td>name</td>
			<td>price</td>
			<td>public</td>
			<td></td>
			<td></td>
		</tr>
			<?
	while($row = mysqli_fetch_array($res, MYSQLI_ASSOC)) {
		++$start;
		echo (($start%2==0)?'<tr class="even">':'<tr>').'
		<td>'.$start.'.</td>
		<td style="text-align: center;">'.$row['id'].'</td>
		<td>'.$row['name'].'</td>
		<td style="text-align: center;">'.substr($row['price'], 0, 15).'</td>
		<td style="text-align: center;">'.$row['public'].'</td>
		<td><a href="'.$_SERVER['PHP_SELF'].'?route=editGood&idGood='.$row['id'].'">Edit</a></td>
		<td><a href="'.$_SERVER['PHP_SELF'].'?route=deleteGood&idGood='.$row['id'].'">Remove</a></td>
		</tr>';
	}
?>
	</table>
<?
	// дальше выводим ссылки на страницы:
	$q = "SELECT count(*) FROM `goods`";
	$res = mysqli_query($dbc, $q);

	$row = mysqli_fetch_row($res);
	$total_rows = $row[0];

	$num_pages = ceil($total_rows/$per_page);

	// 	echo '<a href="'.$_SERVER['PHP_SELF'].'/route=goodsToEdit&num='.$i*$per_page.'">'.$i."</a>\n";

	for($i=1;$i<=$num_pages;$i++) {
		if ($i-1 == $page) {
			echo $i." ";
		}else{
			echo '<a href="'.$_SERVER['PHP_SELF'].'?route=goodsToEdit&page='.$i.'">'.$i."</a> ";
		}
}

	//page принимать в GET и подставлять в выборку

	mysqli_close($dbc);
	?>
