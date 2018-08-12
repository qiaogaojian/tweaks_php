<?php

class Laopo
{
    public $name = "gaojian";

    public function LaoDao1()
    {
        echo "起床了 ".$this->name."<br>";
    }

    public function LaoDao2()
    {
        $name = "Michael";
        echo "起床了 ".$name."<br>";
    }
}

$l = new Laopo();

$l->LaoDao1();
$l->LaoDao2();

?>