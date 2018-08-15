<?php

class Human
{
    public function __construct()
    {
        echo "呱呱坠地!<br>";
    }
}

class Student extends Human
{
    public function __construct()
    {
        parent::__construct();
        echo "好好学习!<br>";
    }
}

$ming = new Student();
