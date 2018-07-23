<?php
//1 计算奖金
$profile = 120;

function CaculateAward($profileNum)
{
    $award = 0;
    if ($profileNum <= 10) {
        $award = $profileNum * 0.1;
    } elseif ($profileNum > 10 && $profileNum <= 20) {
        $award = 10 * 0.1 + ($profileNum - 10) * 0.075;
    } elseif ($profileNum > 20 && $profileNum <= 40) {
        $award = 10 * 0.1 + (20 - 10) * 0.075 + ($profileNum - 20) * 0.05;
    } elseif ($profileNum > 40 && $profileNum <= 60) {
        $award = 10 * 0.1 + (20 - 10) * 0.075 + (40 - 20) * 0.05 + ($profileNum - 40) * 0.03;
    } elseif ($profileNum > 60 && $profileNum <= 100) {
        $award = 10 * 0.1 + (20 - 10) * 0.075 + (40 - 20) * 0.05 + (60 - 40) * 0.03 + ($profileNum - 60) * 0.015;
    } elseif ($profileNum > 100) {
        $award = 10 * 0.1 + (20 - 10) * 0.075 + (40 - 20) * 0.05 + (60 - 40) * 0.03 + (100 - 60) * 0.015 + ($profileNum - 100) * 0.1;
    }
    return $award;
}

$awardTotal = CaculateAward($profile);
echo "可获得的奖金为:", $awardTotal;
echo "<br><br>";

//2 找最大数
$numA = 1;
$numB = 2;
$numC = 3;

$lagerNum = $numA > $numB ? $numA : $numB;
$maxNum = $lagerNum > $numC ? $lagerNum : $numC;
echo "最大的数为:" . $maxNum;
echo "<br><br>";

//3 水仙花数
for ($i = 100; $i < 1000; $i++) {
    $baiwei = floor($i / 100);
    $shiwei = floor($i % 100 / 10);
    $gewei = $i % 10;

    if (pow($baiwei, 3) + pow($shiwei, 3) + pow($gewei, 3) == $i) {
        echo "水仙花数:" . $i . "<br>";
    }
}
echo "<br><br>";

//4 猴子吃桃
$taoNum = 1;

for ($t = 1; $t <= 10; $t++) {
    $taoNum = ($taoNum + 1) * 2;
    if ($t == 10) {
        echo "桃子数量:" . $taoNum;
    }
}
echo "<br><br>";

//5 分数序列
$he = 2;
for ($i = 0, $fenzi = 2, $fenmu = 1; $i < 20; $i++) {
    $fenzi = $fenzi + $fenmu;
    $fenmu = $fenzi;
    $he += $fenzi / $fenmu;
}
echo ($he);
echo "<br><br>";

//6 过路费
$moneyAll = 100000;
$count = 0;
while ($moneyAll >=5000) {
    if ($moneyAll > 50000) {
        $moneyAll -= $moneyAll * 0.05;
    } else {
        $moneyAll -= 5000;
    }
    $count++;
}
echo $count;
echo "<br><br>";

//7 99乘法表
for ($i = 1; $i <= 9; $i++) {
    for ($j = 1; $j <= $i; $j++) {
        echo $j . "*" . $i . "=" . $i * $j . "\t";
    }
    echo "<br>";
}
echo "<br><br>";

//8 百钱买百鸡
$ji1 = 5;
$ji2 = 3;
$ji3 = 1 / 3;

/*
for ($i = 1; $i <= floor(100 / $ji1); $i++) {
    for ($j = 1; $j <= floor(100 / $ji2); $j++) {
        for ($k = 1; $k < 100; $k++) {
            if ($i * $ji1 + $j * $ji2 + $k * $ji3 == 100 && $i+$j+$k==100) {
                echo "公鸡:" . $i . "母鸡" . $j . "小鸡:" . $k . "<br>";
            }
        }
    }
}
*/
for ($i = 1; $i <= 20; $i++) {
    for ($j = 1; $j <= 33; $j++) {
        $k = 100-$i-$j;
            if ($i * $ji1 + $j * $ji2 + $k * $ji3 == 100 && $i+$j+$k==100) {
                echo "公鸡:" . $i . "母鸡" . $j . "小鸡:" . $k . "<br>";
            }
        
    }
}

echo "<br><br>";

//9 1-100的素数
function JundgeSu($n)
{
    for ($j = 2; $j < $n; $j++) {
        if ($n % $j == 0) {
            return false;
        }
    }
    if ($n == 1) {
        return false;
    }
    return true;
}

for ($i = 1; $i <= 100; $i++) {
    if (JundgeSu($i)) {
        echo $i . "<br>";
    }
}
echo "<br><br>";

//10 生🐏
function BornSheep($n)
{
    $arr = array(1, 0, 0, 0, 0);
    for ($i = 0; $i < 20; $i++) {
        $tem = $arr[1] + $arr[3];
        array_unshift($arr, $tem);
        array_pop($arr);
    }
    echo $n . "年后🐏的数量:" . array_sum($arr)."<br>";
}

function BornSheepDiGui($n)
{    
    if($n==0)
    {
        return 0;
    }
    if ($n == 1) {
        return 1;
    }
    if ($n == 2 || $n == 3) {
        return 2;
    }
    if ($n == 4) {
        return 4;
    }
    return BornSheepDiGui($n - 2) + BornSheepDiGui($n - 4);
}

BornSheep(20);

echo "递归 20年后🐏的个数:" . BornSheepDiGui(20);

?>