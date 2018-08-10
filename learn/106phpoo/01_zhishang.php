<?php

class Man
{
    public $iq = 100;

    public function SayHi()
    {
        if ($this->iq >= 100) {
            echo "早上好","<br>";
        } else {
            $randomNum = rand(0, 2);
            if ($randomNum == 1) {
                echo "晚上好","<br>";
            } else {
                echo "你妹啊","<br>";
            }
        }
    }
}

class Car
{
    public function Hit($people)
    {
        $randomNum = rand(50,150);
        $people->iq = $randomNum;
    }
}

$lisi = new Man();
$bwm = new Car();

$lisi->SayHi();

$bwm->Hit($lisi);
echo $lisi->iq,"<br>";;

$lisi->SayHi();