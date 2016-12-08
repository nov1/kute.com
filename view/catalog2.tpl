<?
if ($_GET['sort']) {
	$sort = trim(htmlspecialchars(strip_tags($_GET['sort'])));
}
?>
  <form action="/process/goods/sort_goods_view.php" method="GET">
     <small>Сортировка:</small>
   <select name="sort">
		<option value="expensive">от дорогих к дешевым</option>
		<option value="cheap">от дешевых к дорогим</option>
		<option value="nameasc">А-Я</option>
		<option value="namedesc">Я-А</option>
   </select>
   <input type="submit" value="Отправить">
  </form>

<div class="section-block">
	<h2>Каталог товаров</h2>
        <div class="grid-container grid-container--quarters">

<?
	include $_SERVER['DOCUMENT_ROOT'].'/config/db.php';
	if (isset($_GET['page'])) $page = ($_GET['page']-1); else $page = 0; 		//num получаем номер страницы и подставлять в выборку



	$per_page = 12; //количество выводимых на странице записей.
	$start = abs($page * $per_page);

	$start = abs($page * $per_page);
	$q = "SELECT `id`,`name`,`price`
	FROM `goods`
	WHERE `public` = 1
	"; //тут могла бы быть сортировка 

	if ($sort) {
		if($sort == 'cheap') {
			$q .= ' ORDER BY `price` ASC';
		}
		else if ($sort == 'expensive') {
			$q .= ' ORDER BY `price` DESC';
		}
		else if ($sort == 'nameasc') {
			$q .= ' ORDER BY `name` ASC';
		}
		else if ($sort == 'namedesc') {
			$q .= ' ORDER BY `name` DESC';
		}
	}
	$q .= " LIMIT $start, $per_page";
	

	$res = mysqli_query($dbc, $q);

	if (!$res) {
		echo 'SQL ERROR #'.mysqli_errno($dbc).' - '.mysqli_error($dbc).'<br>';
		var_dump($q);
		die();
	}

		
	while($row = mysqli_fetch_array($res, MYSQLI_ASSOC)) {
?>
			<div class="theme grid-item grid-2">
                <a class="theme_image" href="?route=product2&id=<?=$row['id']?>">
                  	<img src="<?=$goods[$id]["imgGood"][1]?>" alt = "<?=$good["imgGood"][2]?>" title ="<?=$good["imgGood"][3]?>"/>
				</a>

				
			<div class="theme-info">
                <a class="theme_image" href="?route=product2&id=<?=$row['id']?>">
                <small><?=$row['name']?></small>
				</a>
				<small><?if ($row['price']) echo $row['price'].' грн';?></small>
	<?if ($currentBasketArr[$row['id']]) {?>
		<small>Товар уже в корзине</small>
	<?}else{?>
	<form action="/process/basket/basketAdd.php">
		<button name="basketGoodId" value="<?=$row['id']?>">КУПИТЬ</button>
	</form>
			</div>
			</div>


<?}}?>

        </div>
        </div>

<div class="nailed">
<?
	//ссылки на страницы:
	$q = "SELECT count(*) FROM `goods` WHERE `public` = 1;";
	$res = mysqli_query($dbc, $q);

	$row = mysqli_fetch_row($res);
	$total_rows = $row[0];

	$num_pages = ceil($total_rows/$per_page);

	// 	echo '<a href="'.$_SERVER['PHP_SELF'].'/route=goodsToEdit&num='.$i*$per_page.'">'.$i."</a>\n";

      
	for($i=1;$i<=$num_pages;$i++) {
		if ($i-1 == $page) {
			echo $i;
		}else{
			echo '<a href="'.$_SERVER['PHP_SELF'].'?route=catalog2'.(($sort)?"&sort=$sort":"").'&page='.$i.'">'.$i.'</a>';


		}
}
	mysqli_close($dbc);
	?>
	</div>
