<?php
// 常量 比较重要的变量 不能随意修改 名字不用加$
// 特点 不能修改 不能重新声明 不能删除 全局有效
define('PI', 3.14);
echo PI;

// 检测常量

if (defined('PI')) {
    echo "常量存在";
}

if (!defined("PI")) {
    define('PI', 3.14);
}

// 动态常量名
$change = "PI";
echo $change;

echo constant($change);

?>