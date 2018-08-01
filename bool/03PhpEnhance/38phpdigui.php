<?php

function AddAdd($n)
{
    if($n==1)
    {
        return 1;
    }
    return AddAdd($n-1)+$n;
}

echo AddAdd(100),"<br>";

$rootPath = ".";

function DisplayDir($path,$level)
{
    $pathInfo = opendir($path);
    if($pathInfo!==false)
    {
        while(($item = readdir($pathInfo))!==false)
        {
            echo str_repeat("----",$level),$item,"<br>";

            if($item=='.'||$item=='..')
            {
                continue;
            }
            if(is_dir($path."/".$item))
            {
                DisplayDir($path."/".$item,$level+1);
            }          
        }
    }
    else
    {
        echo "无法读取目录.";
        exit();
    }
    closedir($pathInfo);
}

DisplayDir($rootPath,1);

function StaticR()
{
    static $a = 0;
    $a++;
    echo $a,"<br>";
}

StaticR();
StaticR();
StaticR();

$arra = array(1,2,3,array(4,5,6));
function Sum($arr)
{
    static $sumArr = 0;
    foreach($arr as $v)
    {
        if(is_array($v))
        {
            Sum($v);
        }
        else
        {
            $sumArr += $v;
        }
    }
    return $sumArr;
}
echo Sum($arra);
?>