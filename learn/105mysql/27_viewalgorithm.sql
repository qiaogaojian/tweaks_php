视图存储的都是语句

简单语法  建视图的语句 + 查视图的语句 ==> 查物理表的语句   merge

复杂语法  先执行View语句 ==> 再执行查询语句               temptable

create algorithm = merge view mergeview as select from goods_id, goods_name from goods;