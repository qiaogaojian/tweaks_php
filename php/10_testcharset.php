<?php

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "test";
$tbname = "testcharset";

$dbConect = mysqli_connect($servername,$username,$password);

if(!$dbConect)
{
    die("无法连接数据库:".mysqli_error());
}

//创建数据库
// if(mysqli_query($dbConect,"CREATE DATABASE $dbname"))
// {
//     echo "$dbname created.";
// }
// else
// {
//     echo "Error creating database:".mysqli_error();
// }

//创建数据表 面向过程
// mysqli_select_db($dbConect,$dbname);
// $sql = "CREATE TABLE Persons
// (
//     personID int NOT NULL AUTO_INCREMENT,
//     PRIMARY KEY(personID),
//     FirstName varchar(15),
//     LastName varchar(15),
//     Age int
// )";
// mysqli_query($dbConect,$sql);

//创建数据表 对象
// try
// {
//     $conn = new PDO("mysql:host = $servername; dbname = $dbname",$username,$password);

//     $conn ->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);

//     $sql = "CREATE TABLE $tbname(
//         id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
//         firstname VARCHAR(30) NOT NULL,
//         lastname VARCHAR(30) NOT NULL,
//         email VARCHAR(50),
//         reg_data TIMESTAMP
//     )";

//     $conn ->exec($sql);
//     echo "Table MyGuests created successfully";
// }
// catch(PDOException $e)
// {
//     echo $sql."<br>".$e->getMessage();
// }
// $conn = null;


//向数据表插入数据
// mysqli_select_db($dbConect,"$dbname");

// mysqli_query($dbConect,'INSERT INTO Persons(FirstName,LastName,Age) VALUES ("高建","乔","26")');
// mysqli_query($dbConect,"INSERT INTO Persons(FirstName,LastName,Age) VALUES ('Michelle','Zhang','27')");

// mysqli_close($dbConect);

//查询数据库数据
mysqli_select_db($dbConect,"$dbname");

$rs = mysqli_query($dbConect,"select * from persons");

if($rs)
{
    while($row = mysqli_fetch_assoc($rs))
    {
        echo "firstname:".$row["FirstName"]."<br>";
        echo "lastname:".$row["LastName"]."<br>";
        echo "age:".$row["Age"]."<br><br>";
    }   
}

mysqli_close($dbConect);

?>