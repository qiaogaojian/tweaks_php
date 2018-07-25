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
function FindKing($n, $m)
{
    $monkeys = range(1, $n);
    $i = 1;
    while (count($monkeys) > 1) {
        if ($i % $m == 0) {
            unset($monkeys[$i - 1]);
        } else {
            array_push($monkeys, $monkeys[$i - 1]);
            unset($monkeys[$i - 1]);
        }
        echo "i:".$i/$m,"<br>";
        $i++;
    }
    return $monkeys[$i - 1];
}

print_r(FindKing(6, 5));

?>