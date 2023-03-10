/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : wwwwwww

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-04-15 19:17:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_action
-- ----------------------------
DROP TABLE IF EXISTS `sys_action`;
CREATE TABLE `sys_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of sys_action
-- ----------------------------
INSERT INTO `sys_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `sys_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `sys_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `sys_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `sys_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `sys_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `sys_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `sys_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `sys_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `sys_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `sys_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');

-- ----------------------------
-- Table structure for sys_action_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_action_log`;
CREATE TABLE `sys_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=575 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of sys_action_log
-- ----------------------------
INSERT INTO `sys_action_log` VALUES ('560', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-15 10:27登录了后台', '1', '1460687261');
INSERT INTO `sys_action_log` VALUES ('561', '11', '1', '2130706433', 'category', '49', '操作url：/xinban/admin.php?s=/Category/remove/id/49.html', '1', '1460687398');
INSERT INTO `sys_action_log` VALUES ('562', '11', '1', '2130706433', 'category', '51', '操作url：/xinban/admin.php?s=/Category/remove/id/51.html', '1', '1460687426');
INSERT INTO `sys_action_log` VALUES ('563', '11', '1', '2130706433', 'category', '53', '操作url：/xinban/admin.php?s=/Category/remove/id/53.html', '1', '1460687430');
INSERT INTO `sys_action_log` VALUES ('564', '11', '1', '2130706433', 'category', '54', '操作url：/xinban/admin.php?s=/Category/remove/id/54.html', '1', '1460687432');
INSERT INTO `sys_action_log` VALUES ('565', '11', '1', '2130706433', 'category', '52', '操作url：/xinban/admin.php?s=/Category/remove/id/52.html', '1', '1460687435');
INSERT INTO `sys_action_log` VALUES ('566', '11', '1', '2130706433', 'category', '55', '操作url：/xinban/admin.php?s=/Category/remove/id/55.html', '1', '1460687438');
INSERT INTO `sys_action_log` VALUES ('567', '11', '1', '2130706433', 'category', '57', '操作url：/xinban/admin.php?s=/Category/remove/id/57.html', '1', '1460687440');
INSERT INTO `sys_action_log` VALUES ('568', '11', '1', '2130706433', 'category', '56', '操作url：/xinban/admin.php?s=/Category/remove/id/56.html', '1', '1460687443');
INSERT INTO `sys_action_log` VALUES ('569', '11', '1', '2130706433', 'category', '50', '操作url：/xinban/admin.php?s=/Category/remove/id/50.html', '1', '1460687516');
INSERT INTO `sys_action_log` VALUES ('570', '10', '1', '2130706433', 'Menu', '0', '操作url：/xinban/admin.php?s=/Menu/del/id/174.html', '1', '1460687547');
INSERT INTO `sys_action_log` VALUES ('571', '10', '1', '2130706433', 'Menu', '0', '操作url：/xinban/admin.php?s=/Menu/del/id/175.html', '1', '1460687559');
INSERT INTO `sys_action_log` VALUES ('572', '10', '1', '2130706433', 'Menu', '0', '操作url：/xinban/admin.php?s=/Menu/del/id/171.html', '1', '1460687568');
INSERT INTO `sys_action_log` VALUES ('573', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-15 19:08登录了后台', '1', '1460718526');
INSERT INTO `sys_action_log` VALUES ('574', '10', '1', '2130706433', 'Menu', '43', '操作url：/xinban/admin.php?s=/Menu/edit.html', '1', '1460718550');

-- ----------------------------
-- Table structure for sys_addons
-- ----------------------------
DROP TABLE IF EXISTS `sys_addons`;
CREATE TABLE `sys_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of sys_addons
-- ----------------------------
INSERT INTO `sys_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `sys_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `sys_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `sys_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `sys_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `sys_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `sys_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');
INSERT INTO `sys_addons` VALUES ('16', 'UploadImages', '多图上传', '多图上传', '1', 'null', '木梁大囧', '1.2', '1458469947', '0');

-- ----------------------------
-- Table structure for sys_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_attachment`;
CREATE TABLE `sys_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of sys_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for sys_attribute
-- ----------------------------
DROP TABLE IF EXISTS `sys_attribute`;
CREATE TABLE `sys_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of sys_attribute
-- ----------------------------
INSERT INTO `sys_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '[DOCUMENT_POSITION]', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `sys_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `sys_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `sys_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `sys_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('33', 'game_name', '游戏名称', 'varchar(30) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('34', 'game_appid', '游戏appid', 'varchar(32) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('35', 'sort', '排序', 'int(11) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('36', 'short', '简拼', 'varchar(10) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('37', 'game_type', '游戏类型', 'tinyint(2) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('38', 'category', '游戏分组', 'tinyint(2) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('39', 'and_dow_address', '安卓下载地址', 'varchar(255) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('40', 'ios_dow_address', 'IOS下载', 'varchar(255) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('41', 'game_address', '游戏进入地址', 'varchar(255) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('42', 'dow_num', '下载数', 'int(10) NOT NULL ', 'string', '0', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('43', 'version', '游戏版本', 'varchar(10) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('44', 'game_size', '游戏大小', 'varchar(10) NOT NULL ', 'string', '0', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('45', 'icon', '图标', 'int(10) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('46', 'cover', '封面', 'int(10) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('47', 'screenshot', '截图', 'varchar(30) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('48', 'game_status', '游戏状态', 'tinyint(2) NOT NULL ', 'string', '1', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('49', 'recommend_status', '推荐状态', 'tinyint(2) NOT NULL ', 'string', '1', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('50', 'pay_status', '支付状态', 'tinyint(2) NOT NULL ', 'string', '1', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('51', 'dow_status', '下载状态', 'tinyint(2) NOT NULL ', 'string', '1', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('52', 'game_score', '游戏评分', 'varchar(10) NOT NULL ', 'string', '0', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('53', 'features', '游戏特征', 'varchar(30) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('54', 'recommend_level', '推荐指数', 'double(2,1) NOT NULL ', 'string', '0.0', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('55', 'create_time', '', 'int(11) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1457707158', '1457707158', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('56', 'keyword', '关键字', 'varchar(30) NULL ', 'string', '', '', '1', '', '5', '0', '1', '1457707497', '1457707497', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('57', 'coop_id', '合作id', 'varchar(30) NULL ', 'string', '', '', '1', '', '5', '0', '1', '1457707497', '1457707497', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('58', 'game_coin_name', '游戏币名称', 'varchar(10) NULL ', 'string', '', '', '1', '', '5', '0', '1', '1457707497', '1457707497', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('59', 'game_coin_ration', '游戏币比例', 'varchar(10) NULL ', 'string', '', '', '1', '', '5', '0', '1', '1457707497', '1457707497', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('60', 'game_bbs', '官网论坛', 'varchar(255) NULL ', 'string', '', '', '1', '', '5', '0', '1', '1457707497', '1457707497', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('61', 'game_website', '游戏官网', 'varchar(255) NULL ', 'string', '', '', '1', '', '5', '0', '1', '1457707497', '1457707497', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('62', 'qq_group', 'QQ群', 'varchar(100) NULL ', 'string', '', '', '1', '', '5', '0', '1', '1457707497', '1457707497', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('63', 'operator', '运营商', 'varchar(30) NULL ', 'string', '', '', '1', '', '5', '0', '1', '1457707497', '1457707497', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('64', 'introduction', '简介', 'varchar(300) NULL ', 'string', '', '', '1', '', '5', '0', '1', '1457707497', '1457707497', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('65', 'game_id', '游戏id', 'int(11) NULL ', 'string', '', '', '1', '', '6', '0', '1', '1457766728', '1457766728', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('66', 'area_name', '区服名称', 'varchar(30) NULL ', 'string', '', '', '1', '', '6', '0', '1', '1457766728', '1457766728', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('67', 'area_num', '区服编号', 'int(10) NULL ', 'string', '0', '', '1', '', '6', '0', '1', '1457766728', '1457766728', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('68', 'recommend_status', '推荐状态', 'tinyint(2) NULL ', 'string', '1', '', '1', '', '6', '0', '1', '1457766728', '1457766728', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('69', 'show_status', '显示状态', 'tinyint(2) NULL ', 'string', '1', '', '1', '', '6', '0', '1', '1457766728', '1457766728', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('70', 'stop_status', '停服状态', 'tinyint(2) NULL ', 'string', '1', '', '1', '', '6', '0', '1', '1457766728', '1457766728', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('71', 'area_status', '区服状态', 'tinyint(2) NULL ', 'string', '1', '', '1', '', '6', '0', '1', '1457766728', '1457766728', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('72', 'icon', '图标', 'int(10) NULL ', 'string', '0', '', '1', '', '6', '0', '1', '1457766728', '1457766728', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('73', 'start_time', '开始时间', 'int(11) NULL ', 'string', '', '', '1', '', '6', '0', '1', '1457766728', '1457766728', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('74', 'desride', '描述', 'varchar(300) NULL ', 'string', '', '', '1', '', '6', '0', '1', '1457766728', '1457766728', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('75', 'prompt', '提示', 'varchar(300) NULL ', 'string', '', '', '1', '', '6', '0', '1', '1457766728', '1457766728', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('76', 'parent_id', '父类ID', 'int(10) NULL ', 'string', '0', '', '1', '', '6', '0', '1', '1457766728', '1457766728', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('77', 'create_time', '创建时间', 'int(11) NULL ', 'string', '', '', '1', '', '6', '0', '1', '1457766728', '1457766728', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('78', 'game_id', '游戏id', 'int(11) NULL ', 'string', '', '', '1', '', '7', '0', '1', '1457779785', '1457779785', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('79', 'area_id', '区服id', 'int(11) NULL ', 'string', '', '', '1', '', '7', '0', '1', '1457779785', '1457779785', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('80', 'giftbag_name', '礼包名称', 'varchar(30) NULL ', 'string', '', '', '1', '', '7', '0', '1', '1457779785', '1457779785', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('81', 'giftbag_type', '礼包类型', 'tinyint(2) NULL ', 'string', '', '', '1', '', '7', '0', '1', '1457779785', '1457779785', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('82', 'level', '领取等级', 'int(3) NULL ', 'string', '', '', '1', '', '7', '0', '1', '1457779785', '1457779785', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('83', 'sort', '排序', 'int(10) NULL ', 'string', '0', '', '1', '', '7', '0', '1', '1457779785', '1457779785', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('84', 'status', '状态', 'tinyint(2) NULL ', 'string', '1', '', '1', '', '7', '0', '1', '1457779785', '1457779785', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('85', 'call_api', '调用接口', 'tinyint(2) NULL ', 'string', '0', '', '1', '', '7', '0', '1', '1457779785', '1457779785', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('86', 'tong_server', '是否通服', 'tinyint(2) NULL ', 'string', '0', '', '1', '', '7', '0', '1', '1457779785', '1457779785', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('87', 'novice', '激活码', 'varchar(3000) NULL ', 'string', '', '', '1', '', '7', '0', '1', '1457779785', '1457779785', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('88', 'digest', '摘要', 'varchar(300) NULL ', 'string', '', '', '1', '', '7', '0', '1', '1457779785', '1457779785', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('89', 'desribe', '描述', 'varchar(300) NULL ', 'string', '', '', '1', '', '7', '0', '1', '1457779785', '1457779785', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('90', 'start_time', '开始时间', 'int(11) NULL ', 'string', '', '', '1', '', '7', '0', '1', '1457779785', '1457779785', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('91', 'end_time', '结束时间', 'int(11) NULL ', 'string', '', '', '1', '', '7', '0', '1', '1457779785', '1457779785', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('92', 'create_time', '创建时间', 'int(11) NULL ', 'string', '', '', '1', '', '7', '0', '1', '1457779785', '1457779785', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('93', 'account', '账号', 'varchar(30) NULL ', 'string', '', '', '1', '', '8', '0', '1', '1457829118', '1457829118', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('94', 'password', '密码', 'varchar(32) NULL ', 'string', '', '', '1', '', '8', '0', '1', '1457829118', '1457829118', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('95', 'second_pwd', '二级密码', 'varchar(32) NULL ', 'string', '', '', '1', '', '8', '0', '1', '1457829118', '1457829118', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('96', 'nickname', '昵称', 'varchar(30) NULL ', 'string', '', '', '1', '', '8', '0', '1', '1457829119', '1457829119', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('97', 'mobile_phone', '手机号', 'varchar(11) NULL ', 'string', '', '', '1', '', '8', '0', '1', '1457829119', '1457829119', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('98', 'email', '邮箱', 'varchar(50) NULL ', 'string', '', '', '1', '', '8', '0', '1', '1457829119', '1457829119', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('99', 'real_name', '真实姓名', 'varchar(10) NULL ', 'string', '', '', '1', '', '8', '0', '1', '1457829119', '1457829119', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('100', 'bank_name', '银行', 'varchar(50) NULL ', 'string', '', '', '1', '', '8', '0', '1', '1457829119', '1457829119', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('101', 'bank_card', '银行卡', 'varchar(20) NULL ', 'string', '', '', '1', '', '8', '0', '1', '1457829119', '1457829119', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('102', 'money', '金额', 'double(10,2) NULL ', 'string', '0.00', '', '1', '', '8', '0', '1', '1457829119', '1457829119', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('103', 'total_money', '总金额', 'double(10,2) NULL ', 'string', '0.00', '', '1', '', '8', '0', '1', '1457829119', '1457829119', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('104', 'balance_coin', '平台币', 'double(10,2) NULL ', 'string', '0.00', '', '1', '', '8', '0', '1', '1457829119', '1457829119', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('105', 'promote_type', '推广员类型', 'int(2) NULL ', 'string', '1', '', '1', '', '8', '0', '1', '1457829119', '1457829119', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('106', 'status', '状态', 'int(11) NULL ', 'string', '1', '', '1', '', '8', '0', '1', '1457829119', '1457829119', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('107', 'parent_id', '父类ID', 'int(11) NULL ', 'string', '0', '', '1', '', '8', '0', '1', '1457829119', '1457829119', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('108', 'referee_id', '推荐人ID', 'int(11) NULL ', 'string', '0', '', '1', '', '8', '0', '1', '1457829119', '1457829119', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('109', 'create_time', '添加时间', 'int(11) NULL ', 'string', '', '', '1', '', '8', '0', '1', '1457829119', '1457829119', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('110', 'game_id', '游戏ID', 'int(11) NULL ', 'string', '', '', '1', '', '10', '0', '1', '1457933134', '1457933134', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('111', 'promote_id', '推广员ID', 'int(11) NULL ', 'string', '', '', '1', '', '10', '0', '1', '1457933134', '1457933134', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('112', 'ratio', '分成比例', 'int(3) NULL ', 'string', '0', '', '1', '', '10', '0', '1', '1457933134', '1457933134', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('113', 'apply_time', '申请时间', 'int(11) NULL ', 'string', '', '', '1', '', '10', '0', '1', '1457933134', '1457933134', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('114', 'status', '审核状态', 'tinyint(2) NULL ', 'string', '', '', '1', '', '10', '0', '1', '1457933134', '1457933134', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('115', 'enable_status', '操作状态', 'tinyint(2) NULL ', 'string', '', '', '1', '', '10', '0', '1', '1457933134', '1457933134', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('116', 'pack_url', '游戏包地址', 'varchar(255) NULL ', 'string', '', '', '1', '', '10', '0', '1', '1457933134', '1457933134', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('117', 'dow_url', '下载地址', 'varchar(255) NULL ', 'string', '', '', '1', '', '10', '0', '1', '1457933134', '1457933134', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('118', 'dispose_id', '操作人', 'int(11) NULL ', 'string', '', '', '1', '', '10', '0', '1', '1457933134', '1457933134', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('119', 'dispose_time', '操作时间', 'int(11) NULL ', 'string', '', '', '1', '', '10', '0', '1', '1457933134', '1457933134', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('120', 'game_id', '游戏id', 'int(11) NULL ', 'string', '', '', '1', '', '11', '0', '1', '1458193581', '1458193581', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('121', 'user_id', '用户id', 'int(11) NULL ', 'string', '', '', '1', '', '11', '0', '1', '1458193581', '1458193581', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('122', 'title', '标题', 'varchar(50) NULL ', 'string', '', '', '1', '', '11', '0', '1', '1458193581', '1458193581', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('123', 'content', '内容', 'varchar(300) NULL ', 'string', '', '', '1', '', '11', '0', '1', '1458193581', '1458193581', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('124', 'status', '修复状态(0:未,1:已)', 'tinyint(2) NULL ', 'string', '0', '', '1', '', '11', '0', '1', '1458193581', '1458193581', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('125', 'type', '类型(0:纠错,1:留言)', 'tinyint(2) NULL ', 'string', '0', '', '1', '', '11', '0', '1', '1458193581', '1458193581', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('126', 'op_id', '操作人id', 'int(11) NULL ', 'string', '', '', '1', '', '11', '0', '1', '1458193581', '1458193581', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('127', 'op_account', '操作人账号', 'varchar(20) NULL ', 'string', '', '', '1', '', '11', '0', '1', '1458193581', '1458193581', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('128', 'create_time', '修改时间', 'int(11) NULL ', 'string', '', '', '1', '', '11', '0', '1', '1458193581', '1458193581', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('129', 'game_id', '游戏id', 'int(11) NULL ', 'string', '', '', '1', '', '12', '0', '1', '1458195085', '1458195085', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('130', 'game_name', '游戏名称', 'varchar(30) NULL ', 'string', '', '', '1', '', '12', '0', '1', '1458195085', '1458195085', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('131', 'gift_id', '礼包id', 'int(11) NULL ', 'string', '', '', '1', '', '12', '0', '1', '1458195085', '1458195085', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('132', 'gift_name', '礼包名称', 'varchar(30) NULL ', 'string', '', '', '1', '', '12', '0', '1', '1458195085', '1458195085', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('133', 'status', '状态(0:未使用,1:已使用)', 'tinyint(2) NULL ', 'string', '1', '', '1', '', '12', '0', '1', '1458195085', '1458195085', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('134', 'novice', '激活码', 'varchar(30) NULL ', 'string', '', '', '1', '', '12', '0', '1', '1458195085', '1458195085', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('135', 'user_id', '用户id', 'int(11) NULL ', 'string', '', '', '1', '', '12', '0', '1', '1458195085', '1458195085', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('136', 'create_time', '创建时间', 'int(11) NULL ', 'string', '', '', '1', '', '12', '0', '1', '1458195085', '1458195085', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('189', 'sort', '', 'int(11) NOT NULL ', 'string', '', '', '1', '', '20', '0', '1', '1460433026', '1460433026', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('186', 'name', '游戏分类名', 'varchar(30) NULL ', 'string', '', '', '1', '', '20', '0', '1', '1460433026', '1460433026', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('187', 'status', '分类状态', 'tinyint(2) NOT NULL ', 'string', '1', '', '1', '', '20', '0', '1', '1460433026', '1460433026', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('188', 'icon', '分类图标', 'int(10) NOT NULL ', 'string', '', '', '1', '', '20', '0', '1', '1460433026', '1460433026', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('151', 'title', '标题', 'varchar(50) NULL ', 'string', '', '', '1', '', '15', '0', '1', '1458478006', '1458478006', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('152', 'link_url', '友链地址', 'varchar(255) NULL ', 'string', '', '', '1', '', '15', '0', '1', '1458478006', '1458478006', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('153', 'link_icon', '图标', 'int(11) NULL ', 'string', '', '', '1', '', '15', '0', '1', '1458478006', '1458478006', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('154', 'status', '状态', 'tinyint(2) NULL ', 'string', '', '', '1', '', '15', '0', '1', '1458478006', '1458478006', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('155', 'type', '类型', 'tinyint(2) NOT NULL ', 'string', '', '', '1', '', '15', '0', '1', '1458478006', '1458478006', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('156', 'remark', '备注', 'varchar(255) NULL ', 'string', '', '', '1', '', '15', '0', '1', '1458478006', '1458478006', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('157', 'create_time', '创建时间', 'int(11) NULL ', 'string', '', '', '1', '', '15', '0', '1', '1458478006', '1458478006', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('158', 'gameid', '游戏id', 'int(11) NULL ', 'string', '', '', '1', '', '16', '0', '1', '1458483897', '1458483897', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('159', 'gamename', '游戏名称', 'varchar(20) NULL ', 'string', '', '', '1', '', '16', '0', '1', '1458483897', '1458483897', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('160', 'webname', '网站名称', 'varchar(20) NULL ', 'string', '', '', '1', '', '16', '0', '1', '1458483897', '1458483897', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('161', 'keyword', '关键字', 'varchar(30) NULL ', 'string', '', '', '1', '', '16', '0', '1', '1458483897', '1458483897', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('162', 'weburl', '网站地址', 'varchar(255) NULL ', 'string', '', '', '1', '', '16', '0', '1', '1458483897', '1458483897', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('163', 'describe', '描述', 'varchar(255) NULL ', 'string', '', '', '1', '', '16', '0', '1', '1458483897', '1458483897', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('164', 'logo', '图标', 'int(11) NULL ', 'string', '', '', '1', '', '16', '0', '1', '1458483897', '1458483897', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('165', 'backgroundimg', '背景图', 'int(11) NULL ', 'string', '', '', '1', '', '16', '0', '1', '1458483897', '1458483897', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('166', 'backgroundcolor', '背景色', 'varchar(20) NULL ', 'string', '', '', '1', '', '16', '0', '1', '1458483897', '1458483897', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('167', 'templateid', '模板id', 'int(11) NULL ', 'string', '', '', '1', '', '16', '0', '1', '1458483897', '1458483897', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('168', 'templatename', '模板名称', 'varchar(20) NULL ', 'string', '', '', '1', '', '16', '0', '1', '1458483897', '1458483897', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('169', 'createtime', '创建时间', 'datetime NULL ', 'string', '', '', '1', '', '16', '0', '1', '1458483897', '1458483897', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('170', 'temname', '模板名称', 'varchar(20) NULL ', 'string', '', '', '1', '', '17', '0', '1', '1458484201', '1458484201', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('171', 'mark', '标示', 'varchar(20) NULL ', 'string', '', '', '1', '', '17', '0', '1', '1458484201', '1458484201', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('172', 'picture', '缩略图', 'int(11) NULL ', 'string', '', '', '1', '', '17', '0', '1', '1458484201', '1458484201', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('173', 'path', '路径', 'varchar(255) NULL ', 'string', '', '', '1', '', '17', '0', '1', '1458484201', '1458484201', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('174', 'slidetitle', '幻灯片标题', 'varchar(20) NULL ', 'string', '', '', '1', '', '18', '0', '1', '1458484325', '1458484325', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('175', 'slideurl', '幻灯片标题', 'varchar(255) NULL ', 'string', '', '', '1', '', '18', '0', '1', '1458484325', '1458484325', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('176', 'slidedes', '幻灯片描述', 'varchar(50) NULL ', 'string', '', '', '1', '', '18', '0', '1', '1458484325', '1458484325', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('177', 'slidecon', '幻灯片内容', 'varchar(300) NULL ', 'string', '', '', '1', '', '18', '0', '1', '1458484325', '1458484325', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('178', 'cover', '封面', 'int(11) NULL ', 'string', '', '', '1', '', '18', '0', '1', '1458484325', '1458484325', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('179', 'status', '状态', 'tinyint(2) NULL ', 'string', '', '', '1', '', '18', '0', '1', '1458484325', '1458484325', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('180', 'classify', '分类id', 'int(11) NULL ', 'string', '', '', '1', '', '18', '0', '1', '1458484325', '1458484325', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('181', 'createtime', '添加时间', 'datetime NULL ', 'string', '', '', '1', '', '18', '0', '1', '1458484325', '1458484325', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('182', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'string', '0', '', '1', '', '18', '0', '1', '1458484325', '1458484325', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('183', 'typename', '类型名称', 'varchar(20) NULL ', 'string', '', '', '1', '', '19', '0', '1', '1458484381', '1458484381', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('184', 'typemark', '类型标示', 'varchar(20) NULL ', 'string', '', '', '1', '', '19', '0', '1', '1458484381', '1458484381', '', '0', '', '', '', '0', '');
INSERT INTO `sys_attribute` VALUES ('185', 'describe', '类型描述', 'varchar(30) NULL ', 'string', '', '', '1', '', '19', '0', '1', '1458484381', '1458484381', '', '0', '', '', '', '0', '');

-- ----------------------------
-- Table structure for sys_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_extend`;
CREATE TABLE `sys_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of sys_auth_extend
-- ----------------------------
INSERT INTO `sys_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `sys_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `sys_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `sys_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `sys_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `sys_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `sys_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `sys_auth_extend` VALUES ('1', '37', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '1', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '2', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '39', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '40', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '41', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '42', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '43', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '44', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '45', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '46', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '47', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '48', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '49', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '50', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '51', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '52', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '53', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '54', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '55', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '56', '1');
INSERT INTO `sys_auth_extend` VALUES ('9', '57', '1');

-- ----------------------------
-- Table structure for sys_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_group`;
CREATE TABLE `sys_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_auth_group
-- ----------------------------
INSERT INTO `sys_auth_group` VALUES ('1', 'admin', '1', '超级管理员', '最高权限，建议总经理，副总，技术总监使用', '1', '1,2,3,4,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,100,102,103,107,108,109,110,195,209,210,211,217,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259');
INSERT INTO `sys_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');
INSERT INTO `sys_auth_group` VALUES ('3', 'admin', '1', '媒体', '媒体用于日常新闻运维和维护', '1', '');
INSERT INTO `sys_auth_group` VALUES ('4', 'admin', '1', 'SEO', '搜索优化和新闻发布', '1', '');
INSERT INTO `sys_auth_group` VALUES ('5', 'admin', '1', '总监', '掌握其他运营日常绩效等', '1', '');
INSERT INTO `sys_auth_group` VALUES ('6', 'admin', '1', '运营', '日常运营和渠道专员', '1', '');
INSERT INTO `sys_auth_group` VALUES ('7', 'admin', '1', '财务', '负责日常财务统计，报表整理', '1', '');
INSERT INTO `sys_auth_group` VALUES ('8', 'admin', '1', '客服', '针对玩家，处理游戏上和账号密码找回服务的', '1', '');
INSERT INTO `sys_auth_group` VALUES ('9', 'admin', '1', '演示', '对外演示账户', '1', '1,3,5,7,8,9,10,11,12,13,14,15,16,17,18,65,79,89,90,91,92,93,107,109,110,211,217,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,263,264,265,266,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286');

-- ----------------------------
-- Table structure for sys_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_group_access`;
CREATE TABLE `sys_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_auth_group_access
-- ----------------------------
INSERT INTO `sys_auth_group_access` VALUES ('2', '2');
INSERT INTO `sys_auth_group_access` VALUES ('3', '9');

-- ----------------------------
-- Table structure for sys_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_rule`;
CREATE TABLE `sys_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=287 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_auth_rule
-- ----------------------------
INSERT INTO `sys_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/index', '内容', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('17', 'admin', '1', 'Admin/Article/examine', '审核列表', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '管理员列表', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '管理员行为', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '角色管理', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('217', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('218', 'admin', '1', 'Admin/think/lists', '数据列表', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('219', 'admin', '1', 'Admin/Game/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('220', 'admin', '1', 'Admin/Game/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('221', 'admin', '1', 'Admin/Game/sort', '排序', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('222', 'admin', '1', 'Admin/Area/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('223', 'admin', '1', 'Admin/Area/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('224', 'admin', '1', 'Admin/Giftbag/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('225', 'admin', '1', 'Admin/Giftbag/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('226', 'admin', '1', 'Admin/Query/user_edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('227', 'admin', '1', 'Admin/Apply/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('228', 'admin', '1', 'Admin/Statistics/index', '日常统计', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('229', 'admin', '1', 'Admin/Statistics/pay_way', '来款统计', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('230', 'admin', '1', 'Admin//Withdraw/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('231', 'admin', '1', 'Admin/Game/add_source', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('232', 'admin', '1', 'Admin//Mend/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('233', 'admin', '1', 'Admin/Game/lists', '游戏管理', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('234', 'admin', '1', 'Admin/Promote/lists', '推广员管理', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('235', 'admin', '1', 'Admin/Provide/provide', '发放记录', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('236', 'admin', '1', 'Admin/Apply/lists', '推广审核', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('237', 'admin', '1', 'Admin/Game/source', '原包上传', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('238', 'admin', '1', 'Admin/Provide/recharge', '充值记录', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('239', 'admin', '1', 'Admin/Mend/lists', '渠道补链', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('240', 'admin', '1', 'Admin/Game/update', '游戏更新', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('241', 'admin', '1', 'Admin/Provide/spend', '使用记录', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('242', 'admin', '2', 'Admin/Game/lists', '游戏', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('243', 'admin', '1', 'Admin/Area/lists', '区服管理', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('244', 'admin', '1', 'Admin/Settlement/lists', '推广结算', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('245', 'admin', '1', 'Admin/Provide/balance', '用户余额', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('246', 'admin', '2', 'Admin/Promote/lists', '推广', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('247', 'admin', '1', 'Admin/Giftbag/lists', '游戏礼包', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('248', 'admin', '1', 'Admin/Withdraw/lists', '推广提现', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('249', 'admin', '1', 'Admin/Statistics/cpa_login', '登陆统计', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('250', 'admin', '1', 'Admin/Query/register', '注册查询', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('251', 'admin', '1', 'Admin/Giftbag/record', '领取记录', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('252', 'admin', '2', 'Admin/Provide/provide', '平台币', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('253', 'admin', '1', 'Admin/Statistics/cpa_register', '注册统计', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('254', 'admin', '2', 'Admin/Statistics/index', '统计', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('255', 'admin', '1', 'Admin/Query/recharge', '充值查询', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('256', 'admin', '1', 'Admin/Message/wrong', '纠错管理', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('257', 'admin', '1', 'Admin/Statistics/cpa_recharge', '消费统计', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('258', 'admin', '1', 'Admin/Query/agent', '代充查询', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('259', 'admin', '1', 'Admin/Query/bill', '推广对账', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('260', 'admin', '1', 'Admin/Member/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('261', 'admin', '1', 'Admin/Member/user_info', '平台用户', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('262', 'admin', '1', 'Admin/#', '友链管理', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('263', 'admin', '1', 'Admin/SlideManage/index', '广告管理', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('264', 'admin', '1', 'Admin/SlideType/index', '广告类型', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('265', 'admin', '1', 'Admin/WebConfig/group?websiteid=2', '推广官网', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('266', 'admin', '1', 'Admin/WebConfig/group?websiteid=1', '媒体官网', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('267', 'admin', '1', 'Admin/WebConfig/group?websiteid=3', '页游官网', '-1', '');
INSERT INTO `sys_auth_rule` VALUES ('268', 'admin', '1', 'Admin/Selfbuilt/index', '自建官网', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('269', 'admin', '1', 'Admin/Template/index', '自建模板', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('270', 'admin', '1', 'Admin/Links/lists', '友链管理', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('271', 'admin', '1', 'Admin/Promote/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('272', 'admin', '1', 'Admin/WebConfig/index', '网站设置', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('273', 'admin', '1', 'Admin/SlideManage/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('274', 'admin', '1', 'Admin/SlideManage/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('275', 'admin', '1', 'Admin/SlideType/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('276', 'admin', '1', 'Admin/SlideType/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('277', 'admin', '1', 'Admin//Template/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('278', 'admin', '1', 'Admin/Template/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('279', 'admin', '1', 'Admin/Selfbuilt/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('280', 'admin', '1', 'Admin/Selfbuilt/edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('281', 'admin', '1', 'Admin/Provide/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('282', 'admin', '1', 'Admin/Provide/user_edit', '编辑', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('283', 'admin', '2', 'Admin/article/mydocument', '内容', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('284', 'admin', '1', 'Admin/Query/game_spend', '游戏充值', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('285', 'admin', '1', 'Admin/Links/add', '新增', '1', '');
INSERT INTO `sys_auth_rule` VALUES ('286', 'admin', '1', 'Admin/Links/edit', '编辑', '1', '');

-- ----------------------------
-- Table structure for sys_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of sys_category
-- ----------------------------
INSERT INTO `sys_category` VALUES ('1', 'tui', '推广官网', '0', '0', '10', '', '', '', '', '', '', '', '2,3', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1458047674', '1', '0', '');
INSERT INTO `sys_category` VALUES ('2', 'tui_zx', '游戏资讯', '1', '1', '10', '', '', '', '', '', '', '', '2', '2', '2,1,3', '0', '1', '1', '0', '0', '1', '', '1379475028', '1458752603', '1', '0', '');
INSERT INTO `sys_category` VALUES ('39', 'tui_gg', '游戏公告', '1', '0', '10', '', '', '', '', '', '', '', '2', '', '2', '0', '1', '1', '0', '0', '', null, '1458047816', '1458742839', '1', '0', '');
INSERT INTO `sys_category` VALUES ('40', 'tui_about', '关于我们', '1', '2', '10', '', '', '', '', '', '', '', '2', '', '2', '0', '1', '1', '0', '0', '', null, '1458047856', '1458751762', '1', '0', '');
INSERT INTO `sys_category` VALUES ('41', 'media', '媒体官网', '0', '1', '10', '', '', '', 'index', 'index', '', '', '', '', '2', '0', '1', '1', '0', '0', '', null, '1458047970', '1458090766', '1', '0', '');
INSERT INTO `sys_category` VALUES ('42', 'media_gg', '游戏公告', '41', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1458048150', '1458096106', '1', '0', '');
INSERT INTO `sys_category` VALUES ('43', 'media_new', '游戏新闻', '41', '1', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1458048177', '1458096117', '1', '0', '');
INSERT INTO `sys_category` VALUES ('44', 'media_activity', '游戏活动', '41', '2', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1458048213', '1458096129', '1', '0', '');
INSERT INTO `sys_category` VALUES ('45', 'media_partner', '合作伙伴', '41', '3', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1458048331', '1458096151', '1', '0', '');
INSERT INTO `sys_category` VALUES ('46', 'media_collaborate', '商务合作', '41', '4', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1458048430', '1458096159', '1', '0', '');
INSERT INTO `sys_category` VALUES ('47', 'media_supervise', '家长监督', '41', '6', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1458048514', '1458096178', '1', '0', '');
INSERT INTO `sys_category` VALUES ('48', 'media_about', '关于我们', '41', '5', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1458048652', '1458096169', '1', '0', '');

-- ----------------------------
-- Table structure for sys_channel
-- ----------------------------
DROP TABLE IF EXISTS `sys_channel`;
CREATE TABLE `sys_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_channel
-- ----------------------------
INSERT INTO `sys_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `sys_channel` VALUES ('2', '0', '全部应用', 'Article/game_list', '2', '1379475131', '1457953223', '1', '0');
INSERT INTO `sys_channel` VALUES ('3', '0', '资讯公告', 'Article/lists/category/tui_gg', '3', '1379475154', '1458751894', '1', '0');
INSERT INTO `sys_channel` VALUES ('4', '0', '关于我们', 'Article/detail/id/30', '4', '1457953825', '1458752025', '1', '0');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'vlcms', '1');
INSERT INTO `sys_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'vlcms', '8');
INSERT INTO `sys_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `sys_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `sys_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', '3');
INSERT INTO `sys_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `sys_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'blue_color', '10');
INSERT INTO `sys_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `sys_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `sys_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `sys_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `sys_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `sys_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `sys_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `sys_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `sys_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `sys_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `sys_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `sys_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `sys_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `sys_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `sys_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `sys_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `sys_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');
INSERT INTO `sys_config` VALUES ('38', 'WEB_DOMAIN_NAME', '1', '官网域名', '1', '', '用于保存域名方便调用', '1458608600', '1458608600', '1', '', '0');

-- ----------------------------
-- Table structure for sys_document
-- ----------------------------
DROP TABLE IF EXISTS `sys_document`;
CREATE TABLE `sys_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `group_id` smallint(3) unsigned NOT NULL COMMENT '所属分组',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of sys_document
-- ----------------------------
INSERT INTO `sys_document` VALUES ('1', '1', '', '《乱斗西游2》超级联赛S3赛季引爆全国', '43', '0', '全新造星舞台，为草根叩开职业大门！', '0', '0', '2', '2', '4', '0', '0', '1', '0', '0', '4', '0', '0', '15', '1458727260', '1458734043', '1');
INSERT INTO `sys_document` VALUES ('2', '1', '', '谁与争锋《武器大师》神兵利器大盘点', '43', '0', '俗话说，宝剑配英雄，鲜花送佳人。', '0', '0', '2', '2', '4', '0', '0', '1', '0', '0', '0', '0', '0', '14', '1458727320', '1458734029', '1');
INSERT INTO `sys_document` VALUES ('3', '1', '', '金猴闹新春《斗破苍穹》四海龙王齐拜年', '43', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1458727424', '1458727424', '1');
INSERT INTO `sys_document` VALUES ('4', '1', '', '神还原！《琅琊榜》建筑游戏中重现！', '43', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1458727443', '1458727443', '1');
INSERT INTO `sys_document` VALUES ('5', '1', '', '《怒斩三国》有爱就有礼,快乐周二送惊喜', '42', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1458727579', '1458727579', '1');
INSERT INTO `sys_document` VALUES ('6', '1', '', '热血游戏王开年首更新，豪礼送不停', '42', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1458727596', '1458727596', '1');
INSERT INTO `sys_document` VALUES ('7', '1', '', '我欲封天！一万份红包免费领', '44', '0', '', '0', '0', '2', '2', '0', '0', '27', '1', '0', '0', '0', '0', '0', '10', '1458732120', '1458734004', '1');
INSERT INTO `sys_document` VALUES ('8', '1', '', '一个人的江湖,首发好礼送不停', '44', '0', '', '0', '0', '2', '2', '0', '0', '28', '1', '0', '0', '2', '0', '0', '11', '1458733200', '1458733997', '1');
INSERT INTO `sys_document` VALUES ('9', '1', '', '梦幻西游手游元宵节新活动', '44', '0', '', '0', '0', '2', '2', '0', '0', '29', '1', '0', '0', '4', '0', '0', '12', '1458733260', '1458733988', '1');
INSERT INTO `sys_document` VALUES ('10', '1', '', '关于我们', '48', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '18', '0', '0', '0', '1458739200', '1458743179', '1');
INSERT INTO `sys_document` VALUES ('11', '1', '', '商务合作', '46', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '14', '0', '0', '0', '1458739260', '1458742345', '1');
INSERT INTO `sys_document` VALUES ('12', '1', '', '家长监督', '47', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '28', '0', '0', '0', '1458739500', '1458748673', '1');
INSERT INTO `sys_document` VALUES ('13', '1', '', '合作伙伴', '45', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '8', '0', '0', '0', '1458742310', '1458742310', '1');
INSERT INTO `sys_document` VALUES ('14', '1', 'test', '12', '2', '0', '12', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1458742803', '1458742803', '-1');
INSERT INTO `sys_document` VALUES ('15', '1', 'test1', '123', '39', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1458742858', '1458742858', '-1');
INSERT INTO `sys_document` VALUES ('16', '1', 'doc', 'doc', '39', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1458743098', '1458743098', '-1');
INSERT INTO `sys_document` VALUES ('17', '1', '', '热血游戏王开年首更新，豪礼送不停', '39', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1458744250', '1458744250', '1');
INSERT INTO `sys_document` VALUES ('18', '1', '', '《怒斩三国》有爱就有礼,快乐周二送惊喜', '42', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1458744272', '1458744272', '-1');
INSERT INTO `sys_document` VALUES ('19', '1', '', '《怒斩三国》有爱就有礼,快乐周二送惊喜', '39', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1458744293', '1458744293', '1');
INSERT INTO `sys_document` VALUES ('20', '1', '', '《乱斗西游2》超级联赛S3赛季引爆全国', '39', '0', '全新造星舞台，为草根叩开职业大门！', '0', '0', '2', '2', '4', '0', '0', '1', '0', '0', '11', '0', '0', '15', '1458744300', '1458744373', '1');
INSERT INTO `sys_document` VALUES ('21', '1', '', '谁与争锋《武器大师》神兵利器大盘点', '39', '0', '俗话说，宝剑配英雄，鲜花送佳人。', '0', '0', '2', '2', '4', '0', '0', '1', '0', '0', '2', '0', '0', '14', '1458744317', '1458744317', '1');
INSERT INTO `sys_document` VALUES ('22', '1', '', '神还原！《琅琊榜》建筑游戏中重现！', '39', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1458744329', '1458744329', '1');
INSERT INTO `sys_document` VALUES ('23', '1', '', '金猴闹新春《斗破苍穹》四海龙王齐拜年', '39', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1458744340', '1458744340', '1');
INSERT INTO `sys_document` VALUES ('24', '1', '', 'vlcms(溪谷软件)1.0免费版介绍', '2', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1458744628', '1458744628', '1');
INSERT INTO `sys_document` VALUES ('25', '1', '', '全国手机用户破13亿 4G用户比例达到29.6%', '2', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1458744665', '1458744665', '1');
INSERT INTO `sys_document` VALUES ('26', '1', '', '2016立游戏发展 还需直面发行推广问题', '2', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1458744691', '1458744691', '1');
INSERT INTO `sys_document` VALUES ('27', '1', '', '无责任猜想：假如中国统治了游戏界', '2', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1458744717', '1458744717', '1');
INSERT INTO `sys_document` VALUES ('28', '1', '', '八大趋势告诉你，未来互联网是这样的', '2', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1458744751', '1458744751', '1');
INSERT INTO `sys_document` VALUES ('29', '1', '', '直接、悬念及分享是手游留住玩家的关键', '2', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1458744789', '1458744789', '1');
INSERT INTO `sys_document` VALUES ('30', '1', '', '关于我们', '40', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '24', '0', '0', '0', '1458751781', '1458751781', '1');

-- ----------------------------
-- Table structure for sys_document_article
-- ----------------------------
DROP TABLE IF EXISTS `sys_document_article`;
CREATE TABLE `sys_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of sys_document_article
-- ----------------------------
INSERT INTO `sys_document_article` VALUES ('1', '0', '<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　全面革新的网易超人气MOBA手游《乱斗西游2》今日正式宣布，超级联赛S3赛季将再度拿出总额高达50万元的现金赛事奖金，遍邀各路高手决一胜负，3月2日约定你!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　无论你是光环加身的昔日冠军，还是踌躇满志的挑战者，只要敢报名参赛，就有机会登上全中国最高大上的移动电竞舞台，实现自己的王者之梦!\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p19.qhimg.com/t01850cb4e1cbd138e3.jpg\" width=\"600\" height=\"234\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　超级联赛是由《乱斗西游2》官方主办的，除高校联赛、城市争霸赛、全明星赛等丰富赛事活动之外，最大型、最公平的专业移动电竞赛事。历经两届大赛的迅猛发展和数百万电竞粉丝的共同参与见证，迄今为止《乱斗西游2》超级联赛已发展为覆盖范围最广、对战水平最高的国内电竞赛事之一，亦是中国游戏史上首个实现体系化的移动电竞赛事。回顾S1至S2的赛事规模发展历程，以及在线观看人数的不断攀升，S3赛季必将吸引更多乱斗玩家和电竞爱好者的关注与支持!\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p18.qhimg.com/t01a82ca963e32c5998.jpg\" width=\"570\" height=\"380\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　50万奖金激励，职业化赛制公平公正\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　一个月的时间，你能做些什么?减肥减10斤?好好学习考第一?天天加班KPI爆表?在《乱斗西游2》，一个月的时间足以让你名利双收，从此成为人生赢家!2016年3月2日至4月1日，为期一个月的超级联赛S3赛季线上预选赛即将打响!总额50万的现金赛事奖金，高大上的全国赛事舞台，还有机会与知名电竞选手切磋!\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p18.qhimg.com/t0187cb4a46ce1074a9.jpg\" width=\"537\" height=\"303\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　和传统电竞赛事不同的是，超级联赛并非只是顶尖高手的舞台，低门槛的参与条件，让草根选手也有展露头角的机会。譬如S1赛季冠军威廉古堡和S2赛季冠军iegos，两支战队皆由大众玩家组成，只要对大赛准备充分，再加上队友间的默契与配合，最终表现出的竞技水平，甚至超过了部分前来参赛的职业电竞选手!\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p18.qhimg.com/t012bcc8618e3c9f820.jpg\" width=\"570\" height=\"379\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　全新造星舞台，为草根叩开职业大门\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　《乱斗西游2》超级联赛，不仅是各路选手厮杀的战场，也是一座星光闪耀的舞台：除了有电竞豪门VG俱乐部，以及TH000和Infi等世界电竞冠军到场助阵之外，从超级联赛中崛起的草根战队，也逐渐成为乱斗玩家顶礼膜拜的新偶像——在前不久启动的五星导师招募活动中，来自两支冠军战队的威廉公爵和无双影，得到了玩家们的全力支持，一举成为高人气的五星导师。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p16.qhimg.com/t014342db63a48dc413.jpg\" width=\"567\" height=\"378\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　自S1至S3赛季，《乱斗西游2》建立成熟的联赛赛事体系，成功将超级联赛打造成为全中国第一个实现体系化的大型移动电竞赛事。除了超级联赛系列，官方更设计出严肃与娱乐并存的丰富赛事体系，推出多品牌赛事，分别针对学生(高校联赛与巡回挑战赛)、白领(最强王者争霸赛等城市赛事)、半职业与职业(电竞冠军极限挑战赛、全明星赛)等，分类细化运营有的放矢，在各项赛事中投入近千万巨额资金，更是表明对玩家的持续回馈和投入。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p17.qhimg.com/t0133d8ba046c40693b.jpg\" width=\"570\" height=\"276\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　关于《乱斗西游2》\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　《乱斗西游2》是一款采用网易自研NeoX引擎打造的全新3D大作。游戏中，玩家不但可以体验到ARPG式的闯关玩法和英雄收集玩法，更能使用虚拟摇杆和虚拟按键体验到PVP战场的MOBA玩法，在《乱斗西游2》中，实时对战全新升级，更增加3V3六人对战及12V12大型帮战!其标准的双阵营设定、推塔进攻模式、精心优化的美术效果、以及英雄战斗定位， 将唤醒所有lol与dota玩家的手指，在手机上重现显示器前的激情四射!\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('2', '0', '<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　俗话说，宝剑配英雄，鲜花送佳人。每一位英雄都应该有把属于自己的神兵利器，谁能够拥有传说中的神兵，最终唤醒强大的力量，方能扭转乾坤，拯救起源大陆与危难之中!《武器大师》一举囊括众多刀枪剑戟等十八般神兵，将来源于武侠小说、古今中外神话等等的兵器一一呈现，带给玩家全新的自主打造武器的玩法。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://i0.qhimg.com/t01bd684aba8b15c7da.jpg\" width=\"500\" height=\"313\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　三种神兵显神通\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　《武器大师》中，各路神兵分为远程，中程，近程三种。三种神兵相辅相成，而又相互克制，构成了《武器大师》策略战斗赖以千变万化的基础。熟知每一样武器的来历和属性、种类对于新手铸剑师的成长，有着潜移默化的指导意义。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://i7.qhimg.com/t0118aeaa44025d7d0d.jpg\" width=\"500\" height=\"288\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　搜集残页造神兵\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　要说新手玩家最热衷的，莫过于近战神兵屠龙刀。通过搜集神器图谱残页或首充大礼包，即可获得传说中的屠龙刀!当你拿到屠龙刀图谱之后，先不要急于锻造武器，如果残页足够多，还可以进一步将图谱进化，让武器进一步升阶。升阶后的武器不仅各项属性和战斗都有所提高，外观也会有微妙的变化，自带光效显得神兵更神秘高大上!\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://i8.qhimg.com/t01fdf6e6c4640eb497.jpg\" width=\"506\" height=\"303\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　升级技能更强大\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　其次就是登陆赠送的远程神器射雕神弓。射雕神弓特有的技能羽裂虚空，可大大提升自身的速度，招招快速又致命。每一种神兵都有其独特的技能，技能分为主动技能和被动技能，可以通过技能点来提升等级。技能点可以随着时间而恢复，也可以通过购买技能书来恢复哦。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://i0.qhimg.com/t016c8cee7dd82562bf.jpg\" width=\"504\" height=\"290\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　亲手锻造出神兵\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　中程兵器以斧锤枪戟为主，其中不少来源于三国的神兵受到了众多玩家的喜爱。青龙偃月刀相传是关羽所使用的兵器，成为纵横乱世的一代神刀。在《武器大师》中，玩家可亲手打造绝世神兵青龙偃月刀，当熔炼的那一刻开始，神兵的命运就掌握在你的手中!\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://i0.qhimg.com/t01e93e21ad6e2eac06.jpg\" width=\"504\" height=\"285\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　想要了解神兵更多秘密，《武器大师》中还有很多崭新亮点，这都是需要玩家亲自挖掘，亲自体验。想领略到更多的游戏乐趣么?赶快加入到《武器大师》这个冒险又奇幻的世界中来吧!\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('3', '0', '<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　还有5天备受祖国人民喜爱的金猴新年就要到啦。为了迎接久违的孙大圣，《斗破苍穹》手游团队在春节期间强力推出四海龙王组合，和美猴王一起给斗破玩家大拜年。除此之外春节期间还有各种形式多样的活动陆续推出，请大家拭目以待。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p15.qhimg.com/t01db5563050d7e91f9.jpg\" width=\"600\" height=\"400\" />\r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　大圣、龙王齐上阵，斗破苍穹闹新春\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　时间轮转，又是一年新春，五湖四海中华儿女欢庆一堂。中国人民对猴年都有一种特殊的情感寄托，儿时的《西游记》齐天大圣已经成为一代代人的记忆烙印。《斗破苍穹》手游绝不会错过这样的节日，特别在游戏内新增四海龙王、齐天大圣形象，和大家一起在斗破大陆守岁闹新春。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p18.qhimg.com/t01b847eacda29e1522.jpg\" width=\"400\" height=\"600\" />\r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动期间，登陆游戏不仅可以一睹美猴王的飒爽英姿，还会收到大圣特制的猴年大礼包。大圣本领大给的礼包也都是稀罕玩意儿，好好期待一下吧。凭着大圣在四界的影响力和号召力，他还给斗破玩家们请来了四海龙王，呼风唤雨同贺新春。保佑斗破粉丝们2016家和人顺，事事称心。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p18.qhimg.com/t014030c5c511590d9c.jpg\" width=\"400\" height=\"600\" />\r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　四海龙王本领大 斗破大陆斗乾坤\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　四海龙王分别是：南北西海龙王+烛坤。这四个有型有款，有勇有谋的霸道大叔靠着孙大圣的面子即将盛装登场，各位斗破粉丝们是不是有点小激动呢!他们四个有强攻型，有肉盾型，还有均衡型，满足大家对龙王的各种期待。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p16.qhimg.com/t010043a1c29282b971.jpg\" width=\"600\" height=\"400\" />\r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　四海龙王每个人都有自己的必杀技：比如南龙王的“南龙古诀“能将生命提升20%;北龙王的”北龙印发“能将法攻提升19%;西龙王的”焚龙古诀“能将生命提升20%;烛坤的”龙魂灭世“能将武功提升19%。四大龙王齐上阵所产生的羁绊”四大龙王“还能提升生命24%、物攻32%，总之用起来很厉害的样子。除此之外还有很多羁绊效果大家可以春节期间研究一下。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　斗破菌偷偷爆个料，在辞旧迎新的大年三十除夕夜，《斗破苍穹》游戏内将放出一只凶凶哒年兽。大家不妨和年兽一战，听说打败年兽会得到好多压岁钱。\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('4', '0', '<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　无论是寒假还是暑假，总会有那么几部剧反复出现....\r\n</p>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　大家应该都深有体会吧\r\n</p>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　有人做过统计，《西游记》重播了3000多次\r\n</p>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　今年得猴王庇佑，不只是重播，或许各大春晚平台还能看到真猴王的身影呢~\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://www.anfeng.cn/upload/image/201602/1454375912846047.jpg\" width=\"495\" height=\"500\" />\r\n</div>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　继西游记后，谁会是下一代重播王?\r\n</p>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　我看好《琅琊榜》\r\n</p>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　年度业界良心巨制，播出之后，好评无数...还有人专门跑到拍摄基地去寻找剧中场景所在....\r\n</p>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　真是忍不住想说\r\n</p>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　何须那么辛苦，我们游戏中就有呀~\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://www.anfeng.cn/upload/image/201602/1454375913940364.jpg\" width=\"597\" height=\"666\" /><img border=\"1\" alt=\"\" src=\"http://www.anfeng.cn/upload/image/201602/1454375913653466.jpg\" width=\"589\" height=\"610\" /><img border=\"1\" alt=\"\" src=\"http://www.anfeng.cn/upload/image/201602/1454375916260915.jpg\" width=\"579\" height=\"649\" /><img border=\"1\" alt=\"\" src=\"http://www.anfeng.cn/upload/image/201602/1454375916528458.jpg\" width=\"578\" height=\"638\" /><img border=\"1\" alt=\"\" src=\"http://www.anfeng.cn/upload/image/201602/1454375917783175.jpg\" width=\"585\" height=\"653\" /><img border=\"1\" alt=\"\" src=\"http://www.anfeng.cn/upload/image/201602/1454375918294742.jpg\" width=\"577\" height=\"557\" />\r\n</div>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　这可是选择中国才可以看到的建筑风格哦~\r\n</p>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　喜欢古风喜欢《琅琊榜》的小伙伴们有福啦~\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('5', '0', '<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	活动一：有爱就有礼，转盘大返利\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动时间】：2016年12月2日全天\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动内容】：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　1、活动期间，单笔充值≥10000元宝，返利20%\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2、活动期间，等级≥30级的玩家，可转动幸运转盘，获得一定比例的返利资格，获取返利资格后的当日首次充值可获得相应比例充值返利，最高返利800元宝!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动备注】：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　1、单笔充值返利与转盘返利奖励可叠加!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2、每人仅有1次转盘返利的机会!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动二：有爱就有礼，免费临幸貂蝉\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动时间】：2016年12月2日全天\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动内容】：活动期间，临幸貂蝉29次，可在【精彩活动】图标处领取406元宝，相当于免费赠送29次临幸貂蝉的机会哦!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动三：有爱就有礼，送888元宝\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动时间】：2016年12月2日全天\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动内容】：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　1、活动期间，每人可在商城【限时抢购】专区购买1个【幸福礼袋】,成功购买后,可在【精彩活动】处领取888元宝,相当于免费赠送幸福礼袋哦!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2、12月2日12:00起,商城【限时抢购】专区将以6999元宝的价格出售【女将军】,每个区服仅售1个!手快有,手慢无!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　3、活动期间，商城【限时抢购】出售【约会礼包】，每购买10个【约会礼包】送2000将魂\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动备注】：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　1、【幸福礼袋】---打开可获得1500将魂、50功勋、军令*10、4级军牌*2\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2、【女将军】---使用后可获得一个2星金将\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　3、使用【约会礼包】后与美女们约会可获得海量铜钱、玉石、军令、锦囊(可用于兑换暗金武将)奖励，若您幸运地得到与【女将军】约会的机会，那么恭喜您，您将必获赠一个2星金将!\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('6', '0', '<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　《热血游戏王》开年更新第一波!2月18日早上6点30分进行停服维护更新，维护期间预计将会停服30-60分钟，以确保维护稳定。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.anfeng.cn/upload/image/201602/1455619053219011.jpg\" title=\"1455619053219011.jpg\" alt=\"UH~YE)ZRIM3QFQ5]EKAH_@F.jpg\" />\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	&nbsp; &nbsp;<strong><span style=\"font-size:20px;\">更新内容如下</span></strong>：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　1、<strong><span style=\"font-size:18px;\">累充回馈</span></strong>\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2月18日-2月24日\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　限时活动，累充回馈!活动期间，玩家每日充值累计达到指定额度，可额外领取丰厚回馈\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2、<strong><span style=\"font-size:18px;\">单笔返利</span></strong>\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2月18日-2月24日\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　限时活动，单笔返利!活动期间，玩家每日单笔充值达到指定额度，可额外领取大笔返利\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　3、<strong><span style=\"font-size:18px;\">豪华签到</span></strong>\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动期间，每日签到可领取\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动时间2月18日-2月24日\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　4、<strong><span style=\"font-size:18px;\">7星豪礼</span></strong>\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动时间2月21日-2月24日\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动期间首次单笔充值100rmb即可获得一个7星卡包，可随机获得一个7星怪兽卡\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　5、<span style=\"font-size:18px;\"><strong>7星套装</strong></span>\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动时间2月18日-2月20日\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动期间首次单笔充值100rmb即可获得一个7星装备套装，可随机获得一套7星装备(死神套装，凤凰套装，守护套装)\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('7', '0', '<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:21px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;\">&nbsp; &nbsp;&nbsp;</span><span style=\"font-size:18px;color:#3F3F3F;\"><span style=\"font-family:微软雅黑;\">我命如妖欲封天？3月1日上午11点,</span><span style=\"font-family:微软雅黑;\">&nbsp;由起点中文网白金作家耳根授权改编的大型3D仙侠MMORPG手游《我欲封天》将正式不删档上线！多人同屏热血争仙，做自己最大的靠山！年度仙侠扛鼎力作！等你来战！</span></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:21px;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:18px;color:#3F3F3F;font-family:微软雅黑;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;font-weight:bold;font-size:19px;\">【活动时间】</span><span style=\"font-family:宋体;font-size:18px;\">3月<span style=\"font-family:\'Courier New\';\">1</span>日至<span style=\"font-family:\'Courier New\';\">5</span>日</span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;font-weight:bold;font-size:19px;\">【活动内容】</span><span style=\"font-family:宋体;font-size:16px;\">在活动页面登陆后将活动分享给好友，即可获得一次红包的领取资格</span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;font-size:16px;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;font-size:16px;\"><strong><span style=\"font-size:18px;\"><span style=\"font-size:19px;\">【</span>活动入口</span></strong><strong><span style=\"font-family:微软雅黑;\"><span style=\"font-family:宋体;font-size:19px;\">】</span></span></strong><span style=\"color:#FF0000;font-size:24px;text-decoration:underline;background-color:#FFFF00;\"><strong>点我参与活动</strong></span></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;font-size:16px;\"><span style=\"color:#FF0000;font-size:24px;text-decoration:underline;background-color:#FFFF00;\"><br />\r\n</span></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;\">&nbsp;&nbsp;<span style=\"font-size:16px;\">活动参与流程：</span></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;font-size:16px;\">1.</span><span style=\"font-family:arial, helvetica, sans-serif;font-size:16px;\">打开活动页面点击领取红包，登录游戏帐号,如果没有账号则需要注册</span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;font-size:16px;\">&nbsp;&nbsp;<img src=\"http://www.anfeng.cn/upload/image/201602/1456712151279091.jpg\" title=\"1456712151279091.jpg\" alt=\"图片1.jpg\" />&nbsp;&nbsp;</span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;font-size:16px;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;font-size:16px;\">&nbsp; 2.</span><span style=\"font-family:arial, helvetica, sans-serif;font-size:16px;\">登录成功，分享之后即可获得领取红包资格</span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;\">&nbsp;&nbsp;<img src=\"http://www.anfeng.cn/upload/image/201602/1456712308383722.jpg\" title=\"1456712308383722.jpg\" alt=\"图片3.jpg\" />&nbsp;&nbsp;<img src=\"http://www.anfeng.cn/upload/image/201602/1456712322238015.jpg\" title=\"1456712322238015.jpg\" alt=\"图片4.jpg\" />&nbsp;&nbsp;</span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;font-size:19px;font-weight:bold;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;font-size:19px;font-weight:bold;\">【活动规则】</span><br />\r\n<span style=\"font-family:宋体;font-size:16px;\"></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;\"><span style=\"font-family:微软雅黑;\">1.</span><span style=\"font-family:微软雅黑;\">本活动仅限平台官方注册玩家。</span></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;font-size:16px;\">2.严格按照活动参与，破坏活动将取消活动资格。</span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;font-size:16px;\">3活动奖励将在活动结束后3个工作日内公布奖励并发放。</span> \r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('8', '0', '<div style=\"text-align:left;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"></span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"></span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"></span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"></span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"></span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"></span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　自古江湖多纷争，谁来一笑主沉浮?2月24日上午10点,Q萌热血的武侠卡牌大作《一个人的江湖》迎来不删档首发，神雕侠侣只羡鸳鸯不羡仙，射雕英雄传展现浩然正气，笑傲江湖等武侠巨著的英雄人物齐聚掌中，展开巅峰对决，这里有一个江湖，专属于你的江湖!</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　【活动内容】</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　活动时间内，在本贴留下对《一个人的江湖》的签到，就有机会赢得缤纷好礼!24号首发当天更可晒游戏截图+祝福获得额外抽奖机会。</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　【活动时间】</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　2月21日-2月25日</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　【活动奖励】</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　签到满3天以上的玩家：我们将随机抽9名幸运玩家获得定制水杯</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　签到满5天以上的玩家：将获取一次抽奖机会(100%中奖)</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　首发当天晒游戏截图+对祝福额外获得一次抽奖机会</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　抽奖链接内设：F币、不锈钢水杯、T恤、小米移动电源、定制马克杯</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　(满足以上活动条件的用户奖励可叠加获取)</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　【参与方式】：</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　在活动贴内回复格式如下：</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　活动1：账号+签到天数</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　活动2：账号+截图+祝福</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　举个栗子：</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　活动1：账号：1234567+签到第一天</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　活动2：账号：1234567+截图+祝福《一个人的江湖》顺利首发，红红火火，越办越好!</span><br />\r\n<br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　【活动规则】：</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　1.所有获奖玩家仅限XX平台官方注册玩家.</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　2.严格按照活动要求和格式才视为有效参加</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　3活动奖励将在活动结束后3个工作日内公布奖励并发放</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"></span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"></span><br />\r\n</div>', '', '0');
INSERT INTO `sys_document_article` VALUES ('9', '0', '<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	元宵节即将来临，梦幻西游手游元宵节新推出了四个新活动，分别是巧思猜灯谜的答题活动、舞龙舞狮会巡游长安城活动、齐心包汤圆活动、换了闹元宵挑战元宵活动，下面是活动详细内容，喜欢的小伙伴不要错过哦，希望大家互相。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><strong>活动一：巧思猜灯谜</strong></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><strong>活动时间：2016年2月18日0:00——2月23日24:00，每天晚上18:00-18:20。</strong></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><strong>活动要求：需人物等级达到40级，单人参加。</strong></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	活动介绍：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	火树银花舞全城，锦心巧思解谜灯。赏花灯，猜灯谜，是每年正月十五的传统活动。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	活动期间每天晚上17:50-18:00为准备时间，18:00-18:20为正式活动时间。在此期间内玩家均可找NPC“元宵节使官”(长安城141,87)参与巧思猜灯谜活动。在场景内和其他玩家一起答题，还可以发送弹幕哦~答对全部20道题还可获得额外奖励。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	其他说明：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	奖励不受双倍点数影响，不获得活跃度奖励。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><strong>活动二：舞龙舞狮会</strong></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><strong>活动时间：2016年2月18日0:00——2月23日24:00，每天14:00-14:10和19:00-19:10，共2场。</strong></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><strong>活动要求：需人物等级达到40级，单人参加。</strong></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	活动介绍：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	咚咚隆咚呛!舞狮队和舞龙队来啦!元宵节期间每天会有2次舞狮队和舞龙队巡游长安城，少侠快快加入他们，跟着一起躁起来哇!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	每天13:55-14:00和18:55-19:00为准备时间，14:00-14:10和19:00-19:10为正式活动时间。在此期间内玩家可与NPC舞狮队和NPC舞龙队对话加入其中，跟着他们一起巡游长安城，并且拾取NPC所投福箱。此外，活动期间在长安城内所有达到40级的玩家均可获得每分钟一次的经验奖励。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	其他说明：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	1、每天最多获得10次经验奖励。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	2、每天最多可拾取5次福箱(不区分舞狮队和舞龙队福箱)。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	3、奖励不受双倍点数影响，不获得活跃度奖励。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><strong>活动三：齐心包汤圆</strong></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><strong>活动时间：2016年2月18日0:00——2月23日24:00，全天可参加。</strong></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><strong>活动要求：需人物等级达到40级，至少3人组队参加。</strong></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	活动介绍：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	天庭下凡的美食仙女在为大家准备汤圆，热心的少侠快快约上几个好友一起去帮帮她吧!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	活动期间每天可组队找NPC“元宵节使官”(长安城141,87)领取齐心包汤圆任务(共3环)。帮助美食仙女依次完成调馅料、揉面团、包汤圆等过程，即可获得仙女的嘉奖啦~\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	其他说明：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	1、每天第一次完成环任务可获得正常奖励，第二次完成可获得侠义值奖励，第三次之后不再获得奖励。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	2、战斗失败无任何损失。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	3、奖励不受双倍点数影响，不获得活跃度奖励。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><strong>活动四：欢乐闹元宵</strong></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><strong>活动时间：2016年2月18日0:00——2月23日24:00，全天可参加。</strong></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><strong>活动要求：需人物等级达到40级，至少3人组队参加。</strong></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	活动介绍：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	元宵佳节，天庭派赐福元宵(简单)和迎禧元宵(较难)下凡在宝象国(43,21)和(65,35)处接受大家的挑战，战胜它们可获得丰富奖励呦~\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	少侠只需选择两个元宵中的一个挑战即可。若先战胜迎禧元宵，再战胜赐福元宵不再获得奖励。若先战胜赐福元宵，再战胜迎禧元宵可获得差额奖励。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	其他说明：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	1、每天挑战元宵次数无限制，但只有第一次战胜可获得正常奖励。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	2、战斗失败无任何损失。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	3、奖励不受双倍点数影响，不获得活跃度奖励。\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('10', '0', '<p style=\"text-align:left;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:16px;\"></span> \r\n</p>\r\n<h2 style=\"font-size:18px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:18px;font-family:\'Microsoft YaHei\';color:#000000;\">关于溪谷</span> \r\n</h2>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">溪谷软件创立于2015年，是一个专业提供手游推广核心工具！</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">致力于开发国内最优秀的SDK系统、渠道推广系统、APP手游盒子、PC官网和社区系统，力求实现手游联运推广一站式解决方案。</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;\"><br />\r\n</span> \r\n</p>\r\n<h2 style=\"font-size:18px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:18px;font-family:\'Microsoft YaHei\';color:#000000;\">历史事件</span> \r\n</h2>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">▫▫▫▫▫▫▫▫▫▫▫▫▫　2016年我们一起出发，为更多客户提供好用，开源的程序。</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">2016年01月 手游推广整套系统发布</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">2015年10月 启动溪谷软件开发项目</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">2015年08月 成立徐州梦创信息科技有限公司</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">2014年05月 启动页游平台联运，成功运营几十款页游</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">2013年07月 网页游戏平台+推广程序4.0盛大发布</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">2012年11月 网页游戏平台程序发布</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">2012年09月 启动网页游戏平台程序项目</span> \r\n</p>\r\n<br />\r\n<p>\r\n	<br />\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('11', '0', '<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><strong>游戏联运</strong></span> \r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;text-indent:2em;background-color:#FFFFFF;\">\r\n	专业手机游戏运营团队，丰厚的回报来保证合作的成功，如果你有精品的游戏欢迎洽谈。\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;text-indent:2em;background-color:#FFFFFF;\">\r\n	QQ: 504181888\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;text-indent:2em;background-color:#FFFFFF;\">\r\n	E-mail: <span style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;line-height:24px;background-color:#FFFFFF;\">504181<span style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;line-height:24px;background-color:#FFFFFF;\">888</span>@qq</span>.com\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><strong>渠道合作</strong></span> \r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;text-indent:2em;background-color:#FFFFFF;\">\r\n	QQ: 504181<span style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;line-height:24px;background-color:#FFFFFF;\">888</span>\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;text-indent:2em;background-color:#FFFFFF;\">\r\n	E-mail:&nbsp;504181<span style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;line-height:24px;background-color:#FFFFFF;\">888</span>@qq.com\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF0000;\"><strong>公会合作</strong></span> \r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;text-indent:2em;background-color:#FFFFFF;\">\r\n	实时收益，高比例，种类繁多！\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;text-indent:2em;background-color:#FFFFFF;\">\r\n	QQ: 504181<span style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;line-height:24px;background-color:#FFFFFF;\">888</span>\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;text-indent:2em;background-color:#FFFFFF;\">\r\n	E-mail:&nbsp;504181<span style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;line-height:24px;background-color:#FFFFFF;\">888</span>@qq.com\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('12', '0', '<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　“网络游戏未成年人家长监护工程”是一项由国内网络游戏企业共同发起并参与实施，由中华人民共和国文化部指导，旨在加强家长对未成年人参与网络游戏的监护，引导未成年人健康、绿色参与网络游戏，和谐家庭关系的社会性公益行动。它提供了一种切实可行的方法，一种家长实施监控的管道，使家长纠正部分未成年子女沉迷游戏的行为成为可能。\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　该项社会公益行动充分反映了中国网络游戏行业高度的社会责任感，对未成年玩家合法权益的关注及对用实际行动营造和谐社会的愿望。\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　“家长监护机制”是vlcms.com在这一公益行动中，针对目前未成年人缺乏自控及自律能力，容易陷入沉迷;少数监护人缺少时间照顾未成年人，不能及时监督未成年人游戏时间的现状，而推出的一种可由家长实施监控，纠正部分未成年子女沉迷游戏的保护机制。\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　《未成年人健康参与网络游戏提示》\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　随着网络在青少年中的普及，未成年人接触网络游戏已经成为普遍现象。为保护未成年人健康参与游戏，在政府进一步加强行业管理的前提下，家长也应当加强监护引导。为此，我们为未成年人参与网络游戏提供以下意见：\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　一、主动控制游戏时间。游戏只是学习、生活的调剂，要积极参与线下的各类活动，并让父母了解自己在网络游戏中的行为和体验。\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　二、不参与可能耗费较多时间的游戏设置。不玩大型角色扮演类游戏，不玩有PK类设置的游戏。在校学生每周玩游戏不超过2小时，每月在游戏中的花费不超过10元。\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　三、不要将游戏当作精神寄托。尤其在现实生活中遇到压力和挫折时，应多与家人朋友交流倾诉，不要只依靠游戏来缓解压力。\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　四、养成积极健康的游戏心态。克服攀比、炫耀、仇恨和报复等心理，避免形成欺凌弱小、抢劫他人等不良网络行为习惯。\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　五、注意保护个人信息。包括个人家庭、朋友身份信息，家庭、学校、单位地址，电话号码等，防范网络陷阱和网络犯罪。\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　家长监护服务说明：\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　家长监护系统充分考虑家长的实际需求，当家长发现自己的孩子玩游戏过于沉迷的时候，由家长提供合法的监护人资质证明、游戏名称账号、以及家长对于限制强度的愿望等信息，可对处于孩子游戏沉迷状态的账号采取几种限制措施，解决未成年人沉迷游戏的不良现象，如限制未成年人每天玩游戏的时间区间和长度，也可以限制只有节假日才可以游戏，或者完全禁止。\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　家长监护服务进度查询：\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　如果您已经申请家长监护服务，在服务期间，当您对需要提交的信息、处理结果有疑问，或者其他任何问题，您均可以在工作时间联系我们，我们将由专门负责的受理专员为您提供咨询解答服务，或者配合、指导您解决问题。\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　申请方法：\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　1. 拨打申请电话申请\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　申请电话：\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　2. 填写所需表格(见页面右侧)，发电子邮件\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　申请邮箱：504181888@qq.com\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　供申请监督方式：\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　A. 屏蔽账号：根据监护人意愿屏蔽相关游戏应用登陆。\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　B. 账号动态监控：登陆、修改密码等操作将发短信至监护人手机。\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　1)账号已经有认证手机的，将监护人手机替换为认证手机;\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　2)账号未认证手机，将监护人手机绑定成认证手机;\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　其他要求：\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　1.申请人应提交较完备的申请材料，对未提供的信息要及时补充;可请熟知电脑、互联网、游戏的人员进行协助，以便提供详实资料;\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　2.申请人应保证提交的信息真实有效;对于提供虚假信息或伪造证件，我司将保留进一步追究法律责任的权利。\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　申请条件：\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　1、 申请人需为被监护未成年人的法定监护人;\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　2、 申请人的被监护人年龄小于18周岁;\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　3、 申请人需为大陆公民，不含港、澳、台人士。\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　申请需提交材料：\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　1、监护人信息表(包含监护人的身份证明复印件);\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　2、被监护人信息表(包含被监护人所玩游戏相关信息及身份证明复印件);\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　3、填写网络游戏未成年人家长监护申请书、保证书、授权书并手工签字(需下载，填写并打印，签字);\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	　　4、申请人与被监护人的监护关系证明文件(户口簿或有关机关出具的证明文件)。\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<a class=\"ke-insertfile\" href=\"/Uploads/Editor/2016-03-23/56f2bc7a8da96.doc\" target=\"_blank\"><u><span style=\"color:#337FE5;\">家长监护</span></u></a> \r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<a class=\"ke-insertfile\" href=\"/Uploads/Editor/2016-03-23/56f2bc9beac32.doc\" target=\"_blank\"><u><span style=\"color:#337FE5;\">家长监护申请书</span></u></a> \r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<a class=\"ke-insertfile\" href=\"/Uploads/Editor/2016-03-23/56f2bcad4bf57.doc\" target=\"_blank\"><u><span style=\"color:#337FE5;\">监护人信息表</span></u></a> \r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('13', '0', '<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	合作开发商（排名不分先后）\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.anfeng.cn/upload/image/201411/1416563527595892.jpg\" title=\"1416563527595892.jpg\" alt=\"yxcj_r1_c1.jpg\" />\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('14', '0', '12', '', '0');
INSERT INTO `sys_document_article` VALUES ('15', '0', '123', '', '0');
INSERT INTO `sys_document_article` VALUES ('16', '0', '<a class=\"ke-insertfile\" href=\"/Uploads/Editor/2016-03-23/56f2a72e0eb34.doc\" target=\"_blank\">/Uploads/Editor/2016-03-23/56f2a72e0eb34.doc</a>', '', '0');
INSERT INTO `sys_document_article` VALUES ('17', '0', '<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　《热血游戏王》开年更新第一波!2月18日早上6点30分进行停服维护更新，维护期间预计将会停服30-60分钟，以确保维护稳定。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.anfeng.cn/upload/image/201602/1455619053219011.jpg\" title=\"1455619053219011.jpg\" alt=\"UH~YE)ZRIM3QFQ5]EKAH_@F.jpg\" />\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	&nbsp; &nbsp;<strong><span style=\"font-size:20px;\">更新内容如下</span></strong>：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　1、<strong><span style=\"font-size:18px;\">累充回馈</span></strong>\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2月18日-2月24日\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　限时活动，累充回馈!活动期间，玩家每日充值累计达到指定额度，可额外领取丰厚回馈\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2、<strong><span style=\"font-size:18px;\">单笔返利</span></strong>\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2月18日-2月24日\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　限时活动，单笔返利!活动期间，玩家每日单笔充值达到指定额度，可额外领取大笔返利\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　3、<strong><span style=\"font-size:18px;\">豪华签到</span></strong>\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动期间，每日签到可领取\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动时间2月18日-2月24日\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　4、<strong><span style=\"font-size:18px;\">7星豪礼</span></strong>\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动时间2月21日-2月24日\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动期间首次单笔充值100rmb即可获得一个7星卡包，可随机获得一个7星怪兽卡\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　5、<span style=\"font-size:18px;\"><strong>7星套装</strong></span>\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动时间2月18日-2月20日\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动期间首次单笔充值100rmb即可获得一个7星装备套装，可随机获得一套7星装备(死神套装，凤凰套装，守护套装)\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('18', '0', '<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	活动一：有爱就有礼，转盘大返利\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动时间】：2016年12月2日全天\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动内容】：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　1、活动期间，单笔充值≥10000元宝，返利20%\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2、活动期间，等级≥30级的玩家，可转动幸运转盘，获得一定比例的返利资格，获取返利资格后的当日首次充值可获得相应比例充值返利，最高返利800元宝!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动备注】：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　1、单笔充值返利与转盘返利奖励可叠加!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2、每人仅有1次转盘返利的机会!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动二：有爱就有礼，免费临幸貂蝉\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动时间】：2016年12月2日全天\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动内容】：活动期间，临幸貂蝉29次，可在【精彩活动】图标处领取406元宝，相当于免费赠送29次临幸貂蝉的机会哦!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动三：有爱就有礼，送888元宝\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动时间】：2016年12月2日全天\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动内容】：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　1、活动期间，每人可在商城【限时抢购】专区购买1个【幸福礼袋】,成功购买后,可在【精彩活动】处领取888元宝,相当于免费赠送幸福礼袋哦!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2、12月2日12:00起,商城【限时抢购】专区将以6999元宝的价格出售【女将军】,每个区服仅售1个!手快有,手慢无!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　3、活动期间，商城【限时抢购】出售【约会礼包】，每购买10个【约会礼包】送2000将魂\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动备注】：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　1、【幸福礼袋】---打开可获得1500将魂、50功勋、军令*10、4级军牌*2\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2、【女将军】---使用后可获得一个2星金将\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　3、使用【约会礼包】后与美女们约会可获得海量铜钱、玉石、军令、锦囊(可用于兑换暗金武将)奖励，若您幸运地得到与【女将军】约会的机会，那么恭喜您，您将必获赠一个2星金将!\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('19', '0', '<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	活动一：有爱就有礼，转盘大返利\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动时间】：2016年12月2日全天\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动内容】：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　1、活动期间，单笔充值≥10000元宝，返利20%\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2、活动期间，等级≥30级的玩家，可转动幸运转盘，获得一定比例的返利资格，获取返利资格后的当日首次充值可获得相应比例充值返利，最高返利800元宝!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动备注】：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　1、单笔充值返利与转盘返利奖励可叠加!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2、每人仅有1次转盘返利的机会!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动二：有爱就有礼，免费临幸貂蝉\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动时间】：2016年12月2日全天\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动内容】：活动期间，临幸貂蝉29次，可在【精彩活动】图标处领取406元宝，相当于免费赠送29次临幸貂蝉的机会哦!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动三：有爱就有礼，送888元宝\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动时间】：2016年12月2日全天\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动内容】：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　1、活动期间，每人可在商城【限时抢购】专区购买1个【幸福礼袋】,成功购买后,可在【精彩活动】处领取888元宝,相当于免费赠送幸福礼袋哦!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2、12月2日12:00起,商城【限时抢购】专区将以6999元宝的价格出售【女将军】,每个区服仅售1个!手快有,手慢无!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　3、活动期间，商城【限时抢购】出售【约会礼包】，每购买10个【约会礼包】送2000将魂\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　【活动备注】：\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　1、【幸福礼袋】---打开可获得1500将魂、50功勋、军令*10、4级军牌*2\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　2、【女将军】---使用后可获得一个2星金将\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　3、使用【约会礼包】后与美女们约会可获得海量铜钱、玉石、军令、锦囊(可用于兑换暗金武将)奖励，若您幸运地得到与【女将军】约会的机会，那么恭喜您，您将必获赠一个2星金将!\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('20', '0', '<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　全面革新的网易超人气MOBA手游《乱斗西游2》今日正式宣布，超级联赛S3赛季将再度拿出总额高达50万元的现金赛事奖金，遍邀各路高手决一胜负，3月2日约定你!\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　无论你是光环加身的昔日冠军，还是踌躇满志的挑战者，只要敢报名参赛，就有机会登上全中国最高大上的移动电竞舞台，实现自己的王者之梦!\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p19.qhimg.com/t01850cb4e1cbd138e3.jpg\" width=\"600\" height=\"234\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　超级联赛是由《乱斗西游2》官方主办的，除高校联赛、城市争霸赛、全明星赛等丰富赛事活动之外，最大型、最公平的专业移动电竞赛事。历经两届大赛的迅猛发展和数百万电竞粉丝的共同参与见证，迄今为止《乱斗西游2》超级联赛已发展为覆盖范围最广、对战水平最高的国内电竞赛事之一，亦是中国游戏史上首个实现体系化的移动电竞赛事。回顾S1至S2的赛事规模发展历程，以及在线观看人数的不断攀升，S3赛季必将吸引更多乱斗玩家和电竞爱好者的关注与支持!\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p18.qhimg.com/t01a82ca963e32c5998.jpg\" width=\"570\" height=\"380\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　50万奖金激励，职业化赛制公平公正\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　一个月的时间，你能做些什么?减肥减10斤?好好学习考第一?天天加班KPI爆表?在《乱斗西游2》，一个月的时间足以让你名利双收，从此成为人生赢家!2016年3月2日至4月1日，为期一个月的超级联赛S3赛季线上预选赛即将打响!总额50万的现金赛事奖金，高大上的全国赛事舞台，还有机会与知名电竞选手切磋!\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p18.qhimg.com/t0187cb4a46ce1074a9.jpg\" width=\"537\" height=\"303\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　和传统电竞赛事不同的是，超级联赛并非只是顶尖高手的舞台，低门槛的参与条件，让草根选手也有展露头角的机会。譬如S1赛季冠军威廉古堡和S2赛季冠军iegos，两支战队皆由大众玩家组成，只要对大赛准备充分，再加上队友间的默契与配合，最终表现出的竞技水平，甚至超过了部分前来参赛的职业电竞选手!\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p18.qhimg.com/t012bcc8618e3c9f820.jpg\" width=\"570\" height=\"379\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　全新造星舞台，为草根叩开职业大门\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　《乱斗西游2》超级联赛，不仅是各路选手厮杀的战场，也是一座星光闪耀的舞台：除了有电竞豪门VG俱乐部，以及TH000和Infi等世界电竞冠军到场助阵之外，从超级联赛中崛起的草根战队，也逐渐成为乱斗玩家顶礼膜拜的新偶像——在前不久启动的五星导师招募活动中，来自两支冠军战队的威廉公爵和无双影，得到了玩家们的全力支持，一举成为高人气的五星导师。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p16.qhimg.com/t014342db63a48dc413.jpg\" width=\"567\" height=\"378\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　自S1至S3赛季，《乱斗西游2》建立成熟的联赛赛事体系，成功将超级联赛打造成为全中国第一个实现体系化的大型移动电竞赛事。除了超级联赛系列，官方更设计出严肃与娱乐并存的丰富赛事体系，推出多品牌赛事，分别针对学生(高校联赛与巡回挑战赛)、白领(最强王者争霸赛等城市赛事)、半职业与职业(电竞冠军极限挑战赛、全明星赛)等，分类细化运营有的放矢，在各项赛事中投入近千万巨额资金，更是表明对玩家的持续回馈和投入。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p17.qhimg.com/t0133d8ba046c40693b.jpg\" width=\"570\" height=\"276\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　关于《乱斗西游2》\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　《乱斗西游2》是一款采用网易自研NeoX引擎打造的全新3D大作。游戏中，玩家不但可以体验到ARPG式的闯关玩法和英雄收集玩法，更能使用虚拟摇杆和虚拟按键体验到PVP战场的MOBA玩法，在《乱斗西游2》中，实时对战全新升级，更增加3V3六人对战及12V12大型帮战!其标准的双阵营设定、推塔进攻模式、精心优化的美术效果、以及英雄战斗定位， 将唤醒所有lol与dota玩家的手指，在手机上重现显示器前的激情四射!\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('21', '0', '<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　俗话说，宝剑配英雄，鲜花送佳人。每一位英雄都应该有把属于自己的神兵利器，谁能够拥有传说中的神兵，最终唤醒强大的力量，方能扭转乾坤，拯救起源大陆与危难之中!《武器大师》一举囊括众多刀枪剑戟等十八般神兵，将来源于武侠小说、古今中外神话等等的兵器一一呈现，带给玩家全新的自主打造武器的玩法。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://i0.qhimg.com/t01bd684aba8b15c7da.jpg\" width=\"500\" height=\"313\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　三种神兵显神通\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　《武器大师》中，各路神兵分为远程，中程，近程三种。三种神兵相辅相成，而又相互克制，构成了《武器大师》策略战斗赖以千变万化的基础。熟知每一样武器的来历和属性、种类对于新手铸剑师的成长，有着潜移默化的指导意义。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://i7.qhimg.com/t0118aeaa44025d7d0d.jpg\" width=\"500\" height=\"288\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　搜集残页造神兵\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　要说新手玩家最热衷的，莫过于近战神兵屠龙刀。通过搜集神器图谱残页或首充大礼包，即可获得传说中的屠龙刀!当你拿到屠龙刀图谱之后，先不要急于锻造武器，如果残页足够多，还可以进一步将图谱进化，让武器进一步升阶。升阶后的武器不仅各项属性和战斗都有所提高，外观也会有微妙的变化，自带光效显得神兵更神秘高大上!\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://i8.qhimg.com/t01fdf6e6c4640eb497.jpg\" width=\"506\" height=\"303\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　升级技能更强大\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　其次就是登陆赠送的远程神器射雕神弓。射雕神弓特有的技能羽裂虚空，可大大提升自身的速度，招招快速又致命。每一种神兵都有其独特的技能，技能分为主动技能和被动技能，可以通过技能点来提升等级。技能点可以随着时间而恢复，也可以通过购买技能书来恢复哦。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://i0.qhimg.com/t016c8cee7dd82562bf.jpg\" width=\"504\" height=\"290\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　亲手锻造出神兵\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　中程兵器以斧锤枪戟为主，其中不少来源于三国的神兵受到了众多玩家的喜爱。青龙偃月刀相传是关羽所使用的兵器，成为纵横乱世的一代神刀。在《武器大师》中，玩家可亲手打造绝世神兵青龙偃月刀，当熔炼的那一刻开始，神兵的命运就掌握在你的手中!\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://i0.qhimg.com/t01e93e21ad6e2eac06.jpg\" width=\"504\" height=\"285\" /> \r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　想要了解神兵更多秘密，《武器大师》中还有很多崭新亮点，这都是需要玩家亲自挖掘，亲自体验。想领略到更多的游戏乐趣么?赶快加入到《武器大师》这个冒险又奇幻的世界中来吧!\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('22', '0', '<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　无论是寒假还是暑假，总会有那么几部剧反复出现....\r\n</p>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　大家应该都深有体会吧\r\n</p>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　有人做过统计，《西游记》重播了3000多次\r\n</p>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　今年得猴王庇佑，不只是重播，或许各大春晚平台还能看到真猴王的身影呢~\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://www.anfeng.cn/upload/image/201602/1454375912846047.jpg\" width=\"495\" height=\"500\" />\r\n</div>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　继西游记后，谁会是下一代重播王?\r\n</p>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　我看好《琅琊榜》\r\n</p>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　年度业界良心巨制，播出之后，好评无数...还有人专门跑到拍摄基地去寻找剧中场景所在....\r\n</p>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　真是忍不住想说\r\n</p>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　何须那么辛苦，我们游戏中就有呀~\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://www.anfeng.cn/upload/image/201602/1454375913940364.jpg\" width=\"597\" height=\"666\" /><img border=\"1\" alt=\"\" src=\"http://www.anfeng.cn/upload/image/201602/1454375913653466.jpg\" width=\"589\" height=\"610\" /><img border=\"1\" alt=\"\" src=\"http://www.anfeng.cn/upload/image/201602/1454375916260915.jpg\" width=\"579\" height=\"649\" /><img border=\"1\" alt=\"\" src=\"http://www.anfeng.cn/upload/image/201602/1454375916528458.jpg\" width=\"578\" height=\"638\" /><img border=\"1\" alt=\"\" src=\"http://www.anfeng.cn/upload/image/201602/1454375917783175.jpg\" width=\"585\" height=\"653\" /><img border=\"1\" alt=\"\" src=\"http://www.anfeng.cn/upload/image/201602/1454375918294742.jpg\" width=\"577\" height=\"557\" />\r\n</div>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　这可是选择中国才可以看到的建筑风格哦~\r\n</p>\r\n<p style=\"text-align:center;color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　喜欢古风喜欢《琅琊榜》的小伙伴们有福啦~\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('23', '0', '<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　还有5天备受祖国人民喜爱的金猴新年就要到啦。为了迎接久违的孙大圣，《斗破苍穹》手游团队在春节期间强力推出四海龙王组合，和美猴王一起给斗破玩家大拜年。除此之外春节期间还有各种形式多样的活动陆续推出，请大家拭目以待。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p15.qhimg.com/t01db5563050d7e91f9.jpg\" width=\"600\" height=\"400\" />\r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　大圣、龙王齐上阵，斗破苍穹闹新春\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　时间轮转，又是一年新春，五湖四海中华儿女欢庆一堂。中国人民对猴年都有一种特殊的情感寄托，儿时的《西游记》齐天大圣已经成为一代代人的记忆烙印。《斗破苍穹》手游绝不会错过这样的节日，特别在游戏内新增四海龙王、齐天大圣形象，和大家一起在斗破大陆守岁闹新春。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p18.qhimg.com/t01b847eacda29e1522.jpg\" width=\"400\" height=\"600\" />\r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　活动期间，登陆游戏不仅可以一睹美猴王的飒爽英姿，还会收到大圣特制的猴年大礼包。大圣本领大给的礼包也都是稀罕玩意儿，好好期待一下吧。凭着大圣在四界的影响力和号召力，他还给斗破玩家们请来了四海龙王，呼风唤雨同贺新春。保佑斗破粉丝们2016家和人顺，事事称心。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p18.qhimg.com/t014030c5c511590d9c.jpg\" width=\"400\" height=\"600\" />\r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　四海龙王本领大 斗破大陆斗乾坤\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　四海龙王分别是：南北西海龙王+烛坤。这四个有型有款，有勇有谋的霸道大叔靠着孙大圣的面子即将盛装登场，各位斗破粉丝们是不是有点小激动呢!他们四个有强攻型，有肉盾型，还有均衡型，满足大家对龙王的各种期待。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img border=\"1\" alt=\"\" src=\"http://p16.qhimg.com/t010043a1c29282b971.jpg\" width=\"600\" height=\"400\" />\r\n</div>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　四海龙王每个人都有自己的必杀技：比如南龙王的“南龙古诀“能将生命提升20%;北龙王的”北龙印发“能将法攻提升19%;西龙王的”焚龙古诀“能将生命提升20%;烛坤的”龙魂灭世“能将武功提升19%。四大龙王齐上阵所产生的羁绊”四大龙王“还能提升生命24%、物攻32%，总之用起来很厉害的样子。除此之外还有很多羁绊效果大家可以春节期间研究一下。\r\n</p>\r\n<p style=\"color:#555555;font-family:Tahoma, Helvetica, Arial, \'microsoft yahei\', \'Microsoft Yahei\', sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　斗破菌偷偷爆个料，在辞旧迎新的大年三十除夕夜，《斗破苍穹》游戏内将放出一只凶凶哒年兽。大家不妨和年兽一战，听说打败年兽会得到好多压岁钱。\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('24', '0', '<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	vlcms(溪谷软件)1.0免费版是由徐州梦创信息科技有限公司基于Thinkphp开发，有游戏管理，游戏礼包管理，游戏区服管理，纠错管理，游戏图库管理，充值管理，充值方式管理，权限管理，用户管理等功能。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.vlcms.com/data/upload/ueditor/20160308/56deaea7da2bc.png\" title=\"blob.png\" alt=\"blob.png\" width=\"991\" height=\"519\" style=\"width:991px;height:519px;\" />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:20px;\"><span style=\"font-weight:700;\">后台首页</span></span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\"><img src=\"http://www.vlcms.com/data/upload/ueditor/20160308/56deaee21aca9.png\" title=\"blob.png\" alt=\"blob.png\" width=\"998\" height=\"550\" style=\"width:998px;height:550px;\" /></span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:20px;\"><span style=\"font-weight:700;\">游戏管理</span></span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\"><img src=\"http://www.vlcms.com/data/upload/ueditor/20160308/56deaf58be131.png\" title=\"blob.png\" alt=\"blob.png\" width=\"1027\" height=\"532\" style=\"width:1027px;height:532px;\" /><img src=\"http://www.vlcms.com/data/upload/ueditor/20160308/56deaf342f66d.png\" title=\"blob.png\" alt=\"blob.png\" width=\"1\" height=\"1\" style=\"width:1px;height:1px;\" /></span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:20px;\"><span style=\"font-weight:700;\">图库管理</span></span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\"><img src=\"http://www.vlcms.com/data/upload/ueditor/20160308/56deaf86cc772.png\" title=\"blob.png\" alt=\"blob.png\" width=\"1028\" height=\"521\" style=\"width:1028px;height:521px;\" /></span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:20px;\"><span style=\"font-weight:700;\">礼包管理</span></span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\"><img src=\"http://www.vlcms.com/data/upload/ueditor/20160308/56deafd9e6e79.png\" title=\"blob.png\" alt=\"blob.png\" width=\"1033\" height=\"560\" style=\"width:1033px;height:560px;\" /></span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:20px;\"><span style=\"font-weight:700;\">充值管理</span></span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\"><img src=\"http://www.vlcms.com/data/upload/ueditor/20160308/56deb03ee6675.png\" title=\"blob.png\" alt=\"blob.png\" width=\"1012\" height=\"511\" style=\"width:1012px;height:511px;\" /></span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:20px;\"><span style=\"font-weight:700;\">权限管理</span></span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">更多内容欢迎下载使用 &nbsp;<a href=\"http://www.vlcms.com/down\">http://www.vlcms.com/down</a>&nbsp;</span>\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('25', '0', '<p style=\"color:#999999;font-size:14px;text-indent:2em;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	据工信部最新数据显示，截止2015年12月底，全国电话用户总数达到15.37亿户，其中移动电话用户总数达13.06亿户，4G用户总数达3.86225亿户。4G用户在移动电话用户中的渗透率达到29.6%。我国月户均移动互联网接入流量达到389.3M，同比增长89.9%。\r\n</p>\r\n<p style=\"color:#999999;font-size:14px;text-indent:2em;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">全国电话用户总数达15.37亿户</span>\r\n</p>\r\n<p style=\"color:#999999;font-size:14px;text-indent:2em;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	据工信部统计，2015年，全国电话用户净增121.1万户，总数达到15.37亿户，增长0.1%，比上年回落2.5个百分点。其中，移动电话用户净增1964.5万户，总数达13.06亿户，移动电话用户普及率达95.5部/百人，比上年提高1部/百人。固定电话用户总数2.31亿户，比上年减少1843.4万户，普及率下降至16.9部/百人。\r\n</p>\r\n<p style=\"color:#999999;font-size:14px;text-indent:2em;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	2015年，2G移动电话用户减少1.83亿户，是上年净减数的1.5倍，占移动电话用户的比重由上年的54.7%下降至39.9%。4G移动电话用户新增28894.1万户，总数达38622.5万户，在移动电话用户中的渗透率达到29.6%。\r\n</p>\r\n<p style=\"color:#999999;font-size:14px;text-indent:2em;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;text-align:center;background-color:#FFFFFF;\">\r\n	<a href=\"http://i3.shouyou.itc.cn/v3/news/2016/01/26/01261734585945106.png\" target=\"_blank\"><img title=\"全国手机用户破13亿 4G用户渗透率29.6%\" border=\"0\" alt=\"全国手机用户破13亿 4G用户渗透率29.6%\" src=\"http://i3.shouyou.itc.cn/v3/news/2016/01/26/01261734585945106.png\" width=\"500\" height=\"227\" /></a>\r\n</p>\r\n<p style=\"color:#999999;font-size:14px;text-indent:2em;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;text-align:center;background-color:#FFFFFF;\">\r\n	2010-2015年各制式移动电话用户发展情况\r\n</p>\r\n<p style=\"color:#999999;font-size:14px;text-indent:2em;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	2015年，新增移动通信基站127.1万个，是上年净增数的1.3倍，总数达466.8万个。其中4G基站新增92.2万个，总数达到177.1万个。\r\n</p>\r\n<p style=\"color:#999999;font-size:14px;text-indent:2em;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	2015年，移动互联网接入流量消费达41.87亿G，同比增长103%，比上年提高40.1个百分点。月户均移动互联网接入流量达到389.3M，同比增长89.9%。手机上网流量达到37.59亿G，同比增长109.9%，在移动互联网总流量中的比重达到89.8%。固定互联网使用量同期保持较快增长，固定宽带接入时长达50.03万亿分钟，同比增长20.7%。\r\n</p>\r\n<p style=\"color:#999999;font-size:14px;text-indent:2em;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">光纤接入用户总数达1.2亿户</span>\r\n</p>\r\n<p style=\"color:#999999;font-size:14px;text-indent:2em;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	数据显示，2015年，三家基础电信企业固定互联网宽带接入用户净增1288.8万户，总数达2.13亿户。其中，光纤接入(FTTH/0)用户净增5140.8万户，总数达1.2亿户，占宽带用户总数的56.1%，比上年提高22个百分点。8M以上、20M以上宽带用户总数占宽带用户总数的比重分别达69.9%、33.4%，比上年分别提高29、23个百分点。城乡宽带用户发展差距依然较大，城市宽带用户净增1089.4万户，是农村宽带用户净增数的5.5倍。\r\n</p>\r\n<p style=\"color:#999999;font-size:14px;text-indent:2em;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;text-align:center;background-color:#FFFFFF;\">\r\n	<a href=\"http://i3.shouyou.itc.cn/v3/news/2016/01/26/01261734585955107.png\" target=\"_blank\"><img title=\"全国手机用户破13亿 4G用户渗透率29.6%\" border=\"0\" alt=\"全国手机用户破13亿 4G用户渗透率29.6%\" src=\"http://i3.shouyou.itc.cn/v3/news/2016/01/26/01261734585955107.png\" width=\"500\" height=\"238\" /></a>\r\n</p>\r\n<p style=\"color:#999999;font-size:14px;text-indent:2em;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;text-align:center;background-color:#FFFFFF;\">\r\n	2006-2015年互联网宽带接入用户发展和高速率用户占比情况\r\n</p>\r\n<p style=\"color:#999999;font-size:14px;text-indent:2em;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	2015年，互联网宽带接入端口数量达到4.7亿个，比上年净增7320.1万个，同比增长18.3%。互联网宽带接入端口“光进铜退”趋势更加明显，xDSL端口比上年减少3903.7万个，总数降至9870.5万个，占互联网接入端口的比重由上年的34.3%下降至20.8%。光纤接入(FTTH/0)端口比上年净增1.06亿个，达到2.69亿个，占比由上年的40.6%提升至56.7%。\r\n</p>\r\n<p style=\"color:#999999;font-size:14px;text-indent:2em;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	2015年，全国新建光缆线路441.3万公里，光缆线路总长度达到2487.3万公里，同比增长21.6%，比上年同期提高4.4个百分点。\r\n</p>\r\n<p style=\"color:#999999;font-size:14px;text-indent:2em;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	全国新建光缆中，接入网光缆、本地网中继光缆和长途光缆线路所占比重分别为62.6%、36.7%和0.7%。接入网光缆和本地网中继光缆长度同比增长28.9%和16.3%，分别新建276.4万公里和161.8万公里;长途光缆保持小幅扩容，同比增长3.4%，新建长途光缆长度达3.2万公里。\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('26', '0', '<p style=\"text-indent:2em;font-size:16px;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	随着市场的竞争加剧，手游人口红利消失，近来在业内经常传说独立游戏团队将引来寒冬一说，欧美市场的“独立开发者模式降临”的论调还多次登上了各大媒体的版面。不过并不是所有的业界人士都持相同的看法，有的人对独立游戏团队的存在还是抱着积极态度的。\r\n</p>\r\n<p style=\"text-indent:2em;font-size:16px;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	不管怎样，即便2015年里的独立游戏褒贬不一，有的大获好评，有的饱受争议，但这一切即将过去，关键是，2016年独立游戏的发展中又将遭遇什么问题呢？\r\n</p>\r\n<p style=\"text-align:center;text-indent:2em;font-size:16px;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	<img border=\"0\" src=\"http://i3.shouyou.itc.cn/2016/news/2016/01/06/duli.jpg\" />\r\n</p>\r\n<p style=\"text-indent:2em;font-size:16px;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	<strong>关于独立游戏商业模式的问题</strong>\r\n</p>\r\n<p style=\"text-indent:2em;font-size:16px;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	独立游戏本身便是相对于商业游戏而来的定义，而在游戏的多年发展中，这二者之间的定义与界限逐渐模糊，独立游戏虽然不以商业发行为目的，但是游戏营销收费问题也是独立游戏团队不可或缺的支持。于是游戏行业咨询师贾斯丁卡罗尔（Justin Carroll）对此表示：初创独立团队必然会面临困境，在新的市场环境下，独立开发者应当积极调整心态，在努力创作游戏的同时学习如何营销产品。\r\n</p>\r\n<p style=\"text-indent:2em;font-size:16px;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	<strong>那么独立游戏在这种营销模式下如何保持“独立”呢？</strong>\r\n</p>\r\n<p style=\"text-indent:2em;font-size:16px;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	事实上认清这个问题或许也正式2016年独立游戏团队最主要的工作之一。独立游戏在国外的发展明显快过国内，其中一个很重要的原因便是因为国外的索尼和微软两大主机厂商对游戏的支持，这种支持其实也变向的为独立游戏提供了一个商业平台。也就是说，独立游戏中的独立虽然是相对于“商业”而来，但是却并不代表独立游戏不需要设计盈利消费模式。\r\n</p>\r\n<p style=\"text-indent:2em;font-size:16px;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	而现实中由于国内的特殊游戏环境，独立游戏更多的是在PC和移动平台上的投放，于是大多数的选择是一次性付费购买完成的付费方式，而在内购方面的设计则较少甚至是没有，这其实对于大部分独立游戏是不利的。\r\n</p>\r\n<p style=\"text-indent:2em;font-size:16px;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	我们能看到类似《鲤》、《聚爆》等独立游戏能够通过一次性付费的方式取得不错的成绩，但是这并不代表这些游戏的设计就无可挑剔了。一方面《鲤》在早期上架的时候曾以12元的付费下载取得了不错的成绩，但后来却又有不少玩家吐槽了这款游戏，最主要的原因是因为这款游戏在死亡后必须使用四叶草（游戏充值购买），否则就会跳至关卡开头。这样的抱怨其实就是由于游戏内购设置不妥当所造成的，从而也反映了国内游戏在内购设置上普遍存在的套用其他游戏内购设置的问题。\r\n</p>\r\n<p style=\"text-indent:2em;font-size:16px;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	当然独立游戏的商业化模式不止这些问题，无论是在付费方式还是在具体的推广方式上，独立游戏因为自己本身在制作过程中的特殊性或许也应该在这些方面有所独立创新。\r\n</p>\r\n<p style=\"text-indent:2em;font-size:16px;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	<strong>独立游戏也需要创新</strong>\r\n</p>\r\n<p style=\"text-indent:2em;font-size:16px;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	或许有的人会对独立游戏的“创新”提出疑问：独立游戏还有不新颖不创新的？没错，现实中我们看到的独立游戏确实都很新颖都很创新，不过我们这里说的独立游戏需要的创新不是来自于独立游戏的内容，而是独立游戏的推广。\r\n</p>\r\n<p style=\"text-indent:2em;font-size:16px;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	上面我们说了独立游戏该不该有商业化模式以及它们的一些付费设置上的问题，那么我们这里就要说一下关于推广上的创新问题。国外的游戏分析师卡罗尔也曾就这个问题发表过意见：“虽然某些独立开发者擅长创作游戏，但他们当中的绝大多数并不熟悉如何销售游戏。他们要么十分激进地在各种游戏会议上展出自己的游戏，希望能够在玩家群体中一炮走红；要么就什么都不做，想当然地认为是金子总会发光，伟大的游戏就一定能够赢得成功。”\r\n</p>\r\n<p style=\"text-indent:2em;font-size:16px;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	其实这也正体现了独立游戏团队由于本身缺少对游戏推广方面的关注问题，一方面是独立团队中本身比较热衷于游戏内容而无暇顾及，另一方面是很多独立游戏团队都只有少数几个人，缺乏专业的人士。目前的独立游戏团队的推广方式更多的是依赖与第三方的组织机构，除了游戏媒体和渠道之外，还有类似IGF和IndieCade这样的大会组织，而事实证明仅有这些是不够的。\r\n</p>\r\n<p style=\"text-indent:2em;font-size:16px;font-family:微软雅黑, Arial, Helvetica, sans-serif, u5FAEu8F6Fu96C5u9ED1;background-color:#FFFFFF;\">\r\n	此外，随着2016年的到来，VR作为一个新平台被业界普遍看好，独立游戏开发团队对于这样的机会也是不可错过的。\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('27', '0', '<blockquote style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<p>\r\n		基于庞大的人口数量，中国手游也从中受益，前阵子还有报告指出亚洲会在 2017 年坐上游戏市场的头把交椅，其中中国市场的贡献最为突出。不知大家是否有想过，有朝一日中国称霸游戏界，会给我们的游戏生活带来怎样的影响。\r\n	</p>\r\n</blockquote>\r\n<p id=\"summarize_content\" class=\"txt\" style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p id=\"summarize_content\" class=\"txt\" style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	曾几何时，视频游戏是美国的骄傲，在 80 年代任天堂的崛起和日本游戏界的突飞猛进下，美国在游戏界的地位一下子就暗淡下来，有句话说的好，风水轮流转，如今日本国内市场游戏的竞争已经进入白热化 阶段，但是在中国，游戏的发展还处在上升阶段，不管是自主研发还是从国外引进，似乎都在告诉我们，中国市场就是继美日之后的又一“战场”。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	基 于庞大的人口数量，中国手游也从中受益，前阵子还有报告指出亚洲会在 2017 年坐上游戏市场的头把交椅，其中中国市场的贡献最为突出。不知大家是否有想过，有朝一日中国称霸游戏界，会给我们的游戏生活带来怎样的影响，又或者我们需 要面对怎样一个新环境？其实一早就有人做出了猜想，归纳来说就是以下几点。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">1、竞技为王 剧情向靠边站</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	中国玩家大多喜爱竞技类游戏已经不是什么秘密，有的人甚至可以泡在类 CS 或是其他 MOBA 游戏中上百个小时，在极大的社会压力之下，竞技游戏能够给他们带来的绝不仅仅是快乐，更多的是排名上位的那种成就感，哪怕这只是虚拟的，一时的。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	有一个例子可以很好地证明中国玩家更偏爱纯粹的竞技，他们在网吧甚至是在家里玩任何一款 MMORPG 时，很少会去细读任务中的一些剧情，而是不断地点击箭头跳过跳过再跳过，有些 MOBA 玩家打了上千小时的 LOL 也还不知道盖伦口中喊的究竟是啥。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	当然喜欢剧情向的中国玩家也不是没有，不过在长达 14 年主机市场遭禁的大环境下，可想而知这部分人占所有玩家的比例是少之又少，这在一定程度上让中国游戏市场不得不走上以竞技为主的道路。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">2、国外开发者要恶补三国知识</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	“三 国”是中华文化的瑰宝，同时也是游戏领域的常青题材，从近年来不断涌现的三国游戏你就会很清楚这一点，类型上不论是 RPG、卡牌，还是 MOBA，三国题材的身影总是少不了，错综复杂的历史剧情、豪情四海的世界观以及激烈的势力纷争、鲜明的人物故事等多个方面让三国成为了挖掘性极强的热门 IP。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	三国这部名着所构筑的内容相当宏大，不少外国朋友觉得它很有《伊利亚特特洛伊战争》与《权力的游戏》相混合的感觉，当中也不乏一些 正义价值观的传递以及功夫要素，另外电影《赤壁》也让海外玩家和开发者看到了更多关于三国的精彩历史，如果中国称霸游戏领域，那么老外恶补这部名着那是必 须的。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">3、回合对战 RPG 成为主流？</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	不管是日系还是欧美系，其 RPG 作品都具有相同的根基，最早可以追溯到一些桌游以及那款再经典不过的《巫术（Wizardry）》，后来由于玩家习惯上的不同，美式 RPG 更注重自由、开放、以及一些个性化的定制要素，对 PC 平台比较重视。而日系则看重主机平台，幻想味道浓厚，并且在画面上也多以华丽为主。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	中国在 RPG 领域的发展并没有欧美和日本那样有悠久的历史，不过中国玩家对于两个派系的 RPG 都表现出了较高的接受度，只要是好作品，不管出自哪个国家都会选择尝一尝。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	严格来说，西方 RPG 在中国更有竞争力，毕竟在平台的选择上，PC 的普及程度更高，而《暗黑破坏神2》的问世可以说打开了中国市场的大门，部分国内厂商借鉴这个玩法模式衍生出了一些同类型的游戏，一些欧美 MMORPG 也借助这个契机在中国市场站稳了脚跟。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	最 能勾起玩家回忆的日式 RPG，我想很多人都会异口同声地说《最终幻想》，对当时的中国玩家而言，能够在 PS 上玩到《最终幻想》是一件很奢侈的事情，但是凭借当时看来十分华丽的画面以及动人的故事情节，还是让 FF 这个游戏品牌得以广泛传递开来，记得此前香港女歌星王菲还曾经为《最终幻想8》献唱过主题曲。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	欧美与日系 RPG 对中国 RPG 的发展有不小的影响，不过就目前的中国 RPG 来说，更多还是停留在回合制的玩法模式上，近几年来似乎也没有太大起色，能不能彻底摆脱这种固有模式看来还需要等上相当长的一段时间，不习惯不行呀。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">4、无处不在的卡牌游戏</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	迅 速崛起的《炉石传说》让我们看到了卡牌游戏并非真的如某些人所说的那样已经走向末路，短短一年时间就已经成为一个电竞项目相当难得。反观中国市场，卡牌游 戏其实并不是什么新鲜事物，特别是移动平台上充斥着各种各样的卡牌游戏，由于缺乏版权意识和约束力，因此众多厂商对各种热门 IP 进行了大胆的改编，只可惜十个有八个是卡牌玩法，可见如果中国统治了游戏界，卡牌游戏将会对你进行轮番轰炸。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">5、拜审查制度所赐 向重口味说再见</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	游 戏审查并不是中国特有，但中国对海外游戏审查之严格，审查深度与和谐程度之大我想大家都有十分深刻的体会，包含有血腥、恐怖、暴力元素的游戏被拒之门外那 是再正常不过了，即便通过了审查，你也会发现原本重口味的游戏已经清淡了不少，前不久中国刚刚解禁主机市场，至于游戏的分级制度也不知会在什么时候出台， 加之盗版打击力度的加大，或许很长一段时间里我们都必须“吃的清淡一些”。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">6、无美女不游戏</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	“无 美女不游戏”这句话用来形容当今中国游戏领域那是再恰当不过了。从近年来的各类游戏展会中我们不难发现一个现象，那就国内展台除了展示游戏之外，有相当一 部分都是靠各种 Show Girl 来吸引玩家眼球，反观欧美游戏展，更多的是以游戏的质量、实际体验和新鲜卖点来挽留大家，Show Girl 与 Cosplay 仅仅是为了增强不同次元的互动而存在。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	如果中国在游戏界获得了主导地位，那么在竞争如此白热化的今天，各个厂商将会邀请更 多的美女助阵，穿着尺度会变得更加开放，甚至步“车展”后尘也说不定。而这个现象并不只是存在于现实的游戏展会，在虚拟的网络平台中，更是充斥着各种美女 图片，一些规模较小的网站为了吸引流量无所不用其极，久而久之审美疲劳就出来了。\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	其实中国要是真正地统治了游戏界，那么除了上述这几点，或 许还有一些地方是需要玩家与开发商们去适应的，比如营销模式、刷榜排名、合作方式等等，而这些被人们普遍提及的问题很好地放映了中国市场当前需要改善的一 些现象，称霸游戏市场只是一个不太可能实现的命题，能不能与国际接轨，取长补短才是当今中国游戏界应该思考的问题，小编也希望能够在有生之年看到国产游戏 可以从门面功夫的竞争转为内在的提升，真正去理解和实现“游戏体验”这四个字。&nbsp;\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('28', '0', '<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">互联网改变世界，改变思维，改变时空的参照系，山中一日，世上已千年。未来至少是2016年，互联网有哪些大趋势。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">&nbsp;</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.vlcms.com/data/upload/ueditor/20160120/569f42076db1f.png\" title=\"图片5.png\" alt=\"图片5.png\" />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">一、融媒体不断深化，生态化</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">传统媒体转型，门户消融，信息碎片化，移动新闻技术性高度强化，智能化，聚合化趋势骤增，虚拟现实新闻异军突起，媒体在经历一场天翻地覆的变革，当所有媒体都不能实现使用新闻欲求的时候，融合各类媒体形态，实现优势互补，媒介互通、内容兼容、利益共存的融媒体成为媒体革新的必然趋势，随着用户需求和体验加强，媒体竞争性的加剧，因为媒体在移动互联网时代的基础性作用日益凸显，未来融媒体趋势还将深化，并形成以融媒体为基础的商业大生态，生态是媒体的最终形态。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">从最初的移动互联网语音IM即时通讯切入即时沟通软件，到朋友圈、查找附近的人、摇一摇创新功能微信切入社交，上线朋友圈小视频，购物，游戏，订阅号的媒体，服务号的服务，企业号的管理，朋友圈广告，移动支付，本地生活服务，移动互联入口微信已经成为一个典型的融媒体，近日微信又在内测6分钱一分钟的直拨电话，加强对通信领域的控制，微信正在以移动入口的天生优势逐渐完成滚雪球式的生态控制。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">&nbsp;</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">二、互联网入口沉淀，平台化</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">移动互联网入口将会在未来得到进一步的沉淀，初期的入口大多停留在概念意义上，与大平台还差之千里，入口顶多是掌握了用户，完成了对平台结构的构建，元素的补充，要形成真正的平台，平稳渐进的沉淀是必然的。移动入口进阶平台级，进而形成生态才实现了入口的根本意义，入口从根本上来说，是对另一个平台和生态的重构，是对商业形态和空间的进化和再迁移。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">掌控入口的几大因素是用户，支付或者场景，当然更有其他更多的因素，互联网巨头大多争夺的是这些入口级的资源，微信掌控了用户以及用户关系，以用户为切点布局以用户为核心的平台、生态产业链，支付宝掌控了消费以及消费关系，以消费直接切入支付宝平台和生态产业链，而在移动互联网时代，场景成为入口之外的又一个绝对因素，互联网入口将在这些因素的导向作用下，进一步完成沉淀，真正形成一个资源共享，开放连接的大平台。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">入口本质上是另一个平台重构的雏形和开端，平台本质上也是近乎同一种产业形态的变迁，这个过程本质上是产业的进化。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">&nbsp;</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">三、场景深度加强，消费化</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">移动互联网环境下，场景已经融入基于社交、媒体、电商、金融、智能硬件的产业形态之中，QQ基于年轻用户的兴趣文化社交场景已经形成，微博基于明星名人大V、意见领袖(KOL)形成的明星娱乐文化和年轻化、碎片化的资讯形成移动互联时代特有的社交场景，微信特有的商务化社交场景，陌陌特定的LBS陌生人间社交场景，Secret的匿名社交场景，支付宝特有的消费场景，短视频的风行，自拍杆的火爆……移动互联网时代的社交和支付等应用，各类新产品顺应场景而自然诞生，移动互联网时代，无处不在的场景成为时代的标签。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">随着移动互联网的全面深化，互联网+上升到国家高度，全面渗透进社会生活，随之以互联网为核心的场景将更加密集和深化，在各种场景下，一切新的产品都将被发明和引爆，场景就像移动互联网时代的引火器，有着颠覆一切的无限可能，场景即创造，场景即分享，场景即流行，场景即消费。可以说整个移动互联时代都是场景时代，场景深度将在未来不断加强，在场景不断加强的基础上，消费将会成为最终自然的结果，场景消费化，进一步形成整个移动互联环境生态。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">四、文化再度深化，个性化</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">互联网文化随着互联网的变化而变化，互联网是年轻人的战场，尤其是当今的90后，00后甚至自出生就在互联网环境中浸泡长大，互联网文化就成了他们的主流文化，而对其他年龄层的人来说，这些文化都是所谓的非主流文化，显然很不适应迎面而来的年轻文化。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">传统文化的思维禁锢和媒介的机械化运作导致依附于传统媒体、传统产业生态的传统文化在互联网时代已经日迫西山，行将被新兴的互联网文化所替代，信息碎片化造成了新兴文化的细分化、即时化，曾经一度阅后即焚成为年轻用户追捧的新潮，个性化文化层出不穷。在QQ、微博、兴趣部落这样新文化盛行的泛社交生态圈，幽默、搞笑、贱萌符合年轻人口味的个性化兴趣文化泛滥成灾，新的网络文化标签和网络流行语瞬间引发互联网爆炸。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">随着移动互联网生态的逐渐形成，新的年轻的、个性的互联网文化将充斥整个移动互联生态圈，新兴文化引导互联网潮流将必不可逆。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">&nbsp;</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">五、智能技术再升级，智慧化</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">今日头条等新媒体智能检索和新闻聚合彰显了技术对新媒体的革新，媒体将借助创新技术向智能化实现升级，虚拟现实技术同时融入新闻媒体，新的媒体形态产生，体验更优。不仅仅是媒体，搜索引擎融入智能化社交成为大势所趋，微软小冰、百度小度机器人更是将智能技术嵌入搜索引擎，赋予搜索引擎人脑作用。使用搜索引擎像与人对话一样，这也许就是互联网的高级模式了，智能机器人这种比人类更智慧的高级物种族群大行其道必不可逆。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">智能技术助推产业形态升级，将赋予其人脑的智慧，智慧城市，智慧农村，智慧家庭等社会组织形态统统都将在互联网智能技术的驱动下成为现实，互联网从最初的沟通作用，到连接作用，便利人类，最终将改造社会，改造人类。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">&nbsp;</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">六、互联网+“地球生态”加速，大规模化</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">互联网+将成为一种核心力量，成为传统产业向互联网转型的驱动力，将推动传统产业向互联网虚拟生态迅速迁移，呈现大规模趋势。互联网将成为所有传统产业的基础生态，传统产业跨界互联网创变升级，媒体、社交、电商、金融、本地服务、智能硬件等产业形态都以互联网+的作用力，向互联网这个中心无限靠近，形成类“地球生态”，这便是我所提出的“互联网+向心论”。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">互联网+向心论有五大核心，分别是互联网+向心论的中心，互联网;互联网+向心论的力，互联网+;互联网+向心论的产业区间，传统产业和虚拟产业;互联网+向心论的生态，媒体、社交、电商、金融、本地服务、智能硬件、运营商等产业形态形成的虚拟“地球生态”;&nbsp;互联网+向心论的度，传统实体产业向互联网转型的过程中，要实现有效的对接，互联网+向心力要张弛有度，方能实现产业的升级跨越和创变。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">在虚拟的互联网+作用力下，互联网+虚拟“地球生态”将加速，大规模化。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">&nbsp;</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">七、O2O全面进击，迁移化</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">互联网+“地球生态”渐成的同时，电子商务进入沉淀期，跨境电商成为新的引爆点，媒体进入平台期，智能技术成为驱动器，社交进入智能机器人阶段，消费进入场景时代，作为所有产业形态里的最后一站，最接地气的O2O成为互联网+的根本节点，O2O本地生活服务就近连接传统实体产业和互联网虚拟产业将全面向互联网虚拟产业大迁移，大规模爆发。将本地生活服务嫁接于互联网，实现城市生活智慧化，O2O将全面从乡村迁移互联网爆发智慧农业生态，农民生活互联网化，这将是O2O的终极目的。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">新旧跨界交锋的时刻，往往是资本大战最火热的时刻，O2O巨头在2015年经历了滴滴快的、58赶集、美团点评、去哪儿携程大合并，未来将全面进入洗牌期，资本兼并还将持续，O2O依然是BAT巨头的天下，但整个本地生活服务市场将迎来产业的全面爆发和新的商业形态，多样化、细分化呈现，O2F、O2M、F2C、B2N等商业形态将全面爆发。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">八、明星转型互联网，直接引爆化</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">娱乐成为一种经济，始于人的精神欲求，自然风光无限，然而新旧交替的时代，唱片已死，由互联网主宰的电影业IP为王呼声高涨，娱乐至死2.0台网联动成为新常态。娱乐经济的主角明星跨界互联网，开启新一轮的IP争夺战成为新常态，而且一开始就形成天生的强势IP，在互联网炸开了锅。何炅入职阿里音乐，胡海泉投资手游，智能手表，张泉灵投资新媒体，明星的面孔在互联网数见不鲜，并且直接引爆互联网，其费尽心思去制造一个强势IP,远远不及天生的IP光环耀眼，这也是明星转型的根本原因。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:2em;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, \'Microsoft YaHei\';\">科技和娱乐主导的新商业经济将掀起新一轮的商业变革大战，融入娱乐和科技元素的电影业，视频直播，搞笑短视频产业必将掀起新的流行，娱乐是内容驱动力，科技是技术驱动力，加上明星的IP效应，资本驱动，新商业经济将引爆精神领域和科技领域“上层经济”的天然爆发。我曾提出电视台、明星、互联网恰恰形成新商业经济的O2O铁三角，明星是核心主导，也充当了O2O的TO的连接和支点作用，凭借明星的强势IP引爆流行成为必然。</span>\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('29', '0', '<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">玩家留存率是最重要的业绩指标之一，留住玩家可维持游戏的寿命数十年时间，并长期创收。最近的调查表明，将高消费玩家(高端玩家)最初从免费玩家转化为付费玩家所需的时间最长——平均需要15天。然而怎么去留住这些人呢?手游生存法则——直接、悬念及分享是留住玩家的关键。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">一位开发过15款以上游戏的资深游戏设计师DoriAdar，他分享了能够保持玩家参与度和提高玩家游戏频率的5项游戏设计技巧。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#FF0000;font-weight:bold;font-size:16px;\">【直接：快速打开，直奔主题!】</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">要留住玩家，必须让他们享受第一次游戏体验。一开始就觉得体验不太好的玩家不太可能再给这款游戏第二次机会。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">为了让玩家快速体验游戏核心部分，设计十分重要。《海岛奇兵(BoomBeach)》是这方面的典范。这款游戏只需要玩家点击3次即可体验其玩法的精髓：开始游戏，建造第一座塔楼，然后观看战斗。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;\">&nbsp;</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#FF0000;font-weight:bold;font-size:16px;\">【悬念：制造悬念，吸引玩家】</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">激发玩家的好奇心也是好方法。很多手段都能做到这一点，但最有效的方式是延迟反馈。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">以《Covet&nbsp;Fashion》这款社交装扮游戏为例，玩家需要打扮自己出席各种时尚界活动，如电影首映式。玩家首先要疯狂购物，参考好友的意见搭配服装，再向活动主办方提交她们的服装搭配。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">大多数游戏会在玩家提交信息之后立刻提供反馈(评分或其他评级)。但是《Covet&nbsp;Fashion》是一款社交装扮游戏，需要对玩家提交的服装搭配进行投票，因此在最终结果揭晓之前，玩家得耐心等待(有时甚至需要等待几天时间)。在等待投票结果的这段时间，玩家会非常好奇自己的表现和最终的奖品。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">从游戏设计角度来说，立刻提供反馈是常理。但反其道而行之可激发玩家的兴趣，让他们想要了解更多信息，以此来培养玩家的游戏习惯。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;\">&nbsp;</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#FF0000;font-weight:bold;font-size:16px;\">【分享：考虑社交分享、竞争和协作】</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">根据自己的从业经历，DoriAdar发现和社交网络绑定的玩家的价值是匿名玩家的3倍。这说明，说服玩家通过Facebook进行登录十分重要。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">根据Bartle四种玩家分类法(Bartle’s&nbsp;four&nbsp;player&nbsp;types)，社交功能会获得两类玩家的青睐。成就型玩家(热衷竞争的玩家)：他们会因为排行榜以及与好友竞争而更加投入。《糖果粉碎传奇(Candy&nbsp;Crush&nbsp;Saga)》中的社交地图和关卡排行榜对这类玩家具有很强的吸引力。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">社交型玩家喜欢体验协作的乐趣。当玩家们为了一个类似的目标共同努力时，往往会更愿意投入游戏，而一群投入玩家要比一名单独的玩家具有更好留住。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-align:center;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;\">&nbsp;</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">游戏的设计要能留住玩家，以最大化收入和投资回报率。这一思维模式而不是对付费游戏的表面模仿，应是手机游戏设计的重要组成部分。</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">免费手机游戏可提升玩家留存率的设计技巧：</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">1.打开速度尽可能快，让玩家可以体验到游戏的乐趣</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">2.在第一次游戏时就给玩家制造巨大的悬念</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">3.对在游戏中投入时间的玩家进行奖励</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">4.通过协作元素提升玩家的投入度</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">5.在玩家不玩游戏时，通过推送通知提升他们的投入度</span>\r\n</p>\r\n<p style=\"color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;font-size:14px;text-indent:28px;background:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑;color:#666666;font-size:16px;\">利用这些技巧，玩家会自然而然地重复玩游戏。快速投入游戏的玩家很可能会转化为高消费玩家，提升游戏的收入潜力。利用DoriAdar的设计技巧是将游戏转变为吸金石的关键。</span>\r\n</p>', '', '0');
INSERT INTO `sys_document_article` VALUES ('30', '0', '<p style=\"text-align:left;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:16px;\"></span> \r\n</p>\r\n<h2 style=\"font-size:18px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:18px;font-family:\'Microsoft YaHei\';color:#000000;\">关于溪谷</span> \r\n</h2>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">溪谷软件创立于2015年，是一个专业提供手游推广核心工具！</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">致力于开发国内最优秀的SDK系统、渠道推广系统、APP手游盒子、PC官网和社区系统，力求实现手游联运推广一站式解决方案。</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;\"><br />\r\n</span> \r\n</p>\r\n<h2 style=\"font-size:18px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:18px;font-family:\'Microsoft YaHei\';color:#000000;\">历史事件</span> \r\n</h2>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">▫▫▫▫▫▫▫▫▫▫▫▫▫　2016年我们一起出发，为更多客户提供好用，开源的程序。</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">2016年01月 手游推广整套系统发布</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">2015年10月 启动溪谷软件开发项目</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">2015年08月 成立徐州梦创信息科技有限公司</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">2014年05月 启动页游平台联运，成功运营几十款页游</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">2013年07月 网页游戏平台+推广程序4.0盛大发布</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">2012年11月 网页游戏平台程序发布</span> \r\n</p>\r\n<p style=\"font-size:14px;color:#999999;font-family:Arial, \'Microsoft Yahei\', \'Lantinghei SC\', \'Heiti SC\', simsun, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#000000;\">2012年09月 启动网页游戏平台程序项目</span> \r\n</p>\r\n<br />\r\n<p>\r\n	<br />\r\n</p>', '', '0');

-- ----------------------------
-- Table structure for sys_document_download
-- ----------------------------
DROP TABLE IF EXISTS `sys_document_download`;
CREATE TABLE `sys_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of sys_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('1', 'sdk_test_demo.apk', '56f2d1acc7a94.apk', '2016-03-24/', 'apk', 'application/zip', '930226', 'ba4cfe0df3da0efd12d3c5329018aa34', '3e16a33c9b89a05b78251cfca2a32c00d9d4655b', '0', '', '1458753964');

-- ----------------------------
-- Table structure for sys_hooks
-- ----------------------------
DROP TABLE IF EXISTS `sys_hooks`;
CREATE TABLE `sys_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_hooks
-- ----------------------------
INSERT INTO `sys_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '', '1');
INSERT INTO `sys_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop', '1');
INSERT INTO `sys_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment', '1');
INSERT INTO `sys_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment', '1');
INSERT INTO `sys_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '', '1');
INSERT INTO `sys_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment', '1');
INSERT INTO `sys_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor', '1');
INSERT INTO `sys_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin', '1');
INSERT INTO `sys_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam', '1');
INSERT INTO `sys_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor', '1');
INSERT INTO `sys_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '', '1');
INSERT INTO `sys_hooks` VALUES ('17', 'UploadImages', '多图片上传', '1', '1458469881', 'UploadImages', '1');
INSERT INTO `sys_hooks` VALUES ('19', 'wxpaynative', '微信支付', '1', '1460016931', '', '1');

-- ----------------------------
-- Table structure for sys_member
-- ----------------------------
DROP TABLE IF EXISTS `sys_member`;
CREATE TABLE `sys_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of sys_member
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('2', '内容', '0', '3', 'article/mydocument', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0', '1');
INSERT INTO `sys_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0', '1');
INSERT INTO `sys_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('16', '用户', '0', '2', 'User/index', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('17', '管理员列表', '16', '1', 'User/index', '0', '', '管理员中心', '0', '1');
INSERT INTO `sys_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('19', '管理员行为', '16', '2', 'User/action', '0', '', '行为管理', '0', '1');
INSERT INTO `sys_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('27', '角色管理', '16', '4', 'AuthManager/index', '0', '', '管理员中心', '0', '1');
INSERT INTO `sys_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('43', '扩展', '0', '10', 'Addons/index', '1', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0', '1');
INSERT INTO `sys_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0', '1');
INSERT INTO `sys_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0', '1');
INSERT INTO `sys_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('68', '系统', '0', '8', 'Config/group', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0', '1');
INSERT INTO `sys_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0', '1');
INSERT INTO `sys_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0', '1');
INSERT INTO `sys_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0', '1');
INSERT INTO `sys_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', '0', '', '系统设置', '0', '1');
INSERT INTO `sys_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0', '1');
INSERT INTO `sys_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0', '1');
INSERT INTO `sys_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('93', '其他', '0', '9', 'other', '1', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0', '1');
INSERT INTO `sys_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('106', '行为日志', '16', '5', 'Action/actionlog', '0', '', '行为管理', '0', '1');
INSERT INTO `sys_menu` VALUES ('108', '修改密码', '16', '6', 'User/updatePassword', '1', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('109', '修改昵称', '16', '7', 'User/updateNickname', '1', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('122', '数据列表', '58', '0', 'think/lists', '1', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('123', '审核列表', '3', '0', 'Article/examine', '1', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('124', '游戏', '0', '4', 'Game/lists', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('125', '推广', '0', '5', 'Promote/lists', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('126', '统计', '0', '7', 'Statistics/index', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('127', '游戏管理', '124', '1', 'Game/lists', '0', '', '游戏管理', '0', '1');
INSERT INTO `sys_menu` VALUES ('128', '区服管理', '124', '4', 'Area/lists', '0', '', '游戏管理', '0', '1');
INSERT INTO `sys_menu` VALUES ('129', '游戏礼包', '124', '5', 'Giftbag/lists', '0', '', '礼包管理', '0', '1');
INSERT INTO `sys_menu` VALUES ('130', '推广员管理', '125', '1', 'Promote/lists', '0', '', '渠道管理', '0', '1');
INSERT INTO `sys_menu` VALUES ('131', '新增', '127', '0', 'Game/add', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('132', '编辑', '127', '0', 'Game/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('133', '排序', '127', '0', 'Game/sort', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('134', '新增', '128', '0', 'Area/add', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('135', '编辑', '128', '0', 'Area/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('136', '新增', '129', '0', 'Giftbag/add', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('137', '编辑', '129', '0', 'Giftbag/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('140', '编辑', '138', '0', 'Query/user_edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('146', '编辑', '141', '0', 'Apply/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('148', '日常统计', '126', '0', 'Statistics/index', '0', '', '数据统计', '0', '1');
INSERT INTO `sys_menu` VALUES ('150', '新增', '145', '0', '/Withdraw/add', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('151', '管理员修改', '16', '2', 'User/updateNickname', '0', '', '管理员中心', '0', '1');
INSERT INTO `sys_menu` VALUES ('152', '纠错管理', '124', '7', 'Message/wrong', '0', '', '游戏管理', '0', '1');
INSERT INTO `sys_menu` VALUES ('153', '领取记录', '124', '6', 'Giftbag/record', '0', '', '礼包管理', '0', '1');
INSERT INTO `sys_menu` VALUES ('156', '新增', '155', '0', 'Game/add_source', '0', '', '游戏管理', '0', '1');
INSERT INTO `sys_menu` VALUES ('157', '编辑', '142', '0', '/Mend/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('158', '平台币', '0', '6', 'Provide/provide', '1', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('159', '发放记录', '124', '1', 'Provide/provide', '0', '', '平台币管理', '0', '1');
INSERT INTO `sys_menu` VALUES ('162', '用户余额', '124', '4', 'Provide/balance', '0', '', '平台币管理', '0', '1');
INSERT INTO `sys_menu` VALUES ('196', '编辑', '194', '0', 'Classification/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('195', '新增', '194', '0', 'Classification/add', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('194', '游戏分类', '124', '0', 'Classification/lists', '0', '', '游戏管理', '0', '1');
INSERT INTO `sys_menu` VALUES ('166', '平台用户', '16', '9', 'Member/user_info', '0', '', '用户数据', '0', '1');
INSERT INTO `sys_menu` VALUES ('167', '编辑', '166', '0', 'Member/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('168', '友链管理', '68', '0', 'Links/lists', '0', '', '网站设置', '0', '1');
INSERT INTO `sys_menu` VALUES ('169', '广告管理', '68', '0', 'Admin/SlideManage/index', '0', '', '广告管理', '0', '1');
INSERT INTO `sys_menu` VALUES ('170', '广告类型', '68', '0', 'Admin/SlideType/index', '0', '', '广告管理', '0', '1');
INSERT INTO `sys_menu` VALUES ('172', '媒体官网', '68', '0', 'Admin/WebConfig/group?websiteid=1', '0', '', '网站设置', '0', '1');
INSERT INTO `sys_menu` VALUES ('190', '新增', '168', '0', 'Links/add', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('176', '编辑', '130', '0', 'Promote/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('177', '网站设置', '68', '0', 'WebConfig/index', '0', '', '网站设置', '0', '1');
INSERT INTO `sys_menu` VALUES ('178', '新增', '169', '0', 'SlideManage/add', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('179', '编辑', '169', '0', 'SlideManage/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('180', '编辑', '170', '0', 'SlideType/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('181', '新增', '170', '0', 'SlideType/add', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('182', '新增', '175', '0', '/Template/add', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('183', '编辑', '175', '0', 'Template/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('184', '新增', '174', '0', 'Selfbuilt/add', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('185', '编辑', '174', '0', 'Selfbuilt/edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('186', '新增', '159', '0', 'Provide/add', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('187', '编辑', '162', '0', 'Provide/user_edit', '0', '', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('188', '游戏充值', '16', '10', 'Query/game_spend', '0', '', '用户数据', '0', '1');
INSERT INTO `sys_menu` VALUES ('191', '编辑', '168', '0', 'Links/edit', '0', '', '', '0', '1');

-- ----------------------------
-- Table structure for sys_model
-- ----------------------------
DROP TABLE IF EXISTS `sys_model`;
CREATE TABLE `sys_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of sys_model
-- ----------------------------
INSERT INTO `sys_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '0', '', '', '1383891233', '1384507827', '1', 'MyISAM');
INSERT INTO `sys_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', '', '', '0', '', '', '1383891243', '1387260622', '1', 'MyISAM');
INSERT INTO `sys_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', '', '', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');
INSERT INTO `sys_model` VALUES ('4', 'game', '游戏表', '0', '', '1', '{\"1\":[\"49\",\"48\",\"47\",\"46\",\"50\",\"51\",\"55\",\"54\",\"53\",\"52\",\"45\",\"44\",\"37\",\"36\",\"35\",\"34\",\"38\",\"39\",\"43\",\"42\",\"41\",\"40\",\"33\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\nsort:排序\r\ngame_name:游戏名称\r\ngame_appid:游戏APPID\r\ngame_type|get_game_type:游戏类型\r\ncategory|get_game_category:游戏分组\r\ngame_status|get_info_status:游戏状态\r\nrecommend_status|get_game_recommend:推荐状态\r\nid:操作:[EDIT]&id=[id]|编辑,Game/del?ids=[id]|删除', '10', 'game_name', '', '1457707158', '1458728330', '1', 'MyISAM');
INSERT INTO `sys_model` VALUES ('5', 'info', '游戏信息表', '0', '', '1', '{\"1\":[\"62\",\"63\",\"64\",\"61\",\"60\",\"57\",\"58\",\"59\",\"56\"]}', '1:基础', '', '', '', '', '', 'id:编号', '10', '', '', '1457707497', '1457707518', '1', 'MyISAM');
INSERT INTO `sys_model` VALUES ('6', 'area', '区服管理', '0', '', '1', '{\"1\":[\"74\",\"73\",\"75\",\"76\",\"77\",\"72\",\"71\",\"67\",\"66\",\"68\",\"69\",\"70\",\"65\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\narea_name:区服名称\r\ngame_id|get_game_name:游戏名称\r\nrecommend_status|get_info_status:推荐状态\r\nstop_status|get_info_status:区服状态\r\nstart_time|set_show_time:开服时间\r\nid:操作:[EDIT]&id=[id]|编辑,Area/del?ids=[id]|删除', '10', 'area_name', '', '1457766727', '1458285369', '1', 'MyISAM');
INSERT INTO `sys_model` VALUES ('7', 'giftbag', '礼包管理', '0', '', '1', '{\"1\":[\"88\",\"87\",\"89\",\"90\",\"92\",\"91\",\"86\",\"85\",\"80\",\"79\",\"81\",\"82\",\"84\",\"83\",\"78\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ngiftbag_name:礼包名称\r\ngame_id|get_game_name:游戏名称\r\narea_id|get_area_name:区服名称\r\nstatus|get_info_status:状态\r\nstart_time|set_show_time*time:开始时间\r\nend_time|set_show_time*time:结束时间\r\nid:操作:[EDIT]&id=[id]|编辑,Giftbag/del?ids=[id]|删除', '10', 'giftbag_name', '', '1457779784', '1458525227', '1', 'MyISAM');
INSERT INTO `sys_model` VALUES ('8', 'promote', '推广员信息', '0', '', '1', '{\"1\":[\"105\",\"104\",\"103\",\"106\",\"107\",\"109\",\"108\",\"102\",\"101\",\"96\",\"95\",\"94\",\"97\",\"98\",\"100\",\"99\",\"93\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\naccount:账号\r\nreal_name:姓名\r\nmobile_phone:手机\r\nemail:邮箱\r\nstatus|get_info_status*3:状态\r\nid:操作:[EDIT]&id=[id]|查看,Promote/del?ids=[id]|删除', '10', 'account', '', '1457829118', '1458451637', '1', 'MyISAM');
INSERT INTO `sys_model` VALUES ('10', 'apply', '申请审核', '0', '', '1', '{\"1\":[\"116\",\"117\",\"118\",\"119\",\"115\",\"114\",\"111\",\"112\",\"113\",\"110\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ngame_id|get_game_name:游戏名称\r\npromote_id|get_promote_name:推广员\r\nratio*10:分成比例\r\napply_time|set_show_time:申请时间\r\nstatus|get_info_status*5:申请状态\r\ndispose_id|get_admin_nickname:操作人\r\ndispose_time|set_show_time:操作时间\r\nid:操作:Apply/[EDIT]|编辑,Apply/package?ids=[id]|打包', '10', '', '', '1457933133', '1458806828', '1', 'MyISAM');
INSERT INTO `sys_model` VALUES ('11', 'message', '留言纠错', '0', '', '1', '{\"1\":[\"126\",\"127\",\"128\",\"125\",\"124\",\"121\",\"122\",\"123\",\"120\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ngame_id|get_game_name:游戏名称\r\ntitle:错误内容\r\ncreate_time|set_show_time:提交时间\r\nstatus|get_info_status*6:修复状态\r\nop_account:操作', '10', 'title', '', '1458193581', '1458745011', '1', 'MyISAM');
INSERT INTO `sys_model` VALUES ('12', 'record', '礼包领取记录', '0', '', '1', '{\"1\":[\"134\",\"135\",\"136\",\"133\",\"132\",\"130\",\"131\",\"129\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ngame_id|\r\ngame_name:游戏名称\r\ngift_name:礼包名称\r\nuser_id|get_user_account:领取用户\r\nnovice:激活码\r\ncreate_time|set_show_time*time:领取时间', '10', 'gift_name', '', '1458195085', '1458527236', '1', 'MyISAM');
INSERT INTO `sys_model` VALUES ('20', 'classification', '游戏分类', '0', '', '1', '{\"1\":[\"188\",\"187\",\"186\",\"189\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\nname:名称\r\nsort:排序\r\nid:操作:[EDIT]&id=[id]|编辑,Classification/del?ids=[id]|删除', '10', '', '', '1460433025', '1460433039', '1', 'MyISAM');
INSERT INTO `sys_model` VALUES ('15', 'links', '友链管理', '0', '', '1', '{\"1\":[\"156\",\"157\",\"155\",\"154\",\"152\",\"153\",\"151\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntitle:名称\r\nlink_url:友链地址\r\nlink_icon:友链图标\r\nstatus|get_info_status:友链状态\r\ntype|get_links_type:友链类型\r\ncreate_time|set_show_time:创建时间\r\nid:操作:[EDIT]|编辑,Links/del?ids=[id]|删除', '10', 'title', '', '1458478006', '1458481980', '1', 'MyISAM');
INSERT INTO `sys_model` VALUES ('16', 'selfbuilt', '自建网站', '0', '', '1', '{\"1\":[\"166\",\"165\",\"167\",\"168\",\"169\",\"164\",\"163\",\"159\",\"160\",\"161\",\"162\",\"158\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ngameid|get_gamename:游戏名称\r\nwebname:官网名称\r\ntemplatename|get_tepname:模板名称\r\nweburl|open_url:域名\r\nid:操作:Selfbuilt/edit?model=[id]|编辑,Selfbuilt/del?ids=[id]|删除', '10', '', '', '1458483897', '1458483924', '1', 'MyISAM');
INSERT INTO `sys_model` VALUES ('17', 'template', '官网模板', '0', '', '1', '{\"1\":[\"173\",\"172\",\"171\",\"170\"]}', '1:基础', '', '', '', '', '', 'temname:官网名称\r\nmark:标识\r\npath:路径\r\npicture:缩略图\r\nid:操作:[EDIT]&model=[id]|编辑,del?ids=[id]|删除', '10', '', '', '1458484201', '1458484216', '1', 'MyISAM');
INSERT INTO `sys_model` VALUES ('18', 'slidemanage', '幻灯片管理', '0', '', '1', '{\"1\":[\"180\",\"181\",\"182\",\"179\",\"178\",\"175\",\"176\",\"177\",\"174\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\nslidetitle:标题\r\nslidedes:描述\r\nslideurl:地址\r\nclassify:分类\r\nlevel:优先级\r\nid:操作:SlideManage/edit?model=[id]|编辑,SlideManage/del?ids=[id]|删除,SlideManage/setstatus?model=[id]&stauts=1|显示,SlideManage/setstatus?model=[id]&stauts=0|隐藏', '10', '', '', '1458484325', '1458484343', '1', 'MyISAM');
INSERT INTO `sys_model` VALUES ('19', 'slidetype', '幻灯片类型', '0', '', '1', '{\"1\":[\"185\",\"184\",\"183\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntypename:标题\r\ntypemark:标示\r\ndescribe:描述\r\nid:操作:SlideType/edit?model=[id]|编辑,SlideType/del?ids=[id]|删除', '10', '', '', '1458484380', '1458484397', '1', 'MyISAM');

-- ----------------------------
-- Table structure for sys_picture
-- ----------------------------
DROP TABLE IF EXISTS `sys_picture`;
CREATE TABLE `sys_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_picture
-- ----------------------------
INSERT INTO `sys_picture` VALUES ('1', '/Uploads/Picture/2016-03-23/56f25e76ac01d.png', '', '052cbabfa18f6da1c72c661a39f4c3e5', 'fcf569bd80407c3841d3575f6347a5e6b0a4fc8c', '1', '1458724470');
INSERT INTO `sys_picture` VALUES ('2', '/Uploads/Picture/2016-03-23/56f25edd1c369.jpg', '', 'eac5c823ab21143260c334c6fd70cef2', 'b27dd6c7c4f2f7bda2054d617d8fc08f6e8a9aef', '1', '1458724573');
INSERT INTO `sys_picture` VALUES ('3', '/Uploads/Picture/2016-03-23/56f25fed5f0c6.jpg', '', '3cf2354c02bd5e1d9fcdcad78b81e8c8', 'f23d761d1a1206ee58dfaa3704c7c3ff4d17bcb4', '1', '1458724845');
INSERT INTO `sys_picture` VALUES ('4', '/Uploads/Picture/2016-03-23/56f260b0397f3.jpg', '', '450fa470e84e27711d2e375b8db5dd2e', '0a2e5a980fe6435fdcedf7342e4e4b9fa2c96dba', '1', '1458725040');
INSERT INTO `sys_picture` VALUES ('5', '/Uploads/Picture/2016-03-23/56f260e393b84.jpg', '', '513a6e98f7e683e66035f82c35f0cc86', '2d1b4b7cd6f23fdc763e760da869ff7f47278dc7', '1', '1458725091');
INSERT INTO `sys_picture` VALUES ('6', '/Uploads/Picture/2016-03-23/56f26103cb94a.jpg', '', '6743681255ec70c25788ab3188ebddec', '118c9c55fbd5cdebdab4956c2e751a8fa472f1d2', '1', '1458725123');
INSERT INTO `sys_picture` VALUES ('7', '/Uploads/Picture/2016-03-23/56f261234d27f.jpg', '', '0294198516ad73a84da0ae54185f8943', 'c46d8c436eb1d093a3b9668b099ec62d1d148ee4', '1', '1458725155');
INSERT INTO `sys_picture` VALUES ('8', '/Uploads/Picture/2016-03-23/56f261a32f479.png', '', '53d67cce7be5a256c3e87f7b14a48c85', '29e02f33c541a1c23eaf64ba48cfa2a1270592c8', '1', '1458725283');
INSERT INTO `sys_picture` VALUES ('9', '/Uploads/Picture/2016-03-23/56f263698ec61.jpg', '', 'ad7c4dcb1d7a6cd974d2600660c77247', '43926a4bed12b5a744c564024df07729f1e8cc6b', '1', '1458725737');
INSERT INTO `sys_picture` VALUES ('10', '/Uploads/Picture/2016-03-23/56f263a9594bd.jpg', '', 'd967a0f5aae61cd48c8494b82342e6f9', '2bb37fa94757e83bd32fbde7ab8fa04ba7ef194b', '1', '1458725801');
INSERT INTO `sys_picture` VALUES ('11', '/Uploads/Picture/2016-03-23/56f264acdbc1b.png', '', '28cf350991543801a768669e822717f0', '34b25d8576e798c9e879a618a5bf44ce7a0439db', '1', '1458726060');
INSERT INTO `sys_picture` VALUES ('12', '/Uploads/Picture/2016-03-23/56f264ee22673.jpg', '', 'd30b877fc760ba69b3e7a53275d7de66', '7ce72395737ae1ead1dabb5c21edb2a47efc5949', '1', '1458726126');
INSERT INTO `sys_picture` VALUES ('13', '/Uploads/Picture/2016-03-23/56f2658b5daed.png', '', '7c8472c593c545c560812219be9a6b95', 'de2c0f82239ec8f41462bcda184950c7fd93ca81', '1', '1458726283');
INSERT INTO `sys_picture` VALUES ('14', '/Uploads/Picture/2016-03-23/56f2658f889c6.jpg', '', 'cbf0e0a4e116a31905a023192b921ee1', '894d18a4e8a57a22718024452889a0bbd0061969', '1', '1458726287');
INSERT INTO `sys_picture` VALUES ('15', '/Uploads/Picture/2016-03-23/56f2662f2140b.png', '', '40e03506728abc06fb7177ca931904c5', '74c9d9e7023b84e7961be4b121558fbb37f68dcc', '1', '1458726447');
INSERT INTO `sys_picture` VALUES ('16', '/Uploads/Picture/2016-03-23/56f266d6ebe78.png', '', '95e09605962f6b68a9d402753b910329', '9dfd0e79c2861990f626e262897202524cdad555', '1', '1458726614');
INSERT INTO `sys_picture` VALUES ('17', '/Uploads/Picture/2016-03-23/56f268dfe748d.png', '', '44174af1d171beb7ee019365e35b9519', '6867dee89da1dfdf0f6a4eb2c615d7d15bfe2ad1', '1', '1458727135');
INSERT INTO `sys_picture` VALUES ('18', '/Uploads/Picture/2016-03-23/56f26b42f327b.jpg', '', 'fd70df12b0fb3e2bae7fedf87e36c9cf', 'd7de0830d9ab254e699713a67bd877185a3933a0', '1', '1458727746');
INSERT INTO `sys_picture` VALUES ('19', '/Uploads/Picture/2016-03-23/56f26d093c88a.png', '', 'a88b3be03b6a522d05e5a774ea1eddc5', 'dbd76e17da65b484dd1b231345cd8b95fdcd1b44', '1', '1458728201');
INSERT INTO `sys_picture` VALUES ('20', '/Uploads/Picture/2016-03-23/56f26d7c058e1.png', '', '6d07832a13ab9b9de5c71ed2ecb00de4', '166a3ec5a1bce7e63475a244e7951940b397cc97', '1', '1458728315');
INSERT INTO `sys_picture` VALUES ('21', '/Uploads/Picture/2016-03-23/56f26dcc7c36e.jpg', '', 'c428daa0ea4dcd8d8fc766d481507fff', 'bdc25ce54d5ed03ded87af28236b228004f717cd', '1', '1458728396');
INSERT INTO `sys_picture` VALUES ('22', '/Uploads/Picture/2016-03-23/56f26ea8b57db.png', '', 'fb385bbf2a2b45b9aba9422151a65a34', '5171c74cf441fe2a13cf45c94e5b97214043a173', '1', '1458728616');
INSERT INTO `sys_picture` VALUES ('23', '/Uploads/Picture/2016-03-23/56f26fafd9a60.png', '', '05180109c543436a9c658c9e94e361c4', 'b1725589c60013cbfadab9130eacd7040a7c4326', '1', '1458728879');
INSERT INTO `sys_picture` VALUES ('24', '/Uploads/Picture/2016-03-23/56f2700c22798.png', '', '48be87b8fad43f27321560c6cf582d95', '6e4156f2770589469073dd216b781c4df2dde1e2', '1', '1458728972');
INSERT INTO `sys_picture` VALUES ('25', '/Uploads/Picture/2016-03-23/56f2706cdfe67.png', '', 'eef061225e545c9b0a7cc2968f24ca89', 'a33af9235bf1be01a00190d1e8d359eadb7fa28d', '1', '1458729068');
INSERT INTO `sys_picture` VALUES ('26', '/Uploads/Picture/2016-03-23/56f270c4af3d4.png', '', 'd2173c3352db60ea972f72c5b1f0fcb0', '5c926715e1b6ab6300e8f190421632a3152c8fb0', '1', '1458729156');
INSERT INTO `sys_picture` VALUES ('27', '/Uploads/Picture/2016-03-23/56f27c705d602.jpg', '', 'dda1465c679a4aff23e9961f8a05c745', '3c27b7395386abdeabfc32a2fb361aaeb8a0fa9a', '1', '1458732144');
INSERT INTO `sys_picture` VALUES ('28', '/Uploads/Picture/2016-03-23/56f280dd26563.jpg', '', 'dc6145a6548927ea7e329e748206ef54', 'f7ce42f3ae56e181e7e8e51036bbb9d62c78017c', '1', '1458733277');
INSERT INTO `sys_picture` VALUES ('29', '/Uploads/Picture/2016-03-23/56f2810d81d19.jpg', '', '3e859a2480f606e4076f857442c8291d', '8f4c152d64f61dd55e207801d47e9177f77ddd5f', '1', '1458733325');
INSERT INTO `sys_picture` VALUES ('30', '/Uploads/Picture/2016-03-23/56f2b4932c233.jpg', '', 'ba45c8f60456a672e003a875e469d0eb', '30420d1a9afb2bcb60335812569af4435a59ce17', '1', '1458746515');
INSERT INTO `sys_picture` VALUES ('31', '/Uploads/Picture/2016-03-23/56f2b49f5aabd.jpg', '', '8969288f4245120e7c3870287cce0ff3', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '1', '1458746527');
INSERT INTO `sys_picture` VALUES ('32', '/Uploads/Picture/2016-03-24/56f2d12b3ff98.png', '', '292701736a3d4b790c1507ad7c3ccf85', '01bf7e3bb922baa9eed4d4aee1897df164ac39ab', '1', '1458753835');
INSERT INTO `sys_picture` VALUES ('33', '/Uploads/Picture/2016-03-24/56f3b9a41a41e.png', '', 'ca15f053d71d30a8bff20f4a08cc67a8', '53d202a6d86839e45c3b61850d6ce84f22d077d4', '1', '1458813348');
INSERT INTO `sys_picture` VALUES ('34', '/Uploads/Picture/2016-03-24/56f3b9b1abbb4.jpg', '', '25af11968b321c4979174e554797ea89', '81579847aa942f4ef040c70697b5e39e6874ad43', '1', '1458813361');
INSERT INTO `sys_picture` VALUES ('35', '/Uploads/Picture/2016-03-24/56f3cf71d278a.png', '', '6e422869a4b17b271b7eb222233551f2', '06c077f25208aca6f3a4d47142e890257df487ee', '1', '1458818929');
INSERT INTO `sys_picture` VALUES ('36', '/Uploads/Picture/2016-03-24/56f3d03724c71.jpg', '', '1e2f6f7926e6db220f8e38537f707280', '43d0c02ef2b6718480e397e9d0e3416573c61d8d', '1', '1458819127');
INSERT INTO `sys_picture` VALUES ('37', '/Uploads/Picture/2016-03-24/56f3d09731b50.png', '', 'f2e68c524870ca6226ecbec073011042', 'b1f008ed470e42d6699f4cce547a26f75e86b339', '1', '1458819223');
INSERT INTO `sys_picture` VALUES ('38', '/Uploads/Picture/2016-03-24/56f3d0fd1fda4.jpg', '', 'd6b76690bd124a892a7e3454267fa6bc', '3676e3709f76a2d128b553bccc25f2ba5310f2dc', '1', '1458819325');
INSERT INTO `sys_picture` VALUES ('39', '/Uploads/Picture/2016-03-24/56f3d1608ad26.png', '', 'e911534d1a892be78fbadb23e7631cb2', '50e745393d88dc087caba8b32d43bfea0c1bd931', '1', '1458819424');
INSERT INTO `sys_picture` VALUES ('40', '/Uploads/Picture/2016-03-24/56f3d16f89435.jpg', '', '2831ac73f882b6461dce055191a8561b', 'ab14d1f0802c59fc0289b9dd5d8362f3e1377172', '1', '1458819439');
INSERT INTO `sys_picture` VALUES ('41', '/Uploads/Picture/2016-03-24/56f3d1e96beeb.png', '', 'bfbc51b531217cbd2a25b4851ebb02f1', 'a658e4eebb9538de19c8f137c026402320ec81ea', '1', '1458819561');
INSERT INTO `sys_picture` VALUES ('42', '/Uploads/Picture/2016-03-24/56f3d1f3acad2.jpg', '', '48815c5e8adfde816fb32a333515495a', '148afd5ed71faef1e606caffd55c9eec2e45e4da', '1', '1458819571');
INSERT INTO `sys_picture` VALUES ('43', '/Uploads/Picture/2016-03-24/56f3d27829c25.png', '', '62cc5d2cadcf8d70c18e5e2cb8467d7d', '9e5e021f92d1c478b55c7c65d5528bef4769eb63', '1', '1458819704');
INSERT INTO `sys_picture` VALUES ('44', '/Uploads/Picture/2016-03-24/56f3d29037e74.jpg', '', '1b0a89f69470c20cae60873c557803e9', 'b0d8249fa25f856c71d5dbf57acbc8aa9e965a0e', '1', '1458819728');
INSERT INTO `sys_picture` VALUES ('45', '/Uploads/Picture/2016-03-24/56f3d2dd07578.png', '', 'afee495ee63b029035e0ece0efdc5f2b', '1d11bd6f8580300fb118d7b795908388aad4dbd0', '1', '1458819804');
INSERT INTO `sys_picture` VALUES ('46', '/Uploads/Picture/2016-03-24/56f3d2e5f0358.jpg', '', 'b2a09865b7611b7f9f91752e68c0725a', '4b96e011c6040bfbcc2a98e3a418f238ba637864', '1', '1458819813');
INSERT INTO `sys_picture` VALUES ('47', '/Uploads/Picture/2016-03-24/56f3d341cad52.png', '', '84cc669a3ed72f8df8bc00c66d358654', 'c1a21b8f2396187f44889f0fa77f3e0c2d992c5d', '1', '1458819905');
INSERT INTO `sys_picture` VALUES ('48', '/Uploads/Picture/2016-03-24/56f3d3496c9d7.jpg', '', 'fa362c71b42620fb5e6eea0983727e47', '52dc445d9e6cc1791590b0d80f8075ec5238fbe8', '1', '1458819913');
INSERT INTO `sys_picture` VALUES ('49', '/Uploads/Picture/2016-03-26/56f64da43c6aa.jpg', '', '4eca89002fe88309062231c7db9da647', '6f92dfdf7b744a133f550b44f04973bd1755c5a9', '1', '1458982308');
INSERT INTO `sys_picture` VALUES ('50', '/Uploads/Picture/2016-03-26/56f64da47145a.jpg', '', '0b24fa94f73d8b39b384ae77a1453f36', '81e55722702109901fbdfc53f88d518a01630ce1', '1', '1458982308');
INSERT INTO `sys_picture` VALUES ('51', '/Uploads/Picture/2016-03-26/56f64da48a6a1.jpg', '', '9764c6d5258a8bd892ca1bc398f3d287', '659899afa6f6a9798535276c4b20c38db4f97422', '1', '1458982308');
INSERT INTO `sys_picture` VALUES ('52', '/Uploads/Picture/2016-03-28/56f8aa760c2d7.png', '', '0e35511177a8c7f699bc185783ffea79', 'e39eebb6d60911cf8ef9f7af9a14a6b086ad5d5b', '1', '1459137142');
INSERT INTO `sys_picture` VALUES ('53', '/Uploads/Picture/2016-03-28/56f90975dd851.jpg', '', '4410a5668ac620492c58629f294014c3', '8d8acd054b0eef152a1037b22b403ca2ff563d2d', '1', '1459161461');
INSERT INTO `sys_picture` VALUES ('54', '/Uploads/Picture/2016-03-28/56f909761b57e.jpg', '', '4fe6860561b5dd0f00bb62e21c320bc1', 'd70822e710abdb9229044fbbf39b6af55db280ed', '1', '1459161462');
INSERT INTO `sys_picture` VALUES ('55', '/Uploads/Picture/2016-03-28/56f909764eba9.jpg', '', '7f68e76a948295d97d1c478ca4b912eb', 'c1a5d3dbdfab9970d2ffe3055b790c64cdd3d3f5', '1', '1459161462');
INSERT INTO `sys_picture` VALUES ('56', '/Uploads/Picture/2016-04-09/5708ca3628df2.jpg', '', '74e0d3c12384ad36a0894e315c314acb', '394ff5d080b7ddf1d3d30eb91e56967025300fb1', '1', '1460193846');
INSERT INTO `sys_picture` VALUES ('57', '/Uploads/Picture/2016-04-09/5708ca374a43f.jpg', '', '404fa9fe4edee04b7dac711145b0613a', '3be5d8adef73818d346d09da86cf65319add9143', '1', '1460193847');
INSERT INTO `sys_picture` VALUES ('58', '/Uploads/Picture/2016-04-09/5708ca37c026e.jpg', '', 'e6929fc72851a4e3772454fdf50e6515', 'b21fbc068292768850122a01cd5a127b95489d3b', '1', '1460193847');
INSERT INTO `sys_picture` VALUES ('59', '/Uploads/Picture/2016-04-09/5708ca38b891f.jpg', '', 'ef44261fa2d099d678bd4b38269982d9', '547f4b7577959234eeb9a967e71b72441cc1048c', '1', '1460193848');
INSERT INTO `sys_picture` VALUES ('60', '/Uploads/Picture/2016-04-09/5708ca396028f.jpg', '', '287dafcf82b280cd09ad444dbef3fca8', '0e2b5e1eb0bb580119be179b336dacf48451e54f', '1', '1460193849');
INSERT INTO `sys_picture` VALUES ('61', '/Uploads/Picture/2016-04-12/570c89e158cc5.png', '', 'dac245822e11abab0a28ba3881f6267c', '0eaab5e58065c8aa5a4f2cef26432a7316a0b5bc', '1', '1460439521');
INSERT INTO `sys_picture` VALUES ('62', '/Uploads/Picture/2016-04-12/570c8a18c4876.jpg', '', '0c235d0dc5c86a3fbb0633ea87acda55', 'e148a905a2e20ebe4ec6f6c57158ac89b0bdf2c9', '1', '1460439576');
INSERT INTO `sys_picture` VALUES ('63', '/Uploads/Picture/2016-04-13/570da40b1d22d.jpg', '', '3f00c8f2c127cb8678b612693bc2b33e', '831702c57a652b3b5c4cd5eff4e640c132ff16c1', '1', '1460511755');
INSERT INTO `sys_picture` VALUES ('64', '/Uploads/Picture/2016-04-13/570e3c05888ad.jpg', '', '3fb8ea74b8c1d11f1c1a50987507b99d', 'e89ce07cf48590b72b618e79950042c28ee29636', '1', '1460550661');
INSERT INTO `sys_picture` VALUES ('65', '/Uploads/Picture/2016-04-13/570e3c48dca64.jpg', '', '8fdc6682bd62fb8a88cd849582f294a3', '1970c794e2ec6513c12a3b61d761228d4b7dd37d', '1', '1460550728');
INSERT INTO `sys_picture` VALUES ('66', '/Uploads/Picture/2016-04-14/570f3db326fc6.jpg', '', '2d1290a9a4a6a8f535e7a7641104330b', 'ae026e7388421003920ec1194ad9084384829501', '1', '1460616627');
INSERT INTO `sys_picture` VALUES ('67', '/Uploads/Picture/2016-04-14/570f3db351d71.jpg', '', '1934f1ce0809ac637f5bc239b4cb30de', 'e8b663263c71411f8de7a9b63466842e570cc125', '1', '1460616627');
INSERT INTO `sys_picture` VALUES ('68', '/Uploads/Picture/2016-04-14/570f3db370b86.jpg', '', '6315d3ddd7be48d807befbdf46b37ae5', '59cda6d9f8961de095dbb50a82cb449beeb86d09', '1', '1460616627');
INSERT INTO `sys_picture` VALUES ('69', '/Uploads/Picture/2016-04-14/570f3db38774c.jpg', '', '4a205aaf1705e7ab3183c873b25acd79', '56344e6b168fcf38c0a4c6b36ca30b15d74edcbb', '1', '1460616627');
INSERT INTO `sys_picture` VALUES ('70', '/Uploads/Picture/2016-04-14/570f682f47eec.jpg', '', '16ef7a2affc8b68c7733f9f4284e4c63', 'f35ecb90996249becacfc5642d30c0652bf5e4df', '1', '1460627503');
INSERT INTO `sys_picture` VALUES ('71', '/Uploads/Picture/2016-04-14/570f683875d88.jpg', '', 'b3756e2af5c6fa5afff90813491f426a', 'b176d2324303ddf7a7e1f87e73087a0a85d69159', '1', '1460627512');
INSERT INTO `sys_picture` VALUES ('72', '/Uploads/Picture/2016-04-14/570f68439b265.jpg', '', 'a3d78e25dd7c424c3218c205fc8b486b', '0d290a45dfd172d4c31ee7b70a5055b9800eda1d', '1', '1460627523');
INSERT INTO `sys_picture` VALUES ('73', '/Uploads/Picture/2016-04-14/570f684d41fac.jpg', '', 'ccb71c1e9646775730bd6ea30cc67ab3', 'f1cb7908814087305273f3fc91985e697b9c1d67', '1', '1460627533');

-- ----------------------------
-- Table structure for sys_selfbuilt
-- ----------------------------
DROP TABLE IF EXISTS `sys_selfbuilt`;
CREATE TABLE `sys_selfbuilt` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `gameid` int(11) DEFAULT NULL COMMENT '游戏id',
  `gamename` varchar(20) DEFAULT NULL COMMENT '游戏名称',
  `webname` varchar(20) DEFAULT NULL COMMENT '网站名称',
  `keyword` varchar(30) DEFAULT NULL COMMENT '关键字',
  `weburl` varchar(255) DEFAULT NULL COMMENT '网站地址',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述',
  `logo` int(11) DEFAULT NULL COMMENT '图标',
  `backgroundimg` int(11) DEFAULT NULL COMMENT '背景图',
  `backgroundcolor` varchar(20) DEFAULT NULL COMMENT '背景色',
  `templateid` int(11) DEFAULT NULL COMMENT '模板id',
  `templatename` varchar(20) DEFAULT NULL COMMENT '模板名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自建官网';

-- ----------------------------
-- Records of sys_selfbuilt
-- ----------------------------

-- ----------------------------
-- Table structure for sys_slidemanage
-- ----------------------------
DROP TABLE IF EXISTS `sys_slidemanage`;
CREATE TABLE `sys_slidemanage` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `slidetitle` varchar(20) DEFAULT NULL COMMENT '幻灯片标题',
  `slideurl` varchar(255) DEFAULT NULL COMMENT '幻灯片标题',
  `slidedes` varchar(50) DEFAULT NULL COMMENT '幻灯片描述',
  `slidecon` varchar(300) DEFAULT NULL COMMENT '幻灯片内容',
  `cover` int(11) DEFAULT NULL COMMENT '封面',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态',
  `classify` int(11) DEFAULT NULL COMMENT '分类id',
  `createtime` datetime DEFAULT NULL COMMENT '添加时间',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_slidemanage
-- ----------------------------
INSERT INTO `sys_slidemanage` VALUES ('1', '功夫熊猫3', 'http://www.vlcms.com', '功夫熊猫3', '功夫熊猫3', '3', '1', '2', '2016-03-23 17:03:48', '0');
INSERT INTO `sys_slidemanage` VALUES ('2', '影游联动，真3D大世界，全息无限制战斗', 'http://www.vlcms.com', '影游联动，真3D大世界，全息无限制战斗', '影游联动，真3D大世界，全息无限制战斗', '4', '1', '1', '2016-03-23 17:03:36', '4');
INSERT INTO `sys_slidemanage` VALUES ('3', '《蜀山战纪》驰骋武林，一起寻找情缘', 'http://www.vlcms.com', '《蜀山战纪》驰骋武林，一起寻找情缘', '《蜀山战纪》驰骋武林，一起寻找情缘', '5', '1', '1', '2016-03-23 17:03:21', '3');
INSERT INTO `sys_slidemanage` VALUES ('4', '《画江湖之灵主》一个多姿多彩的动态武侠世', 'http://www.vlcms.com', '《画江湖之灵主》一个多姿多彩的动态武侠世', '《画江湖之灵主》一个多姿多彩的动态武侠世', '6', '1', '1', '2016-03-23 17:03:56', '2');
INSERT INTO `sys_slidemanage` VALUES ('5', '基于网络小说的故事背的MMORPG手游', 'http://www.baidu.com/', '基于网络小说的故事背的MMORPG手游', '基于网络小说的故事背的MMORPG手游', '7', '1', '1', '2016-03-23 17:03:31', '1');

-- ----------------------------
-- Table structure for sys_slidetype
-- ----------------------------
DROP TABLE IF EXISTS `sys_slidetype`;
CREATE TABLE `sys_slidetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `typename` varchar(20) DEFAULT NULL COMMENT '类型名称',
  `typemark` varchar(20) DEFAULT NULL COMMENT '类型标示',
  `describe` varchar(30) DEFAULT NULL COMMENT '类型描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='幻灯片类型表';

-- ----------------------------
-- Records of sys_slidetype
-- ----------------------------
INSERT INTO `sys_slidetype` VALUES ('1', '首页幻灯片', 'shouye', '用于添加首页4个首页幻灯片');
INSERT INTO `sys_slidetype` VALUES ('2', '右上角广告', 'guanggao', '用于添加右上角广告图');

-- ----------------------------
-- Table structure for sys_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_template`;
CREATE TABLE `sys_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `temname` varchar(20) DEFAULT NULL COMMENT '模板名称',
  `mark` varchar(20) DEFAULT NULL COMMENT '标示',
  `picture` int(11) DEFAULT NULL COMMENT '缩略图',
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of sys_template
-- ----------------------------

-- ----------------------------
-- Table structure for sys_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `sys_ucenter_admin`;
CREATE TABLE `sys_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of sys_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for sys_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `sys_ucenter_app`;
CREATE TABLE `sys_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of sys_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for sys_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `sys_ucenter_member`;
CREATE TABLE `sys_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_ucenter_member
-- ----------------------------

-- ----------------------------
-- Table structure for sys_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `sys_ucenter_setting`;
CREATE TABLE `sys_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of sys_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for sys_url
-- ----------------------------
DROP TABLE IF EXISTS `sys_url`;
CREATE TABLE `sys_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of sys_url
-- ----------------------------

-- ----------------------------
-- Table structure for sys_userdata
-- ----------------------------
DROP TABLE IF EXISTS `sys_userdata`;
CREATE TABLE `sys_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_userdata
-- ----------------------------

-- ----------------------------
-- Table structure for sys_webconfig
-- ----------------------------
DROP TABLE IF EXISTS `sys_webconfig`;
CREATE TABLE `sys_webconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(20) NOT NULL COMMENT '配置名称',
  `type` tinyint(2) NOT NULL COMMENT '配置类型',
  `title` varchar(20) NOT NULL COMMENT '配置说明',
  `group` tinyint(2) NOT NULL COMMENT '配置分组',
  `extra` varchar(10) NOT NULL COMMENT '配置值',
  `remark` varchar(20) NOT NULL COMMENT '配置说明',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `values` varchar(300) CHARACTER SET ucs2 NOT NULL COMMENT '配置值',
  `sort` int(11) NOT NULL COMMENT '排序',
  `websiteid` int(2) NOT NULL COMMENT '配置网站',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='网站配置表';

-- ----------------------------
-- Records of sys_webconfig
-- ----------------------------
INSERT INTO `sys_webconfig` VALUES ('1', 'MT_SITE_TITLE', '1', '网站标题', '1', '', '媒体官网标题', '1', '手机游戏运营平台', '1', '1', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('2', 'CONFIG_TYPE_ENUM', '3', '类型配置', '4', '', '', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举\r\n5:图片', '0', '0', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('3', 'CONFIG_GROUP_ENUM', '3', '配置分组', '4', '', '', '1', '1:基本\r\n2:内容\r\n', '0', '1', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('4', 'MT_SITE_LOGO', '5', '网站图标', '1', '', '网站LOGO上传', '1', '1', '13', '1', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('24', 'WEB_SITE_ICP2', '1', '网站备案号', '1', '', '工信部备案信息', '1', '苏ICP备15062631号-1', '5', '2', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('20', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '工信部备案', '1', '苏ICP备15062631号-1', '7', '1', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('7', 'MT_SITE_TEL', '1', '联系电话', '1', '', '客服电话 比如：0516-8346337', '1', '0516-83463372', '3', '1', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('8', 'MT_SITE_TIME', '1', '工作时间', '1', '', '详细工作时间不限格式', '1', '8:30-20:00', '2', '1', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('9', 'MT_SITE_QQ', '1', '客服QQ', '1', '', '前台客服QQ显示', '1', '836333669', '4', '1', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('10', 'MT_SITE_EMAIL', '1', '客服邮箱', '1', '', '客服邮箱 比如：kefu@vlcms.c', '1', '836333669@qq.com', '5', '1', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('11', 'MT_SITE_TEMAIL', '1', '投诉邮箱', '1', '', '投诉邮箱', '1', '836333669@qq.com', '6', '1', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('19', 'MT_SITE_TITLE2', '1', '网站标题', '1', '', '推广官网标题', '1', '手机游戏推广联盟', '1', '2', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('14', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', 'SEO网站描述', '1', '手机游戏运营平台_溪谷客户端游戏下载中心', '8', '1', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('15', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', 'SEO关键字', '1', '手游 联运 下载', '9', '1', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('21', 'MT_SITE_LOGO2', '5', '网站图标', '1', '', '网站LOGO上传', '1', '1', '9', '2', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('36', 'WEB_SITE_DESCRI2', '2', '网站描述', '1', '', 'SEO网站描述', '1', '手机游戏推广联盟_推广联盟中心', '6', '2', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('23', 'WEB_SITE_KEYWORD2', '2', '关键字搜索', '1', '', 'SEO关键字', '1', '123', '7', '2', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('25', 'MT_SITE_P2', '1', '公司位置', '1', '公司位置地址', '', '1', '江苏省徐州市云龙区新锐领地A2-1301', '2', '2', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('27', 'MT_SITE_T2', '1', '联系电话', '1', '', '客服电话 比如：0516-8346337', '1', '0516-83463372', '3', '2', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('33', 'MT_SITE_LICENSE', '1', '网络文化经营许可证编号', '1', '', '省文化厅颁发，没有可以不填', '1', '201603210825', '12', '1', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('29', 'MT_SITE_E2', '1', '公司邮箱', '1', '', '比如：kefu@vlcms.com', '1', 'kefu@vlcms.com', '4', '2', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('32', 'MT_SITE_B', '2', '版权信息', '1', '', '网站底部版权信息', '1', '© 徐州梦创信息科技有限公司 版权所有 2016 vlcms.com', '10', '1', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('34', 'MT_SITE_LICENSE2', '1', '网络文化经营许可证编号', '1', '', '省文化厅颁发，没有可以不填', '1', '123123', '8', '2', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('35', 'MT_SITE_B2', '2', '版权信息', '1', '', '底部版权信息', '1', '© 徐州梦创信息科技有限公司 版权所有 2016 vlcms.com', '6', '2', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('37', 'YMT_SITE_TITLE', '1', '网站标题', '1', '', '', '1', '', '0', '3', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('38', 'YMT_SITE_TIME', '1', '工作时间', '1', '', '', '1', '', '0', '3', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('39', 'YMT_SITE_T', '1', '联系电话', '1', '', '', '1', '', '0', '3', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('40', 'YMT_SITE_QQ', '1', '客服QQ', '1', '', '', '1', '', '0', '3', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('41', 'YMT_SITE_EMAIL', '1', '客服邮箱', '1', '', '', '1', '111', '0', '3', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('42', 'YWEB_SITE_ICP', '1', '网站备案号', '1', '', '', '1', '', '0', '3', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('43', 'YWEB_SITE_DESCRIPTIO', '2', '网站描述', '1', '', '', '1', '', '0', '3', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('44', 'YWEB_SITE_KEYWORD2', '2', '网站关键字', '1', '', '', '1', '', '0', '3', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('45', 'YMT_SITE_B', '2', '版权信息', '1', '', '', '1', '', '0', '3', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('46', 'YMT_SITE_LICENSE', '1', '网络文化经营许可证编号', '1', '', '', '1', '', '0', '3', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('47', 'YMT_SITE_LOGO', '5', '网站图标', '1', '', '', '1', '109', '0', '3', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('48', 'JADMIN_ALLOW_IP', '2', '媒体拒绝访问ip', '1', '', '媒体拒绝访问ip', '1', '', '11', '1', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('50', 'JADMIN_ALLOW_IP2', '2', '推广官网拒绝访问ip', '1', '', '推广官网拒绝访问ip', '1', '', '8', '2', '0000-00-00 00:00:00');
INSERT INTO `sys_webconfig` VALUES ('51', 'MT_SITE_DIMENSION', '5', '二维码', '1', '', '底部二维码', '1', '2', '14', '1', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for tab_agent
-- ----------------------------
DROP TABLE IF EXISTS `tab_agent`;
CREATE TABLE `tab_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `game_id` int(11) DEFAULT NULL COMMENT '游戏ID',
  `promote_id` int(11) DEFAULT NULL COMMENT '推广员ID',
  `user_account` varchar(30) DEFAULT NULL COMMENT '玩家账号',
  `amount` double(10,2) DEFAULT '0.00' COMMENT '支付金额',
  `real_amount` double(10,2) DEFAULT '0.00' COMMENT '实际金额',
  `status` tinyint(2) DEFAULT '1' COMMENT '支付状态',
  `pay_type` tinyint(2) DEFAULT NULL COMMENT '类型',
  `create_time` int(11) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='代理充值记录';

-- ----------------------------
-- Records of tab_agent
-- ----------------------------
INSERT INTO `tab_agent` VALUES ('1', '16', '4', '335231', '1.00', '1.00', '1', '0', '1458754724');
INSERT INTO `tab_agent` VALUES ('2', '16', '3', 'qqqqa', '1.00', '1.00', '1', '0', '1458755013');

-- ----------------------------
-- Table structure for tab_apply
-- ----------------------------
DROP TABLE IF EXISTS `tab_apply`;
CREATE TABLE `tab_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `game_id` int(11) DEFAULT NULL COMMENT '游戏ID',
  `promote_id` int(11) DEFAULT NULL COMMENT '推广员ID',
  `ratio` int(3) DEFAULT '0' COMMENT '分成比例',
  `apply_time` int(11) DEFAULT NULL COMMENT '申请时间',
  `status` tinyint(2) DEFAULT NULL COMMENT '审核状态',
  `enable_status` tinyint(2) DEFAULT NULL COMMENT '操作状态',
  `pack_url` varchar(255) DEFAULT NULL COMMENT '游戏包地址',
  `dow_url` varchar(255) DEFAULT NULL COMMENT '下载地址',
  `dispose_id` int(11) DEFAULT NULL COMMENT '操作人',
  `dispose_time` int(11) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='游戏申请表';

-- ----------------------------
-- Records of tab_apply
-- ----------------------------
INSERT INTO `tab_apply` VALUES ('1', '1', '1', '0', '1458737299', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('2', '2', '1', '0', '1458737301', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('3', '4', '1', '0', '1458737302', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('4', '3', '1', '0', '1458737305', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('5', '7', '1', '0', '1458737307', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('6', '6', '1', '0', '1458737308', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('7', '5', '1', '0', '1458737309', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('8', '8', '1', '0', '1458737310', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('9', '9', '1', '0', '1458737310', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('10', '10', '1', '0', '1458737312', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('11', '11', '1', '0', '1458737315', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('12', '12', '1', '0', '1458737316', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('13', '13', '1', '0', '1458737317', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('14', '14', '1', '0', '1458737318', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('15', '15', '1', '0', '1458737319', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('16', '1', '2', '0', '1458741894', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('17', '10', '2', '0', '1458741910', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('18', '9', '2', '0', '1458741911', '0', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('19', '8', '2', '0', '1458741912', '2', '1', null, null, null, null);
INSERT INTO `tab_apply` VALUES ('20', '16', '3', '0', '1458753993', '1', '1', '/www/web/v_lifenxi_com/public_html/Uploads/GamePack/game_package16-3.apk', '/index.php?s=/Down/down_file/game_id/16/promote_id/3', '1', '1458754045');
INSERT INTO `tab_apply` VALUES ('21', '16', '4', '5', '1458755228', '1', '1', '/www/web/v_lifenxi_com/public_html/Uploads/GamePack/game_package16-4.apk', '/index.php?s=/Down/down_file/game_id/16/promote_id/4', '1', '1458754413');
INSERT INTO `tab_apply` VALUES ('22', '16', '5', '5', '1458755416', '1', '1', '/www/web/v_lifenxi_com/public_html/Uploads/GamePack/game_package16-5.apk', '/index.php?s=/Down/down_file/game_id/16/promote_id/5', '1', '1458786576');
INSERT INTO `tab_apply` VALUES ('23', '7', '4', '0', '1458826342', '1', '1', null, null, null, null);

-- ----------------------------
-- Table structure for tab_area
-- ----------------------------
DROP TABLE IF EXISTS `tab_area`;
CREATE TABLE `tab_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `game_id` int(11) DEFAULT NULL COMMENT '游戏id',
  `area_name` varchar(30) DEFAULT NULL COMMENT '区服名称',
  `area_num` int(10) DEFAULT '0' COMMENT '区服编号',
  `recommend_status` tinyint(2) DEFAULT '1' COMMENT '推荐状态',
  `show_status` tinyint(2) DEFAULT '1' COMMENT '显示状态',
  `stop_status` tinyint(2) DEFAULT '1' COMMENT '停服状态',
  `area_status` tinyint(2) DEFAULT '1' COMMENT '区服状态',
  `icon` int(10) DEFAULT '0' COMMENT '图标',
  `start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `desride` varchar(300) DEFAULT NULL COMMENT '描述',
  `prompt` varchar(300) DEFAULT NULL COMMENT '提示',
  `parent_id` int(10) DEFAULT '0' COMMENT '父类ID',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='区服表';

-- ----------------------------
-- Records of tab_area
-- ----------------------------
INSERT INTO `tab_area` VALUES ('1', '1', '双线1区', '0', '1', '1', '1', '0', '0', '1459353600', '', '', '0', '1458729814');
INSERT INTO `tab_area` VALUES ('2', '2', '双线1区', '0', '1', '1', '1', '0', '0', '1459420920', '', '', '0', '1458729769');
INSERT INTO `tab_area` VALUES ('3', '3', '双线1区', '0', '1', '1', '1', '0', '0', '1459420920', '', '', '0', '1458729789');
INSERT INTO `tab_area` VALUES ('4', '4', '双线1区', '0', '1', '1', '1', '0', '0', '1459420980', '', '', '0', '1458729830');
INSERT INTO `tab_area` VALUES ('5', '7', '双线1区', '0', '1', '1', '1', '0', '0', '1459420980', '', '', '0', '1458729843');
INSERT INTO `tab_area` VALUES ('6', '6', '双线1区', '0', '1', '1', '1', '0', '0', '1459421040', '', '', '0', '1458729856');
INSERT INTO `tab_area` VALUES ('7', '5', '双线1区', '0', '1', '1', '1', '0', '0', '1459421040', '', '', '0', '1458729869');
INSERT INTO `tab_area` VALUES ('8', '8', '双线1区', '0', '1', '1', '1', '0', '0', '1459421040', '', '', '0', '1458729886');
INSERT INTO `tab_area` VALUES ('9', '9', '双线1区', '0', '1', '1', '1', '0', '0', '1459421040', '', '', '0', '1458729899');
INSERT INTO `tab_area` VALUES ('10', '10', '双线1区', '0', '1', '1', '1', '0', '0', '1459421040', '', '', '0', '1458729914');
INSERT INTO `tab_area` VALUES ('11', '9', '双线1区', '0', '1', '1', '0', '0', '0', '1459321560', '', '维护', '0', '1459322050');

-- ----------------------------
-- Table structure for tab_classification
-- ----------------------------
DROP TABLE IF EXISTS `tab_classification`;
CREATE TABLE `tab_classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增标识',
  `name` varchar(30) DEFAULT NULL COMMENT '游戏分类名',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '分类状态',
  `icon` int(10) NOT NULL COMMENT '分类图标',
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_classification
-- ----------------------------
INSERT INTO `tab_classification` VALUES ('1', '网络游戏 ', '1', '0', '0');
INSERT INTO `tab_classification` VALUES ('2', '体育竞速 ', '1', '0', '1');
INSERT INTO `tab_classification` VALUES ('3', '角色扮演 ', '1', '0', '2');
INSERT INTO `tab_classification` VALUES ('4', '飞行射击 ', '1', '0', '3');
INSERT INTO `tab_classification` VALUES ('5', '策略经营 ', '1', '0', '4');
INSERT INTO `tab_classification` VALUES ('6', '卡片游戏 ', '1', '0', '5');
INSERT INTO `tab_classification` VALUES ('7', '动作冒险 ', '1', '0', '6');
INSERT INTO `tab_classification` VALUES ('8', '单机游戏 ', '1', '0', '7');
INSERT INTO `tab_classification` VALUES ('9', '棋牌天地 ', '1', '0', '8');
INSERT INTO `tab_classification` VALUES ('10', '休闲益智 ', '1', '0', '9');

-- ----------------------------
-- Table structure for tab_deposit
-- ----------------------------
DROP TABLE IF EXISTS `tab_deposit`;
CREATE TABLE `tab_deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_number` varchar(30) DEFAULT NULL COMMENT '订单号',
  `pay_order_number` varchar(30) DEFAULT NULL COMMENT '支付订单号',
  `user_account` varchar(30) DEFAULT NULL COMMENT '用户账号',
  `promote_id` int(11) DEFAULT NULL COMMENT '推广员ID',
  `amount` double(10,2) DEFAULT '0.00' COMMENT '充值金额',
  `status` tinyint(2) DEFAULT '0' COMMENT '充值状态',
  `pay_way` tinyint(2) DEFAULT '0' COMMENT '支付方式',
  `pay_source` tinyint(2) DEFAULT '0' COMMENT '支付来源',
  `pay_ip` varchar(20) DEFAULT NULL COMMENT '充值IP',
  `create_time` int(11) DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='平台币充值记录';

-- ----------------------------
-- Records of tab_deposit
-- ----------------------------
INSERT INTO `tab_deposit` VALUES ('4', '', 'DC_20160407175503AIOA', 'wan001', '0', '100.00', '0', '1', '0', '127.0.0.1', '1460022903');
INSERT INTO `tab_deposit` VALUES ('2', '', 'DC_201604071556522DE6', 'wan001', '0', '100.00', '0', '0', '0', '127.0.0.1', '1460015811');
INSERT INTO `tab_deposit` VALUES ('3', '', 'DC_20160407173433K6UT', 'wan001', '0', '100.00', '0', '0', '0', '127.0.0.1', '1460021673');
INSERT INTO `tab_deposit` VALUES ('5', '', 'DC_20160407175603ZQOS', 'wan001', '0', '10.00', '0', '0', '0', '127.0.0.1', '1460022962');
INSERT INTO `tab_deposit` VALUES ('6', '', 'DC_20160407175828068L', 'wan001', '0', '10.00', '0', '0', '0', '127.0.0.1', '1460023108');
INSERT INTO `tab_deposit` VALUES ('7', '', 'DC_20160408102747h1N7', 'wan001', '0', '1000.00', '0', '0', '0', '127.0.0.1', '1460082467');
INSERT INTO `tab_deposit` VALUES ('8', '', 'DC_20160408102836eKCB', 'wan001', '0', '1000.00', '0', '1', '0', '127.0.0.1', '1460082516');
INSERT INTO `tab_deposit` VALUES ('9', '', 'DC_20160408103028zKcx', 'wan001', '0', '1000.00', '0', '1', '0', '127.0.0.1', '1460082628');
INSERT INTO `tab_deposit` VALUES ('10', '', 'DC_20160408103721JYfl', 'wan001', '0', '1000.00', '0', '1', '0', '127.0.0.1', '1460083041');
INSERT INTO `tab_deposit` VALUES ('11', '', 'DC_20160408104148gXPo', 'wan001', '0', '1000.00', '0', '1', '0', '127.0.0.1', '1460083307');
INSERT INTO `tab_deposit` VALUES ('12', '', 'DC_201604081043264fv2', 'wan001', '0', '1000.00', '0', '1', '0', '127.0.0.1', '1460083406');

-- ----------------------------
-- Table structure for tab_down_stat
-- ----------------------------
DROP TABLE IF EXISTS `tab_down_stat`;
CREATE TABLE `tab_down_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `promote_id` int(11) DEFAULT NULL COMMENT '推广员id',
  `game_id` int(11) DEFAULT NULL COMMENT '游戏id',
  `number` int(2) DEFAULT '1' COMMENT '下载次数',
  `create_time` int(11) DEFAULT NULL COMMENT '时间',
  `type` int(2) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='下载统计表';

-- ----------------------------
-- Records of tab_down_stat
-- ----------------------------
INSERT INTO `tab_down_stat` VALUES ('1', '4', '7', '1', '1458826381', '1');
INSERT INTO `tab_down_stat` VALUES ('2', '0', '16', '1', '1458826543', '0');
INSERT INTO `tab_down_stat` VALUES ('3', '4', '7', '1', '1458827984', '1');
INSERT INTO `tab_down_stat` VALUES ('4', '4', '7', '1', '1458827984', '1');
INSERT INTO `tab_down_stat` VALUES ('5', '4', '7', '1', '1458827984', '1');
INSERT INTO `tab_down_stat` VALUES ('6', '4', '7', '1', '1458827984', '1');
INSERT INTO `tab_down_stat` VALUES ('7', '4', '7', '1', '1458827984', '1');
INSERT INTO `tab_down_stat` VALUES ('8', '4', '7', '1', '1458827984', '1');
INSERT INTO `tab_down_stat` VALUES ('9', '4', '7', '1', '1458827984', '1');
INSERT INTO `tab_down_stat` VALUES ('10', '4', '7', '1', '1458827984', '1');
INSERT INTO `tab_down_stat` VALUES ('11', '4', '7', '1', '1458827984', '1');
INSERT INTO `tab_down_stat` VALUES ('12', '4', '7', '1', '1458827984', '1');
INSERT INTO `tab_down_stat` VALUES ('13', '4', '7', '1', '1458827985', '1');
INSERT INTO `tab_down_stat` VALUES ('14', '4', '7', '1', '1458827985', '1');
INSERT INTO `tab_down_stat` VALUES ('15', '4', '7', '1', '1458827985', '1');
INSERT INTO `tab_down_stat` VALUES ('16', '4', '7', '1', '1458827985', '1');
INSERT INTO `tab_down_stat` VALUES ('17', '4', '7', '1', '1458827985', '1');
INSERT INTO `tab_down_stat` VALUES ('18', '4', '7', '1', '1458827985', '1');
INSERT INTO `tab_down_stat` VALUES ('19', '4', '7', '1', '1458827985', '1');
INSERT INTO `tab_down_stat` VALUES ('20', '4', '7', '1', '1458827985', '1');
INSERT INTO `tab_down_stat` VALUES ('21', '4', '7', '1', '1458827985', '1');
INSERT INTO `tab_down_stat` VALUES ('22', '4', '7', '1', '1458827985', '1');
INSERT INTO `tab_down_stat` VALUES ('23', '4', '7', '1', '1458827985', '1');

-- ----------------------------
-- Table structure for tab_firstpunch
-- ----------------------------
DROP TABLE IF EXISTS `tab_firstpunch`;
CREATE TABLE `tab_firstpunch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordernum` varchar(20) DEFAULT NULL COMMENT '订单号',
  `promote_id` int(11) DEFAULT NULL COMMENT '推广员id',
  `promote_account` varchar(50) DEFAULT NULL COMMENT '推广员',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `user_account` varchar(50) DEFAULT NULL COMMENT '用户名',
  `game_id` int(11) DEFAULT NULL,
  `game_name` varchar(50) DEFAULT NULL COMMENT '游戏名称',
  `area_id` int(11) DEFAULT NULL COMMENT ' 区服id',
  `area_name` varchar(30) DEFAULT NULL COMMENT '区服名称',
  `amount` varchar(20) DEFAULT NULL COMMENT '充值金额',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态',
  `create_date` int(11) DEFAULT NULL COMMENT '充值日期',
  `use_play_id` int(11) DEFAULT NULL COMMENT '被充值id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_firstpunch
-- ----------------------------

-- ----------------------------
-- Table structure for tab_game
-- ----------------------------
DROP TABLE IF EXISTS `tab_game`;
CREATE TABLE `tab_game` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `game_name` varchar(30) DEFAULT NULL COMMENT '游戏名称',
  `game_appid` varchar(32) DEFAULT NULL COMMENT '游戏appid',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `short` varchar(10) DEFAULT NULL COMMENT '简拼',
  `game_type` tinyint(2) DEFAULT NULL COMMENT '游戏类型',
  `category` tinyint(2) DEFAULT NULL COMMENT '游戏分组',
  `and_dow_address` varchar(255) DEFAULT NULL COMMENT '安卓下载地址',
  `ios_dow_address` varchar(255) DEFAULT NULL COMMENT 'IOS下载',
  `game_address` varchar(255) DEFAULT NULL COMMENT '游戏进入地址',
  `dow_num` int(10) NOT NULL DEFAULT '0' COMMENT '下载数',
  `version` varchar(10) DEFAULT NULL COMMENT '游戏版本',
  `game_size` varchar(255) NOT NULL DEFAULT '0' COMMENT '游戏大小',
  `sicon` varchar(10) DEFAULT NULL COMMENT '游戏小图标',
  `icon` int(10) DEFAULT NULL COMMENT '图标',
  `cover` int(10) DEFAULT NULL COMMENT '封面',
  `screenshot` varchar(255) DEFAULT NULL COMMENT '截图',
  `game_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '游戏状态',
  `recommend_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '推荐状态',
  `pay_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '支付状态',
  `dow_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '下载状态',
  `game_score` varchar(10) NOT NULL DEFAULT '0' COMMENT '游戏评分',
  `features` varchar(30) DEFAULT NULL COMMENT '游戏特征',
  `recommend_level` double(2,1) NOT NULL DEFAULT '0.0' COMMENT '推荐指数',
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='游戏表';

-- ----------------------------
-- Records of tab_game
-- ----------------------------
INSERT INTO `tab_game` VALUES ('1', '画江湖之灵主', 'A3B4049F9FEF3CCFB', '2', 'hjhzlz', '1', '1', null, null, 'www.vlcms.com', '0', '2.0', '222M', null, '8', '18', '53,54,55', '1', '1', '1', '1', '0', '角色扮演', '0.0', '1460692631');
INSERT INTO `tab_game` VALUES ('2', '青丘狐传说', 'DE5700D6765E58044', '4', 'qqhcs', '3', '1', null, null, 'http://tg.ewan.cn/downapp.jsp?aid=10367&pid=91228&plat=1', '42', '1.0.9', '269M', null, '9', '10', '', '1', '1', '1', '1', '0', '角色扮演', '0.0', '1460692667');
INSERT INTO `tab_game` VALUES ('7', '蜀山战纪', '45FFEDCE7F5A26F97', '7', 'sszj', '7', '1', null, null, 'http://tg.ewan.cn/downapp.jsp?aid=10361&pid=91226&plat=1', '73', '2.0', '100.1M', null, '17', '0', '', '1', '2', '1', '1', '0', '角色扮演', '0.0', '1460692699');
INSERT INTO `tab_game` VALUES ('3', '我叫MT全3D', '59E912010CE052AFD', '6', 'wjmtq3D', '6', '1', null, null, 'www.vlcms.com', '0', '2.0', '152.3M', null, '11', '12', '', '1', '1', '1', '1', '0', '棋牌天地', '0.0', '1460692691');
INSERT INTO `tab_game` VALUES ('4', '红警世界大战', 'F2D8CCD1B9C7FFCFA', '5', 'hjsjdz', '5', '1', null, null, '', '0', '2.0', '62.1M', null, '13', '14', '', '1', '1', '1', '1', '0', '飞行射击', '0.0', '1460692682');
INSERT INTO `tab_game` VALUES ('5', '莽荒纪2', '8E26DCF816473D5F8', '16', 'mhj', '3', '1', null, null, '', '0', '2.0', '202.8 M', null, '15', '0', '', '1', '2', '1', '1', '0', '角色扮演', '0.0', '1460692825');
INSERT INTO `tab_game` VALUES ('6', '大话西游手游', '7FAF8E725EA77948B', '9', 'dhxysy', '3', '1', null, null, '', '0', '2.0', '232.31M', null, '16', '0', '', '1', '2', '1', '1', '0', '角色扮演', '0.0', '1460692717');
INSERT INTO `tab_game` VALUES ('8', '功夫熊猫3', '85F7E28FDB4CC604F', '17', 'gfxm3', '3', '1', null, null, '', '0', '2.0', '219.5M', null, '19', '0', '', '1', '2', '1', '1', '0', '动作冒险', '0.0', '1460692841');
INSERT INTO `tab_game` VALUES ('9', '画江湖之不良人', '8346992973724684C', '1', 'hjhzblr', '1', '1', null, null, '', '0', '2.0', '170.2M', null, '20', '0', '33,20', '1', '3', '1', '1', '0', '角色扮演', '0.0', '1460692616');
INSERT INTO `tab_game` VALUES ('10', '天龙八部3D', '41176751ACBD2AC00', '18', 'tlbb3d', '3', '1', null, null, '', '0', '2.0', '206.2 M', null, '21', '0', '', '1', '2', '1', '1', '0', '角色扮演', '0.0', '1460692852');
INSERT INTO `tab_game` VALUES ('11', '琅琊榜', 'FB1DCCF1D8063A990', '19', 'lyb', '3', '1', null, null, '', '0', '2.0', '165.9M', null, '22', '0', '', '1', '2', '1', '1', '0', '卡牌游戏', '0.0', '1460692861');
INSERT INTO `tab_game` VALUES ('12', '部落冲突', '882E6EAF69F19B614', '20', 'blct', '4', '1', null, null, '', '0', '2.0', '65.8 M', null, '23', '0', '', '1', '2', '1', '1', '0', '', '0.0', '1460692869');
INSERT INTO `tab_game` VALUES ('13', '一个人的江湖', '91B62C7A130829C5B', '21', '', '7', '1', null, null, '', '0', '2.0', '96.97 M', null, '24', '0', '', '1', '2', '1', '1', '0', '卡牌竞技', '0.0', '1460692878');
INSERT INTO `tab_game` VALUES ('14', '天下X天下', '8408D4E45CCE4B6D0', '22', 'txxtx', '3', '1', null, null, '', '0', '2.0', '217.5M', null, '25', '0', '', '1', '2', '1', '1', '0', '角色扮演', '0.0', '1460692887');
INSERT INTO `tab_game` VALUES ('15', '花千骨手游', 'BDD4F09F4B0D9F2AD', '23', 'hqgsy', '3', '1', null, null, '', '0', '2.0', '251.66 M', null, '26', '0', '', '1', '3', '1', '1', '0', '角色扮演', '0.0', '1460692900');
INSERT INTO `tab_game` VALUES ('17', '沙巴克传奇', 'F30A0B582B65F1B54', '10', 'sbkcq', '4', '1', null, null, 'http://tg.ewan.cn/downapp.jsp?aid=10361&pid=91226&plat=1', '55', '1.0.6.0', '294M', null, '33', '34', '', '1', '2', '1', '0', '0', '', '0.0', '1460692726');
INSERT INTO `tab_game` VALUES ('18', '数码世界OL', 'A3D0A361D42ADB876', '11', 'smsj', '6', '1', null, null, 'http://tg.ewan.cn/downapp.jsp?aid=10390&pid=91233&plat=1', '43', '1.0.3', '113M', null, '35', '36', '49,50,51', '1', '2', '1', '1', '0', '', '0.0', '1460692736');
INSERT INTO `tab_game` VALUES ('19', '雏蜂之尖兵少女', 'FB0C5F281BF934E2B', '12', 'cfzjbsl', '3', '1', null, null, 'http://tg.ewan.cn/downapp.jsp?aid=10393&pid=91232&plat=1', '46', '2.1.0', '121M', null, '37', '38', '', '1', '2', '1', '1', '0', '', '0.0', '1460692806');
INSERT INTO `tab_game` VALUES ('20', '射雕英雄传3D', 'CD9F71EAECB505B4E', '13', 'sdyxz', '7', '1', null, null, 'http://tg.ewan.cn/downapp.jsp?aid=10379&pid=91231&plat=1', '45', '1.1.0', '337M', null, '39', '40', '', '1', '2', '1', '1', '0', '', '0.0', '1460359662');
INSERT INTO `tab_game` VALUES ('23', '修仙奇缘', 'ACF99B41E5CFCA9D5', '3', 'xxqy', '3', '1', '/Uploads/Source/2016-03-24/56f401c07fa59.apk', null, 'http://tg.ewan.cn/downapp.jsp?aid=10357&pid=91227&plat=1', '56', '1.0.3', '3976340', null, '20', '46', '', '1', '1', '1', '1', '0', '', '0.0', '1460692660');
INSERT INTO `tab_game` VALUES ('24', '别让我冒险', '9FE78437D9E290996', '8', 'brwmx', '2', '1', '/Uploads/Source/2016-03-24/56f401d9c8302.apk', null, 'http://tg.ewan.cn/downapp.jsp?aid=10376&pid=91225&plat=1', '52', '1.0.79', '939876', null, '20', '48', '', '1', '2', '1', '0', '0', '', '0.0', '1460692711');

-- ----------------------------
-- Table structure for tab_game_info
-- ----------------------------
DROP TABLE IF EXISTS `tab_game_info`;
CREATE TABLE `tab_game_info` (
  `id` int(11) NOT NULL COMMENT '外键',
  `keyword` varchar(30) DEFAULT NULL COMMENT '关键字',
  `coop_id` varchar(30) DEFAULT NULL COMMENT '合作id',
  `game_coin_name` varchar(10) DEFAULT NULL COMMENT '游戏币名称',
  `game_coin_ration` varchar(10) DEFAULT NULL COMMENT '游戏币比例',
  `game_bbs` varchar(255) DEFAULT NULL COMMENT '官网论坛',
  `game_website` varchar(255) DEFAULT NULL COMMENT '游戏官网',
  `qq_group` varchar(100) DEFAULT NULL COMMENT 'QQ群',
  `operator` varchar(30) DEFAULT NULL COMMENT '运营商',
  `introduction` varchar(300) DEFAULT NULL COMMENT '简介'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='游戏信息表';

-- ----------------------------
-- Records of tab_game_info
-- ----------------------------
INSERT INTO `tab_game_info` VALUES ('1', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('2', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('3', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('4', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('8', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('9', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('10', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('11', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('12', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('13', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('14', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('15', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('16', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('5', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('6', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('7', '', '', '', '', '', '', '', '', '蜀山战纪');
INSERT INTO `tab_game_info` VALUES ('1', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('2', '', '', '', '', '', '', '', '', '青丘狐传说是一款大型角色扮演类手游。');
INSERT INTO `tab_game_info` VALUES ('3', '', '', '', '', '', '', '', '', '一款经典手游我叫MT的全新续作。');
INSERT INTO `tab_game_info` VALUES ('4', '', '', '', '', '', '', '', '', '一款写实风格的战略手游新作');
INSERT INTO `tab_game_info` VALUES ('8', '', '', '', '', '', '', '', '', '贺岁大片《功夫熊猫3》唯一官方手游');
INSERT INTO `tab_game_info` VALUES ('9', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('10', '', '', '', '', '', '', '', '', '同样的面孔，却演绎不同的传奇故事！');
INSERT INTO `tab_game_info` VALUES ('11', '', '', '', '', '', '', '', '', '一卷风云琅琊榜，囊尽天下奇英才。');
INSERT INTO `tab_game_info` VALUES ('12', '', '', '', '', '', '', '', '', '大型热门国战类手游。');
INSERT INTO `tab_game_info` VALUES ('13', '', '', '', '', '', '', '', '', '一款大型武侠题材的MMORPG手游。');
INSERT INTO `tab_game_info` VALUES ('14', '', '', '', '', '', '', '', '', '掌心里的天下，还原端游核心玩法！');
INSERT INTO `tab_game_info` VALUES ('15', '', '', '', '', '', '', '', '', '还原原着剧情以及电视剧的人物形象，精彩不容错过哦! ');
INSERT INTO `tab_game_info` VALUES ('16', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_game_info` VALUES ('17', '', '', '', '', '', '', '', '', '精彩沙巴克，谁能勇拔头筹？');
INSERT INTO `tab_game_info` VALUES ('18', '', '', '', '', '', '', '', '', '数码世界OL是一款二次元向的卡牌RPG游戏。');
INSERT INTO `tab_game_info` VALUES ('19', '', '', '', '', '', '', '', '', '《雏蜂之尖兵少女》是一款萌娘养成+横版射击手游。');
INSERT INTO `tab_game_info` VALUES ('5', '', '', '', '', '', '', '', '', '时尚流行的日韩风格，精致华丽的游戏画面');
INSERT INTO `tab_game_info` VALUES ('20', '', '', '', '', '', '', '', '', '《射雕英雄传3D》手游走进金庸武侠世界吧！');
INSERT INTO `tab_game_info` VALUES ('21', '', '', '', '', '', '', '', '', '《封神3D》是一款大型3D手游巨作。');
INSERT INTO `tab_game_info` VALUES ('22', '', '', '', '', '', '', '', '', '《我欲封仙》是一款古典气息的仙魔大战角色扮演类手游。');
INSERT INTO `tab_game_info` VALUES ('23', '', '', '', '', '', '', '', '', '《修仙奇缘》是一大型即时制角色扮演型网络游戏。');
INSERT INTO `tab_game_info` VALUES ('24', '', '', '', '', '', '', '', '', '通过每一关探险地图的考验，最终聚齐神器。');
INSERT INTO `tab_game_info` VALUES ('6', '', '', '', '', '', '', '', '', '一款西游题材的角色扮演类手游。');
INSERT INTO `tab_game_info` VALUES ('7', '', '', '', '', '', '', '', '', '《蜀山战纪》改编自同名电视剧，由吴奇隆亲自监制');

-- ----------------------------
-- Table structure for tab_game_source
-- ----------------------------
DROP TABLE IF EXISTS `tab_game_source`;
CREATE TABLE `tab_game_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `game_id` int(11) DEFAULT NULL COMMENT '游戏id',
  `file_id` int(11) DEFAULT NULL COMMENT '文件id',
  `file_name` varchar(30) DEFAULT NULL COMMENT '文件名称',
  `file_url` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `file_size` int(11) NOT NULL COMMENT '文件大小',
  `file_type` tinyint(2) DEFAULT NULL COMMENT '原包类型',
  `op_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_account` varchar(30) DEFAULT NULL COMMENT '操作人名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='游戏原包';

-- ----------------------------
-- Records of tab_game_source
-- ----------------------------
INSERT INTO `tab_game_source` VALUES ('1', '16', '1', '56f2d1acc7a94.apk', '/Uploads/Source/2016-03-24/56f2d1acc7a94.apk', '930226', '1', '1', 'admin', '', '1458753968');

-- ----------------------------
-- Table structure for tab_game_update
-- ----------------------------
DROP TABLE IF EXISTS `tab_game_update`;
CREATE TABLE `tab_game_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `game_id` int(11) DEFAULT NULL COMMENT '游戏id',
  `game_name` varchar(30) DEFAULT NULL COMMENT '游戏名称',
  `up_size` varchar(10) DEFAULT NULL COMMENT '更新大小',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='游戏更新表';

-- ----------------------------
-- Records of tab_game_update
-- ----------------------------

-- ----------------------------
-- Table structure for tab_giftbag
-- ----------------------------
DROP TABLE IF EXISTS `tab_giftbag`;
CREATE TABLE `tab_giftbag` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `game_id` int(11) DEFAULT NULL COMMENT '游戏id',
  `area_id` int(11) DEFAULT NULL COMMENT '区服id',
  `giftbag_name` varchar(30) DEFAULT NULL COMMENT '礼包名称',
  `giftbag_type` tinyint(2) DEFAULT NULL COMMENT '礼包类型',
  `level` int(3) DEFAULT NULL COMMENT '领取等级',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `call_api` tinyint(2) DEFAULT '0' COMMENT '调用接口',
  `tong_server` tinyint(2) DEFAULT '0' COMMENT '是否通服',
  `novice` varchar(3000) DEFAULT NULL COMMENT '激活码',
  `digest` varchar(300) DEFAULT NULL COMMENT '摘要',
  `desribe` varchar(300) DEFAULT NULL COMMENT '描述',
  `start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='礼包管理';

-- ----------------------------
-- Records of tab_giftbag
-- ----------------------------
INSERT INTO `tab_giftbag` VALUES ('1', '1', '1', '画江湖之灵主-媒体礼包', '2', '0', '0', '1', '0', '0', '5XC1E82D4F56S,5XC1E82D4F57S,5XC1E82D4F58S,5XC1E82D4F59S,5XC1E82D4F60S,5XC1E82D4F61S,5XC1E82D4F62S,5XC1E82D4F63S,5XC1E82D4F64S,5XC1E82D4F65S,5XC1E82D4F66S,5XC1E82D4F67S,5XC1E82D4F68S,5XC1E82D4F69S,5XC1E82D4F70S,5XC1E82D4F71S,5XC1E82D4F72S,5XC1E82D4F73S,5XC1E82D4F74S,5XC1E82D4F75S', '进入游戏→点击游戏右上角的福→点击CDkey→输入激活码领取礼包', '绑金*15000、小飞鞋*10、随机传送卷*10、礼券*200、节日烟花*10、召集令*10、2倍经验神符*5', '1458662400', '1459353600', '1458730040');
INSERT INTO `tab_giftbag` VALUES ('2', '2', '2', '青丘狐传说-新手礼包', '1', '0', '0', '1', '0', '0', '5XC1E82D4F56S,5XC1E82D4F57S,5XC1E82D4F58S,5XC1E82D4F59S,5XC1E82D4F60S,5XC1E82D4F61S,5XC1E82D4F62S,5XC1E82D4F63S,5XC1E82D4F64S,5XC1E82D4F65S,5XC1E82D4F66S,5XC1E82D4F67S,5XC1E82D4F68S,5XC1E82D4F69S,5XC1E82D4F70S,5XC1E82D4F71S,5XC1E82D4F72S,5XC1E82D4F73S,5XC1E82D4F74S,5XC1E82D4F75S', '进入游戏→点击游戏右上角的福→点击CDkey→输入激活码领取礼包', '绑金*15000、小飞鞋*10、随机传送卷*10、礼券*200、节日烟花*10、召集令*10、2倍经验神符*5', '1458730020', '1459421220', '1458730092');
INSERT INTO `tab_giftbag` VALUES ('3', '4', '4', '红警世界大战-媒体礼包', '2', '0', '0', '1', '0', '0', '5XC1E82D4F56S,5XC1E82D4F57S,5XC1E82D4F58S,5XC1E82D4F59S,5XC1E82D4F60S,5XC1E82D4F61S,5XC1E82D4F62S,5XC1E82D4F63S,5XC1E82D4F64S,5XC1E82D4F65S,5XC1E82D4F66S,5XC1E82D4F67S,5XC1E82D4F68S,5XC1E82D4F69S,5XC1E82D4F70S,5XC1E82D4F71S,5XC1E82D4F72S,5XC1E82D4F73S,5XC1E82D4F74S,5XC1E82D4F75S', '进入游戏→点击游戏右上角的福→点击CDkey→输入激活码领取礼包', '绑金*15000、小飞鞋*10、随机传送卷*10、礼券*200、节日烟花*10、召集令*10、2倍经验神符*5', '1458730080', '1459421280', '1458730122');
INSERT INTO `tab_giftbag` VALUES ('4', '3', '3', '我叫MT全3D-新手礼包', '1', '0', '0', '1', '0', '0', '5XC1E82D4F56S,5XC1E82D4F57S,5XC1E82D4F58S,5XC1E82D4F59S,5XC1E82D4F60S,5XC1E82D4F61S,5XC1E82D4F62S,5XC1E82D4F63S,5XC1E82D4F64S,5XC1E82D4F65S,5XC1E82D4F66S,5XC1E82D4F67S,5XC1E82D4F68S,5XC1E82D4F69S,5XC1E82D4F70S,5XC1E82D4F71S,5XC1E82D4F72S,5XC1E82D4F73S,5XC1E82D4F74S,5XC1E82D4F75S', '进入游戏→点击游戏右上角的福→点击CDkey→输入激活码领取礼包', '绑金*15000、小飞鞋*10、随机传送卷*10、礼券*200、节日烟花*10、召集令*10、2倍经验神符*5', '1458730080', '1459421280', '1458730188');
INSERT INTO `tab_giftbag` VALUES ('5', '7', '5', '蜀山战纪-新手礼包', '1', '0', '0', '1', '0', '0', '5XC1E82D4F56S,5XC1E82D4F57S,5XC1E82D4F58S,5XC1E82D4F59S,5XC1E82D4F60S,5XC1E82D4F61S,5XC1E82D4F62S,5XC1E82D4F63S,5XC1E82D4F64S,5XC1E82D4F65S,5XC1E82D4F66S,5XC1E82D4F67S,5XC1E82D4F68S,5XC1E82D4F69S,5XC1E82D4F70S,5XC1E82D4F71S,5XC1E82D4F72S,5XC1E82D4F73S,5XC1E82D4F74S,5XC1E82D4F75S', '进入游戏→点击游戏右上角的福→点击CDkey→输入激活码领取礼包', '绑金*15000、小飞鞋*10、随机传送卷*10、礼券*200、节日烟花*10、召集令*10、2倍经验神符*5', '1458730140', '1459421340', '1458730232');
INSERT INTO `tab_giftbag` VALUES ('6', '6', '6', '大话西游手游-媒体礼包', '2', '0', '0', '1', '0', '0', '5XC1E82D4F56S,5XC1E82D4F57S,5XC1E82D4F58S,5XC1E82D4F59S,5XC1E82D4F60S,5XC1E82D4F61S,5XC1E82D4F62S,5XC1E82D4F63S,5XC1E82D4F64S,5XC1E82D4F65S,5XC1E82D4F66S,5XC1E82D4F67S,5XC1E82D4F68S,5XC1E82D4F69S,5XC1E82D4F70S,5XC1E82D4F71S,5XC1E82D4F72S,5XC1E82D4F73S,5XC1E82D4F74S,5XC1E82D4F75S', '进入游戏→点击游戏右上角的福→点击CDkey→输入激活码领取礼包', '绑金*15000、小飞鞋*10、随机传送卷*10、礼券*200、节日烟花*10、召集令*10、2倍经验神符*5', '1458730200', '1459421400', '1458730261');
INSERT INTO `tab_giftbag` VALUES ('7', '5', '7', '莽荒纪2-新手礼包', '1', '0', '0', '1', '0', '0', '5XC1E82D4F56S,5XC1E82D4F57S,5XC1E82D4F58S,5XC1E82D4F59S,5XC1E82D4F60S,5XC1E82D4F61S,5XC1E82D4F62S,5XC1E82D4F63S,5XC1E82D4F64S,5XC1E82D4F65S,5XC1E82D4F66S,5XC1E82D4F67S,5XC1E82D4F68S,5XC1E82D4F69S,5XC1E82D4F70S,5XC1E82D4F71S,5XC1E82D4F72S,5XC1E82D4F73S,5XC1E82D4F74S,5XC1E82D4F75S', '进入游戏→点击游戏右上角的福→点击CDkey→输入激活码领取礼包', '绑金*15000、小飞鞋*10、随机传送卷*10、礼券*200、节日烟花*10、召集令*10、2倍经验神符*5', '1458730200', '1459421400', '1458730292');
INSERT INTO `tab_giftbag` VALUES ('8', '8', '8', '功夫熊猫3-媒体礼包', '2', '0', '0', '1', '0', '0', '5XC1E82D4F57S,5XC1E82D4F58S,5XC1E82D4F59S,5XC1E82D4F60S,5XC1E82D4F61S,5XC1E82D4F62S,5XC1E82D4F63S,5XC1E82D4F64S,5XC1E82D4F65S,5XC1E82D4F66S,5XC1E82D4F67S,5XC1E82D4F68S,5XC1E82D4F69S,5XC1E82D4F70S,5XC1E82D4F71S,5XC1E82D4F72S,5XC1E82D4F73S,5XC1E82D4F74S,5XC1E82D4F75S', '进入游戏→点击游戏右上角的福→点击CDkey→输入激活码领取礼包', '绑金*15000、小飞鞋*10、随机传送卷*10、礼券*200、节日烟花*10、召集令*10、2倍经验神符*5', '1458730260', '1459421460', '1458730324');
INSERT INTO `tab_giftbag` VALUES ('9', '10', '10', '天龙八部3D-媒体礼包', '2', '0', '0', '1', '0', '0', '5XC1E82D4F58S,5XC1E82D4F59S,5XC1E82D4F60S,5XC1E82D4F61S,5XC1E82D4F62S,5XC1E82D4F63S,5XC1E82D4F64S,5XC1E82D4F65S,5XC1E82D4F66S,5XC1E82D4F67S,5XC1E82D4F68S,5XC1E82D4F69S,5XC1E82D4F70S,5XC1E82D4F71S,5XC1E82D4F72S,5XC1E82D4F73S,5XC1E82D4F74S,5XC1E82D4F75S', '进入游戏→点击游戏右上角的福→点击CDkey→输入激活码领取礼包', '绑金*15000、小飞鞋*10、随机传送卷*10、礼券*200、节日烟花*10、召集令*10、2倍经验神符*5', '1458730320', '1459421520', '1458730366');
INSERT INTO `tab_giftbag` VALUES ('10', '10', '10', '天龙八部3D-新手礼', '1', '0', '0', '1', '0', '0', '5XC1E82D4F58S,5XC1E82D4F59S,5XC1E82D4F60S,5XC1E82D4F61S,5XC1E82D4F62S,5XC1E82D4F63S,5XC1E82D4F64S,5XC1E82D4F65S,5XC1E82D4F66S,5XC1E82D4F67S,5XC1E82D4F68S,5XC1E82D4F69S,5XC1E82D4F70S,5XC1E82D4F71S,5XC1E82D4F72S,5XC1E82D4F73S,5XC1E82D4F74S,5XC1E82D4F75S', '进入游戏→点击游戏右上角的福→点击CDkey→输入激活码领取礼包', '绑金*15000、小飞鞋*10、随机传送卷*10、礼券*200、节日烟花*10、召集令*10、2倍经验神符*5', '1458730320', '1459421520', null);

-- ----------------------------
-- Table structure for tab_gift_record
-- ----------------------------
DROP TABLE IF EXISTS `tab_gift_record`;
CREATE TABLE `tab_gift_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `game_id` int(11) DEFAULT NULL COMMENT '游戏id',
  `game_name` varchar(30) DEFAULT NULL COMMENT '游戏名称',
  `gift_id` int(11) DEFAULT NULL COMMENT '礼包id',
  `gift_name` varchar(30) DEFAULT NULL COMMENT '礼包名称',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态(0:未使用,1:已使用)',
  `novice` varchar(30) DEFAULT NULL COMMENT '激活码',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='礼包领取记录';

-- ----------------------------
-- Records of tab_gift_record
-- ----------------------------
INSERT INTO `tab_gift_record` VALUES ('1', '10', '天龙八部3D', '9', '天龙八部3D-媒体礼包', '1', '5XC1E82D4F56S', '14', '1458691662');
INSERT INTO `tab_gift_record` VALUES ('2', '10', '天龙八部3D', '9', '天龙八部3D-媒体礼包', '1', '5XC1E82D4F57S', '59', '1460431274');
INSERT INTO `tab_gift_record` VALUES ('3', '8', '功夫熊猫3', '8', '功夫熊猫3-媒体礼包', '1', '5XC1E82D4F56S', '59', '1460431302');
INSERT INTO `tab_gift_record` VALUES ('4', '10', '天龙八部3D', '10', '天龙八部3D-新手礼', '1', '5XC1E82D4F57S', '59', '1460431444');

-- ----------------------------
-- Table structure for tab_links
-- ----------------------------
DROP TABLE IF EXISTS `tab_links`;
CREATE TABLE `tab_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `link_url` varchar(255) DEFAULT NULL COMMENT '友链地址',
  `link_icon` int(11) DEFAULT NULL COMMENT '图标',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态',
  `type` tinyint(2) NOT NULL COMMENT '类型',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友链管理';

-- ----------------------------
-- Records of tab_links
-- ----------------------------
INSERT INTO `tab_links` VALUES ('1', '溪谷软件', 'http://www.vlcms.com', '31', '1', '2', '溪谷软件', '1458746528');

-- ----------------------------
-- Table structure for tab_mend
-- ----------------------------
DROP TABLE IF EXISTS `tab_mend`;
CREATE TABLE `tab_mend` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `game_id` int(11) DEFAULT NULL COMMENT '游戏id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `promote_id` int(11) DEFAULT NULL COMMENT '推广id',
  `prmoote_id_to` int(11) DEFAULT NULL COMMENT '修改后id',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `op_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_account` varchar(30) DEFAULT NULL COMMENT '操作人账号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='推广补链';

-- ----------------------------
-- Records of tab_mend
-- ----------------------------
INSERT INTO `tab_mend` VALUES ('1', null, '0', '0', '4', '', '1458831896', '1', 'amdin_account');
INSERT INTO `tab_mend` VALUES ('2', null, '56', '2', '4', '', '1458832150', '1', 'amdin_account');
INSERT INTO `tab_mend` VALUES ('3', null, '58', '2', '4', '', '1458832186', '1', 'amdin_account');

-- ----------------------------
-- Table structure for tab_message
-- ----------------------------
DROP TABLE IF EXISTS `tab_message`;
CREATE TABLE `tab_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `game_id` int(11) DEFAULT NULL COMMENT '游戏id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` varchar(300) DEFAULT NULL COMMENT '内容',
  `status` tinyint(2) DEFAULT '0' COMMENT '修复状态(0:未,1:已)',
  `type` tinyint(2) DEFAULT '0' COMMENT '类型(0:纠错,1:留言)',
  `op_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_account` varchar(20) DEFAULT NULL COMMENT '操作人账号',
  `create_time` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='留言';

-- ----------------------------
-- Records of tab_message
-- ----------------------------
INSERT INTO `tab_message` VALUES ('1', '2', '24', '游戏无法下载', '', '1', '0', '1', 'admin', '1458739620');
INSERT INTO `tab_message` VALUES ('2', '1', '24', '游戏无法下载', '', '1', '0', '1', 'admin', '1458744589');

-- ----------------------------
-- Table structure for tab_promote
-- ----------------------------
DROP TABLE IF EXISTS `tab_promote`;
CREATE TABLE `tab_promote` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account` varchar(30) DEFAULT NULL COMMENT '账号',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `second_pwd` varchar(32) DEFAULT NULL COMMENT '二级密码',
  `nickname` varchar(30) DEFAULT NULL COMMENT '昵称',
  `mobile_phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `real_name` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '银行',
  `bank_card` varchar(20) DEFAULT NULL COMMENT '银行卡',
  `money` double(10,2) DEFAULT '0.00' COMMENT '金额',
  `total_money` double(10,2) DEFAULT '0.00' COMMENT '总金额',
  `balance_coin` double(10,2) DEFAULT '0.00' COMMENT '平台币',
  `promote_type` int(2) DEFAULT '1' COMMENT '推广员类型',
  `status` int(11) DEFAULT '1' COMMENT '状态',
  `parent_id` int(11) DEFAULT '0' COMMENT '父类ID',
  `referee_id` int(11) DEFAULT '0' COMMENT '推荐人ID',
  `create_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='推广员';

-- ----------------------------
-- Records of tab_promote
-- ----------------------------

-- ----------------------------
-- Table structure for tab_provide
-- ----------------------------
DROP TABLE IF EXISTS `tab_provide`;
CREATE TABLE `tab_provide` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `user_account` varchar(30) DEFAULT NULL COMMENT '用户账号',
  `amount` double(10,2) DEFAULT NULL COMMENT '充值金额',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态',
  `op_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_account` varchar(30) DEFAULT NULL COMMENT '操作人账号',
  `create_time` int(11) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='平台币发发放记录';

-- ----------------------------
-- Records of tab_provide
-- ----------------------------

-- ----------------------------
-- Table structure for tab_recharge
-- ----------------------------
DROP TABLE IF EXISTS `tab_recharge`;
CREATE TABLE `tab_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_account` varchar(20) DEFAULT NULL COMMENT '用户账号',
  `game_id` int(11) DEFAULT NULL COMMENT '游戏ID',
  `game_appid` varchar(32) DEFAULT NULL COMMENT '游戏appid',
  `game_name` varchar(30) DEFAULT NULL COMMENT '游戏名称',
  `promote_id` int(11) DEFAULT NULL COMMENT '推广员id',
  `promote_account` varchar(30) DEFAULT NULL COMMENT '推广员账号',
  `order_number` varchar(30) DEFAULT '0' COMMENT '订单号',
  `pay_order_number` varchar(30) NOT NULL DEFAULT '0' COMMENT '支付订单号',
  `props_name` varchar(20) NOT NULL COMMENT '游戏道具',
  `pay_amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `pay_time` int(11) NOT NULL COMMENT '支付时间',
  `pay_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `pay_game_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '游戏支付状态',
  `pay_way` tinyint(2) NOT NULL DEFAULT '0' COMMENT '支付方式',
  `pay_source` tinyint(2) NOT NULL DEFAULT '0' COMMENT '支付来源',
  `recharge_ip` varchar(16) NOT NULL COMMENT '充值ip',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='充值记录表';

-- ----------------------------
-- Records of tab_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for tab_settlement
-- ----------------------------
DROP TABLE IF EXISTS `tab_settlement`;
CREATE TABLE `tab_settlement` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `promote_id` int(11) DEFAULT NULL COMMENT '推广员ID',
  `game_id` varchar(32) DEFAULT NULL COMMENT '游戏ID',
  `spend_time` int(11) DEFAULT NULL COMMENT '消费时间',
  `reg_num` int(10) DEFAULT '0' COMMENT '注册人数',
  `spend_num` int(10) DEFAULT '0' COMMENT '消费人数',
  `money` double(10,2) DEFAULT '0.00' COMMENT '金额',
  `real_money` double(10,2) DEFAULT '0.00' COMMENT '实际金额',
  `status` tinyint(2) DEFAULT '1' COMMENT '结算状态',
  `type` tinyint(2) DEFAULT '0' COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='结算表';

-- ----------------------------
-- Records of tab_settlement
-- ----------------------------

-- ----------------------------
-- Table structure for tab_user
-- ----------------------------
DROP TABLE IF EXISTS `tab_user`;
CREATE TABLE `tab_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `account` varchar(30) DEFAULT NULL COMMENT '登陆账号',
  `password` varchar(32) DEFAULT NULL COMMENT '登陆密码',
  `nickname` varchar(30) DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `idcard` varchar(20) DEFAULT NULL COMMENT '身份证',
  `vip_level` tinyint(2) DEFAULT '0' COMMENT 'vip等级',
  `cumulative` double(10,2) DEFAULT '0.00' COMMENT '累计充值',
  `balance` double(10,2) DEFAULT '0.00' COMMENT '余额',
  `anti_addiction` tinyint(2) DEFAULT '0' COMMENT '防沉迷',
  `lock_status` tinyint(2) DEFAULT '1' COMMENT '锁定状态',
  `register_way` tinyint(2) DEFAULT '0' COMMENT '注册方式',
  `register_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `login_time` int(11) DEFAULT NULL COMMENT '登陆时间',
  `register_ip` varchar(16) NOT NULL COMMENT '注册ip',
  `login_ip` varchar(16) NOT NULL COMMENT '登陆ip',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tab_user
-- ----------------------------

-- ----------------------------
-- Table structure for tab_user_play
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_play`;
CREATE TABLE `tab_user_play` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `game_appid` varchar(32) DEFAULT NULL COMMENT '游戏appid',
  `area_id` int(11) DEFAULT '0' COMMENT '区服id',
  `role_id` int(11) DEFAULT '0' COMMENT '角色',
  `role_name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `role_level` int(3) DEFAULT '0' COMMENT '等级',
  `promote_id` int(11) DEFAULT '0' COMMENT '推广员id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='万家表';

-- ----------------------------
-- Records of tab_user_play
-- ----------------------------

-- ----------------------------
-- Table structure for tab_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `tab_withdraw`;
CREATE TABLE `tab_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `promote_id` int(11) DEFAULT NULL COMMENT '推广员id',
  `amount` double(10,2) DEFAULT '0.00' COMMENT '金额',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `op_id` int(11) DEFAULT NULL COMMENT '操作人ID',
  `op_account` varchar(20) DEFAULT NULL COMMENT '操作人',
  `create_time` int(11) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='结算表';

-- ----------------------------
-- Records of tab_withdraw
-- ----------------------------
