<?php

// 定义大段文本 headdoc nowdoc
$str3 = <<<HTML
'Hello wor'ld' adb
michael
"ok" now;'
HTML;

echo $str3;
echo "<br>";

// 单引号和双引号的区别 
$age = 18;

$str1 = " \" \\ \n \t \v \$ $age";
echo $str1;
echo "<br>";

$str2 = ' \" \\ \n \t \v \$ $age';
echo $str2;
echo "<br>";

//优先使用单引号

?>