<?php
// 1 多维数组变2倍
$array = array(1, 2, 'a', array(3, 'b', array(4, 5)));

function DoubleArrayNum($arr)
{
    foreach ($arr as $k => $v) {
        if (is_numeric($v)) {
            $arr[$k] = $v * 2;
        } elseif (is_array($v)) {
            $arr[$k] = DoubleArrayNum($v);
        }
    }
    return $arr;
}

print_r(DoubleArrayNum($array));
