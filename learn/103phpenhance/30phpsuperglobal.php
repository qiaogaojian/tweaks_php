<?php
//超级全局变量
/*
$_GET; // 地址栏上获取的值
$_POST; // Post表单获取的值
$_REQUEST; // 既有get 又有 post

$_SESSION;
$_COOKIE;
$_FILES;

$_ENV; //服务器操作系统的环境变量 如操作系统 环境变量等等  Web服务的相关信息 容易暴露服务器信息 一般不允许显示
$_SERVER; //服务器整体的信息 获取当前访问的脚本 访问者的IP(REMOTE_ADDR  HTTP_X_FORWARD_FOR) 
$GLOBALS; //所有全局变量索引 通过该变量 可以任意访问全局变量
*/

print_r($_GET);
echo ":GET<br>";
print_r($_POST);
echo ":POST<br>";
print_r($_REQUEST);
echo ":REQUEST<br>";

print_r($_ENV);
print_r($_SERVER);

$a = 1;
print_r($GLOBALS["a"]);

?>