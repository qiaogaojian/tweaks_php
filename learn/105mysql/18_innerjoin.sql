select goods.goods_id,goods.goods_name,goods.cat_id,category.cat_name
from goods inner join category
on goods.cat_id = category.cat_id;

select count(*) from (select goods.goods_id,goods.goods_name,goods.cat_id,category.cat_name from goods inner join category on goods.cat_id = category.cat_id) as t;

select goods_name, cat_name, shop_price from (select goods.goods_id,goods.goods_name,goods.cat_id,goods.shop_price,category.cat_name from goods inner join category on goods.cat_id = category.cat_id) as t where cat_id = 4;