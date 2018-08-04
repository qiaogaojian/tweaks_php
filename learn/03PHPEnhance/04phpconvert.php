<?php
//字符串转数字:从左到右截取,直到碰到不合法的数字,截取出来的部分转为数字
$a ='1hello23';
$a = $a+15;
echo $a;
echo "<br>";

//数字转字符串 后面连接一个字符串即可
$b = 12;
echo $b."";
echo(gettype($b.""));
echo "<br>";

//转换为布尔值 以下值都为false
//'',"",'0',0,0.0,false,NULL,array()
if(''==false)
{
    echo '"" 为false';
}

?>