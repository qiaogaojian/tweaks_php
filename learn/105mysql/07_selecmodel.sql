-- 查询模型where后就是一个布尔变量
select * from user where 1;

-- 变量可以计算
select uid,name,age+1 from user where uid>=3;

-- 条件查询
select goods_id,goods_name,market_price-shop_price from goods;
select goods_id,goods_name,shop_price,market_price,market_price-shop_price from goods;

-- 装逼术语
-- 投影运算(取表中的某些变量)
-- 广义投影(变量运算的结果)