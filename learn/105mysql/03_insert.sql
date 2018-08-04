-- 连接数据库 账号密码 root root
mysql -h localhost -u root -p

root

-- 选择数据库
use test;

--插入表数据
insert into user (uid,name,age) values (1,"乔高建",25);

select * from user;

-- 表结构
desc user;

-- 插入所有列的简化操作
insert into user values (3,"Michelle",26);

-- 注意: 
-- 列与值, 严格对应
-- 数字和字符串的注意点
-- 数字不必加引号,字符串必须加引号