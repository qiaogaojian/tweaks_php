<?php

//1 全局变量
$a = 1;
function foo()
{
    global $a;
    echo $a;
}
foo();
echo "<br>";

//超全局变量
echo $_SERVER["REMOTE_ADDR"];
echo "<br>";

//判断函数存不存在
echo "isset:".function_exists("foo");
echo "<br>";

//$GLOBALS 
$GLOBALS["var1"] =5;
$var2 =1;
function get_value()
{
    global $var2;
    $var1 = 0;
    return $var2++;
}
get_value();
echo $var1."\n";
echo $var2;

?>