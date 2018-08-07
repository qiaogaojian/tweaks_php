# 数据库数据描述语言

    建表就是声明表头的过程

## 数值型

### 整型数值范围

-----------
|类型|字节数|范围|
|---|---|---:|
|tinyint| 1 8位|+-128|
|smallint| 2 16位|+-32, 768|
|mediumint| 3 24位|+-8, 388, 608|
|int| 4 32位|+-2, 147, 483, 648|
|bigint| 8 64位|+-9, 223, 372, 036, 854, 775, 808|

### 可选参数

#### unsigned 无符号

#### zerofill(M) 固定宽度M 填充0 (隐含附带 unsigned 属性)

## 浮点和定点

### 浮点

会有精度损失

#### float

#### double

### 定点

没有精度损失

#### decimal

### [M,D] M:位数 D:精度

## 字符串

### char

定长 速度快

### varchar

不定长 速度慢

### blob

二进制 防止字符集过滤信息丢失

### enum

固定的几个值

### 常见字符长度

#### 英文字母

##### GBK: 1

##### UTF8: 1

#### 中文汉字

##### GBK: 2

##### UTF8: 3

#### 标点符号

##### GBK: 1

##### UTF8: 1

## 日期时间

### year

### date

### time

### datetime

### timestamp

## 默认值

### not null default 'value'

### primary key

### auto increment

## 类型取值范围汇总

-----------
|类 型|大 小|描 述|
|---|---|---|
|CAHR(Length)|Length字节|定长字段，长度为0~255个字符|
|VARCHAR(Length)|String长度:1字节或String长度:2字节|变长字段，长度为0~65 535个字符|
| TINYTEXT|String长度:1字节|字符串，最大长度为255个字符|
| TEXT|String长度:2字节|字符串，最大长度为65 535个字符|
| MEDIUMTEXT|String长度:3字节|字符串，最大长度为16 777 215个字符|
| LONGTEXT|String长度:4字节|字符串，最大长度为4 294 967 295个字符|
| TINYINT(Length)|1字节|范围：-128~127，或者0~255（无符号）|
| SMALLINT(Length)|2字节|范围：-32 768~32 767，或者0~65 535（无符号）|
| MEDIUMINT(Length)|3字节|范围：-8 388 608~8 388 607，或者0~16 777 215（无符号）|
| INT(Length)|4字节|范围：-2 147 483 648~2 147 483 647，或者0~4 294 967 295（无符号）|
| BIGINT(Length)|8字节|范围：-9 223 372 036 854 775 808~9 223 372 036 854 775 807，或者0~18  446 744 073 709 551 615（无符号）|
| FLOAT(Length, Decimals)|4字节|具有浮动小数点的较小的数|
| DOUBLE(Length, Decimals)|8字节|具有浮动小数点的较大的数|
| DECIMAL(Length, Decimals)|Length:1字节或Length:2字节|存储为字符串的DOUBLE，允许固定的小数点|
| DATE|3字节|采用YYYY-MM-DD格式|
| DATETIME|8字节|采用YYYY-MM-DD HH:MM:SS格式|
| TIMESTAMP|4字节|采用YYYYMMDDHHMMSS格式；可接受的范围终止于2037年|
| TIME|3字节|采用HH:MM:SS格式|
| ENUM|1或2字节|Enumeration(枚举)的简写，这意味着每一列都可以具有多个可能的值之一|
| SET|1、2、3、4或8字节|与ENUM一样，只不过每一列都可以具有多个可能的值|

## 优化

### 定长不定长分离

### 常用不常用分离
