/*
Navicat MySQL Data Transfer

Source Server         : 192.168.33.10_3306
Source Server Version : 50637
Source Host           : 192.168.33.10:3306
Source Database       : mypro

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2018-10-25 11:04:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '文章标题',
  `status` varchar(255) DEFAULT NULL COMMENT '文章状态',
  `cover` varchar(255) DEFAULT NULL COMMENT '文章封面',
  `description` varchar(255) DEFAULT NULL COMMENT '文章描述',
  `content` text COMMENT '文章内容',
  `type` varchar(255) DEFAULT NULL COMMENT '文章分类',
  `create_time` int(11) DEFAULT NULL COMMENT '文章创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '文章更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '文章测试标题1', 'normal', null, '摘要', '内容', '心路历程', '123123', '123123');
INSERT INTO `article` VALUES ('7', '文章测试标题2', 'normal', null, '摘要', '内容', '心路历程', '123123', null);
INSERT INTO `article` VALUES ('8', '文章测试标题3', 'normal', null, '摘要', '中国', '心路历程', '123123', null);
INSERT INTO `article` VALUES ('9', '文章测试标题4', 'normal', null, '摘要', '内容', '心路历程', '123123', null);
INSERT INTO `article` VALUES ('10', '文章测试标题5', 'normal', null, '摘要', '内容', '心路历程', '123123', null);
INSERT INTO `article` VALUES ('11', '文章测试标题6', 'normal', null, '摘要', '内容', '心路历程', '123123', null);
INSERT INTO `article` VALUES ('12', '文章测试标题7', 'normal', null, '摘要', '内容', '心路历程', '123123', null);
INSERT INTO `article` VALUES ('13', '文章测试标题8', 'normal', null, '摘要', '内容', '心路历程', '123123', null);

-- ----------------------------
-- Table structure for article_type
-- ----------------------------
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_type
-- ----------------------------
INSERT INTO `article_type` VALUES ('11', '心路历程', '123123', '123123');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `create_time` int(11) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL COMMENT '身份类型',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '大番薯6', '1540396800', 'admin', 'http://luckyme.barry.umdev.cn/static/uploads/20181025/57dffcd7622c24c547bbc5da082fb545.jpg', '90后程序员', '火星球', '530027054@qq.com');
