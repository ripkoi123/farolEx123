/*
Navicat MySQL Data Transfer

Source Server         : con1
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : farolex

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-10-23 23:22:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for delivered
-- ----------------------------
DROP TABLE IF EXISTS `delivered`;
CREATE TABLE `delivered` (
  `id` int(8) NOT NULL,
  `state` int(1) DEFAULT NULL,
  `dateOrder` datetime DEFAULT NULL,
  `dateDelivered` datetime DEFAULT NULL,
  `delivers_id` int(11) DEFAULT NULL,
  `orders_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivers_id` (`delivers_id`) USING BTREE,
  KEY `orders_id` (`orders_id`) USING BTREE,
  CONSTRAINT `delivered_ibfk_1` FOREIGN KEY (`delivers_id`) REFERENCES `delivers` (`id`),
  CONSTRAINT `delivered_ibfk_2` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of delivered
-- ----------------------------

-- ----------------------------
-- Table structure for delivers
-- ----------------------------
DROP TABLE IF EXISTS `delivers`;
CREATE TABLE `delivers` (
  `id` int(3) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` int(10) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of delivers
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(8) NOT NULL,
  `order` varchar(255) DEFAULT NULL,
  `cost` double(6,2) DEFAULT NULL,
  `lat` double(10,7) DEFAULT NULL,
  `long` double(10,7) DEFAULT NULL,
  `products_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_id` (`products_id`) USING BTREE,
  KEY `users_id` (`users_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(4) NOT NULL,
  `product` varchar(45) DEFAULT NULL,
  `cost` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'pizza little caesars peperoni', '80.00');
INSERT INTO `products` VALUES ('2', 'pizza little caesars super cheese', '120.00');
INSERT INTO `products` VALUES ('3', 'pizza little caesars 3 meat', '120.00');
INSERT INTO `products` VALUES ('4', 'hamburguesa sirloin buffalucas', '80.00');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(8) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` int(10) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
