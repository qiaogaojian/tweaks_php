-- 创建 Table 注意单词拼写
create table goods(
goods_id int primary key auto_increment,
goods_name varchar(100),
cat_id int,
brand_id int,
goods_sn varchar(20),
goods_number int,
shop_price float,
goods_desc varchar(300)
);

-- 创建索引
-- 索引类型
 primary       -- key主键索引
 index         -- 普通索引
 unique index  -- 唯一性索引
 fulltext index-- 全文索引
-- 方法1: 
create index [索引名称] on [表名称] (列名称)
-- 方法2: 
alter table [表名称] (列名称) add index [索引名称] (列名称)

-- 删除索引
-- 方法1: 
ALTER TABLE 表名 DROP INDEX 索引名
-- 方法2: 
DROP INDEX 索引名 ON 表名；

-- 调整字段顺序
--放在第一位
alter table goods modify goods_sn int first;
--放在其他位置
alter table goods modify goods_sn int after goods_id;

INSERT INTO goods
VALUES (1, 'KD876', 4, 8, 'ECS000000', 10, 1388.00, 7),
	(4, '诺基亚N85原装充电器', 8, 1, 'ECS000004', 17, 58.00, 0),
	(3, '诺基亚原装5800耳机', 8, 1, 'ECS000002', 24, 68.00, 3),
	(5, '索爱原装M2卡读卡器', 11, 7, 'ECS000005', 8, 20.00, 3),
	(6, '胜创KINGMAX内存卡', 11, 0, 'ECS000006', 15, 42.00, 0),
	(7, '诺基亚N85原装立体声耳机HS-82', 8, 1, 'ECS000007', 20, 100.00, 0),
	(8, '飞利浦9@9v', 3, 4, 'ECS000008', 17, 399.00, 9),
	(9, '诺基亚E66', 3, 1, 'ECS000009', 13, 2298.00, 20),
	(10, '索爱C702c', 3, 7, 'ECS000010', 7, 1328.00, 11),
	(11, '索爱C702c2', 3, 7, 'ECS000011', 1, 1300.00, 0),
	(12, '摩托罗拉A810', 3, 2, 'ECS000012', 8, 983.00, 14),
	(13, '诺基亚5320 XpressMusic', 3, 1, 'ECS000013', 8, 1311.00, 13),
	(14, '诺基亚5800XM', 4, 1, 'ECS000014', 4, 2625.00, 6),
	(15, '摩托罗拉A8102', 3, 2, 'ECS000015', 3, 788.00, 8),
	(16, '恒基伟业G101', 2, 11, 'ECS000016', 0, 823.33, 3),
	(17, '夏新N7', 3, 5, 'ECS000017', 1, 2300.00, 2),
	(18, '夏新T5', 4, 5, 'ECS000018', 1, 2878.00, 0),
	(19, '三星SGH-F258', 3, 6, 'ECS000019', 0, 858.00, 7),
	(20, '三星BC01', 3, 6, 'ECS000020', 13, 280.00, 14),
	(21, '金立 A30', 3, 10, 'ECS000021', 40, 2000.00, 4),
	(22, '多普达Touch HD', 3, 3, 'ECS000022', 0, 5999.00, 15),
	(23, '诺基亚N96', 5, 1, 'ECS000023', 8, 3700.00, 17),
	(24, 'P806', 3, 9, 'ECS000024', 148, 2000.00, 36),
	(25, '小灵通/固话50元充值卡', 13, 0, 'ECS000025', 2, 48.00, 0),
	(26, '小灵通/固话20元充值卡', 13, 0, 'ECS000026', 2, 19.00, 0),
	(27, '联通100元充值卡', 15, 0, 'ECS000027', 2, 95.00, 0),
	(28, '联通50元充值卡', 15, 0, 'ECS000028', 0, 45.00, 0),
	(29, '移动100元充值卡', 14, 0, 'ECS000029', 0, 90.00, 0),
	(30, '移动20元充值卡', 14, 0, 'ECS000030', 9, 18.00, 1),
	(31, '摩托罗拉E8', 3, 2, 'ECS000031', 1, 1337.00, 5),
	(32, '诺基亚N85', 3, 1, 'ECS000032', 1, 3010.00, 9);

-- 改变字段类型
alter table goods change shop_price shop_price decimal(10,2);

-- 通配符
-- 多个字符 %
mysql> select * from goods where goods_name like "诺基亚%";
-- 单个字符 _
mysql> select * from goods where goods_name like "诺基亚N__";

-- 替换
-- 第一种方法: 
UPDATE goods
SET goods_name= replace(goods_name, '诺基亚', 'HTC')
WHERE goods_name LIKE '诺基亚%';
-- 第二种方法: 
UPDATE goods
set goods_name= concat("诺基亚",substring(goods_name,3))
where goods_name like "HTC%";
