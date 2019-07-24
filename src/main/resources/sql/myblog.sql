/*
Navicat MySQL Data Transfer

Source Server         : kwbbin
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2019-04-21 11:47:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL auto_increment,
  `postedTime` datetime default NULL,
  `title` varchar(40) NOT NULL,
  `good` int(11) default NULL,
  `content` text,
  `sectionId` int(11) default NULL,
  `author` varchar(20) default NULL,
  `logo` varchar(255) default NULL,
  `articleType` varchar(255) default NULL,
  `reading` int(11) default '0',
  PRIMARY KEY  (`id`),
  KEY `sectionId` (`sectionId`),
  CONSTRAINT `sectionId` FOREIGN KEY (`sectionId`) REFERENCES `section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '2018-08-08 09:16:47', '初探html', '121', '假装我是一篇html文章', '1', 'kwbbin', 'images/test.jpg', '1', '19');
INSERT INTO `article` VALUES ('2', '2018-09-08 22:28:47', '初探CSS', '875', '假装我是一篇CSS文章', '2', 'kwbbin', 'images/test.jpg', '1', '5');
INSERT INTO `article` VALUES ('3', '2018-09-28 06:40:47', '初探javascript', '22', '假装我是一篇javascript文章', '3', 'kwbbin', 'images/test.jpg', '1', '5');
INSERT INTO `article` VALUES ('4', '2018-09-30 22:06:47', '初探JAVA', '362', '假装我是一篇JAVA文章', '5', 'kwbbin', 'images/test.jpg', '1', '13');
INSERT INTO `article` VALUES ('5', '2018-11-08 18:20:47', '浅谈css盒子模型', '909', '假装我是一篇CSS文章', '2', 'kwbbin', 'images/test.jpg', '1', '1');
INSERT INTO `article` VALUES ('6', '2018-12-29 02:14:47', 'String对象常用方法', '598', '假装我是一篇JAVA文章', '5', 'kwbbin', 'sdfsfsdfsdf', '1', '0');
INSERT INTO `article` VALUES ('7', '2018-10-29 02:14:47', '生活小悟', '598', '假装我是一篇文章', '6', 'kwbbin', 'sdfsfsdfsdf', '2', '12');
INSERT INTO `article` VALUES ('8', '2018-11-29 02:14:47', '生活小小悟', '528', '我的大学生活', '7', 'kwbbin', 'sdfsfsdfsdf', '2', '0');
INSERT INTO `article` VALUES ('9', '2017-12-11 02:14:47', '初探html', '58', '刚开始学习html', '9', 'kwbbin', 'sdfsfsdfsdf', '2', '0');
INSERT INTO `article` VALUES ('10', '2018-01-01 02:14:47', '初探css', '58', '刚开始学习css', '9', 'kwbbin', 'sdfsfsdfsdf', '2', '0');
INSERT INTO `article` VALUES ('11', '2018-02-01 02:14:47', '初探javascript', '58', '刚开始学习js', '9', 'kwbbin', 'sdfsfsdfsdf', '2', '0');
INSERT INTO `article` VALUES ('12', '2018-07-10 02:14:47', '初探java', '58', '刚开始学习java', '9', 'kwbbin', 'sdfsfsdfsdf', '2', '0');
INSERT INTO `article` VALUES ('13', '2018-07-10 02:14:47', '初探java', '1', '刚开始学习java', '9', 'kwbbin', 'sdfsfsdfsdf', '3', '0');
INSERT INTO `article` VALUES ('14', '2018-01-01 02:14:47', '初探css', '2', '刚开始学习css', '9', 'kwbbin', 'sdfsfsdfsdf', '3', '0');
INSERT INTO `article` VALUES ('15', '2018-02-01 02:14:47', '初探javascript', '3', '刚开始学习js', '9', 'kwbbin', 'sdfsfsdfsdf', '3', '0');
INSERT INTO `article` VALUES ('16', '2018-07-10 02:14:47', '初探java', '4', '刚开始学习java', '9', 'kwbbin', 'sdfsfsdfsdf', '3', '0');
INSERT INTO `article` VALUES ('17', '2018-02-01 02:14:47', '初探javascript', '34', '刚开始学习js', '9', 'kwbbin', 'sdfsfsdfsdf', '4', '0');
INSERT INTO `article` VALUES ('18', '2018-07-10 02:14:47', '初探java', '4999', '刚开始学习java', '9', 'kwbbin', 'sdfsfsdfsdf', '4', '2');
INSERT INTO `article` VALUES ('19', '2018-07-10 02:14:47', '初探java', '1', '刚开始学习java', '9', 'kwbbin', 'sdfsfsdfsdf', '3', '0');
INSERT INTO `article` VALUES ('20', '2018-01-01 02:14:47', '初探css', '2', '刚开始学习css', '9', 'kwbbin', 'sdfsfsdfsdf', '3', '0');
INSERT INTO `article` VALUES ('21', '2018-02-01 02:14:47', '初探javascript', '3', '刚开始学习js', '9', 'kwbbin', 'sdfsfsdfsdf', '3', '1');
INSERT INTO `article` VALUES ('22', '2018-07-10 02:14:47', '初探java', '4', '刚开始学习java', '9', 'kwbbin', 'sdfsfsdfsdf', '3', '0');
INSERT INTO `article` VALUES ('23', '2018-02-01 02:14:47', '初探javascript', '34', '刚开始学习js', '9', 'kwbbin', 'sdfsfsdfsdf', '4', '0');
INSERT INTO `article` VALUES ('24', '2018-07-10 02:14:47', '初探java', '4999', '刚开始学习java', '9', 'kwbbin', 'sdfsfsdfsdf', '4', '0');
INSERT INTO `article` VALUES ('25', '2018-11-29 02:14:47', '生活小小悟', '528', '我的大学生活', '7', 'kwbbin', 'sdfsfsdfsdf', '14', '0');
INSERT INTO `article` VALUES ('26', '2017-12-11 02:14:47', '初探html', '58', '刚开始学习html', '9', 'kwbbin', 'sdfsfsdfsdf', '13', '0');
INSERT INTO `article` VALUES ('27', '2018-01-01 02:14:47', '初探css', '58', '刚开始学习css', '9', 'kwbbin', 'sdfsfsdfsdf', '12', '0');
INSERT INTO `article` VALUES ('28', '2018-02-01 02:14:47', '初探javascript', '58', '刚开始学习js', '9', 'kwbbin', 'sdfsfsdfsdf', '11', '0');
INSERT INTO `article` VALUES ('29', '2018-07-10 02:14:47', '初探java', '1', '刚开始学习java', '9', 'kwbbin', 'sdfsfsdfsdf', '10', '0');
INSERT INTO `article` VALUES ('30', '2018-01-01 02:14:47', '初探css', '2', '刚开始学习css', '9', 'kwbbin', 'sdfsfsdfsdf', '9', '0');
INSERT INTO `article` VALUES ('31', '2018-02-01 02:14:47', '初探javascript', '3', '刚开始学习js', '9', 'kwbbin', 'sdfsfsdfsdf', '8', '0');
INSERT INTO `article` VALUES ('32', '2018-07-10 02:14:47', '初探java', '4', '刚开始学习java', '9', 'kwbbin', 'sdfsfsdfsdf', '7', '1');
INSERT INTO `article` VALUES ('33', '2018-02-01 02:14:47', '初探javascript', '34', '刚开始学习js', '9', 'kwbbin', 'sdfsfsdfsdf', '6', '0');
INSERT INTO `article` VALUES ('34', '2018-07-10 02:14:47', '初探java', '4999', '刚开始学习java', '9', 'kwbbin', 'sdfsfsdfsdf', '5', '0');
INSERT INTO `article` VALUES ('35', '2018-02-01 02:14:47', '初探javascript', '58', '刚开始学习js', '9', 'kwbbin', 'sdfsfsdfsdf', '21', '0');
INSERT INTO `article` VALUES ('36', '2018-07-10 02:14:47', '初探java', '1', '刚开始学习java', '9', 'kwbbin', 'sdfsfsdfsdf', '20', '0');
INSERT INTO `article` VALUES ('37', '2018-01-01 02:14:47', '初探css', '2', '刚开始学习css', '9', 'kwbbin', 'sdfsfsdfsdf', '19', '0');
INSERT INTO `article` VALUES ('38', '2018-02-01 02:14:47', '初探javascript', '3', '刚开始学习js', '9', 'kwbbin', 'sdfsfsdfsdf', '18', '0');
INSERT INTO `article` VALUES ('39', '2018-07-10 02:14:47', '初探java', '4', '刚开始学习java', '9', 'kwbbin', 'sdfsfsdfsdf', '17', '0');
INSERT INTO `article` VALUES ('40', '2018-02-01 02:14:47', '初探javascript', '34', '刚开始学习js', '9', 'kwbbin', 'images/test.jpg', '16', '0');
INSERT INTO `article` VALUES ('41', '2018-02-01 02:14:47', '初探javascript', '58', '刚开始学习js', '9', 'kwbbin', 'images/test.jpg', '21', '0');
INSERT INTO `article` VALUES ('42', '2018-07-10 02:14:47', '初探java', '1', '刚开始学习java', '9', 'kwbbin', 'images/test.jpg', '20', '0');
INSERT INTO `article` VALUES ('43', '2018-01-01 02:14:47', '初探css', '2', '刚开始学习css', '9', 'kwbbin', 'images/test.jpg', '19', '2');
INSERT INTO `article` VALUES ('44', '2018-02-01 02:14:47', '初探javascript', '3', '刚开始学习js', '9', 'kwbbin', 'images/test.jpg', '18', '2');
INSERT INTO `article` VALUES ('45', '2018-02-01 02:14:47', '初探javascript', '34', '刚开始学习js', '9', 'kwbbin', 'images/test.jpg', '15', '4');
INSERT INTO `article` VALUES ('46', '2018-07-10 02:14:47', '555555', '4999', '刚开始学习java', '9', 'kwbbin', 'sdfsfsdfsdf', '5', '2');

-- ----------------------------
-- Table structure for articletype
-- ----------------------------
DROP TABLE IF EXISTS `articletype`;
CREATE TABLE `articletype` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articletype
-- ----------------------------
INSERT INTO `articletype` VALUES ('1', 'html');
INSERT INTO `articletype` VALUES ('2', 'css');
INSERT INTO `articletype` VALUES ('3', 'java');
INSERT INTO `articletype` VALUES ('4', 'Mybatis');
INSERT INTO `articletype` VALUES ('5', 'SSM');
INSERT INTO `articletype` VALUES ('6', '服务器');
INSERT INTO `articletype` VALUES ('7', 'ssh');
INSERT INTO `articletype` VALUES ('8', 'spring');
INSERT INTO `articletype` VALUES ('9', 'Spring-mvc');
INSERT INTO `articletype` VALUES ('10', 'vue');
INSERT INTO `articletype` VALUES ('11', 'vue');
INSERT INTO `articletype` VALUES ('12', 'java');
INSERT INTO `articletype` VALUES ('13', 'php');
INSERT INTO `articletype` VALUES ('14', 'SSM');
INSERT INTO `articletype` VALUES ('15', '服务器');
INSERT INTO `articletype` VALUES ('16', 'ssh');
INSERT INTO `articletype` VALUES ('17', 'spring');
INSERT INTO `articletype` VALUES ('18', 'SSM');
INSERT INTO `articletype` VALUES ('19', '服务器');
INSERT INTO `articletype` VALUES ('20', 'ssh');
INSERT INTO `articletype` VALUES ('21', 'spring');

-- ----------------------------
-- Table structure for friendlink
-- ----------------------------
DROP TABLE IF EXISTS `friendlink`;
CREATE TABLE `friendlink` (
  `id` int(11) NOT NULL auto_increment,
  `friendLink` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friendlink
-- ----------------------------
INSERT INTO `friendlink` VALUES ('1', 'www.baidu.com', '百度');
INSERT INTO `friendlink` VALUES ('2', 'www.taobao.com', '淘宝');
INSERT INTO `friendlink` VALUES ('3', 'www.kwbbin.com', 'kwbbin的个人博客');
INSERT INTO `friendlink` VALUES ('4', 'www.liuhua.com', '刘华的个人博客');

-- ----------------------------
-- Table structure for life_article
-- ----------------------------
DROP TABLE IF EXISTS `life_article`;
CREATE TABLE `life_article` (
  `life` int(11) NOT NULL auto_increment,
  `articleId` int(11) NOT NULL,
  PRIMARY KEY  (`life`),
  KEY `life_fore` (`articleId`),
  CONSTRAINT `life_fore` FOREIGN KEY (`articleId`) REFERENCES `article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of life_article
-- ----------------------------
INSERT INTO `life_article` VALUES ('1', '2');
INSERT INTO `life_article` VALUES ('2', '4');
INSERT INTO `life_article` VALUES ('3', '6');
INSERT INTO `life_article` VALUES ('4', '8');
INSERT INTO `life_article` VALUES ('5', '10');
INSERT INTO `life_article` VALUES ('6', '12');
INSERT INTO `life_article` VALUES ('7', '14');
INSERT INTO `life_article` VALUES ('8', '16');
INSERT INTO `life_article` VALUES ('9', '18');
INSERT INTO `life_article` VALUES ('10', '20');
INSERT INTO `life_article` VALUES ('11', '22');
INSERT INTO `life_article` VALUES ('12', '24');
INSERT INTO `life_article` VALUES ('13', '26');
INSERT INTO `life_article` VALUES ('14', '28');
INSERT INTO `life_article` VALUES ('15', '30');
INSERT INTO `life_article` VALUES ('16', '32');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL auto_increment,
  `content` text,
  `responseTime` datetime default NULL,
  `userId` int(11) NOT NULL,
  `good` int(11) default '0',
  `answerToMessage` int(11) default NULL,
  `answerToUser` int(11) default NULL,
  PRIMARY KEY  (`id`,`userId`),
  KEY `user-message` (`userId`),
  CONSTRAINT `user-message` FOREIGN KEY (`userId`) REFERENCES `myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '哈哈哈，留个言', '2018-07-10 02:14:47', '28', '0', null, '28');
INSERT INTO `message` VALUES ('2', '你好帅！！！', '2018-07-10 02:14:47', '28', '0', '2', null);
INSERT INTO `message` VALUES ('3', '奥特曼打小怪兽', '2018-07-10 02:14:47', '28', '0', '2', '1');
INSERT INTO `message` VALUES ('4', '哈哈哈，留个言', '2018-07-10 02:14:47', '28', '0', null, '28');
INSERT INTO `message` VALUES ('5', '胜多负少', '2019-04-17 18:14:05', '37', '0', null, null);
INSERT INTO `message` VALUES ('6', 'sfsdfs', '2019-04-17 20:31:29', '37', '0', null, null);
INSERT INTO `message` VALUES ('7', '编号编号基金会不', '2019-04-17 20:43:20', '37', '0', null, null);
INSERT INTO `message` VALUES ('8', '水电费是否大是大非<img style=\"width:40px;height:40px\" class=\"images\" src=\"http://localhost:8080/MyBlog_war_exploded/images/emoji/emoji2/emoji2_3.png\">', '2019-04-18 15:21:04', '37', '0', null, null);
INSERT INTO `message` VALUES ('9', '黄齑淡饭盛世嫡妃<img style=\"width:60px;height:60px\" class=\"images\" src=\"http://localhost:8080/MyBlog_war_exploded/images/emoji/emoji4/emoji4_6.gif\">', '2019-04-18 15:21:13', '37', '0', null, null);
INSERT INTO `message` VALUES ('10', '沙发沙发是·<img style=\"width:40px;height:40px\" class=\"images\" src=\"http://localhost:8080/MyBlog_war_exploded/images/emoji/emoji1/emoji1_3.jpg\">', '2019-04-18 15:21:20', '37', '0', null, null);
INSERT INTO `message` VALUES ('11', '沙发沙发是·<img style=\"width:40px;height:40px\" class=\"images\" src=\"http://localhost:8080/MyBlog_war_exploded/images/emoji/emoji1/emoji1_3.jpg\">', '2019-04-18 15:21:25', '37', '0', null, null);
INSERT INTO `message` VALUES ('12', '沙发沙发是·<img style=\"width:40px;height:40px\" class=\"images\" src=\"http://localhost:8080/MyBlog_war_exploded/images/emoji/emoji1/emoji1_3.jpg\">', '2019-04-18 15:21:27', '37', '0', null, null);
INSERT INTO `message` VALUES ('13', '沙发沙发是·<img style=\"width:40px;height:40px\" class=\"images\" src=\"http://localhost:8080/MyBlog_war_exploded/images/emoji/emoji1/emoji1_3.jpg\">', '2019-04-18 15:21:29', '37', '0', null, null);
INSERT INTO `message` VALUES ('14', '沙发沙发是·<img style=\"width:40px;height:40px\" class=\"images\" src=\"http://localhost:8080/MyBlog_war_exploded/images/emoji/emoji1/emoji1_3.jpg\">', '2019-04-18 15:21:32', '37', '0', null, null);
INSERT INTO `message` VALUES ('15', '沙发沙发是·<img style=\"width:40px;height:40px\" class=\"images\" src=\"http://localhost:8080/MyBlog_war_exploded/images/emoji/emoji1/emoji1_3.jpg\">', '2019-04-18 15:21:34', '37', '0', null, null);
INSERT INTO `message` VALUES ('16', 'asdfsdffsdf', '2019-04-18 15:21:34', '28', '0', null, null);
INSERT INTO `message` VALUES ('17', '沙发是多少', '2019-04-18 15:21:34', '37', '0', null, null);
INSERT INTO `message` VALUES ('18', '上市公司感受到发生', '2019-04-18 15:21:34', '28', '0', null, null);
INSERT INTO `message` VALUES ('19', '四大行官方几十个', '2019-04-18 15:21:34', '37', '0', null, null);
INSERT INTO `message` VALUES ('20', '考拉海购沙发上', '2019-04-18 15:21:34', '28', '0', null, null);
INSERT INTO `message` VALUES ('21', '打飞机阿萨德的方式', '2019-04-18 15:21:34', '37', '0', null, null);
INSERT INTO `message` VALUES ('22', '且一化三改', '2019-04-18 15:21:34', '28', '0', null, null);

-- ----------------------------
-- Table structure for myuser
-- ----------------------------
DROP TABLE IF EXISTS `myuser`;
CREATE TABLE `myuser` (
  `logo` varchar(255) default NULL,
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) default NULL,
  `telephone` varchar(15) default NULL,
  `password` varchar(16) NOT NULL,
  `sex` varchar(2) default NULL,
  `type` int(11) NOT NULL,
  `joinTime` datetime default NULL,
  `userNumber` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`,`userNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myuser
-- ----------------------------
INSERT INTO `myuser` VALUES ('sdfsfdsfsdf', '28', '愿', '1903144341@qq.com', '15797274066', '1997123456', '男', '1', '2018-07-10 02:14:47', '1903144341');
INSERT INTO `myuser` VALUES ('sdfsfdsfsdf', '29', '小可爱', '214323423@qq.com', '15712541324', '123456', '女', '2', '2018-07-10 02:14:47', '10001');
INSERT INTO `myuser` VALUES ('sdfsfdsfsdf', '30', '小饼干', '14354325@qq.com', '15797271324', '654321', '女', '2', '2018-07-10 02:14:47', '10002');
INSERT INTO `myuser` VALUES ('sdfsfdsfsdf', '31', '小白兔', '22443423@qq.com', '15797279432', '12345678', '女', '2', '2018-07-10 02:14:47', '10003');
INSERT INTO `myuser` VALUES ('sdfsfdsfsdf', '32', '长颈鹿', '14524223@qq.com', '15797271493', 'kwbbin', '男', '2', '2018-07-10 02:14:47', '10004');
INSERT INTO `myuser` VALUES ('1550291172060.jpg', '33', '愿', '', '', '111111', '男', '1', '2019-02-16 12:26:12', 'kwbbin');
INSERT INTO `myuser` VALUES ('1550291365867.jpg', '34', '小妮子', '', '', '111111', '男', '1', '2019-02-16 12:29:25', 'hjll');
INSERT INTO `myuser` VALUES ('1550291467117.png', '35', '10086', '', '', '111111', '男', '1', '2019-02-16 12:31:07', '10086');
INSERT INTO `myuser` VALUES (null, '36', '11111', '', '', '111111', '男', '1', '2019-02-16 12:32:31', '111111');
INSERT INTO `myuser` VALUES (null, '37', 'kwbbin', '', '', '123456', '男', '1', '2019-04-14 14:49:46', 'kwbbin1');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL auto_increment,
  `responseTime` datetime default NULL,
  `userId` int(11) default NULL,
  `good` int(11) default NULL,
  `content` text,
  `articleId` int(11) default NULL,
  `replyTo` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `userId` (`userId`),
  KEY `articleId` (`articleId`),
  CONSTRAINT `articleId` FOREIGN KEY (`articleId`) REFERENCES `article` (`id`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '2018-07-10 02:14:47', '28', '65', '好精彩的文章啊', '4', null);
INSERT INTO `reply` VALUES ('2', '2018-07-10 02:14:47', '30', '65', '写得真好', '6', null);
INSERT INTO `reply` VALUES ('3', '2018-07-10 02:14:47', '28', '65', '我也觉得', '6', '2');
INSERT INTO `reply` VALUES ('8', '2019-04-15 08:46:48', '37', null, '是否·', '4', null);
INSERT INTO `reply` VALUES ('9', '2019-04-15 09:00:27', '37', null, '是', '4', null);
INSERT INTO `reply` VALUES ('16', '2019-04-15 17:43:10', '37', null, '<img style=\"width:40px;height:40px\" class=\"images\" src=\"http://localhost:8080/MyBlog_war_exploded/images/emoji/emoji1/emoji1_4.jpg\"><img style=\"width:40px;height:40px\" class=\"images\" src=\"http://localhost:8080/MyBlog_war_exploded/images/emoji/emoji2/emoji2_4.png\">', '4', null);
INSERT INTO `reply` VALUES ('17', '2019-04-15 17:54:02', '37', null, '内部钕2<img style=\"width:40px;height:40px\" class=\"images\" src=\"http://localhost:8080/MyBlog_war_exploded/images/emoji/emoji1/emoji1_4.jpg\">', '5', null);
INSERT INTO `reply` VALUES ('18', '2019-04-15 18:02:01', '37', null, '舒服舒服', '5', null);
INSERT INTO `reply` VALUES ('19', '2019-04-15 21:09:28', '37', null, '是否水电费<img style=\"width:40px;height:40px\" class=\"images\" src=\"http://localhost:8080/MyBlog_war_exploded/images/emoji/emoji1/emoji1_1.jpg\">', '1', null);
INSERT INTO `reply` VALUES ('20', '2019-04-16 13:16:57', '37', null, '师傅师傅说<img style=\"width:60px;height:60px\" class=\"images\" src=\"http://localhost:8080/MyBlog_war_exploded/images/emoji/emoji4/emoji4_6.gif\">', '3', null);
INSERT INTO `reply` VALUES ('21', '2019-04-17 15:23:21', '37', null, '水电费是否是', '2', null);
INSERT INTO `reply` VALUES ('22', '2019-04-17 16:03:24', '37', null, '爱上大厦·<img style=\"width:60px;height:60px\" class=\"images\" src=\"http://localhost:8080/MyBlog_war_exploded/images/emoji/emoji4/emoji4_1.gif\">', null, null);
INSERT INTO `reply` VALUES ('23', '2019-04-17 16:05:41', '37', null, '电饭锅', null, null);
INSERT INTO `reply` VALUES ('24', '2019-04-17 16:07:10', '37', null, '电饭锅', null, null);
INSERT INTO `reply` VALUES ('25', '2019-04-17 16:08:44', '37', null, '电饭锅', null, null);
INSERT INTO `reply` VALUES ('26', '2019-04-17 18:04:36', '37', null, '案发时<img style=\"width:40px;height:40px\" class=\"images\" src=\"http://localhost:8080/MyBlog_war_exploded/images/emoji/emoji1/emoji1_3.jpg\">', '3', null);
INSERT INTO `reply` VALUES ('27', '2019-04-20 12:36:17', '37', null, '阿大声道', '7', null);

-- ----------------------------
-- Table structure for section
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(40) NOT NULL,
  `zoneId` int(11) default NULL,
  `logo` varchar(225) default NULL,
  PRIMARY KEY  (`id`),
  KEY `zone-section` (`zoneId`),
  CONSTRAINT `zone-section` FOREIGN KEY (`zoneId`) REFERENCES `zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES ('1', 'HTML', '1', 'sfsfsfdsfsf');
INSERT INTO `section` VALUES ('2', 'CSS', '1', 'sfsfsfdsfsf');
INSERT INTO `section` VALUES ('3', 'javascript', '1', 'sfsfsfdsfsf');
INSERT INTO `section` VALUES ('4', 'jQuery', '1', 'sfsfsfdsfsf');
INSERT INTO `section` VALUES ('5', 'JAVA', '1', 'sfsfsfdsfsf');
INSERT INTO `section` VALUES ('6', '2018', '1', 'sfsfsfdsfsf');
INSERT INTO `section` VALUES ('7', '大学篇', '1', 'sfsfsfdsfsf');
INSERT INTO `section` VALUES ('8', '2018年历程', '1', 'sfsfsfdsfsf');
INSERT INTO `section` VALUES ('9', '我的知识库', '1', 'sfsfsfdsfsf');

-- ----------------------------
-- Table structure for study_article
-- ----------------------------
DROP TABLE IF EXISTS `study_article`;
CREATE TABLE `study_article` (
  `study` int(11) NOT NULL auto_increment,
  `articleId` int(11) NOT NULL,
  PRIMARY KEY  (`study`),
  KEY `articleId_fore` (`articleId`),
  CONSTRAINT `articleId_fore` FOREIGN KEY (`articleId`) REFERENCES `article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of study_article
-- ----------------------------
INSERT INTO `study_article` VALUES ('1', '1');
INSERT INTO `study_article` VALUES ('2', '3');
INSERT INTO `study_article` VALUES ('3', '5');
INSERT INTO `study_article` VALUES ('4', '7');
INSERT INTO `study_article` VALUES ('5', '9');
INSERT INTO `study_article` VALUES ('6', '11');
INSERT INTO `study_article` VALUES ('7', '13');
INSERT INTO `study_article` VALUES ('8', '15');
INSERT INTO `study_article` VALUES ('9', '17');
INSERT INTO `study_article` VALUES ('10', '19');
INSERT INTO `study_article` VALUES ('11', '21');
INSERT INTO `study_article` VALUES ('12', '23');
INSERT INTO `study_article` VALUES ('13', '25');
INSERT INTO `study_article` VALUES ('14', '27');
INSERT INTO `study_article` VALUES ('15', '29');
INSERT INTO `study_article` VALUES ('16', '31');

-- ----------------------------
-- Table structure for timeline
-- ----------------------------
DROP TABLE IF EXISTS `timeline`;
CREATE TABLE `timeline` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `time` datetime default NULL,
  `content` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of timeline
-- ----------------------------
INSERT INTO `timeline` VALUES ('1', '梵蒂冈', '2018-07-10 02:14:47', '官方更符合规范化规范化个回复');
INSERT INTO `timeline` VALUES ('2', '电饭锅', '2018-07-10 02:14:47', '国际化攻击攻击韩国锦湖');
INSERT INTO `timeline` VALUES ('3', '盛世嫡妃', '2018-07-10 02:14:47', '热带鱼是是if人生的同时大幅度的方式风格的更好恢复111');
INSERT INTO `timeline` VALUES ('4', '热点', '2018-07-10 02:14:47', '和改进公积金卡廉洁奉公');
INSERT INTO `timeline` VALUES ('5', '辅导费', '2018-07-10 02:14:47', '客户端闪闪发光电饭锅');
INSERT INTO `timeline` VALUES ('6', '是多少', '2018-07-10 02:14:47', '代收代付赶紧回家回顾和');

-- ----------------------------
-- Table structure for zone
-- ----------------------------
DROP TABLE IF EXISTS `zone`;
CREATE TABLE `zone` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zone
-- ----------------------------
INSERT INTO `zone` VALUES ('1', '学无止境');
INSERT INTO `zone` VALUES ('2', '生活笔记');
INSERT INTO `zone` VALUES ('3', '时光轴');
