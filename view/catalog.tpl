
<div class="section-block">
	<h2>Каталог товаров</h2>
        <div class="grid-container grid-container--quarters">

<?foreach ($goods as $id => $value) { ?>
			<div class="theme grid-item grid-2">
                <a class="theme_image" href="?route=product&id=<?=$id?>">
                  	<img src="<?=$goods[$id]["imgGood"][1]?>" alt = "<?=$good["imgGood"][2]?>" title ="<?=$good["imgGood"][3]?>"/>
				</a>

				
			<div class="theme-info">
                <a class="theme_image" href="?route=product&id=<?=$id?>">
	                <small><?=$goods[$id]["nameGood"]["name"]?></small>
				</a>
	<?if ($currentBasketArr[$id]) {?>
		<small>Товар уже в корзине</small>
	<?}else{?>
	<form action="/process/basket/basketAdd.php">
		<button name="basketGoodId" value="<?=$id?>">КУПИТЬ</button>
	</form>
			</div>
			</div>


<?}}?>

        </div>
      </div>