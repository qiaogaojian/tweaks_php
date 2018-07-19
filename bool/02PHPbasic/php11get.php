<?php
$tid = $_GET["tid"];

echo("查找第:".$tid."个留言.");

$ly = fopen("./msg.txt","r");
$line = 1;
while(fgets($ly) != null)
{    
    if($line == $tid)
    {
        echo(fgets($ly));
    }
    $line++;
}

?>