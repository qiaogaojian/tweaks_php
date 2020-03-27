# MySql

## table 表 : 多行多列数据

## database 数据库: 相同类别的表的集合

## server 数据库服务器: 多个数据库存放的服务器

## 安装后更改初始密码

- 先在 my.ini mysqld 下面添加 skip-grant-tables=1

- 命令行输入 mysql 输入以下命令

```sql
update mysql.user set authentication_string=password('newpassword') where user='root';

alter user 'root'@'localhost' identified by 'root';
```
