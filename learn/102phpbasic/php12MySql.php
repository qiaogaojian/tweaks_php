<?php

$servername = "127.0.0.1";
$username = "root";
$password = "root";
$dbname = "messageboard";

$dbConnect = mysqli_connect($servername, $username, $password);

if (!$dbConnect) {
    echo "无法连接数据库." . mysqli_error();
    exit();
}

//创建数据库
// if(mysqli_query($dbConnect,"CREATE DATABASE $dbname"))
// {
//     echo "$dbname has been created.";
// }
// else
// {
//     echo "Error creating database.".mysqli_error();
// }

//创建数据表
mysqli_select_db($dbConnect, $dbname);
$sql = "CREATE TABLE message
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tittle VARCHAR(100) NOT NULL,
    content VARCHAR(1000),
    time INT
)CHARSET GBK";
mysqli_query($dbConnect, $sql);

echo "Table message has been created.";

mysqli_close($dbConnect);

// 常用SQL语句(首字母顶格,行尾加分号.)

// 1.连接数据库
// mysql -h $servername -u $username -p 
// $password

// 2.查看库
//show databases;

// 3.选库
//use $dbname;

// 4.查看库下面的表
//show tables;

// 5.建表
// create table messageboardtable
// (
//     id int auto_increment primary key,
//     tittle varchar(100),
//     content varchar(1000),
//     time int
// )charset utf8;

// 6.告诉服务器客户端字符集
//set name gbk/utf8;

// 7.添加数据
//insert into messageboardtable (id,tittle,content,time) values (1,"SqlMsg","This is Sql message.","1300123456");

// 8.查询所有数据
// select * from messageboardtable;

// 9.按id查询一行
// select * from messageboardtable where id = 1;

// 10.清空表
// truncate messageboardtable;

?>