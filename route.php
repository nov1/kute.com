<?
//developer B add some code to route...
//new coder A made some changes 2
	switch ($route) {
		case NULL:
			include_once "view/main.tpl"; //главная страница
			break;
		case "about":
			include_once "view/about.tpl"; //О нас
			break;
		case "contacts":
			include_once "view/contacts.tpl"; //Контакты
			break;
		case "catalog":
			include_once "view/catalog.tpl"; //Каталог товаров
			break;
		case "catalog2":
			include_once "view/catalog2.tpl"; //Каталог товаров
			break;
		case "product":
			include_once "view/product.tpl"; //Станица продукта
			break;
		case "product2":
			include_once "view/product2.tpl"; //Станица продукта
			break;
		case "basket":
			include_once "view/basket.tpl"; //Корзина
			break;
		case "addNewGood":
			include_once "view/addNewGood.tpl"; //Корзина
			break;
		case "goodsToEdit":
			include_once "view/goodsToEdit.tpl"; //Корзина
			break;
		case "editGood":
			include_once "view/editGood.tpl"; //Корзина
			break;
		case "registration":
			include_once "view/form.tpl"; //Корзина
			break;

		default:
			include_once "view/404.tpl"; //404 - Страница не найдена
			break;
	}

?>