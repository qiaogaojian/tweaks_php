<?php

//继承的属性或方法范围只能不变或变大 不能越来越严格
//私有的属性也能继承下来只不过不能操作,只能供着
class Human
{
    private $name = "人类";

    public function Show()
    {
        echo "Parent:" . $this->name . "<br>";
    }
}

class Student extends Human
{
    private $name = "小明";

    public function Show()
    {
        echo "Children:" . $this->name . "<br>";
        parent::Show();
    }
}

$xiaoming = new Student();

$xiaoming->Show();
