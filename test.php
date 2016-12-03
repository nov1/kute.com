<?
function modVar(&$foo)
{
	 $foo += 1;
	 $foo = $foo + 1;
	 return 'подсчет успешно завершен';
}

var_dump(modVar($foo));
$foo = '1';
modVar($foo);
echo 'Foo = '.$foo;


// function add_some_extra(&$string)
// {
//     $string .= 'и кое-что еще.';
// }
// $str = 'Это строка, ';
// add_some_extra($str);
// echo $str;    // выведет 'Это строка, и кое-что еще.'

?>