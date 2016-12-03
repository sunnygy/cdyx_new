/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : cdyx_new

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2016-12-03 23:33:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_type_id` int(11) DEFAULT NULL,
  `en_name_menu` varchar(64) DEFAULT NULL,
  `cn_name_menu` varchar(64) DEFAULT NULL,
  `desc_menu` varchar(128) DEFAULT NULL,
  `price_menu` decimal(5,0) DEFAULT NULL,
  `path_menu_pic` varchar(255) NOT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `FK_Relationship_7` (`menu_type_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`menu_type_id`) REFERENCES `menu_type` (`menu_type_id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for menu_type
-- ----------------------------
DROP TABLE IF EXISTS `menu_type`;
CREATE TABLE `menu_type` (
  `menu_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_parent_id` int(11) DEFAULT NULL,
  `en_name_menu_type` varchar(64) DEFAULT NULL,
  `cn_name_nemu_type` varchar(64) DEFAULT NULL,
  `desc_menu_type` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`menu_type_id`),
  KEY `menu_parent_id` (`menu_parent_id`),
  CONSTRAINT `menu_type_ibfk_1` FOREIGN KEY (`menu_parent_id`) REFERENCES `menu_parent` (`menu_parent_id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `end_time_detail` datetime DEFAULT NULL,
  `order_detail_price` float(6,2) DEFAULT NULL,
  `order_detail_status` tinyint(1) DEFAULT NULL,
  `copies_number` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FK_Relationship_3` (`order_id`),
  KEY `FK_Relationship_5` (`menu_id`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`order_id`) REFERENCES `order_info` (`order_id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `discount` smallint(6) DEFAULT NULL,
  `total_price` float(6,2) DEFAULT NULL,
  `desc_order` varchar(64) DEFAULT NULL,
  `order_status` tinyint(1) DEFAULT NULL,
  `order_code` varchar(255) DEFAULT NULL,
  `people_num` smallint(6) DEFAULT NULL,
  `people_type` varchar(255) DEFAULT NULL,
  `order_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_Relationship_4` (`table_id`),
  KEY `order_type_id` (`order_type_id`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`table_id`) REFERENCES `table_list` (`table_id`),
  CONSTRAINT `order_info_ibfk_1` FOREIGN KEY (`order_type_id`) REFERENCES `order_type` (`order_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_type
-- ----------------------------
DROP TABLE IF EXISTS `order_type`;
CREATE TABLE `order_type` (
  `order_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_type_name` varchar(255) DEFAULT NULL,
  `order_type_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for table_list
-- ----------------------------
DROP TABLE IF EXISTS `table_list`;
CREATE TABLE `table_list` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_code` varchar(16) NOT NULL,
  `table_desc` varchar(16) DEFAULT NULL,
  `table_status` tinyint(1) DEFAULT NULL,
  `table_type` tinyint(255) DEFAULT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

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
