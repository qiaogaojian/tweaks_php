<?php
class Baby
{
    public $name;
    public $weight;

    public function __construct($name, $weight)
    {
        echo "Baby name: " . $name . " weight: " . $weight . "kg<br>";
    }

    public function __destruct()
    {
        echo $this->name." 对象Unset().<br>";
    }
}

$baby1 = new Baby("Michael", 60);
unset($baby1);

// 代码执行到页面时最后一行时 会隐式销毁 系统回收对象 不容易内存泄漏
$baby2 = new Baby("Qiao", 68);