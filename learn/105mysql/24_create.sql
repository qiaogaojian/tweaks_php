create table users
(
    Id int unsigned primary key auto_increment,
    Username char(10),
    gender char(1),
    weight tinyint unsigned,
    Birth date,
    Salary Decimal(8,2),
    lastlogin int unsigned
)charset=utf8;

create table userinfo
(
    Id int unsigned primary key auto_increment,
    Username char(10),
    intro varchar(1500)
)charset=utf8;