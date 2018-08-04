<?php
//短路特性

if(false && (isset($a))) //isset 被短路
{
    echo "Hello";
}

//利用短路的简单写法
defined("PI")||define("PI",3.14);


//unset 索引不会自动整理  shift 索引会自动整理
$arr = array('a','b','c');  
unset($arr[0]);
print_r($arr);
array_push($arr,'d');
print_r($arr);

?>