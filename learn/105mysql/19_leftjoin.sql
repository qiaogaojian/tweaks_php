-- 左连接 以左表数据为准
select boy.hid,boy.bname,girl.gname
from boy left join girl
on boy.hid = girl.hid;
