<?php
$a = 99;
if(isset($a))
{
    echo "存在";
}
else
{
    echo("不存在");
}

echo "<br>";

unset($a);
if(isset($a))
{
    echo "存在";
}
else
{
    echo("不存在");
}

?>