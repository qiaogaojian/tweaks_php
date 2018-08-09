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
