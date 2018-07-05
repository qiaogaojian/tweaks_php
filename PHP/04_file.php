<<!DOCTYPE html>
<html>
<head>
<title>PHP 文件操作</title>    
</head>
<body>

<?php 
include("03_menu.php");

//打开并输出文件
//echo readfile("../Doc/webdictionary.txt");

// //打开文件
// $webDicFile = fopen("../Doc/webdictionary.txt","r") or die("无法打开文件.");

// //读取整个文件
// echo fread($webDicFile,filesize("../Doc/webdictionary.txt"));

// //读取单行
// echo "<br>";
// while(!feof($webDicFile))
// {
//     echo fgets($webDicFile)."<br>";
// }

// //读取单个字符
// while(!feof($webDicFile))
// {
//     echo fgetc($webDicFile)."<br>";
// }

// fclose($webDicFile);

// //创建文件
// $testFile = fopen("../Doc/testFile.txt","w") or die("无法打开文件.");

// $txt = "qiaogaojian\n";
// fwrite($testFile,$txt);
// $txt = "Michael";
// fwrite($testFile,$txt);

// fclose($testFile);





include("02_footer.php");
?>

<form action = "upload_file.php" method = "post" enctype = "multipart/form-data">
<label for = "file">FileName:</label>
<input type = "file" name = "file" id = "file"/>
<br>
<input type = "submit" name = "submit" value = "Submit"/>
</form>
    
</body>
</html>

