<?php

class Glass
{

}

class RedGlass extends Glass
{
    public function Display()
    {
        echo "红光照耀<br>";
    }
}

class GreenGlass extends Glass
{
    public function Display()
    {
        echo "绿光照耀<br>";
    }
}

class BlueGlass extends Glass
{
    public function Display()
    {
        echo "蓝光照耀<br>";
    }
}

class Pig
{
    public function Display()
    {
        echo "猪哼哼<br>";
    }
}

class Light
{
    public function ShowLight(Glass $glass)
    {
        $glass->Display();
    }
}

$lightObj = new Light();

$rg = new RedGlass();
$gg = new GreenGlass();
$bg = new BlueGlass();

$lightObj->ShowLight($rg);
$lightObj->ShowLight($gg);
$lightObj->ShowLight($bg);

//PHP太灵活了,需要类型限制,给所有Glass类型加一个父类Glass 并在多态接口参数加上Glass限制
$p = new Pig();
$lightObj->ShowLight($p);