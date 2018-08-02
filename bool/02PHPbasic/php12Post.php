<?php
class Message
{
    public $tittle;
    public $content;
    public $time;
}

$messageTittle = $_POST["tittle"];
$messageContent = $_POST["content"];
$timeNow = time();

$message = new Message();
$message->tittle = $messageTittle;
$message->content = $messageContent;
$message->time = "20" . date("y/m/d/h:i", time());
//以MySql为载体存储留言数据
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

mysqli_select_db($dbConnect, $dbname);
$sql = "INSERT INTO $tbname(tittle,content,time) VALUES ('$messageTittle','$messageContent',$timeNow)";
mysqli_query($dbConnect, $sql);

mysqli_close($dbConnect);


//以Json格式写入文件存储留言数据
// $messageText = json_encode($message);
// $fileMessage = fopen("./msg.txt", 'a');
// fwrite($fileMessage, $messageText . "\n");
// fclose($fileMessage);

header("Location:./php12MessageBoard.php");
?>
<!-- <p>留言发表成功.</p>
<a href="./php12MessageBoard.php">点击返回</a> -->