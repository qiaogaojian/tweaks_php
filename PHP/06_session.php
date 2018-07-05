<!DOCTYPE html>
<?php
session_start();
$_SESSION["view"] ="06_session.php";
if(isset($_SESSION["views"]))
{
    $_SESSION["views"] = $_SESSION["views"]+1;
}
else
{
    $_SESSION["views"] = 1;
}
?>

<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Session</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <script src="main.js"></script>
</head>
<body>
    
    <?php
    echo "Pageviews =".$_SESSION["view"]."<br>";
    echo "Views =".$_SESSION["views"];
    ?>

    <?php
    //删除所有Session
    //session_destroy();
    //删除特定Session
    //unset($_SESSION['views']);
    ?>
</body>
</html>