<?
if ($good) {
	# code...
}else{
	include_once "view/404.tpl";
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
		<div class="nameGood">
			<?if($good["nameGood"])
			{?>
				<h3><?=$good["nameGood"]["name"]?></h3>
			<?}?>
		</div>
		<div class="endingGood">
			<?if($good["endingGood"])
			{?>
				<p><strike><?=$good["oldPrice"]." грн"?></strike></p>
				<p><?=$good["price"]." грн"?></p>
			<?}else{?>
				<p><?=$good["price"]." грн"?></p>
			<?}?>
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
			<?if($good["description"])
			{?>
				<p><?=$good["description"]?></p>
			<?}?>
		</div>
		<hr>
	</div>
