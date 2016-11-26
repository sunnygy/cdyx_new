/*
Navicat MySQL Data Transfer

Source Server         : cdyx_new_remote
Source Server Version : 50553
Source Host           : 45.63.50.137:3306
Source Database       : cdyx_new

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2016-11-26 22:00:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_parent_id` int(11) DEFAULT NULL,
  `en_name_menu` varchar(64) DEFAULT NULL,
  `cn_name_menu` varchar(64) DEFAULT NULL,
  `desc_menu` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `FK_Relationship_7` (`menu_parent_id`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`menu_parent_id`) REFERENCES `menu_parent` (`menu_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for menu_parent
-- ----------------------------
DROP TABLE IF EXISTS `menu_parent`;
CREATE TABLE `menu_parent` (
  `menu_parent_id` int(11) NOT NULL AUTO_INCREMENT,
  `en_name_menu_parent` varchar(64) DEFAULT NULL,
  `cn_name_menu_parent` varchar(64) DEFAULT NULL,
  `desc_menu_parent` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`menu_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `table__id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `discount` smallint(6) DEFAULT NULL,
  `total_price` float(6,2) DEFAULT NULL,
  `desc_order` varchar(64) DEFAULT NULL,
  `order_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_Relationship_4` (`table__id`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`table__id`) REFERENCES `table_list` (`table__id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_menu_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `end_time_detail` datetime DEFAULT NULL,
  `order_detail_price` float(6,2) DEFAULT NULL,
  `order_detail_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FK_Relationship_3` (`order_id`),
  KEY `FK_Relationship_5` (`sub_menu_id`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`sub_menu_id`) REFERENCES `sub_menu` (`sub_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `pos_id` int(11) NOT NULL AUTO_INCREMENT,
  `en_name_pos` varchar(64) DEFAULT NULL,
  `cn_name_pos` varchar(64) DEFAULT NULL,
  `desc＿position` char(128) DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sub_menu
-- ----------------------------
DROP TABLE IF EXISTS `sub_menu`;
CREATE TABLE `sub_menu` (
  `sub_menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `en_name_sub_menu` varchar(64) DEFAULT NULL,
  `cn_name_sub_menu` varchar(64) DEFAULT NULL,
  `desc_sub_menu` varchar(128) DEFAULT NULL,
  `price_sub_menu` float(6,2) DEFAULT NULL,
  `sub_menu_pic` varchar(256) DEFAULT NULL,
  `sub_menu_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`sub_menu_id`),
  KEY `FK_Relationship_6` (`menu_id`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for table_list
-- ----------------------------
DROP TABLE IF EXISTS `table_list`;
CREATE TABLE `table_list` (
  `table__id` int(11) NOT NULL AUTO_INCREMENT,
  `table_code` char(4) NOT NULL,
  `table_desc` varchar(16) DEFAULT NULL,
  `table_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`table__id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_id` int(11) DEFAULT NULL,
  `username` varchar(16) DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `age` smallint(6) DEFAULT NULL,
  `sex` bit(1) DEFAULT NULL,
  `status_user` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_Relationship_1` (`pos_id`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`pos_id`) REFERENCES `position` (`pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
