<h2>Корзина:</h2>

	<form action="/process/basket/basketClear.php">
		<button class="button">Очистить корзину</button>
	</form>
	<hr class="bold">
<?


//1. получить basket из cookie + 2. распаковать basket в массив
$currentBasketArr = unserialize($_COOKIE["basket"]);

?>
<ul>
<?
	$totalPrice = 0;
	foreach ($currentBasketArr as $id => $value) { ?>		
	<li>
	<a href="?route=product&id=<?=$id?>">
		<?=$goods[$id]["nameGood"]["name"]
		//3.1 Имя товара
		?>
	</a>

		<span class="goodprice"><?=$goods[$id]["price"]." грн ";
		//3.2 цена товара за 1 шт.
		?></span>

		<span class="amount">
		<form action="/process/basket/basketMinus.php"><button name="basketGoodId" value="<?=$id?>">-</button></form>
		<?=$value." шт. ";
		//3.3 количество товара
		?>
		<form action="/process/basket/basketPlus.php"><button name="basketGoodId" value="<?=$id?>">+</button></form>
				<!-- !!!!!Вероятно отсылать следует не value а всё таки ID -->
		</span>

		<span class="remove-from-basket">
				<form action="/process/basket/basketDel.php"><button name="basketGoodId" value="<?=$id?>">x</button></form>
				<!-- !!!!!Вероятно отсылать следует не value а всё таки ID -->
		</span>

		<span class="fullprice"><?=$fullprice=$goods[$id]["price"]*$value." грн ";
		//3.4 суммированая цена товара за все шт. 
		?></span>

	</li>
		<?$totalPrice += $fullprice?>
	<hr>
	<?}?>
	<span class="total-price">Итого: <?=$totalPrice." грн"?></span>

<div class="align-center">
	<form action="/">
		<button class="button">ОФОРМИТЬ ЗАКАЗ</button>
	</form>
</div>
<div class="align-center">
	<div class="link"><a href="/?route=catalog">Продолжить покупки</a></div>
</div>

</ul>