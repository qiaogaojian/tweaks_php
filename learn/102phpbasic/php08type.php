<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <?php
    //字符串
    $str  = "Hello' World!";
    //整数
    $num = 123;
    //浮点型
    $pi = 3.14;
    //数组
    $arr = array('a',115,"\"false\"");
    for($i=0;$i<count($arr);$i++)
    {
        echo $arr[$i];
        echo "<br>";
    }
    //布尔   
    echo $b = false;
    ?>
</body>
</html>