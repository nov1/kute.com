<h2>Admin Panel</h2>

<h3>Добавить новый товар</h3>

<form enctype="multipart/form-data" action="/process/goods/AddNewGood.php"  method="POST">
		Название продукта
	<input type="text" name="nameGood"><br>
		mediaLinkVideo
	<input type="text" name="mediaLinkVideo"><br>
		mediaLinkDemo
	<input type="text" name="mediaLinkDemo"><br>
		sticker:<br>
		<input type="checkbox" name="super-price" value="super-price">Суперцена
		<input type="checkbox" name="top-sales" value="#top-sales">Топ продаж
		<input type="checkbox" name="action" value="#action">Акция
		<br>
		colorsGood:<br>
		<input type="checkbox" name="white" value="#white">white
		<input type="checkbox" name="black" value="#black">black
		<input type="checkbox" name="gold" value="#gold">gold
		<input type="checkbox" name="silver" value="#silver">silver
		<input type="checkbox" name="red" value="#red">red
		<input type="checkbox" name="green" value="#green">green
		<input type="checkbox" name="blue" value="#blue">blue
		<input type="checkbox" name="yellow" value="#yellow">yellow
		<input type="checkbox" name="orange" value="#orange">orange
		<input type="checkbox" name="pink" value="#pink">pink
		<input type="checkbox" name="purple" value="#purple">purple
		<br>
		endingGood
	<input type="text" name="endingGood"><br>
		oldPrice
	<input type="text" name="oldPrice"><br>
		price
	<input type="text" name="price"><br>
		raiting
	<input type="text" name="raiting"><br>
		кол-во обзоров:
	<input type="text" name="reviews"><br>
		features^(выбор тегов)
	<input type="text" name="features"><br>
		description
	<input type="text" name="description"><br>

		imgGood^
	<input type="file" name="imgGood"><br>
		image tag
	<input type="text" name="imgTag" value="#"><br>
		image alternative description
	<input type="text" name="imgAlt"><br>
		image title
	<input type="text" name="imgTitle"><br>
	<input type="submit" name="send" value="Добавить товар в базу">
</form>
