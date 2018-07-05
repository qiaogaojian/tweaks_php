<?php
$dbConect = mysqli_connect("localhost","root","root");

if(!$dbConect)
{
    die("无法连接数据库:".mysqli_error());
}

//创建数据库
// if(mysqli_query($dbConect,"CREATE DATABASE my_db"))
// {
//     echo "my_db created.";
// }
// else
// {
//     echo "Error creating database:".mysqli_error();
// }

//创建数据表
// mysqli_select_db($dbConect,"my_db");
// $sql = "CREATE TABLE Persons
// (
//     personID int NOT NULL AUTO_INCREMENT,
//     PRIMARY KEY(personID),
//     FirstName varchar(15),
//     LastName varchar(15),
//     Age int
// )";
// mysqli_query($dbConect,$sql);

//向数据表插入数据
mysqli_select_db($dbConect,"my_db");

mysqli_query($dbConect,'INSERT INTO Persons(FirstName,LastName,Age) VALUES ("Michael","Qiao","26")');
mysqli_query($dbConect,"INSERT INTO Persons(FirstName,LastName,Age) VALUES ('Michelle','Zhang','27')");

mysqli_close($dbConect);

?>