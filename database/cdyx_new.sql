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


DROP TABLE IF EXISTS `menu_parent`;
CREATE TABLE `menu_parent` (
  `menu_parent_id` int(11) NOT NULL AUTO_INCREMENT,
  `en_name_menu_parent` varchar(64) DEFAULT NULL,
  `cn_name_menu_parent` varchar(64) DEFAULT NULL,
  `desc_menu_parent` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`menu_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_menu_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `end_time_detail` datetime DEFAULT NULL,
  `order_detail_price` float(6,2) DEFAULT NULL,
  `order_detail_status` tinyint(1) DEFAULT NULL,
  `copies_number` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FK_Relationship_3` (`order_id`),
  KEY `FK_Relationship_5` (`sub_menu_id`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`order_id`) REFERENCES `order_info` (`order_id`),
  CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`sub_menu_id`) REFERENCES `sub_menu` (`sub_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`order_id`),
  KEY `FK_Relationship_4` (`table_id`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`table_id`) REFERENCES `table_list` (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `pos_id` int(11) NOT NULL AUTO_INCREMENT,
  `en_name_pos` varchar(64) DEFAULT NULL,
  `cn_name_pos` varchar(64) DEFAULT NULL,
  `desc＿position` char(128) DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

DROP TABLE IF EXISTS `table_list`;
CREATE TABLE `table_list` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_code` varchar(16) NOT NULL,
  `table_desc` varchar(16) DEFAULT NULL,
  `table_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
