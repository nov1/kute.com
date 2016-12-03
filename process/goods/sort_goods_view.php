<?

$sort = trim(htmlspecialchars(strip_tags($_GET[sort])));
header("Location: /index.php?route=catalog2&sort=$sort");

?>