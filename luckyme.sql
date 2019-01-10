/*
Navicat MySQL Data Transfer

Source Server         : 192.168.33.10_3306
Source Server Version : 50637
Source Host           : 192.168.33.10:3306
Source Database       : mypro

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2019-01-10 17:33:27
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
  `looked` int(11) unsigned DEFAULT '0' COMMENT '浏览次数',
  `is_draft` int(1) unsigned DEFAULT '0' COMMENT '是否为草稿',
  `liked` int(11) unsigned DEFAULT '0' COMMENT '喜欢人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of article
-- ----------------------------

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of article_type
-- ----------------------------
INSERT INTO `article_type` VALUES ('1', '1543666733', '1543630495', '1543630495', 'XLLC', '心路历程');
INSERT INTO `article_type` VALUES ('2', '1543666734', '1543666734', '1543666734', 'QGSJ', '情感世界');
INSERT INTO `article_type` VALUES ('3', '1543666735', '1543666735', '1543666735', 'JSJL', '技术交流');
INSERT INTO `article_type` VALUES ('4', '1543666736', '1543666736', '1543666736', 'SHZY', '韶华追忆');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of draft
-- ----------------------------

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '大番薯', '1540396800', 'admin', 'static/uploads/20190110/2be2210cd8c35a7b17d0291133b4cf5d.jpg', '90后程序员', '火星球', '530027054@qq.com');
