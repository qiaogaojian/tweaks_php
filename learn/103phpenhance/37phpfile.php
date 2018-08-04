<?php
//文件管理
$path = "./";

if(isset($_GET["dir"]))
{
    $path = $path."/".$_GET["dir"];
}

$pathResource = opendir($path);

if($pathResource===false)
{
    echo "无法读取目标.";
    exit;
}

$list  = array();
while(($item = readdir($pathResource))!==false)
{
    $list[] = $item;
}
header("Location:./37php.php");
//header("Location:./UnityPackage/portal.php");
//print_r($list);

closedir($pathResource);
 


?>