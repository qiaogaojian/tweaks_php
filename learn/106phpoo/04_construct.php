<?php
// 声明格式
header("Content-type:text/html;charset=utf-8"); //gbk

echo "中国<br>";

class Baby
{
    public $name;
    public $weight;

    public function __construct($name,$weight)
    {
        $this->name = $name;
        $this->weight = $weight;
        echo "Baby name: ".$name." weight: ".$weight."kg";
    }
}

$baby1 = new Baby("Michael",10);

//$baby2 = new Baby();
