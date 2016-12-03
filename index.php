<?
session_start();
/*
route=main - главная
route=about - О нас
route=contacts - Контакты
404 - default
*/

//SOME CHANGES FOR GIT TESTS 

if (!$_COOKIE["basket"]) {
	setcookie("basket",serialize([]),time()+60*60*24*30,"/"); //записать пустой массив в корзину
}

/*
$_COOKIE["basket"] ? : setcookie("basket",serialize([]),time()+60*60*24*30,"/");

//код работает, но правильно ли записан тернарный оператор?
не могу вывести echo.
*/


$goods = unserialize(file_get_contents('db/goods.base')); //получаем базу товаров из файла.

include_once "preferences.php"; //подключаем настройки
include_once "lib/functions.php"; //подключаем функции
// include_once "db/goods.base"; //подключаем файловую базу товаров
$route = $_GET['route'];
include_once "view/template.tpl"; //подключаем шаблон

?>
