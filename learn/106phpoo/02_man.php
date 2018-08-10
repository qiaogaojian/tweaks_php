<?php

class Human
{
    public $name;
    public $age;

    public function SayHi()
    {
        echo "Hi,I am " . $this->name . ", I am " . $this->age . " years old.<br>";
    }

}

$michael = new Human();

$michael->name = "Michael";
$michael->age = 18;

$michael->SayHi();

$michael->name = "Qiao";

$michael->SayHi();

// php 对象中属性的获取 $this->value  value不需要加$
