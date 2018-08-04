<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Json</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <script src="main.js"></script>
</head>
<body>

<?php

//序列化
// $testArray = array(1,1,2,3,5,8);
// echo json_encode($testArray);

//反序列化
$jsonTxt = '{"a":1,"b":2,"c":3,"d":4,"e":5}';
var_dump(json_decode($jsonTxt));
echo "<br>";
var_dump(json_decode($jsonTxt, true));
?>

</body>
</html>