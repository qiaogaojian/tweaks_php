<?php
//传值赋值 值类型
$a =1;
$b =3;
$a = $b;
$b = 5;
var_dump($a,$b);

echo "<br>";

//引用赋值 引用类型
$c = 5;
$d = 10;
$c = &$d;
$d = 6;
var_dump($c,$d);

?>