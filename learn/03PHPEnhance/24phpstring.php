<?php

// 定义大段文本 heredoc(" ") nowdoc(' ')
$age = 18;

$str3 = <<<DOC
'Hello wor'ld' adb
michael
" \" \\ \n \t \v \$ $age";
"ok" now;'
DOC;

$str4 = <<<'DOC'
'Hello wor'ld' adb
michael
" \" \\ \n \t \v \$ $age";
"ok" now;'
DOC;

echo $str3;
echo "<br>";
echo $str4;
echo "<br>";
// 单引号和双引号的区别 

$str1 = " \" \\ \n \t \v \$ $age";
echo $str1;
echo "<br>";

$str2 = ' \" \\ \n \t \v \$ $age';
echo $str2;
echo "<br>";

//优先使用单引号

?>