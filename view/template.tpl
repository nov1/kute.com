<!DOCTYPE html>
<html lang="en">
	<?
	$id = trim(htmlspecialchars(strip_tags($_GET['id'])));
	$good = $goods[$id];

	//1. получить basket из cookie + 2. распаковать basket в массив
	$currentBasketArr = unserialize($_COOKIE["basket"]);
	?>
<head>
	<meta charset="UTF-8">
	<title><?if($good["nameGood"]["name"]){
		echo $good["nameGood"]["name"]."- $storeName";
	}else{
		echo "$storeName";
	}
	?></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/view/static/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/view/static/css/style.css">
</head>

<body>
<div id="wrapper">
	<header id="header">
		<div class="header-contact">
		<ul class="header-contact-list">

		<?foreach ($myContactPhohe as $key => $value) {?>
			<li><?=$value?></li>
		<?}?>
		</ul>
<div class="work-time"><?=$workTime?></div>
		</div>

		<div class="logo">
			<a href="/"><h1 id="title"><?=$storeName?></h1></a>
		</div>
		
		<div class="header-right">
			<a href="/?route=basket">Корзина<?
				if ($_COOKIE["basket"]) {?>
			(<?=array_sum($currentBasketArr)?>)
			<?}?></a>
		</div>
	</header>


<!-- Navigation -->
<nav id="menu" class="clearfix">
	<ul>
		<li><a href="/">Главная</a></li>
		<li><a href="/?route=catalog">Каталог товаров</a></li>
		<li><a href="/?route=catalog2">Каталог товаров2</a></li>
		<li><a href="/?route=about">О нас</a></li>
		<li><a href="/?route=contacts">Контакты</a></li>
	</ul>
</nav>
<nav id="menu" class="clearfix">
	<ul>
		<li><a href="/?route=addNewGood">Add Good</a></li>
		<li><a href="/?route=goodsToEdit">Edit Goods</a></li>
		<li><a href="/?route=registration">Регистрация</a></li>
	</ul>
</nav>

<div id="main">
	<!-- Main Content area -->
    <section id="content">
        	<?	include_once "route.php";	?>
        <!-- Main content -->
    </section>


    <!-- Sidebar -->
    <aside id="sidebar">
       
        <?
if ($_SESSION['auth']==true) {
	echo "Приветствую, <b>".$_SESSION['email']."</b>";?>
	<form action="/process/user/exit.php" method="POST">
	<input type="submit" value="Выход">
</form>
	<?}else{?>
<p>Приветствуем <b>Гость</b>,<br>
У Вас уже есть учётная запись ?</p>
<form action="/process/user/auth.php" method="POST">
	<input type="text" name="email"><br>
	<input type="text" name="passwd"><br>
	<input type="submit" value="Войти">
</form>
<?}?>
        
		<!-- Sidebar content -->
    </aside>
</div>

    <!-- Footer -->
	<footer id="footer" class="clearfix">
		<h6><?=$myCopyright?></h6>
	 <!-- Footer content -->
	</footer>

</div>

</body>
</html>