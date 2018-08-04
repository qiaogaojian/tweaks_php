<?php

//全局变量
$a = 3;
function foo()
{
    global $a; //这种写法也不推荐
    echo $a; // 这里的$a 和外面的不是一个东西  要想用 需要传参或声明global
}
foo();
//超级全局变量,任何地方都能直接访问的变量. 

?>