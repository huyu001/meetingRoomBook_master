/*
 Navicat Premium Data Transfer

 Source Server         : local_mysql
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : meeting

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 31/01/2021 11:46:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for application_record
-- ----------------------------
DROP TABLE IF EXISTS `application_record`;
CREATE TABLE `application_record`  (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `apply_time` datetime(0) NOT NULL,
  `audit_time` datetime(0) NULL DEFAULT NULL,
  `audit_status` int(1) NOT NULL DEFAULT 0,
  `reject_reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apply_date` date NOT NULL,
  `apply_slot` int(11) NOT NULL,
  `meeting_theme` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `meeting_size` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`application_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of application_record
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_no` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_password` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `college` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `studentId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '开发部', '13451678901', '1001', '123456', '软件工程', '计科院', '1001', '开发部负责人');
INSERT INTO `department` VALUES (2, '策划部', '13467299832', '1002', '123456', '软件工程', '计科院', '1002', '策划部负责人');
INSERT INTO `department` VALUES (3, '美术部', '15643529438', '1003', '123456', '软件工程', '计科院', '1003', '美术部负责人');
INSERT INTO `department` VALUES (4, '宣传部', '15634238374', '1004', '123456', '软件工程', '计科院', '1004', '宣传部负责人');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationId` int(11) NULL DEFAULT NULL,
  `oldFileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` int(255) NULL DEFAULT NULL,
  `ext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `newFileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `username` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for meeting_record
-- ----------------------------
DROP TABLE IF EXISTS `meeting_record`;
CREATE TABLE `meeting_record`  (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_theme` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `meeting_size` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `meeting_date` date NOT NULL,
  `meeting_slot` int(11) NOT NULL,
  `apply_id` int(11) NOT NULL,
  `isStart` int(11) NULL DEFAULT NULL COMMENT '代表是否开启签到，0代表未开启签到，1代表开启签到',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meeting_record
-- ----------------------------

-- ----------------------------
-- Table structure for meeting_room
-- ----------------------------
DROP TABLE IF EXISTS `meeting_room`;
CREATE TABLE `meeting_room`  (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_no` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `room_size` int(11) NOT NULL,
  `room_status` tinyint(1) NOT NULL DEFAULT 1,
  `air` tinyint(1) NOT NULL DEFAULT 1,
  `projector` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meeting_room
-- ----------------------------
INSERT INTO `meeting_room` VALUES (1, '301', 60, 1, 1, 1);
INSERT INTO `meeting_room` VALUES (2, '302', 30, 1, 1, 1);
INSERT INTO `meeting_room` VALUES (3, '303', 30, 1, 1, 1);
INSERT INTO `meeting_room` VALUES (4, '304', 30, 1, 1, 1);
INSERT INTO `meeting_room` VALUES (5, '305', 60, 1, 1, 1);
INSERT INTO `meeting_room` VALUES (6, '306', 60, 1, 1, 1);
INSERT INTO `meeting_room` VALUES (7, '401', 30, 1, 1, 1);
INSERT INTO `meeting_room` VALUES (8, '402', 30, 1, 1, 1);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` int(255) NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_no` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `one` tinyint(1) NULL DEFAULT 1,
  `two` tinyint(1) NULL DEFAULT 1,
  `three` tinyint(1) NULL DEFAULT 1,
  `four` tinyint(1) NULL DEFAULT 1,
  `five` tinyint(1) NULL DEFAULT 1,
  `room_size` int(11) NULL DEFAULT NULL,
  `air` tinyint(1) NULL DEFAULT 1,
  `projector` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES (1, '301', 1, 1, 1, 1, 1, 60, 1, 1);
INSERT INTO `status` VALUES (2, '302', 1, 1, 1, 1, 1, 30, 1, 1);
INSERT INTO `status` VALUES (3, '303', 1, 1, 1, 1, 1, 30, 0, 1);
INSERT INTO `status` VALUES (4, '304', 1, 1, 1, 1, 1, 30, 1, 1);
INSERT INTO `status` VALUES (5, '305', 1, 1, 1, 1, 1, 60, 1, 1);
INSERT INTO `status` VALUES (6, '306', 1, 1, 1, 1, 1, 60, 1, 1);
INSERT INTO `status` VALUES (7, '401', 1, 1, 1, 1, 1, 30, 1, 1);
INSERT INTO `status` VALUES (8, '402', 1, 1, 1, 1, 1, 30, 1, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deptId` int(11) NULL DEFAULT NULL,
  `studentId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `college` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '段鹏', '123456', 1, '2015', '软件工程', '计科院', '18942895149', '段鹏');
INSERT INTO `user` VALUES (2, '张三', '123456', 1, '2016', '软件工程', '计科院', '18160199862', '张三');
INSERT INTO `user` VALUES (3, '李四', '123456', 1, '2017', '软件工程', '计科院', '18160199862', '李四');

-- ----------------------------
-- Table structure for user_append
-- ----------------------------
DROP TABLE IF EXISTS `user_append`;
CREATE TABLE `user_append`  (
  `userId` int(11) NOT NULL,
  `meeting_id` int(11) NULL DEFAULT NULL,
  `askLeave` int(255) NULL DEFAULT NULL,
  `sign` int(255) NULL DEFAULT NULL,
  `absent` int(255) NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pending` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_append
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
