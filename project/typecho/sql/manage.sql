
// 分类信息
truncate typecho_metas;

insert into typecho_metas
values
(1, "Unity", "Unity", "category", "Unity3d游戏开发", 2, 1, 0),
(2, "PHP", "PHP", "category", "PHP开发", 0, 2, 0),
(3, "Kali", "Kali", "category", "Kali网络安全", 0, 3, 0),
(4, "Python", "Python", "category", "Python开发", 0, 4, 0),
(5, "Android", "Android", "category", "Android开发", 0, 5, 0),
(6, "Web", "Web", "category", "Web开发", 0, 6, 0),
(7, "BlockChain", "BlockChain", "category", "区块链应用开发", 0, 7, 0),
(8, "OprationSystem", "OS", "category", "操作系统相关", 0, 8, 0),
(9, "Tools", "Tools", "category", "编程工具使用", 0, 9, 0),
(10, "Linux", "Linux", "category", "Linux操作系统", 0, 1, 8),
(11, "Mac", "Mac", "category", "Mac操作系统", 0, 2, 8),
(12, "Windows", "Windows", "category", "Windows操作系统", 0, 3, 8),
(13, "Utils", "Utils", "category", "小工具", 0, 1, 9),
(14, "Git", "Git", "category", "Git使用", 0, 2, 9),
(15, "VSCode", "VSCode", "category", "VSCode使用", 0, 3, 9),
(16, "Tips", "Tips", "tag", NULL, 2, 0, 0);


`cid`       int(10) unsigned NOT NULL AUTO_INCREMENT,
`title`     varchar(150) DEFAULT NULL,
`slug`      varchar(150) DEFAULT NULL,
`created`   int(10) unsigned DEFAULT '0',
`modified`  int(10) unsigned DEFAULT '0',
`text`      longtext,
`order`     int(10) unsigned DEFAULT '0',
`authorId`  int(10) unsigned DEFAULT '0',
`template`  varchar(32) DEFAULT NULL,
`type`      varchar(16) DEFAULT 'post',
`status`    varchar(16) DEFAULT 'publish',
`password`  varchar(32) DEFAULT NULL,
`commentsNum` int(10) unsigned DEFAULT '0',
`allowComment` char(1) DEFAULT '0',
`allowPing` char(1) DEFAULT '0',
`allowFeed` char(1) DEFAULT '0',
`parent`    int(10) unsigned DEFAULT '0',


// 更新文章类别分类关系表
update typecho_metas set mid = 1 where mid = 2;
