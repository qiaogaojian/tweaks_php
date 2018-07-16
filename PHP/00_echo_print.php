<?php
//echo 能输出多个字符串  print只能输出一个
echo ("<h2>PHP is fun!</h2>");
echo ("Hello World!<br>");
echo ("I'm about to learn PHP!<br>");
echo "This"," string"," was"," made"," with multiple parameters.<br>";

//显示变量
$txt1 = "Learn PHP";
$txt2 = "ETAGame";
$cars = array("Volvo","BMW","SAAB");

echo $txt1;
echo "<br>";
echo "Study PHP at $txt2<br>";
echo "My car is a {$cars[0]}<br>";

$x = TRUE;
$y = FALSE;

echo "x:",$x,"<br>";
echo "y:",$y,"<br>";

class Car
{
    var $color;
    function _consturct($color = "green")
    {
        $this->color = $color;
    }

    function ShowColor()
    {
        return $this->color;
    }
}

//常量
define("PRICE",1000000);
echo "price:",PRICE,"$<br>";

//字符串运算符
$text1 = "Hello";
$text1 = $text1." World!";
echo $text1;
echo "<br>";

//比较运算
$testX = 100 ;
$testY = "100";
var_dump($testX == $testY);
echo "<br>";
var_dump($testX === $testY);
echo "<br>";

$time = date("H");
echo $time;
var_dump($time);
if($time<"20")
{
    echo "have fun.";
}
echo "<br>";
for($i = 0; $i<10; $i++)
{
    echo $i,"<br>";
}

$colors = array("red","green","blue");
foreach($colors as $color)
{
    echo $color,"<br>";
}

//函数
function SayHello($name)
{
    echo "Hello >".$name;
}
SayHello("Michael");
echo "<br>";

echo $_SERVER['PHP_SELF'];
echo "<br>";
echo $_SERVER['SERVER_NAME'];
echo "<br>";
echo $_SERVER['HTTP_HOST'];
echo "<br>";
echo $_SERVER['HTTP_USER_AGENT'];
echo "<br>";
echo $_SERVER['SCRIPT_NAME'];

?>
