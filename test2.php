<?php
// function makecoffee($type = "капуччино")
// {
//     return "Готовим чашку $type.\n";
// }
// echo makecoffee().'<hr>';
// echo makecoffee(null).'<hr>';
// echo makecoffee("эспрессо").'<hr>';
?>

<?php
function makecoffee($types = array("капуччино"), $coffeeMaker = NULL)
{
    $device = is_null($coffeeMaker) ? "вручную" : $coffeeMaker;
    return "Готовлю чашку ".join(", ", $types)." $device.\n";
}
echo makecoffee().'<hr>';
echo makecoffee(array("капуччино", "лавацца"), "в чайнике").'<hr>';
?>