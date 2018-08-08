create view goodsview as select goods_id,goods_name,market_price-shop_price from goods;

select * from goodsview;

-- 显示
show tables;

-- 视图和物理表有一一对应关系时才可以更改