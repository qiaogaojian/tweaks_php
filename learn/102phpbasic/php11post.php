<?php
$tittle = $_POST["tittle"];
$content = $_POST["content"];
echo ($_POST);
echo "Tittle:" . $tittle . "<br>" . "Content:" . $content;

//php打开文件 $fh是资源类型的变量  
$fh = fopen("./msg.txt", "a");

//往文件写内容
fwrite($fh, "Tittle:" . $tittle . "<br>" . "Content:" . $content . "<br>");

fclose($fh);

?>