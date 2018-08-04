-- 查询所有数据
select * from user;

-- 单行所有列
select * from user where uid=2;

-- 指定列 指定行
 select uid,name from user where uid>=3;

-- 结构:
 -- 查哪张表的数据
 -- 要选择哪些列来查询
 -- 要选择哪些行