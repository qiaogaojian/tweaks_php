show databases;

use {databasename}

show tables;

desc goods;

show create table goods;

show create view vuder;
-- 表的详细信息
show table status \G;
-- 表的详细信息
show table status where name = "user" \G;
-- 清空表
truncate  相当于 drop + create

delete  相当于删除表数据

rename table user to userhack