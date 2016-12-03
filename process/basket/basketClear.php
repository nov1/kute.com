<?

setcookie("basket",serialize([]),time()+60*60*24*30,"/");

header("Location: /?route=basket");
die();
?>



<!-- Код очишения корзины -->