<?
	//когда будет готов вывод всех параметров
	//заменить $goods['name'] на $rowGood['name']

	include $_SERVER['DOCUMENT_ROOT'].'/config/db.php';

	// 1) получаем инфу по продукту из goods
	$q = "SELECT *
	FROM `goods`
	WHERE `id` = $id
	AND `public` = 1
	";

	$resGood = mysqli_query($dbc, $q);

	if (!$resGood) {
		echo 'SQL ERROR #'.mysqli_errno($dbc).' - '.mysqli_error($dbc).'<br>';
		var_dump($q);
		die();
	}

	$rowGood = mysqli_fetch_assoc($resGood);

	if (!$rowGood) {
		include_once "view/404.tpl";
	}else{
		// 2) по ID продукта получаем ID всех его цветов.
		$queryGetGoodColorsId = "
		SELECT `c_id`
		FROM `goods_colors`
		WHERE `g_id`= $id
		";
		$resColors = mysqli_query($dbc, $queryGetGoodColorsId);

		$goodColorsId = [];
		while ($rowColorsId = mysqli_fetch_array($resColors, MYSQLI_NUM)) {
			$goodColorsId[] = $rowColorsId;
		}
		
		$amount = count($goodColorsId);

		// 3) имея ID цветов, получаем их названия по этим ID
		if ($amount!=0) {

			// var_dump(count($goodColorsId));
			// echo "<br>";
			// var_dump($goodColorsId);
			// echo "<br><br><br>";

			$rowColorNames = [];
			for ($i=0; $i < $amount; $i++) { 
				$queryGetColorNames = "
				SELECT `color_name`, `color_class`
				FROM `colors`
				WHERE `id`= '".$goodColorsId[$i][0]."';
			";
			$resColorNames = mysqli_query($dbc, $queryGetColorNames);
				if (!$resColorNames) {
					echo 'SQL ERROR #'.mysqli_errno($dbc).' - '.mysqli_error($dbc).'<br>';
					var_dump($q);
					die();
				}
			$rowColorNames[] = mysqli_fetch_row($resColorNames);
			}

			//вывод во VIEW/HTML
			if ($rowColorNames) {
				for ($i=0; $i < count($rowColorNames); $i++) { 
					echo "<p><b>".$rowColorNames[$i][0]."</b></p>";
					echo "<p><b>".$rowColorNames[$i][1]."</b></p>";
				}
			}

			unset($amount);
		}


?>

<?if ($currentBasketArr[$id]) {?>
		Товар уже в корзине
	<?}else{?>
	<form action="/process/basket/basketAdd.php">
		<button name="basketGoodId" value="<?=$id?>">КУПИТЬ</button>
	</form>
	<?}?>
	<div id="<?=$good["idGood"]?>">
		<div class="demo">
			<?if ($good["mediaLinkVideo"]) 
			{?>
				<a href="<?=$good["mediaLinkVideo"]?>">Видеообзор</a>
			
			<?}?>
			<?if($good["mediaLinkDemo"])
			{?>
				<a href="<?=$good["mediaLinkDemo"]?>">Демонстрация товара</a>
			<?}?>
		</div>
		
			<?if ($good["sticker"])
			{?>
			<div class="sticker">
				<img class="<?=$good["sticker"][0]?>" src ="/view/static/img/_.gif"  alt = "<?=$good["sticker"][1]?>"/>
			</div>
			<?}?>
	
		<div class="imgGood">
			<?if($good["imgGood"])
			{?>
				<a href="<?=$good["imgGood"][0]?>"> <img src = "<?=$good["imgGood"][1]?>" alt = "<?=$good["imgGood"][2]?>" title ="<?=$good["imgGood"][3]?>"/> </a>
			<?}?>
		</div>
		<div class="colorsGood">
			<br>
			<?if($good["colorsGood"])
			{
				for($i=0;$i<count($good["colorsGood"]);$i++)
				{?>
					<a href="<?=$good["colorsGood"][$i][1]?>"><img border ="1" style="background-color:<?=$good["colorsGood"][$i][0]?>;" src="/view/static/img/_.gif" width="24" height="24" alt="_"></a>
				<?}?>
			<?}?>
		</div>



		<div class="colorsGood">
			<br>
			<?
			if ($rowColorNames) {
				for ($i=0; $i < count($rowColorNames); $i++) {?>
					<a href="<?=$rowColorNames[$i][0]?>"><?=$rowColorNames[$i][0]?><img border ="1" style="background-color:<?=$rowColorNames[$i][1]?>;" src="/view/static/img/_.gif" width="24" height="24" alt="_"></a>
				<?}
			}?>

		</div>



		<div class="nameGood">
			<?if($rowGood['name'])
			{?>
				<h3><?=$rowGood['name']?></h3>
			<?}?>
		</div>
		<div class="endingGood">
			<?if($good["endingGood"]){?>
				<p><strike><?=$good["oldPrice"]." грн"?></strike></p>
			<?}?>
		</div>
		<div class="price">
			<?if ($rowGood['price']) echo $rowGood['price'].' грн'?>
		</div>
		<div class="raiting">
			<?switch ($good["raiting"]) {
					case '5':
					?><img src = "/img/5stars.png"/><?
					break;
					case '4':
					?><img src = "/img/4stars.png"/><?
					break;
					case '3':
					?><img src = "/img/3stars.png"/><?
					break;
					case '2':
					?><img src = "/img/2stars.png"/><?
					break;
					case '1':
					?><img src = "/img/1stars.png"/><?
					break;
			}
			?>
		</div>
		<div class="reviews">
			<?if($good["reviews"])
			{?>
				<a href="<?=$good["reviews"][0]?>"><?=$good["reviews"][1]?> отзыва</a>
			<?}?>
		</div>
		<div class="features">
			<?if($good["features"])
			{
				for($i=0; $i<count($good["features"]);$i++)
				{?>
					<img src ="<?=$good["features"][$i]?>"/>
				<?}?>
			<?}?>
		</div>
		<div class="description">
			<?if($rowGood['description'])
			{?>
				<p><?=$rowGood['description']?></p>
			<?}?>
			<?}?>
		</div>
		<hr>
	</div>
