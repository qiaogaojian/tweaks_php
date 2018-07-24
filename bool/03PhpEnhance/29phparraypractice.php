<?php

$arr = array('a', 'b', 'c');
echo array_push($arr, 'd'); //返回count
echo array_push($arr, 'e');
echo array_pop($arr);
echo array_unshift($arr, 'f'); //返回count
echo array_shift($arr); //返回头部元素

//生🐏问题
$sheep = array(1, 0, 0, 0, 0);
for ($y = 0; $y < 20; $y++) {
    $tem = $sheep[1] + $sheep[3];
    array_pop($sheep);
    array_unshift($sheep, $tem);
}
echo "羊的个数:" . array_sum($sheep);
echo "<br><br>";

//猴子选大王
$n = 10;
$m = 3;
$index = 0;
$monkey = array();
for ($i = 0; $i < $n; $i++) {
    array_push($monkey, $i);
}
while ($m > 0) {

    $m--;
    $index++;
    if ($m == 0) {
        unset($monkey[$index % count($monkey)]);
        $m = 3;
        if(count($monkey)==1)
        {
            echo "大王是:".current($monkey);
            $m = -1;
            break;
        }
        echo current($monkey);
    }
}

?>