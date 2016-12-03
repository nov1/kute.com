<?

//1. получить ID товара
$basketGoodId = trim(htmlspecialchars(strip_tags($_GET["basketGoodId"])));

//2. получить basket из cookie
$currentBasket = $_COOKIE["basket"];

//3. распаковать basket в массив
$currentBasketArr = unserialize($currentBasket);

//4. увеличить кол-во товара по ID на 1.
$currentBasketArr[$basketGoodId] += 1;

//5. запаковать массив в basket
//6. отправить cookie
setcookie("basket",serialize($currentBasketArr),time()+60*60*24*30,"/");

// 7. вернуть назад
header("Location: /index.php?route=basket");

die();

?>
<!-- Код увеличения кол-ва товара в корзине -->