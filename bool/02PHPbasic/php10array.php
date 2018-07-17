<?php
$arr = array(1,2,3,4,5,6);
for($i = 0;$i<count($arr);$i++)
{
    echo $arr[$i];
    echo "<br>";
}
echo "<br>";
echo "<br>";


$arrR = array("name"=>"michael","age"=>18);
foreach($arrR as $key=>$value)
{
    echo $key.":".$value;
    echo "<br>";
}

?>