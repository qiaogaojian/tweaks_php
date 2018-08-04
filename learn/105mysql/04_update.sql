-- 改哪张表 你要改哪几列的值 分别改为什么值 在哪些行生效 (结构)
update user set age=18 where name="Michael";

-- 更新多个属性时记得加逗号',' 属性的顺序和表结构保持一致
update user set name="迈克尔",age=19 where uid=2;