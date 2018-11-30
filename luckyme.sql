/*
Navicat MySQL Data Transfer

Source Server         : 192.168.33.10_3306
Source Server Version : 50637
Source Host           : 192.168.33.10:3306
Source Database       : mypro

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2018-11-30 18:04:58
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
  `create_time` int(20) DEFAULT NULL COMMENT '文章创建时间',
  `update_time` int(20) DEFAULT NULL COMMENT '文章更新时间',
  `looked` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '浏览次数',
  `is_draft` int(1) unsigned DEFAULT '0' COMMENT '是否为草稿',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '0');
INSERT INTO `article` VALUES ('2', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '0');
INSERT INTO `article` VALUES ('3', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '0');
INSERT INTO `article` VALUES ('4', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '0');
INSERT INTO `article` VALUES ('5', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '0');
INSERT INTO `article` VALUES ('6', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '0');
INSERT INTO `article` VALUES ('7', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '0');
INSERT INTO `article` VALUES ('8', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '0');
INSERT INTO `article` VALUES ('9', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '0');
INSERT INTO `article` VALUES ('10', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '0');
INSERT INTO `article` VALUES ('11', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '0');
INSERT INTO `article` VALUES ('12', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '0');
INSERT INTO `article` VALUES ('13', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '0');
INSERT INTO `article` VALUES ('14', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '0');

-- ----------------------------
-- Table structure for article_type
-- ----------------------------
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '中文名称',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `en_name` varchar(255) DEFAULT NULL COMMENT '英文分类名',
  `cn_name` varchar(255) DEFAULT NULL COMMENT '中文分类名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_type
-- ----------------------------
INSERT INTO `article_type` VALUES ('12', '1', '123123', '123123', 'LuckyMe', '心路历程');

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
  `type` varchar(255) DEFAULT NULL COMMENT '文章分类',
  `create_time` int(20) DEFAULT NULL COMMENT '文章创建时间',
  `update_time` int(20) DEFAULT NULL COMMENT '文章更新时间',
  `looked` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '浏览次数',
  `is_draft` int(1) unsigned DEFAULT '1' COMMENT '是否为草稿',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of draft
-- ----------------------------
INSERT INTO `draft` VALUES ('1', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '1');
INSERT INTO `draft` VALUES ('2', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '1');
INSERT INTO `draft` VALUES ('3', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '1');
INSERT INTO `draft` VALUES ('4', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '1');
INSERT INTO `draft` VALUES ('5', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '1');
INSERT INTO `draft` VALUES ('6', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '1');
INSERT INTO `draft` VALUES ('7', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '1');
INSERT INTO `draft` VALUES ('8', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '1');
INSERT INTO `draft` VALUES ('9', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '1');
INSERT INTO `draft` VALUES ('10', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '1');
INSERT INTO `draft` VALUES ('11', '草稿', 'normal', '', '草稿', '<p>草稿</p>', '1', '1543568808', '1543568808', '00000000000', '1');

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
INSERT INTO `user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '大番薯', '1540396800', 'admin', '/api/static/uploads/20181127/4eecedb59ffbf24d6b1af13f409dab72.jpg', '90后程序员', '火星球', '530027054@qq.com');
