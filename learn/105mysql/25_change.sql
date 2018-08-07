-- 加列

alter table users add email char(20) after gender;

-- 减列

alter table users drop Salary;

-- 改列

alter table users change email mail char(30);

-- 调整字段顺序 modify不能改列名 只能改属性
--放在第一位
alter table goods modify goods_sn int first;
--放在其他位置
alter table goods modify goods_sn int after goods_id;

