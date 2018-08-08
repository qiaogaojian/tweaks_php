--查
show index from goods;
-- 加
alter table goods add index goodsname(goods_name);
-- 删
alter table goods drop index goodsname;

drop index tindex on goods;