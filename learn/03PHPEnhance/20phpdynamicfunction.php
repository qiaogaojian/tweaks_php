<?php

function foo()
{
    echo "foo";
}

function bar()
{
    echo "bar";
}

$func = "foo";
$func();
$func = "bar";
$func();

?>