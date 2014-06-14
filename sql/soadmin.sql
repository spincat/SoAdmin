/*
Navicat MySQL Data Transfer

Source Server         : hanbud
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : soadmin

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2014-06-13 22:25:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `menuurl`
-- ----------------------------
DROP TABLE IF EXISTS `menuurl`;
CREATE TABLE `menuurl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) NOT NULL,
  `menu_url` varchar(255) NOT NULL,
  `module_id` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL COMMENT '是否在sidebar里出现',
  `online` int(11) NOT NULL DEFAULT '1' COMMENT '在线状态，还是下线状态，即可用，不可用。',
  `shortcut_allowed` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许快捷访问',
  `menu_desc` varchar(255) DEFAULT NULL,
  `father_menu` int(11) NOT NULL DEFAULT '0' COMMENT '上一级菜单',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_url` (`menu_url`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='功能链接（菜单链接）';

-- ----------------------------
-- Records of menuurl
-- ----------------------------
INSERT INTO `menuurl` VALUES ('1', '首页', '/index.php', '1', '0', '1', '1', '', '0');
INSERT INTO `menuurl` VALUES ('2', '账号列表', '/admin/users.php', '2', '1', '1', '1', '账号列表', '0');
INSERT INTO `menuurl` VALUES ('3', '修改账号', '/admin/user_modify.php', '2', '0', '1', '0', '修改账号', '2');
INSERT INTO `menuurl` VALUES ('4', '新建账号', '/admin/user_add.php', '2', '0', '1', '1', '新建账号', '2');
INSERT INTO `menuurl` VALUES ('5', '个人信息', '/admin/profile.php', '2', '0', '1', '1', '个人信息', '0');
INSERT INTO `menuurl` VALUES ('6', '账号组成员', '/admin/group.php', '2', '0', '1', '0', '显示账号组详情及该组成员', '7');
INSERT INTO `menuurl` VALUES ('7', '账号组管理', '/admin/groups.php', '2', '1', '1', '1', '增加管理员', '0');
INSERT INTO `menuurl` VALUES ('8', '修改账号组', '/admin/group_modify.php', '2', '0', '1', '0', '修改账号组', '7');
INSERT INTO `menuurl` VALUES ('9', '新建账号组', '/admin/group_add.php', '2', '0', '1', '1', '新建账号组', '7');
INSERT INTO `menuurl` VALUES ('10', '权限管理', '/admin/group_role.php', '2', '1', '1', '1', '用户权限依赖于账号组的权限', '0');
INSERT INTO `menuurl` VALUES ('11', '菜单模块', '/admin/modules.php', '2', '1', '1', '1', '菜单里的模块', '0');
INSERT INTO `menuurl` VALUES ('12', '编辑菜单模块', '/admin/module_modify.php', '2', '0', '1', '0', '编辑模块', '11');
INSERT INTO `menuurl` VALUES ('13', '添加菜单模块', '/admin/module_add.php', '2', '0', '1', '1', '添加菜单模块', '11');
INSERT INTO `menuurl` VALUES ('14', '功能列表', '/admin/menus.php', '2', '1', '1', '1', '菜单功能及可访问的链接', '0');
INSERT INTO `menuurl` VALUES ('15', '增加功能', '/admin/menu_add.php', '2', '0', '1', '1', '增加功能', '14');
INSERT INTO `menuurl` VALUES ('16', '功能修改', '/admin/menu_modify.php', '2', '0', '1', '0', '修改功能', '14');
INSERT INTO `menuurl` VALUES ('17', '设置模板', '/admin/set.php', '2', '0', '1', '1', '设置模板', '0');
INSERT INTO `menuurl` VALUES ('18', '便签管理', '/admin/quicknotes.php', '2', '1', '1', '1', 'quick note', '0');
INSERT INTO `menuurl` VALUES ('19', '菜单链接列表', '/admin/module.php', '2', '0', '1', '0', '显示模块详情及该模块下的菜单', '11');
INSERT INTO `menuurl` VALUES ('20', '登入', '/login.php', '2', '0', '1', '1', '登入页面', '0');
INSERT INTO `menuurl` VALUES ('21', '操作记录', '/admin/syslog.php', '2', '1', '1', '1', '用户操作的历史行为', '0');
INSERT INTO `menuurl` VALUES ('22', '系统信息', '/admin/system.php', '2', '1', '1', '1', '显示系统相关信息', '0');
INSERT INTO `menuurl` VALUES ('23', 'ajax访问修改快捷菜单', '/ajax/shortcut.php', '2', '0', '1', '0', 'ajax请求', '0');
INSERT INTO `menuurl` VALUES ('24', '添加便签', '/admin/quicknote_add.php', '2', '0', '1', '1', '添加quicknote的内容', '18');
INSERT INTO `menuurl` VALUES ('25', '修改便签', '/admin/quicknote_modify.php', '2', '0', '1', '0', '修改quicknote的内容', '18');
INSERT INTO `menuurl` VALUES ('26', '系统设置', '/admin/setting.php', '2', '0', '1', '0', '系统设置', '0');
INSERT INTO `menuurl` VALUES ('27', '标准信息管理', '/demo/info.php', '3', '1', '1', '1', '教言信息管理', '0');
INSERT INTO `menuurl` VALUES ('28', '添加信息', '/demo/info_add.php', '3', '0', '1', '0', '添加教言信息', '27');
INSERT INTO `menuurl` VALUES ('29', '修改信息', '/demo/info_modify.php', '3', '0', '1', '0', '修改教言信息', '27');
INSERT INTO `menuurl` VALUES ('30', '用户邮件管理', '/demo/feedback.php', '3', '1', '1', '1', '反馈信息管理', '0');
INSERT INTO `menuurl` VALUES ('31', '查看邮件', '/demo/feedback_view.php', '3', '0', '1', '0', '查看反馈信息', '30');

-- ----------------------------
-- Table structure for `module`
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_url` varchar(128) NOT NULL,
  `module_sort` int(11) unsigned NOT NULL DEFAULT '1',
  `module_desc` varchar(255) DEFAULT NULL,
  `online` int(11) NOT NULL DEFAULT '1' COMMENT '模块是否在线',
  `module_icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='菜单模块';

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('1', '仪表盘', '/index.php', '0', 'dashboard', '1', 'fa-dashboard');
INSERT INTO `module` VALUES ('2', '系统', '/index.php', '1', '后台系统管理', '1', 'fa-gears');
INSERT INTO `module` VALUES ('3', '样例', '/index.php', '2', '示范样例', '1', 'fa-plane');
INSERT INTO `module` VALUES ('4', '帮助', 'http://www.osadmin.org', '3', '帮助', '1', 'fa-question-circle');

-- ----------------------------
-- Table structure for `quicknote`
-- ----------------------------
DROP TABLE IF EXISTS `quicknote`;
CREATE TABLE `quicknote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'note_id',
  `note_content` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '内容',
  `owner_id` int(10) unsigned NOT NULL COMMENT '谁添加的',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用于显示的quick note';

-- ----------------------------
-- Records of quicknote
-- ----------------------------
INSERT INTO `quicknote` VALUES ('31', '欢迎进入SoAdmin管理后台！', '1');
INSERT INTO `quicknote` VALUES ('32', '若无闲事挂心头，便是人间好时节', '1');
INSERT INTO `quicknote` VALUES ('33', '以一切法无我，得成于忍', '1');
INSERT INTO `quicknote` VALUES ('34', '天行健，君子以自强不息；地势坤，君子以厚德载物', '1');
INSERT INTO `quicknote` VALUES ('35', '实迷途其未远，觉今是而昨非', '1');

-- ----------------------------
-- Table structure for `syslog`
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) NOT NULL,
  `action` varchar(255) NOT NULL,
  `class_name` varchar(255) NOT NULL COMMENT '操作了哪个类的对象',
  `class_obj` varchar(32) NOT NULL COMMENT '操作的对象是谁，可能为对象的ID',
  `result` text NOT NULL COMMENT '操作的结果',
  `op_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `op_time` (`op_time`),
  KEY `class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('4', 'admin', 'MODIFY', 'User', '1', '{\"real_name\":\"\",\"mobile\":\"\",\"email\":\"\",\"user_desc\":\"\",\"show_quicknote\":\"\"}', '1402666389');
INSERT INTO `syslog` VALUES ('5', 'admin', 'MODIFY', 'User', '1', '{\"real_name\":\"\",\"mobile\":\"\",\"email\":\"\",\"user_desc\":\"\",\"show_quicknote\":\"\"}', '1402667511');
INSERT INTO `syslog` VALUES ('6', 'admin', 'MODIFY', 'User', '1', '{\"real_name\":\"\",\"mobile\":\"\",\"email\":\"\",\"user_desc\":\"\",\"show_quicknote\":\"\"}', '1402667563');
INSERT INTO `syslog` VALUES ('7', 'admin', 'MODIFY', 'User', '1', '{\"real_name\":\"\",\"mobile\":\"\",\"email\":\"\",\"user_desc\":\"\",\"show_quicknote\":\"\"}', '1402667584');
INSERT INTO `syslog` VALUES ('8', 'admin', 'MODIFY', 'User', '1', '{\"real_name\":\"\",\"mobile\":\"\",\"email\":\"\",\"user_desc\":\"\",\"show_quicknote\":\"\"}', '1402667649');
INSERT INTO `syslog` VALUES ('9', 'admin', 'MODIFY', 'User', '1', '{\"real_name\":\"\",\"mobile\":\"\",\"email\":\"\",\"user_desc\":\"\",\"show_quicknote\":\"\"}', '1402667711');
INSERT INTO `syslog` VALUES ('10', 'admin', 'LOGOUT', 'User', '1', '', '1402668682');
INSERT INTO `syslog` VALUES ('11', 'admin', 'LOGIN', 'User', '1', '{\"IP\":\"192.168.137.101\"}', '1402668697');
INSERT INTO `syslog` VALUES ('12', 'admin', 'MODIFY', 'User', '1', '{\"real_name\":\"spincat\",\"mobile\":\"18000000000\",\"email\":\"spincat.me@gmail.com\",\"email_password\":\"000000\",\"user_desc\":\"1\",\"show_quicknote\":\"0\"}', '1402668736');
INSERT INTO `syslog` VALUES ('13', 'admin', 'MODIFY', 'User', '1', '', '1402668806');

-- ----------------------------
-- Table structure for `system`
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `id` int(11) NOT NULL,
  `key_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `key_value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`key_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统配置表';

-- ----------------------------
-- Records of system
-- ----------------------------
INSERT INTO `system` VALUES ('0', 'timezone', '\"Asia/Shanghai\"');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `real_name` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_desc` varchar(255) DEFAULT NULL,
  `login_time` int(11) DEFAULT NULL COMMENT '登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `login_ip` varchar(32) DEFAULT NULL,
  `usergroup_id` int(11) NOT NULL,
  `template` varchar(32) NOT NULL DEFAULT 'default' COMMENT '主题模板',
  `shortcuts` text COMMENT '快捷菜单',
  `show_quicknote` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示quicknote',
  `email_password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'spincat', '18000000000', 'spincat.me@gmail.com', '1', '1402668697', '1', '192.168.137.101', '1', 'default', '1,2,7,10,11,14,18,21,24,101', '0', '000000');

-- ----------------------------
-- Table structure for `usergroup`
-- ----------------------------
DROP TABLE IF EXISTS `usergroup`;
CREATE TABLE `usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(32) DEFAULT NULL,
  `group_role` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '初始权限为1,5,17,18,22,23,24,25',
  `owner_id` int(11) DEFAULT NULL COMMENT '创建人ID',
  `group_desc` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='账号组';

-- ----------------------------
-- Records of usergroup
-- ----------------------------
INSERT INTO `usergroup` VALUES ('1', '超级管理员组', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31', '1', '万能的不是神，是程序员.');
INSERT INTO `usergroup` VALUES ('2', '默认账号组', '1,5,17,18,20,22,23,24,25,101', '1', '默认账号组');
