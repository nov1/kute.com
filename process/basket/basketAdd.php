<?
//1. получить ID товара
$basketGoodId = trim(htmlspecialchars(strip_tags($_GET["basketGoodId"])));

//2. получить basket из cookie + 3. распаковать basket в массив.
$currentBasketArr = unserialize($_COOKIE["basket"]);

//4. добавить ID товара в basket
// $currentBasketArr[$basketGoodId] += 1; //my first version

/*Добавляю ID товара в ключ, для избежания дублей в корзине (одних и тех же товаров под разными индексами)
+= 1 в случае повторного нажатия на КУПИТЬ товар добавляется +1
можно убирать когда вместо кнопки КУПИТЬ будет отображаться что товар уже в корзине.
*/

if ($currentBasketArr[$basketGoodId]) {
	 $currentBasketArr[$basketGoodId] += 1;
}else{
	$currentBasketArr[$basketGoodId] = 1;
}


//5. запаковать массив в basket
//6. отправить cookie
setcookie("basket",serialize($currentBasketArr),time()+60*60*24*30,"/");

// 7. вернуть назад
if ($_SERVER['HTTP_REFERER']=='http://'.$_SERVER['HTTP_HOST'].'/?route=catalog') {
	header("Location: /index.php?route=catalog");
}else{
	header("Location: /index.php?route=product&id=$basketGoodId");
}
// header("Location: /index.php?route=product&id=$basketGoodId");
// header("Location: /index.php?route=catalog");

die();

?>
<!-- Код добавления товара в корзину -->