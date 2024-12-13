/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80040
 Source Host           : localhost:3306
 Source Schema         : fitness

 Target Server Type    : MySQL
 Target Server Version : 80040
 File Encoding         : 65001

 Date: 14/12/2024 02:57:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'element-plus' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '其它生成选项',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'sys_tenant_package', '租户套餐表', NULL, NULL, 'SysTenantPackage', 'crud', 'element-plus', 'system', 'system', 'package', '租户套餐表', 'nestAdmin', '0', '/', '', '0', '0', 'admin', '2024-12-06 21:25:25.774481', '', '2024-12-06 21:25:25.774481', NULL);
INSERT INTO `gen_table` VALUES (2, 'hospital_doctor', '医生表', NULL, NULL, 'HospitalDoctor', 'crud', 'element-plus', 'system', 'system', 'doctor', '医生表', 'nestAdmin', '0', '/', '', '0', '0', 'admin', '2024-12-13 00:30:12.208903', '', '2024-12-13 00:30:12.208903', NULL);
INSERT INTO `gen_table` VALUES (6, 'hospital_departments', '医院科室表', NULL, NULL, 'HospitalDepartments', 'crud', 'element-plus', 'system', 'system', 'departments', '医院科室表', 'nestAdmin', '0', '/', '', '0', '0', 'admin', '2024-12-13 23:11:20.147925', '', '2024-12-13 23:11:20.147925', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` int NOT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NOT NULL COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `column_default` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '默认值',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'package_id', '套餐id', 'bigint', 'Number', 'packageId', '1', '1', '0', '0', '1', '1', '1', 'EQ', 'input', '', 1, '0', '0', 'admin', '2024-12-06 21:25:25.000000', 'admin', '2024-12-06 21:25:25.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (2, 1, 'package_name', '套餐名称', 'varchar', 'String', 'packageName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, '0', '0', 'admin', '2024-12-06 21:25:25.000000', 'admin', '2024-12-06 21:25:25.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (3, 1, 'menu_ids', '关联菜单id', 'longtext', 'String', 'menuIds', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, '0', '0', 'admin', '2024-12-06 21:25:25.000000', 'admin', '2024-12-06 21:25:25.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (4, 1, 'menu_check_strictly', '菜单树选择项是否关联显示', 'tinyint', 'Number', 'menuCheckStrictly', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, '0', '0', 'admin', '2024-12-06 21:25:25.000000', 'admin', '2024-12-06 21:25:25.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (5, 1, 'status', '状态', 'char', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 5, '0', '0', 'admin', '2024-12-06 21:25:25.000000', 'admin', '2024-12-06 21:25:25.000000', '0', NULL);
INSERT INTO `gen_table_column` VALUES (6, 1, 'del_flag', '删除标志', 'char', 'String', 'delFlag', '0', '0', '0', '0', '0', '0', '1', 'EQ', 'input', '', 6, '0', '0', 'admin', '2024-12-06 21:25:25.000000', 'admin', '2024-12-06 21:25:25.000000', '0', NULL);
INSERT INTO `gen_table_column` VALUES (7, 1, 'create_by', '创建者', 'varchar', 'String', 'createBy', '0', '0', '0', '0', '0', '0', '1', 'EQ', 'input', '', 7, '0', '0', 'admin', '2024-12-06 21:25:25.000000', 'admin', '2024-12-06 21:25:25.000000', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', '0', '0', '1', 'BETWEEN', 'datetime', '', 8, '0', '0', 'admin', '2024-12-06 21:25:25.000000', 'admin', '2024-12-06 21:25:25.000000', 'CURRENT_TIMESTAMP(6)', NULL);
INSERT INTO `gen_table_column` VALUES (9, 1, 'update_by', '更新者', 'varchar', 'String', 'updateBy', '0', '0', '0', '1', '1', '0', '1', 'EQ', 'input', '', 9, '0', '0', 'admin', '2024-12-06 21:25:25.000000', 'admin', '2024-12-06 21:25:25.000000', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', '0', '1', 'BETWEEN', 'datetime', '', 10, '0', '0', 'admin', '2024-12-06 21:25:25.000000', 'admin', '2024-12-06 21:25:25.000000', 'CURRENT_TIMESTAMP(6)', NULL);
INSERT INTO `gen_table_column` VALUES (11, 1, 'remark', '备注', 'varchar', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, '0', '0', 'admin', '2024-12-06 21:25:25.000000', 'admin', '2024-12-06 21:25:25.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (12, 2, 'status', '状态', 'char', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 1, '0', '0', 'admin', '2024-12-13 00:30:12.000000', 'admin', '2024-12-13 00:30:12.000000', '0', NULL);
INSERT INTO `gen_table_column` VALUES (13, 2, 'del_flag', '删除标志', 'char', 'String', 'delFlag', '0', '0', '0', '0', '0', '0', '1', 'EQ', 'input', '', 2, '0', '0', 'admin', '2024-12-13 00:30:12.000000', 'admin', '2024-12-13 00:30:12.000000', '0', NULL);
INSERT INTO `gen_table_column` VALUES (14, 2, 'create_by', '创建者', 'varchar', 'String', 'createBy', '0', '0', '0', '0', '0', '0', '1', 'EQ', 'input', '', 3, '0', '0', 'admin', '2024-12-13 00:30:12.000000', 'admin', '2024-12-13 00:30:12.000000', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', '0', '0', '1', 'BETWEEN', 'datetime', '', 4, '0', '0', 'admin', '2024-12-13 00:30:12.000000', 'admin', '2024-12-13 00:30:12.000000', 'CURRENT_TIMESTAMP(6)', NULL);
INSERT INTO `gen_table_column` VALUES (16, 2, 'update_by', '更新者', 'varchar', 'String', 'updateBy', '0', '0', '0', '1', '1', '0', '1', 'EQ', 'input', '', 5, '0', '0', 'admin', '2024-12-13 00:30:12.000000', 'admin', '2024-12-13 00:30:12.000000', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', '0', '1', 'BETWEEN', 'datetime', '', 6, '0', '0', 'admin', '2024-12-13 00:30:12.000000', 'admin', '2024-12-13 00:30:12.000000', 'CURRENT_TIMESTAMP(6)', NULL);
INSERT INTO `gen_table_column` VALUES (18, 2, 'remark', '备注', 'varchar', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, '0', '0', 'admin', '2024-12-13 00:30:12.000000', 'admin', '2024-12-13 00:30:12.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (19, 2, 'doctor_id', '医生ID', 'int', 'Number', 'doctorId', '1', '1', '0', '0', '1', '1', '1', 'EQ', 'input', '', 8, '0', '0', 'admin', '2024-12-13 00:30:12.000000', 'admin', '2024-12-13 00:30:12.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (20, 2, 'doctor_name', '医生姓名', 'varchar', 'String', 'doctorName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 9, '0', '0', 'admin', '2024-12-13 00:30:12.000000', 'admin', '2024-12-13 00:30:12.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (21, 2, 'doctor_avatar', '医生头像', 'varchar', 'String', 'doctorAvatar', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, '0', '0', 'admin', '2024-12-13 00:30:12.000000', 'admin', '2024-12-13 00:30:12.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (22, 2, 'doctor_title', '医生职称', 'varchar', 'String', 'doctorTitle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, '0', '0', 'admin', '2024-12-13 00:30:12.000000', 'admin', '2024-12-13 00:30:12.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (23, 2, 'doctor_intro', '医生简介', 'varchar', 'String', 'doctorIntro', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, '0', '0', 'admin', '2024-12-13 00:30:12.000000', 'admin', '2024-12-13 00:30:12.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (24, 2, 'doctor_good_at', '医生擅长', 'varchar', 'String', 'doctorGoodAt', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, '0', '0', 'admin', '2024-12-13 00:30:12.000000', 'admin', '2024-12-13 00:30:12.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (25, 2, 'is_recommend', '是否推荐', 'int', 'Number', 'isRecommend', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, '0', '0', 'admin', '2024-12-13 00:30:12.000000', 'admin', '2024-12-13 00:30:12.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (26, 2, 'tenant_code', '医院ID', 'varchar', 'String', 'tenantCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, '0', '0', 'admin', '2024-12-13 00:30:12.000000', 'admin', '2024-12-13 00:30:12.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (65, 6, 'status', '状态', 'char', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 1, '0', '0', 'admin', '2024-12-13 23:11:20.000000', 'admin', '2024-12-13 23:11:20.000000', '0', NULL);
INSERT INTO `gen_table_column` VALUES (66, 6, 'del_flag', '删除标志', 'char', 'String', 'delFlag', '0', '0', '0', '0', '0', '0', '1', 'EQ', 'input', '', 2, '0', '0', 'admin', '2024-12-13 23:11:20.000000', 'admin', '2024-12-13 23:11:20.000000', '0', NULL);
INSERT INTO `gen_table_column` VALUES (67, 6, 'create_by', '创建者', 'varchar', 'String', 'createBy', '0', '0', '0', '0', '0', '0', '1', 'EQ', 'input', '', 3, '0', '0', 'admin', '2024-12-13 23:11:20.000000', 'admin', '2024-12-13 23:11:20.000000', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', '0', '0', '1', 'BETWEEN', 'datetime', '', 4, '0', '0', 'admin', '2024-12-13 23:11:20.000000', 'admin', '2024-12-13 23:11:20.000000', 'CURRENT_TIMESTAMP(6)', NULL);
INSERT INTO `gen_table_column` VALUES (69, 6, 'update_by', '更新者', 'varchar', 'String', 'updateBy', '0', '0', '0', '1', '1', '0', '1', 'EQ', 'input', '', 5, '0', '0', 'admin', '2024-12-13 23:11:20.000000', 'admin', '2024-12-13 23:11:20.000000', '', NULL);
INSERT INTO `gen_table_column` VALUES (70, 6, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', '0', '1', 'BETWEEN', 'datetime', '', 6, '0', '0', 'admin', '2024-12-13 23:11:20.000000', 'admin', '2024-12-13 23:11:20.000000', 'CURRENT_TIMESTAMP(6)', NULL);
INSERT INTO `gen_table_column` VALUES (71, 6, 'remark', '备注', 'varchar', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, '0', '0', 'admin', '2024-12-13 23:11:20.000000', 'admin', '2024-12-13 23:11:20.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (72, 6, 'hospital_dept_id', '科室id', 'int', 'Number', 'hospitalDeptId', '1', '1', '0', '0', '1', '1', '1', 'EQ', 'input', '', 8, '0', '0', 'admin', '2024-12-13 23:11:20.000000', 'admin', '2024-12-13 23:11:20.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (73, 6, 'dept_name', '科室名称', 'varchar', 'String', 'deptName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 9, '0', '0', 'admin', '2024-12-13 23:11:20.000000', 'admin', '2024-12-13 23:11:20.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (74, 6, 'parent_id', '父级科室', 'int', 'Number', 'parentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, '0', '0', 'admin', '2024-12-13 23:11:20.000000', 'admin', '2024-12-13 23:11:20.000000', '0', NULL);
INSERT INTO `gen_table_column` VALUES (75, 6, 'tenant_code', '所属医院', 'varchar', 'String', 'tenantCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, '0', '0', 'admin', '2024-12-13 23:11:20.000000', 'admin', '2024-12-13 23:11:20.000000', '000000', NULL);
INSERT INTO `gen_table_column` VALUES (76, 6, 'sort', '排序', 'int', 'Number', 'sort', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, '0', '0', 'admin', '2024-12-13 23:11:20.000000', 'admin', '2024-12-13 23:11:20.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (77, 6, 'leader', '科室负责人', 'varchar', 'String', 'leader', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, '0', '0', 'admin', '2024-12-13 23:11:20.000000', 'admin', '2024-12-13 23:11:20.000000', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (78, 6, 'phone', '科室负责人电话', 'varchar', 'String', 'phone', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, '0', '0', 'admin', '2024-12-13 23:11:20.000000', 'admin', '2024-12-13 23:11:20.000000', NULL, NULL);

-- ----------------------------
-- Table structure for health_information
-- ----------------------------
DROP TABLE IF EXISTS `health_information`;
CREATE TABLE `health_information`  (
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `health_information_id` int NOT NULL AUTO_INCREMENT COMMENT '健康资讯id',
  PRIMARY KEY (`health_information_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '健康资讯' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of health_information
-- ----------------------------

-- ----------------------------
-- Table structure for health_state
-- ----------------------------
DROP TABLE IF EXISTS `health_state`;
CREATE TABLE `health_state`  (
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `health_state_id` int NOT NULL AUTO_INCREMENT COMMENT '健康状态辩证id',
  `health_state_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '健康状态标签',
  `health_state_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '健康状态内容',
  `health_state_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '健康状态描述',
  PRIMARY KEY (`health_state_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '健康状态辩证表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of health_state
-- ----------------------------

-- ----------------------------
-- Table structure for hospital_departments
-- ----------------------------
DROP TABLE IF EXISTS `hospital_departments`;
CREATE TABLE `hospital_departments`  (
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `hospital_dept_id` int NOT NULL AUTO_INCREMENT COMMENT '科室id',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '科室名称',
  `parent_id` int NOT NULL DEFAULT 0 COMMENT '父级科室',
  `tenant_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '000000' COMMENT '所属医院',
  `sort` int NOT NULL COMMENT '排序',
  `leader` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '科室负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '科室负责人电话',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '祖级列表',
  PRIMARY KEY (`hospital_dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '医院科室表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hospital_departments
-- ----------------------------
INSERT INTO `hospital_departments` VALUES ('0', '0', '', '2024-12-14 00:37:16.812156', '', '2024-12-14 00:59:32.139251', NULL, 1, '全部科室', 0, '000000', 0, NULL, NULL, '0');
INSERT INTO `hospital_departments` VALUES ('0', '0', '', '2024-12-14 02:22:41.933342', '', '2024-12-14 02:22:41.933342', NULL, 5, '内科', 1, '000000', 0, NULL, NULL, '0,1');
INSERT INTO `hospital_departments` VALUES ('0', '0', '', '2024-12-14 02:22:53.343690', '', '2024-12-14 02:22:53.343690', NULL, 6, '心内', 5, '000000', 0, NULL, NULL, '0,1,5');

-- ----------------------------
-- Table structure for hospital_doctor
-- ----------------------------
DROP TABLE IF EXISTS `hospital_doctor`;
CREATE TABLE `hospital_doctor`  (
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `doctor_id` int NOT NULL AUTO_INCREMENT COMMENT '医生ID',
  `doctor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医生姓名',
  `doctor_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医生头像',
  `doctor_intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医生简介',
  `doctor_good_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医生擅长',
  `is_recommend` int NOT NULL COMMENT '是否首页推荐',
  `tenant_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医院ID',
  `doctor_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医生联系方式',
  `doctor_post_id` int NOT NULL COMMENT '医生职称',
  `doctor_dept_id` int NOT NULL COMMENT '医生所在科室',
  PRIMARY KEY (`doctor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '医生表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hospital_doctor
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `tenant_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户编码',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N' COMMENT '系统内置',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '000000', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:24:53.866211', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow', '0', '0');
INSERT INTO `sys_config` VALUES (2, '000000', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:24:54.632749', '初始化密码 123456', '0', '0');
INSERT INTO `sys_config` VALUES (3, '000000', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:24:55.254606', '深色主题theme-dark，浅色主题theme-light', '0', '0');
INSERT INTO `sys_config` VALUES (4, '000000', '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:24:55.941539', '是否开启验证码功能（true开启，false关闭）', '0', '0');
INSERT INTO `sys_config` VALUES (5, '000000', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:24:56.608789', '是否开启注册用户功能（true开启，false关闭）', '0', '0');
INSERT INTO `sys_config` VALUES (6, '000000', '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:24:58.302215', '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）', '0', '0');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` int NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `tenant_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户编码',
  `parent_id` int NOT NULL DEFAULT 0 COMMENT '父部门ID',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门名称',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, '000000', 0, '0', 'nest-admin科技', 0, 'nest-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:24:40.107793', NULL);
INSERT INTO `sys_dept` VALUES (101, '000000', 100, '0,100', '深圳总公司', 1, 'nest-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:24:41.058130', NULL);
INSERT INTO `sys_dept` VALUES (102, '000000', 100, '0,100', '长沙分公司', 2, 'nest-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:24:41.776676', NULL);
INSERT INTO `sys_dept` VALUES (103, '000000', 101, '0,100,101', '研发部门', 1, 'nest-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:24:42.449523', NULL);
INSERT INTO `sys_dept` VALUES (104, '000000', 101, '0,100,101', '市场部门', 2, 'nest-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:24:43.038790', NULL);
INSERT INTO `sys_dept` VALUES (105, '000000', 101, '0,100,101', '测试部门', 3, 'nest-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:24:44.014988', NULL);
INSERT INTO `sys_dept` VALUES (106, '000000', 101, '0,100,101', '财务部门', 4, 'nest-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:24:44.635525', NULL);
INSERT INTO `sys_dept` VALUES (107, '000000', 101, '0,100,101', '运维部门', 5, 'nest-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:24:45.343709', NULL);
INSERT INTO `sys_dept` VALUES (108, '000000', 102, '0,100,102', '市场部门', 1, 'nest-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:24:46.198648', NULL);
INSERT INTO `sys_dept` VALUES (109, '000000', 102, '0,100,102', '财务部门', 2, 'nest-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:24:49.461590', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` int NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `tenant_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '000000' COMMENT '租户编码',
  `dict_sort` int NOT NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '样式属性',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N' COMMENT '是否默认',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, '000000', 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:23.056432', '性别男', '0');
INSERT INTO `sys_dict_data` VALUES (2, '000000', 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:24.430402', '性别女', '0');
INSERT INTO `sys_dict_data` VALUES (3, '000000', 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:25.178186', '性别未知', '0');
INSERT INTO `sys_dict_data` VALUES (4, '000000', 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:25.844250', '显示菜单', '0');
INSERT INTO `sys_dict_data` VALUES (5, '000000', 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:26.573170', '隐藏菜单', '0');
INSERT INTO `sys_dict_data` VALUES (6, '000000', 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:27.211938', '正常状态', '0');
INSERT INTO `sys_dict_data` VALUES (7, '000000', 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:27.918658', '停用状态', '0');
INSERT INTO `sys_dict_data` VALUES (8, '000000', 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:28.733707', '正常状态', '0');
INSERT INTO `sys_dict_data` VALUES (9, '000000', 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:29.904100', '停用状态', '0');
INSERT INTO `sys_dict_data` VALUES (10, '000000', 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:30.715292', '默认分组', '0');
INSERT INTO `sys_dict_data` VALUES (11, '000000', 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:31.516954', '系统分组', '0');
INSERT INTO `sys_dict_data` VALUES (12, '000000', 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:32.140867', '系统默认是', '0');
INSERT INTO `sys_dict_data` VALUES (13, '000000', 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:32.859310', '系统默认否', '0');
INSERT INTO `sys_dict_data` VALUES (14, '000000', 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:33.557036', '通知', '0');
INSERT INTO `sys_dict_data` VALUES (15, '000000', 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:34.180714', '公告', '0');
INSERT INTO `sys_dict_data` VALUES (16, '000000', 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:34.849937', '正常状态', '0');
INSERT INTO `sys_dict_data` VALUES (17, '000000', 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:36.707360', '关闭状态', '0');
INSERT INTO `sys_dict_data` VALUES (18, '000000', 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:35.816290', '其他操作', '0');
INSERT INTO `sys_dict_data` VALUES (19, '000000', 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:37.595149', '新增操作', '0');
INSERT INTO `sys_dict_data` VALUES (20, '000000', 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:38.232721', '修改操作', '0');
INSERT INTO `sys_dict_data` VALUES (21, '000000', 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:38.894494', '删除操作', '0');
INSERT INTO `sys_dict_data` VALUES (22, '000000', 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:39.785872', '授权操作', '0');
INSERT INTO `sys_dict_data` VALUES (23, '000000', 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:40.461216', '导出操作', '0');
INSERT INTO `sys_dict_data` VALUES (24, '000000', 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:41.186897', '导入操作', '0');
INSERT INTO `sys_dict_data` VALUES (25, '000000', 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:42.234041', '强退操作', '0');
INSERT INTO `sys_dict_data` VALUES (26, '000000', 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:42.973818', '生成操作', '0');
INSERT INTO `sys_dict_data` VALUES (27, '000000', 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:43.648235', '清空操作', '0');
INSERT INTO `sys_dict_data` VALUES (28, '000000', 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:46.098655', '正常状态', '0');
INSERT INTO `sys_dict_data` VALUES (29, '000000', 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:48.255386', '停用状态', '0');
INSERT INTO `sys_dict_data` VALUES (100, '000000', 0, '住院医师', '0', 'sys_docter_post', '', 'default', 'N', '0', 'admin', '2024-12-13 00:07:14.000000', '', '2024-12-13 00:07:14.251182', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (101, '000000', 0, '主治医师', '1', 'sys_docter_post', '', 'default', 'N', '0', 'admin', '2024-12-13 00:07:30.000000', '', '2024-12-13 00:07:30.923131', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (102, '000000', 0, '副主任医师', '2', 'sys_docter_post', '', 'default', 'N', '0', 'admin', '2024-12-13 00:08:01.000000', '', '2024-12-13 00:08:01.718446', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (103, '000000', 0, '主任医师', '3', 'sys_docter_post', '', 'default', 'N', '0', 'admin', '2024-12-13 00:08:14.000000', '', '2024-12-13 00:08:14.770622', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (104, '000000', 0, '专家', '4', 'sys_docter_post', '', 'default', 'N', '0', 'admin', '2024-12-13 00:08:30.000000', '', '2024-12-13 00:08:30.974844', NULL, '0');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` int NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `tenant_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '000000' COMMENT '租户编码',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `IDX_f4e4273658733a3bbe6a2479bf`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '000000', '用户性别', 'sys_user_sex', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:55.404442', '用户性别列表', '0');
INSERT INTO `sys_dict_type` VALUES (2, '000000', '菜单状态', 'sys_show_hide', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:56.324213', '菜单状态列表', '0');
INSERT INTO `sys_dict_type` VALUES (3, '000000', '系统开关', 'sys_normal_disable', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:57.019046', '系统开关列表', '0');
INSERT INTO `sys_dict_type` VALUES (4, '000000', '任务状态', 'sys_job_status', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:57.681645', '任务状态列表', '0');
INSERT INTO `sys_dict_type` VALUES (5, '000000', '任务分组', 'sys_job_group', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:58.376919', '任务分组列表', '0');
INSERT INTO `sys_dict_type` VALUES (6, '000000', '系统是否', 'sys_yes_no', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:58.936090', '系统是否列表', '0');
INSERT INTO `sys_dict_type` VALUES (7, '000000', '通知类型', 'sys_notice_type', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:25:59.442799', '通知类型列表', '0');
INSERT INTO `sys_dict_type` VALUES (8, '000000', '通知状态', 'sys_notice_status', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:26:00.090897', '通知状态列表', '0');
INSERT INTO `sys_dict_type` VALUES (9, '000000', '操作类型', 'sys_oper_type', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:26:00.754880', '操作类型列表', '0');
INSERT INTO `sys_dict_type` VALUES (10, '000000', '系统状态', 'sys_common_status', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:26:02.551973', '登录状态列表', '0');
INSERT INTO `sys_dict_type` VALUES (100, '000000', '医院科室', 'sys_hospital_dept', '0', 'admin', '2024-12-13 00:04:36.000000', '', '2024-12-13 00:04:36.341868', NULL, '0');
INSERT INTO `sys_dict_type` VALUES (101, '000000', '医生职称', 'sys_docter_post', '0', 'admin', '2024-12-13 00:06:11.000000', '', '2024-12-13 00:06:11.674311', NULL, '0');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` int NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-12-05 00:54:46', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-12-05 00:54:46', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-12-05 00:54:46', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` int NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` int NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '提示消息',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  `login_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, '', '::1', '福建省泉州市 联通', 'Chrome 131.0.0', 'Windows', '0', '退出成功', '', '2024-12-05 21:28:12.328265', '', '2024-12-05 21:28:12.328265', NULL, '0', '2024-12-05 21:28:12.328265');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '::1', '福建省泉州市 联通', 'Chrome 131.0.0', 'Windows', '1', '验证码错误', '', '2024-12-06 21:07:30.080039', '', '2024-12-06 21:07:30.080039', NULL, '0', '2024-12-06 21:07:30.080039');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '::1', '福建省泉州市 联通', 'Chrome 131.0.0', 'Windows', '0', '登录成功', '', '2024-12-06 21:07:39.035227', '', '2024-12-06 21:07:39.035227', NULL, '0', '2024-12-06 21:07:39.035227');
INSERT INTO `sys_logininfor` VALUES (103, '', '::1', '福建省泉州市 联通', 'Chrome 131.0.0', 'Windows', '0', '退出成功', '', '2024-12-06 21:40:51.493233', '', '2024-12-06 21:40:51.493233', NULL, '0', '2024-12-06 21:40:51.493233');
INSERT INTO `sys_logininfor` VALUES (104, '', '::1', '福建省泉州市 联通', 'Chrome 131.0.0', 'Windows', '0', '退出成功', '', '2024-12-06 21:40:53.178550', '', '2024-12-06 21:40:53.178550', NULL, '0', '2024-12-06 21:40:53.178550');
INSERT INTO `sys_logininfor` VALUES (105, '', '::1', '福建省泉州市 联通', 'Chrome 131.0.0', 'Windows', '0', '退出成功', '', '2024-12-06 21:44:55.846330', '', '2024-12-06 21:44:55.846330', NULL, '0', '2024-12-06 21:44:55.846330');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '::1', '福建省泉州市 联通', 'Chrome 131.0.0', 'Windows', '0', '登录成功', '', '2024-12-06 21:45:21.069935', '', '2024-12-06 21:45:21.069935', NULL, '0', '2024-12-06 21:45:21.069935');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '::1', '福建省泉州市 联通', 'Chrome 131.0.0', 'Windows', '0', '登录成功', '', '2024-12-06 22:11:24.386098', '', '2024-12-06 22:11:24.386098', NULL, '0', '2024-12-06 22:11:24.386098');
INSERT INTO `sys_logininfor` VALUES (108, '', '::1', '福建省泉州市 联通', 'Chrome 131.0.0', 'Windows', '0', '退出成功', '', '2024-12-08 18:51:33.629415', '', '2024-12-08 18:51:33.629415', NULL, '0', '2024-12-08 18:51:33.629415');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '::1', '福建省泉州市 联通', 'Chrome 131.0.0', 'Windows', '0', '登录成功', '', '2024-12-09 21:01:14.234243', '', '2024-12-09 21:01:14.234243', NULL, '0', '2024-12-09 21:01:14.234243');
INSERT INTO `sys_logininfor` VALUES (110, '', '::1', '未知', 'Chrome 131.0.0', 'Windows', '0', '退出成功', '', '2024-12-10 21:05:41.536050', '', '2024-12-10 21:05:41.536050', NULL, '0', '2024-12-10 21:05:41.536050');
INSERT INTO `sys_logininfor` VALUES (111, '', '::1', '福建省泉州市 联通', 'Chrome 131.0.0', 'Windows', '0', '退出成功', '', '2024-12-10 21:05:41.850225', '', '2024-12-10 21:05:41.850225', NULL, '0', '2024-12-10 21:05:41.850225');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '::1', '福建省泉州市 联通', 'Chrome 131.0.0', 'Windows', '1', '验证码已过期', '', '2024-12-12 23:52:07.351331', '', '2024-12-12 23:52:07.351331', NULL, '0', '2024-12-12 23:52:07.351331');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '::1', '福建省泉州市 联通', 'Chrome 131.0.0', 'Windows', '0', '登录成功', '', '2024-12-12 23:52:30.070832', '', '2024-12-12 23:52:30.070832', NULL, '0', '2024-12-12 23:52:30.070832');
INSERT INTO `sys_logininfor` VALUES (114, '', '::1', '福建省泉州市 联通', 'Chrome 131.0.0', 'Windows', '0', '退出成功', '', '2024-12-13 23:53:25.530783', '', '2024-12-13 23:53:25.530783', NULL, '0', '2024-12-13 23:53:25.530783');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '::1', '福建省泉州市 联通', 'Chrome 131.0.0', 'Windows', '0', '登录成功', '', '2024-12-13 23:53:44.888971', '', '2024-12-13 23:53:44.888971', NULL, '0', '2024-12-13 23:53:44.888971');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` int NOT NULL COMMENT '父菜单ID',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '路由参数',
  `is_frame` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '是否为外链',
  `is_cache` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否缓存',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'M' COMMENT '菜单类型',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2026 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '系统管理目录', '0');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '系统监控目录', '0');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '系统工具目录', '0');
INSERT INTO `sys_menu` VALUES (4, 'nest-admin官网', 0, 4, 'https://nest-admin.dooring.vip', NULL, '', '0', '0', 'M', '0', '0', '', 'guide', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-07 00:33:31.000000', 'nest-admin官网地址', '1');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '用户管理菜单', '0');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '角色管理菜单', '0');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '菜单管理菜单', '0');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '部门管理菜单', '0');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '岗位管理菜单', '0');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '字典管理菜单', '0');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '参数设置菜单', '0');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '通知公告菜单', '0');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '日志管理菜单', '0');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '在线用户菜单', '0');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '定时任务菜单', '0');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '数据监控菜单', '0');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '服务监控菜单', '0');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '缓存监控菜单', '0');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '缓存列表菜单', '0');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '表单构建菜单', '0');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '代码生成菜单', '0');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '系统接口菜单', '0');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '操作日志菜单', '0');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '登录日志菜单', '0');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');
INSERT INTO `sys_menu` VALUES (2000, '租户管理', 1, 0, 'tenant', 'system/tenant/index', '', '1', '0', 'C', '0', '0', 'system:tenant:list', 'education', '', '2024-12-05 02:12:47.077272', '', '2024-12-06 22:24:38.000000', NULL, '1');
INSERT INTO `sys_menu` VALUES (2001, '租户套餐表', 1, 0, 'package', 'system/tenant/package/index', '', '1', '0', 'C', '0', '0', '', '', '', '2024-12-06 21:29:40.967798', '', '2024-12-06 22:24:35.000000', NULL, '1');
INSERT INTO `sys_menu` VALUES (2002, '租户管理', 0, 0, 'tenant', NULL, '', '1', '0', 'M', '0', '0', '', 'monitor', '', '2024-12-06 22:12:28.000345', '', '2024-12-06 22:12:28.000345', NULL, '0');
INSERT INTO `sys_menu` VALUES (2003, '租户管理', 2002, 0, 'list', 'tenant/list/index', '', '1', '0', 'C', '0', '0', '', 'swagger', '', '2024-12-06 22:15:33.390767', '', '2024-12-06 22:22:08.000000', NULL, '1');
INSERT INTO `sys_menu` VALUES (2004, '租户管理', 2002, 0, 'tenant/index', NULL, '', '1', '0', 'M', '0', '0', '', 'monitor', '', '2024-12-06 22:25:43.629373', '', '2024-12-06 22:26:57.000000', NULL, '1');
INSERT INTO `sys_menu` VALUES (2005, '租户套餐管理', 2002, 1, 'packge', 'tenant/package/index', '', '1', '0', 'C', '0', '0', 'system:tenantPackage:list', 'monitor', '', '2024-12-06 22:43:28.635653', '', '2024-12-06 22:46:40.000000', NULL, '0');
INSERT INTO `sys_menu` VALUES (2006, '租户套餐查询', 2005, 1, '', NULL, '', '1', '0', 'F', '0', '0', 'system:tenantPackage:query', '', '', '2024-12-07 00:04:51.111207', '', '2024-12-07 00:04:51.111207', NULL, '0');
INSERT INTO `sys_menu` VALUES (2007, '租户套餐列表', 2005, 2, '', NULL, '', '1', '0', 'F', '0', '0', 'system:tenantPackage:list', '', '', '2024-12-07 00:05:28.746194', '', '2024-12-07 00:05:28.746194', NULL, '0');
INSERT INTO `sys_menu` VALUES (2008, '租户套餐添加', 2005, 3, '', NULL, '', '1', '0', 'F', '0', '0', 'system:tenantPackage:add', '', '', '2024-12-07 00:06:23.173698', '', '2024-12-07 00:06:23.173698', NULL, '0');
INSERT INTO `sys_menu` VALUES (2009, '租户套餐编辑', 2005, 4, '', NULL, '', '1', '0', 'F', '0', '0', 'system:tenantPackage:edit', '', '', '2024-12-07 00:06:55.540877', '', '2024-12-07 00:06:55.540877', NULL, '0');
INSERT INTO `sys_menu` VALUES (2010, '租户套餐删除', 2005, 5, '', NULL, '', '1', '0', 'F', '0', '0', 'system:tenantPackage:remove', '', '', '2024-12-07 00:07:22.874916', '', '2024-12-07 00:07:22.874916', NULL, '0');
INSERT INTO `sys_menu` VALUES (2011, '套餐租户导出', 2005, 6, '', NULL, '', '1', '0', 'F', '0', '0', 'system:tenantPackage:export', '', '', '2024-12-07 00:08:03.070045', '', '2024-12-07 00:08:03.070045', NULL, '0');
INSERT INTO `sys_menu` VALUES (2012, '租户管理', 2002, 0, 'list', 'tenant/list/index', '', '1', '0', 'C', '0', '0', 'system:tenant:list', 'list', '', '2024-12-09 23:08:59.381589', '', '2024-12-09 23:08:59.381589', NULL, '0');
INSERT INTO `sys_menu` VALUES (2013, '医院管理', 0, 0, 'hospital', NULL, '', '1', '0', 'M', '0', '0', '', 'date-range', '', '2024-12-13 22:21:43.355003', '', '2024-12-13 22:25:22.000000', NULL, '0');
INSERT INTO `sys_menu` VALUES (2014, '医生管理', 2013, 0, 'doctor', 'hospital/doctor/index', '', '1', '0', 'C', '0', '0', 'hospital:doctor:list', 'people', '', '2024-12-13 22:23:15.718892', '', '2024-12-13 22:49:07.000000', NULL, '1');
INSERT INTO `sys_menu` VALUES (2015, '科室管理', 2013, 1, 'departments', NULL, '', '1', '0', 'M', '0', '0', '', 'monitor', '', '2024-12-13 22:48:53.307975', '', '2024-12-13 22:49:05.000000', NULL, '1');
INSERT INTO `sys_menu` VALUES (2016, '科室管理', 2013, 1, 'departments', 'hospital/departments/index', '', '1', '0', 'C', '0', '0', 'hospital:departments:list', 'monitor', '', '2024-12-13 22:50:36.934955', '', '2024-12-13 22:50:36.934955', NULL, '0');
INSERT INTO `sys_menu` VALUES (2017, '医生管理', 2013, 0, 'doctor', 'hospital/doctor/index', '', '1', '0', 'C', '0', '0', 'hospital:doctor:list', 'job', '', '2024-12-13 22:52:41.241963', '', '2024-12-13 22:54:14.000000', NULL, '0');
INSERT INTO `sys_menu` VALUES (2018, '新增', 2016, 0, '', NULL, '', '1', '0', 'F', '0', '0', 'hospital:departments:add', '', '', '2024-12-13 22:56:15.507276', '', '2024-12-13 22:56:15.507276', NULL, '0');
INSERT INTO `sys_menu` VALUES (2019, '编辑', 2016, 1, 'hospital:departments:edit', NULL, '', '1', '0', 'F', '0', '0', 'hospital:departments:edit', '', '', '2024-12-13 22:57:14.673837', '', '2024-12-13 22:57:14.673837', NULL, '0');
INSERT INTO `sys_menu` VALUES (2020, '详情', 2016, 2, '', NULL, '', '1', '0', 'F', '0', '0', 'hospital:departments:query', '', '', '2024-12-13 22:58:05.778931', '', '2024-12-13 22:58:05.778931', NULL, '0');
INSERT INTO `sys_menu` VALUES (2021, '删除', 2016, 3, '', NULL, '', '1', '0', 'F', '0', '0', 'hospital:departments:remove', '', '', '2024-12-13 22:58:38.812218', '', '2024-12-13 22:58:38.812218', NULL, '0');
INSERT INTO `sys_menu` VALUES (2022, '新增', 2017, 0, '', NULL, '', '1', '0', 'F', '0', '0', 'hospital:doctor:add', '', '', '2024-12-13 22:59:27.764045', '', '2024-12-13 22:59:27.764045', NULL, '0');
INSERT INTO `sys_menu` VALUES (2023, '修改', 2017, 1, '', NULL, '', '1', '0', 'F', '0', '0', 'hospital:doctor:edit', '', '', '2024-12-13 22:59:45.713990', '', '2024-12-13 22:59:45.713990', NULL, '0');
INSERT INTO `sys_menu` VALUES (2024, '详情', 2017, 3, '', NULL, '', '1', '0', 'F', '0', '0', 'hospital:doctor:query', '', '', '2024-12-13 23:00:00.685362', '', '2024-12-13 23:00:00.685362', NULL, '0');
INSERT INTO `sys_menu` VALUES (2025, '删除', 2017, 3, '', NULL, '', '1', '0', 'F', '0', '0', 'hospital:doctor:remove', '', '', '2024-12-13 23:00:18.754171', '', '2024-12-13 23:00:18.754171', NULL, '0');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `tenant_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户编码',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型',
  `notice_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '000000', '温馨提醒：2018-07-01 nest-admin新版本发布啦', '2', '新版本内容', '0', 'admin', '2024-12-05 00:54:46.000000', '', '2024-12-05 01:26:10.063631', '0', NULL);
INSERT INTO `sys_notice` VALUES (2, '', '维护通知：2018-07-01 nest-admin系统凌晨维护', '1', '维护内容', '0', 'admin', '2024-12-05 00:54:46.000000', '', NULL, '0', NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` int NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NOT NULL DEFAULT 0 COMMENT '业务类型',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '请求方式',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '请求URL',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '返回参数',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '登录状态',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '错误消息',
  `cost_time` int NOT NULL DEFAULT 0 COMMENT '消耗时间',
  `operator_type` int NOT NULL DEFAULT 0 COMMENT '操作类别',
  `oper_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '主机地址',
  `oper_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` int NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `tenant_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户编码',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, '000000', 'ceo', '董事长', 1, '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:26:16.452624', '', '0');
INSERT INTO `sys_post` VALUES (2, '000000', 'se', '项目经理', 2, '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:26:17.547910', '', '0');
INSERT INTO `sys_post` VALUES (3, '000000', 'hr', '人力资源', 3, '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:26:19.006044', '', '0');
INSERT INTO `sys_post` VALUES (4, '', 'user', '普通员工', 4, '0', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `tenant_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户编码',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '数据范围',
  `menu_check_strictly` tinyint NOT NULL DEFAULT 0 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint NOT NULL DEFAULT 0 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '000000', '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-05 01:26:22.803742', '超级管理员');
INSERT INTO `sys_role` VALUES (2, '', '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` int NOT NULL DEFAULT 0 COMMENT '角色ID',
  `dept_id` int NOT NULL DEFAULT 0 COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int NOT NULL DEFAULT 0 COMMENT '角色ID',
  `menu_id` int NOT NULL DEFAULT 0 COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `tenant_id` bigint NOT NULL AUTO_INCREMENT COMMENT '租户id',
  `tenant_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户编码',
  `tenant_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户名称',
  `tenant_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户描述',
  `tenant_contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户联系人',
  `tenant_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户联系电话',
  `tenant_area` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户地区',
  `tenant_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户联系地址',
  `longitude` int NOT NULL COMMENT '经度',
  `latitude` int NOT NULL COMMENT '纬度',
  `tenant_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户logo',
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `package_id` bigint NOT NULL COMMENT '租户套餐id',
  `area_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户地区编码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`tenant_id`) USING BTREE,
  UNIQUE INDEX `IDX_bb5b76e5b5c57900a8e237ac59`(`tenant_code` ASC) USING BTREE,
  UNIQUE INDEX `IDX_71292f2192ab2b7cc1461e1b23`(`tenant_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '租户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES (1, '000000', '友双咻科技', '友双咻科技', '小曾', '17606000478', '福建省泉州市', '德化县浔中镇', 0, 0, 'xxx', '2024-12-31 01:09:48', 0, '350526', '0', '0', '', '2024-12-05 01:44:23.841732', '', '2024-12-06 21:07:21.779793', NULL);

-- ----------------------------
-- Table structure for sys_tenant_package
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant_package`;
CREATE TABLE `sys_tenant_package`  (
  `package_id` bigint NOT NULL AUTO_INCREMENT COMMENT '套餐id',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '套餐名称',
  `menu_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '关联菜单id',
  `menu_check_strictly` tinyint NOT NULL COMMENT '菜单树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`package_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '租户套餐表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tenant_package
-- ----------------------------
INSERT INTO `sys_tenant_package` VALUES (1, '测试', '[1,100,1000,1001,1002,1003,1004,1005,1006,101,1008,1009,1010,1011,102,1015,103,1019,104,105,106,107,108]', 1, '0', '1', '', '2024-12-07 01:01:21.855008', '', '2024-12-09 21:51:27.000000', NULL);
INSERT INTO `sys_tenant_package` VALUES (2, '测试', '[2002,2005,2006,2007,2008,2009,2010,2011]', 1, '0', '0', '', '2024-12-09 21:57:16.701698', '', '2024-12-09 23:34:32.000000', NULL);

-- ----------------------------
-- Table structure for sys_upload
-- ----------------------------
DROP TABLE IF EXISTS `sys_upload`;
CREATE TABLE `sys_upload`  (
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `upload_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务Id',
  `size` int NOT NULL COMMENT '文件大小',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件路径',
  `new_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件地址',
  `ext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '拓展名',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件上传记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_upload
-- ----------------------------
INSERT INTO `sys_upload` VALUES ('0', '0', '', '2024-12-10 01:12:09.160110', '', '2024-12-10 01:12:09.160110', NULL, '48232a22ec2a46dd8d53d7e8a3fa7980', 2374, '\\profile\\search.png_1733764329138.png', 'search.png_1733764329138.png', 'http:\\localhost:8080\\profile\\search.png_1733764329138.png', '.png');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `tenant_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户编码',
  `dept_id` int NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '00' COMMENT '用户类型',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '性别',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '删除标志',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '头像地址',
  `login_date` timestamp NOT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '000000', 103, 'admin', 'nest-admin', '00', 'ry@163.com', '15888888888', '1', '$2b$10$d4Z9Iq.v9J4pjX55I9mzRuPHsOMKLupOqxlb/UfbD9oYsYxd5ezeS', '0', '0', '::1', 'admin', '2024-12-05 00:54:45.000000', '', '2024-12-13 23:53:44.000000', '管理员', '', '2024-12-13 23:53:45');
INSERT INTO `sys_user` VALUES (2, '', 105, 'ry', 'nest-admin', '00', 'ry@qq.com', '15666666666', '1', '$2b$10$d4Z9Iq.v9J4pjX55I9mzRuPHsOMKLupOqxlb/UfbD9oYsYxd5ezeS', '0', '0', '127.0.0.1', 'admin', '2024-12-05 00:54:45.000000', '', NULL, '测试员', '', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` int NOT NULL COMMENT '用户ID',
  `post_id` int NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int NOT NULL COMMENT '用户ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
