<?php

// 时间戳: 自1970/01/01/00:00:00到现在经过的秒数
echo time();
echo "<br>";

print_r(microtime());  //微秒 一般用来计算程序运行时间
echo "<br>";
print_r(microtime(true));
echo "<br>";

?>