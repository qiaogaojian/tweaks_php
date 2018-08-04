<?php

$hash = @"$2y$10$tAvs57lz";
$password = "qiao";

$hashpw = password_hash($password, PASSWORD_DEFAULT);

echo "hashpw: ".$hashpw;


if(password_verify($password,$hashpw))
{
    echo "密码正确";
}
else
{
    echo "密码错误";
}

?>