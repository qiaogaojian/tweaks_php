<?php
//凡运算必有运算结果
$a = 5;
$b = 6;
var_dump($a>$b);

$c = 5;
$d = '5';
var_dump($c==$d);
var_dump($c===$d);  //===要求值和类型都相等.

//===的意义
$res = 0;
if($res===false)
{
    echo "没找到.";
}
else
{
    echo "找到了.";
}

?>