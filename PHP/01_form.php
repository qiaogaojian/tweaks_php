<!DOCTYPE html>
<?php setcookie("user","Qiao",time()+60);?>
<html>
<head>
    <title>Form Limit</title>  
    <style>
    .error {color: #ff0000;}
    </style>
</head>
<body>
<div class = "menu">
<?php include "03_menu.php"?>
</div>

<?php

$nameErr = $emailErr = $genderErr = $websiteErr = "";

$name = $email = $gender = $website = $comment = "";

if($_SERVER["REQUEST_METHOD"] == "POST")
{
    if(empty($_POST["name"]))
    {
        $nameErr = "姓名是必填的!";
    }
    else
    {
        $name = testInput($_POST["name"]);
        if(!preg_match("/^[a-zA-Z ]*$/",$name))
        {
            $nameErr = "只允许字母和空格.";
        }
    }

    if(empty($_POST["email"]))
    {
        $emailErr = "Email是必填的!";
    }
    else
    {
        $email = testInput($_POST["email"]);
        if(!preg_match("/([\w\-]+\@[\w\-]+\.[\w\-]+)/",$email))
        {
            $emailErr = "邮件格式不合法.";
        }
    }

    if(empty($_POST["gender"]))
    {
        $genderErr = "性别是必填的!";
    }
    else
    {
        $gender = testInput($_POST["gender"]);
    }

    if(empty($_POST["website"]))
    {
        $website = "";
    }
    else
    {
        $website = testInput($_POST["website"]);
        if (!preg_match("/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i",$website))
        {
            $websiteErr = "无效的网址."; 
        }
    }

    if(empty($_POST["comment"]))
    {
        $comment = "";
    }
    else
    {
        $comment = testInput($_POST["comment"]);
    }
}

function testInput($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

?>


<h2>PHP 表单验证</h2>
<p><span class = "error">* 必填字段</span></p>
<form method = "post" action = "<?php echo htmlspecialchars($_SERVER["PHP_SELF"])?>">

    姓名:  <input type = "text" name = "name" value = "<?php echo $name;?>">
    <span class = "error">*<?php echo $nameErr;?></span>
    <br><br>
    
    邮件:  <input type = "text" name = "email" value = "<?php echo $email?>">
    <span class = "error">*<?php echo $emailErr;?></span>
    <br><br>

    博客:  <Input type = "text" name = "website" value = "<?php echo $website?>">
    <span class = "error"><?php echo $websiteErr;?></span>
    <br><br>
    
    评论:  <textarea name = "comment" row = "5" cols = "40"><?php echo $comment?></textarea>
    <br><br>

    性别:
    <input type = "radio" name = "gender" <?php if(isset($gender)&&$gender=="female"){echo "checked";}?> value = "female">Female
    <input type = "radio" name = "gender" <?php if(isset($gender)&&$gender =="male"){echo "checked";}?> value = "male">Male

    <span class = "error">*<?php echo $genderErr;?> </span>
    <br><br>

    <input type = "submit" name = "submit" value = "submit">
</form>

<?php
echo "<h2>Your Submit:</h2>";

echo $name;
echo "<br>";

echo $email;
echo "<br>";

echo $website;
echo "<br>";

echo $comment;
echo "<br>";

echo $gender;
echo "<br>";
?>

<?php include "02_footer.php"?>
</body>
</html>