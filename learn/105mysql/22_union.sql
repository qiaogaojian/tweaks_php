-- 各语句取出的列要相同 使用union时 完全相等的行将会被合并 合并是比较耗时的 一般不让union进行合并 使用union all
select * from goods where cat_id = 2
union
select * from goods where cat_id = 3;

select * from a
union all
select * from b;

-- union 子句不能用order by  合并后的总结果可以order by


select * from a union all select * from b;

select a.id, a.num+b.num from a inner join b on a.id = b.id;

select allt.id,sum(allt.num) from
(select * from a union all select * from b) as allt
group by allt.id;

select a.id,a.num+b.num
from
a inner join b
on
a.id = b.id;
