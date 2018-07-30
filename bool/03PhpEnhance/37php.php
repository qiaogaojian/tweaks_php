<?php
    $path = "./";
    $currentUri = $_SERVER["REQUEST_URI"];

    if(isset($_GET["dir"]))
    {
        $path = $_GET["dir"];
    }
    else
    {
        $currentUri = $currentUri."?dir=.";
    }
    
    $pathResource = opendir($path);
    
    if($pathResource===false)
    {
        echo "无法读取目录:",$path;
        exit;
    }
    
    $list  = array();
    while(($item = readdir($pathResource))!==false)
    {
        $list[] = $item;
    }
   
    closedir($pathResource);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <style>
    
    td{
        border: 1px solid blueviolet;
    }

    </style>

</head>
<body>
    
    <h1>文件管理系统</h1>
    <table>
        <tr>
            <td>序号</td>
            <td>文件名</td>
            <td>操作</td>
        </tr>
        <?php
        foreach($list as $k=>$v)
        {        
        ?>
        <tr>
            <td><?php echo $k ?></td>
            <td><?php echo $v ?></td>
            <td><?php 
            if(is_dir($path."./".$v))
            {
                echo "<a href = '",$currentUri,"/",$v,"'>浏览</a>";
            }
            else
            {
                $pathDir = substr($currentUri,strpos($currentUri,'=')+1,strlen($currentUri));
                echo "<a href = './",$pathDir,"/",$v,"'>查看</a>";
            }
            ?>
            </td>
        </tr>
        <?php
        }
        ?>
    </table>


</body>
</html>