-- 一个结果集获得之后 有选择性的选择一部分结果  有两个参数 offset,range
mysql> select * from goods order by shop_price desc limit 3;
-- 这个才是常规的写法
mysql> select * from goods order by shop_price desc limit 2,3;

mysql> select * from goods order by goods_id desc limit 0,1;