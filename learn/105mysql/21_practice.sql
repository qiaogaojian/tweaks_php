select m.mid,m.hid,t.tname,m.mres,m.matime
from m left join t
on m.hid = t.tid;

select m.mid,m.gid,t.tname,m.mres,m.matime
from m left join t
on m.gid = t.tid;

-- 主队
select m.mid, m.hid, t.tname, m.mres, m.matime from m left join t on m.hid = t.tid;
-- 客队
select m.mid, m.gid, t.tname, m.mres, m.matime from m left join t on m.gid = t.tid;
-- 连接
select ht.hid, ht.tname, ht.mres, gt.gid, gt.tname,gt.matime
from
(select m.mid, m.hid, t.tname, m.mres, m.matime from m left join t on m.hid = t.tid) as ht
left join
(select m.mid, m.gid, t.tname, m.mres, m.matime from m left join t on m.gid = t.tid) as gt
on ht.mid = gt.mid
where gt.matime between '2006-06-01' and '2006-07-01';

-- 更好的写法 多次连接 使用多次的表要起别名
select m.hid, ht.tname, m.mres, m.gid, gt.tname,m.matime
from
m inner join t as ht
on m.hid = ht.tid
inner join t as gt
on m.gid = gt.tid
where m.matime between '2006-06-01' and '2006-07-01';
