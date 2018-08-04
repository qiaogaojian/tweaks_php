<?php

//键的规则
$arr = array(3=>"a",'b','c');
print_r($arr);

echo "<br>";
//如果不声明 会从 0 1 2..递增
//如果存在个别数字 则从最大的数字键递增
//如果键声明重复了 后面的会覆盖前面的
//键只能是整数或字符串
$arr2 = array(2=>'a',2.5=>'b');
print_r($arr2);
echo "<br>";

//单元操作
$arr3 = array('a','b','c');
$arr3[6] = 'e';
$arr3[] = 'd';
print_r($arr3);
echo "<br>";
//增查
$arr3['stu'] = array("li","wang");
echo $arr3["stu"][0] , "<br>";
//删改
unset($arr3[0]);
print_r($arr3);
echo "<br>";

//循环
foreach($arr3 as $ar) //$key=>$value
{
    print_r($ar);
    echo ", ";
}

$arr4 = array('a','b','c','e');
for($i=0;$i<count($arr4);$i++)
{
    echo $arr4[$i],',';
}
echo "<br>";


$stu = array("zhangsan"=>1,"lisi"=>2,"wangwu"=>3);
foreach($stu as $k=>$v)
{
    $stu[$k] = $v*2;
}
print_r($stu);
echo "<br>";

//游标操作
$arr6 = array('q','w','e','r');
echo current($arr6),"<br>";

next($arr6);
echo current($arr6),"<br>";

end($arr6);
echo current($arr6),"<br>";

prev($arr6);
echo current($arr6),"<br>";

reset($arr6);
echo current($arr6),"<br>";

$arr6[] = false;
$arr6[] = "false";  //用游标的缺陷 遇到值为false退出 while 和 do while都会有

do
{
    print_r(current($arr6));
}
while(next($arr6));

while(current($arr6))
{
    print_r(current($arr6));
    next($arr6);
}
echo "<br>";

?>