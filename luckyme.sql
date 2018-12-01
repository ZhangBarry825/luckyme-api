/*
Navicat MySQL Data Transfer

Source Server         : 192.168.33.10_3306
Source Server Version : 50637
Source Host           : 192.168.33.10:3306
Source Database       : mypro

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2018-12-01 18:02:51
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
  `type` int(11) DEFAULT NULL COMMENT '文章分类',
  `create_time` int(20) DEFAULT NULL COMMENT '文章创建时间',
  `update_time` int(20) DEFAULT NULL COMMENT '文章更新时间',
  `looked` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '浏览次数',
  `is_draft` int(1) unsigned DEFAULT '0' COMMENT '是否为草稿',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '心路历程', 'normal', '', '心路历程', '<p>心路历程</p>', '1543630495', '1543629247', '1543629247', '00000000000', '0');
INSERT INTO `article` VALUES ('2', '情感世界', 'normal', 'static/uploads/20181201/65ccd816f313e5ff557d7f59a3f8452f.jpg', '情感世界', '<p>情感世界</p>', '1543630306', '1543633253', '1543633253', '00000000000', '0');
INSERT INTO `article` VALUES ('3', '情感', 'normal', '', '情感', '<p>情感世界</p>', '1543630306', '1543633371', '1543633371', '00000000000', '0');
INSERT INTO `article` VALUES ('4', 'create', 'normal', 'static/uploads/20181201/80778fcd9c8654a6dee0ea68d142cd60.gif', 'create', '<p><img class=\"wscnph\" src=\"api/static/uploads/20181201/0426035f44ef957c9c5f74d06add8bf8.gif\" /></p>', '1543630495', '1543633464', '1543633464', '00000000000', '0');

-- ----------------------------
-- Table structure for article_type
-- ----------------------------
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(11) unsigned DEFAULT NULL COMMENT '分类标识',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `en_name` varchar(255) DEFAULT NULL COMMENT '英文分类名',
  `cn_name` varchar(255) DEFAULT NULL COMMENT '中文分类名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_type
-- ----------------------------
INSERT INTO `article_type` VALUES ('14', '1543630306', '1543630306', '1543630306', 'QGSJ', '情感世界');
INSERT INTO `article_type` VALUES ('15', '1543630495', '1543630495', '1543630495', 'XLLC', '心路历程');

-- ----------------------------
-- Table structure for draft
-- ----------------------------
DROP TABLE IF EXISTS `draft`;
CREATE TABLE `draft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '文章标题',
  `status` varchar(255) DEFAULT NULL COMMENT '文章状态',
  `cover` varchar(255) DEFAULT NULL COMMENT '文章封面',
  `description` varchar(255) DEFAULT NULL COMMENT '文章描述',
  `content` text COMMENT '文章内容',
  `type` int(11) DEFAULT NULL COMMENT '文章分类',
  `create_time` int(20) DEFAULT NULL COMMENT '文章创建时间',
  `update_time` int(20) DEFAULT NULL COMMENT '文章更新时间',
  `looked` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '浏览次数',
  `is_draft` int(1) unsigned DEFAULT '1' COMMENT '是否为草稿',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of draft
-- ----------------------------
INSERT INTO `draft` VALUES ('4', 'create', 'normal', 'static/uploads/20181201/80778fcd9c8654a6dee0ea68d142cd60.gif', 'create', '<p><img class=\"wscnph\" src=\"api/static/uploads/20181201/0426035f44ef957c9c5f74d06add8bf8.gif\" /></p>', '1543630495', '1543633464', '1543633464', '00000000000', '1');
INSERT INTO `draft` VALUES ('5', '草稿', 'normal', '', '草稿', '<p>草稿草稿草稿草稿草稿</p>', '1543630495', '1543633585', '1543633585', '00000000000', '1');

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
INSERT INTO `user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '大番薯', '1540396800', 'admin', '/api/static/uploads/20181201/a7107f17cc0281b6a4f5e2f3f0bf6df3.jpg', '90后程序员', '火星球', '530027054@qq.com');
