<?php

// 时间戳格式化
echo date("Y-m-d 星期N h:i:s");
echo("<br>");
echo date("Y-m-d 星期N h:i:s",0);
echo("<br>");
echo gmdate("Y-m-d 星期N H:i:s",0);  //大写H 代表24小时制
echo("<br>");

// 解析时间为时间戳
echo mktime(23,40,50,07,23,2018);
echo("<br>");

echo strtotime("now");
echo("<br>");
echo strtotime("now +3 day");
echo("<br>");
echo strtotime("now -1 weeks");
echo("<br>");
echo strtotime("now -3 years");
echo("<br>");

// 日期合法性
var_dump(checkdate(2,29,2018));
echo("<br>");
?>