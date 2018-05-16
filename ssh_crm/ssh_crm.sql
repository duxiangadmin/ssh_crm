/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : ssh_crm

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-05-16 10:11:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `custName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custLevel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custSource` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custPhone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custMobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('7', '阿里巴巴', 'vip', '网络', '70162641', '110');
INSERT INTO `t_customer` VALUES ('9', '网易', 'vip', '3', '', '');
INSERT INTO `t_customer` VALUES ('10', '腾讯', '2', '3', '', '');
INSERT INTO `t_customer` VALUES ('27', '天美', 'vip', '3', '', '');
INSERT INTO `t_customer` VALUES ('28', '阿里', 'vip', '3', '', '');

-- ----------------------------
-- Table structure for `t_linkman`
-- ----------------------------
DROP TABLE IF EXISTS `t_linkman`;
CREATE TABLE `t_linkman` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `lkmName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lkmGender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lkmPhone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lkmMobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clid` int(11) DEFAULT NULL,
  PRIMARY KEY (`lid`),
  KEY `FKjtgu0oocf35ij4fmulu123vwk` (`clid`),
  CONSTRAINT `FKjtgu0oocf35ij4fmulu123vwk` FOREIGN KEY (`clid`) REFERENCES `t_customer` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_linkman
-- ----------------------------
INSERT INTO `t_linkman` VALUES ('4', '赵六', '1', '1234', '123', '7');
INSERT INTO `t_linkman` VALUES ('7', '王五', '1', '110', '120', '9');
INSERT INTO `t_linkman` VALUES ('8', '宋祁', '2', '1201', '110', '10');
INSERT INTO `t_linkman` VALUES ('11', '红红', '1', '120', '110', '7');
INSERT INTO `t_linkman` VALUES ('12', '胡红', '2', '1', '1', '7');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'lisi', '123', 'hangzhou');

-- ----------------------------
-- Table structure for `t_visit`
-- ----------------------------
DROP TABLE IF EXISTS `t_visit`;
CREATE TABLE `t_visit` (
  `visitid` int(11) NOT NULL AUTO_INCREMENT,
  `visitAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visitContent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cvid` int(11) DEFAULT NULL,
  `uvid` int(11) DEFAULT NULL,
  PRIMARY KEY (`visitid`),
  KEY `FKfq1vs5t876wufr6l5tctnopps` (`cvid`),
  KEY `FKnbsiiqbdcpvtugygwe4vj42s0` (`uvid`),
  CONSTRAINT `FKfq1vs5t876wufr6l5tctnopps` FOREIGN KEY (`cvid`) REFERENCES `t_customer` (`cid`),
  CONSTRAINT `FKnbsiiqbdcpvtugygwe4vj42s0` FOREIGN KEY (`uvid`) REFERENCES `t_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_visit
-- ----------------------------
INSERT INTO `t_visit` VALUES ('16', '1', '1', '7', '1');
INSERT INTO `t_visit` VALUES ('17', '2', '2', '27', '1');
