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
//顺序结构
$num1  = 1;
$num2 = 2;
echo $num1;
echo $num2;

//选择结构
$gender = "男";
if($gender == "男")
{
    echo "男";
}

echo "<br>";

//循环结构
$rice = 1;
while($rice<=10)
{
    echo "继续吃.<br>";
    $rice++;
}
echo "吃完了.";

for($i =2;$i<=100;$i+=2)
{
    echo $i;
}


?>    
</body>
</html>