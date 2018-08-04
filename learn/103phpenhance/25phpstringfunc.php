<?php
//字符串长度
$str = "HelloWorld";
echo strlen($str), "<br>";  //返回字节数
$str2 = "你好";
echo mb_strlen($str2, "utf-8"), "<br>"; //返回字符数

//字符串位置
$str3 = "HelloWorld";
$str4 = "lo";
echo strpos($str3, $str4), "<br>";
if (strpos($str3, 'H') === false) //大小写敏感
{
    echo "HelloWorld 不含有h";
} else {
    echo "HelloWorld 含有h", "<br>";
}

//替换字符串
$str5 = "hi,fuck";
echo str_replace("fuck", "f**k", $str5), "<br>";
$str6 = "男人,女人,男孩,女孩";
echo strtr($str6, array('男' => '女', '女' => '男')), "<br>";

//截取字符串
$str7 = "tommrow day is another day";
echo substr($str7, 5, -10), "<br>";

//拆分字符串
$str8 = "qiao,gao,zhang";
$arry = explode(',', $str8);
print_r($arry);
echo "<br>";
echo implode(':', $arry), "<br>";

?>