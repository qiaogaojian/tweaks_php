select * from (select * from goods order by cat_id asc,goods_id desc) as tem group by cat_id order by goods_id;
