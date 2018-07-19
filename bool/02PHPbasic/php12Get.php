<?php
$fileMessage = file("msg.txt");

foreach ($fileMessage as $message) {
    $messageText = json_decode($message);
    echo "Tittle: " . $messageText->tittle . "<br>Content " . $messageText->content . "<br>PostTime: " . $messageText->time . "<br><br>";

}
?>