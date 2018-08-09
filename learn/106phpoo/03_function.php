<?php
namespace CheckVarName {
    include("./03_variable.php");

    // 全局函数不能重名(重复定义)  类中的函数可以和外部的普通方法重名
    class Clock
    {
        public function time()
        {
            echo "现在的时间是2018-08-10<br>";
        }

        public function RealTime()
        {
            echo "现在的时间戳是", time();
        }

    }

    $timeClock = new Clock();

    $timeClock->time();

    $timeClock->RealTime();

    // function CheckName()
    // {
    //     echo "同名不同文件方法2<br>";
    // }

    // 经过测试发现 同一个命名空间下 不同文件 函数同名可行 include之后不行
    CheckName();

    // 不 include 无法获取这个类 include后可以
    $goods2 = new Goods();
    $goods2->ShowPrice();
}
