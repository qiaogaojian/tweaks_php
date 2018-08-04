<?php
$a = 0;
// 不推荐使用
function &Foo(&$a)
{
    $a = 1;
    $a++;
    return $a;
}

$b = foo($a);
$b =3;
echo "b:".$b."\t"."a:".$a;

echo "<br><br>";

$c = &foo($a);
$c =6;
echo "c:".$c."\t"."a:".$a;;


?>