-- where 子查询
select * from goods where goods_id = (select max(goods_id) from goods);

select * from goods where goods_id in (select max(goods_id) from goods group by cat_id);

select cat_id, cat_name from category where cat_id = (select cat_id from goods where goods_id=19);