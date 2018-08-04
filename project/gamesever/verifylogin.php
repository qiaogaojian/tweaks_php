<?php 
ini_set('display_errors', 'On');
error_reporting(E_ALL);

     try {
        $dbh = new PDO('mysql:host=localhost;dbname=test;charset=utf8mb4', 'root', 'root');
    } catch(PDOException $e) {
        echo '<h1>An error has occurred.</h1><pre>', $e->getMessage() ,'</pre>';
    }

$name = $_POST['username'];
$password = $_POST['pw'];

echo "name:".$name." password:".$password;


$sql = "SELECT * FROM Users WHERE username = '$name'";

foreach ($dbh->query($sql) as $data) {
	
	$message=$data['password'];
	$message=$data['id'];
	$message=$data['username'];
}


if ($password != '')
{
	if (password_verify($password, $data['password']))
	{
	echo "succes";
    header('LoginSucceed: true');
    header('PlayerID: ' . $data['id']);
    header('PlayerName: ' . $data['username']);
	}
	else 
	{
	echo "wrong";
	echo "dbpassword: ".$data['password'];
	header('LoginSucceed: false');
	}
}
else
{
	echo "wrong";
    header('LoginSucceed: false');
}
$dbh = null;
?>