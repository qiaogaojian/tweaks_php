<!DOCTYPE html>
<?php setcookie("user","Qiao",time()+60);?>

<html>
<head>
    <title>Cookies</title> 
</head>
<body>
    <?php
    if(isset($_COOKIE["user"]))
    {
        echo "Welcome ".$_COOKIE["user"]."<br>";
        print_r($_COOKIE);
    }
    else
    {
        echo "Welcome guest."."<br>";
    }    
    ?>



</body>
</html>