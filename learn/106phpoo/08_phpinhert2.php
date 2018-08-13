<?php
class Human
{
    private $height = 160;
    public function Cry()
    {
        echo "5555555555<br>";
    }
}

class Student extends Human
{
    private $height = 170;
    public $score = 59;

    public function Study()
    {
        echo "Good Good Study, Day Day Up.<br>";
    }
}

class Lawyer extends Human
{
    private $height = "180";
    public $area = "economy";

    public function Argue()
    {
        echo "我的当事人无罪.<br>";
    }
}

$zhoukou = new Human();
$zhoukou->Cry();

$xiaoming = new Student();
$xiaoming->Cry();
$xiaoming->Study();

$liu = new Lawyer();
$liu->Cry();
$liu->Argue();

