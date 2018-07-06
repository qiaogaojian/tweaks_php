<?php 
ini_set('display_errors', 'On');
error_reporting(E_ALL);

    try 
    {
        $dbConect = mysqli_connect("localhost","root","root");
    }
    catch(PDOException $e) 
    {
        echo '<h1>An error has occurred.</h1><pre>', $e->getMessage() ,'</pre>';
    }
       
    //创建数据表
    mysqli_select_db($dbConect,"test");
    $sql = "CREATE TABLE Highscore
    (
        playerID int NOT NULL AUTO_INCREMENT,
        PRIMARY KEY(playerID),
        score varchar(15),
        mapSeed varchar(15),
        playthrough varchar(15)
    )";
    mysqli_query($dbConect,$sql);

    mysqli_close($dbConect);
?>