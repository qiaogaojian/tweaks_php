-- 索引是一种树形结构

-- 提高了查的速度 减慢了增删改的速度 一般在查询频繁高和重复率低的列加索引

key
unique key
primary key
fulltext 全文索引中文无效 一般用分词+索引 如sphinx

create table test
(
    id int,
    name char(10),
    email char(20),
    primary key(id),
    key name(name),
    unique key email(email)
);

索引长度
key email(emial(10)) 取前10个字符作为索引 为了把重复的内容剔除

多列索引
create table name
(
    xing char(2),
    ming char(10),
    key xm(xing,ming)
);
左前缀: 0 两个 第一次 索引生效  只有第二个无效
explain select * from name where xing = "michael" \G;

冗余索引 被多个覆盖
key xm(xing,ming),
key m(ming)


