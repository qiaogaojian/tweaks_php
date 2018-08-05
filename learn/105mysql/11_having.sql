-- 计算出的结果 内存中的数据 如果要获取需要用having where只能取静态表数据
select goods_id,goods_name,(market_price-shop_price) as sheng from goods having sheng>=200;

 insert into stu values
("张三","数学",90),
("张三","语文",50),
("张三","地理",40),
("李四","语文",55),
("李四","政治",45),
("王五","政治",30);

-- 对比
--错误的条件筛选 直接count(score<60)不管真假都会累加 sum(score>60)会得出符合结果的次数
mysql> select name,avg(score),count(score<60) from stu group by name;
-- 正确的筛选
mysql> select name,sum(score<60) as guake ,avg(score) from stu group by name having guake>=2;