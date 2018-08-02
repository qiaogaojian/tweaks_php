<?php

$servername = "127.0.0.1";
$username = "root";
$password = "root";
$dbname = "messageboard";
$tbname = "message";

$dbConnect = mysqli_connect($servername, $username, $password);

if (!$dbConnect) {
    echo "无法连接数据库." . mysqli_error();
    exit();
}

mysqli_select_db($dbConnect,$dbname);

$sql = 'select * from message';
$res = mysqli_query($dbConnect, $sql);

var_dump($res);

// while(($row = mysqli_fetch_assoc($res)))
// {               
//     echo "<div class='board'> PostTime: " . $row->time . "<br>";
//     echo "Tittle: " . $row->tittle . "<br>";
//     echo "Content:<br>" . $row->content . "<br></div>";
// }

mysqli_close($dbConnect);

?>