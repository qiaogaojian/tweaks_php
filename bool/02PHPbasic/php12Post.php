<?php
class Message
{
    public $tittle;
    public $content;
    public $time;
}

$messageTittle = $_POST["tittle"];
$messageContent = $_POST["content"];

$message = new Message();
$message->tittle = $messageTittle;
$message->content = $messageContent;
$message->time = "20".date("y/m/d/h:i",time());
$messageText = json_encode($message);

$fileMessage = fopen("./msg.txt", 'a');
fwrite($fileMessage, $messageText . "\n");
fclose($fileMessage);
header("Location:./php12MessageBoard.php");
?>
<!-- <p>留言发表成功.</p>
<a href="./php12MessageBoard.php">点击返回</a> -->