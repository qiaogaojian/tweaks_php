-- where 子查询
select * from goods where goods_id = (select max(goods_id) from goods);

select * from goods where goods_id in (select max(goods_id) from goods group by cat_id);