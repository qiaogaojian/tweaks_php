-- group 数据分组

-- 统计函数: 
-- max() count() avg() min() sum()

-- 求各个品类的平均值
mysql> select avg(shop_price) from goods group by cat_id;

-- 求各个品类的数量
mysql> select cat_id,count(cat_id) from goods group by cat_id;

-- 每个栏目下最贵的价格
mysql> select cat_id,goods_name,max(shop_price) from goods group by cat_id;