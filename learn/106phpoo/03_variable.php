<?php
namespace CheckVarName {

    class Goods
    {
        // PHP的属性的值必须是一个直接的值 不能用表达式 1+2 不能用函数 time()
        public $num = 10;
        // PHP中的属性 不赋值为null
        public $price;

        public function ShowPrice()
        {
            echo "商品价格".$this->price;
        }
    }

    $goods = new Goods();

    var_dump($goods->num);
    echo "<br>";

    var_dump($goods->price);

    function CheckName()
    {
        echo "同名不同文件方法1";
    }
}
