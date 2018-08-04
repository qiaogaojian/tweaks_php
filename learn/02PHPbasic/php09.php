<?php
//在单引号中  只认识两个转义  \' => '  \\ => \ 其他转义字符无效  双引号都可以
// \n在控制台可以换行 但是在网页上面要换行还是要用<br>

$str = "hello \"world \n 下一行";
$str2 = "hi "."what\'s your name?";

echo $str.$str2;
?>