/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50713
Source Host           : 127.0.0.1:3306
Source Database       : litemanager_git

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2018-07-12 18:49:55
*/

SET FOREIGN_KEY_CHECKS=0;


-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------


-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(140) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(19) NOT NULL,
  `SCHED_TIME` bigint(19) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` tinyint(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` tinyint(1) NOT NULL,
  `IS_NONCONCURRENT` tinyint(1) NOT NULL,
  `IS_UPDATE_DATA` tinyint(1) NOT NULL,
  `REQUESTS_RECOVERY` tinyint(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------



-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------


-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(19) NOT NULL,
  `CHECKIN_INTERVAL` bigint(19) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------


-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------


-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` tinyint(1) DEFAULT NULL,
  `BOOL_PROP_2` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(19) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(19) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(19) NOT NULL,
  `END_TIME` bigint(19) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------



-- ----------------------------
-- Table structure for quartz_task
-- ----------------------------
DROP TABLE IF EXISTS `quartz_task`;
CREATE TABLE `quartz_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '任务名称,input,YES,false,true,true',
  `cron` varchar(255) DEFAULT NULL COMMENT '任务表达式,input,YES,false,true,false',
  `target_bean` varchar(255) DEFAULT NULL COMMENT '执行的类,input,YES,false,true,false',
  `trget_method` varchar(255) DEFAULT NULL COMMENT '执行方法,input,YES,false,true,false',
  `params` varchar(255) DEFAULT NULL COMMENT '执行参数,textarea,YES,false,false,false',
  `status` int(11) DEFAULT NULL COMMENT '任务状态,radio,YES,false,true,true',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务,1';

-- ----------------------------
-- Records of quartz_task
-- ----------------------------


-- ----------------------------
-- Table structure for quartz_task_log
-- ----------------------------
DROP TABLE IF EXISTS `quartz_task_log`;
CREATE TABLE `quartz_task_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_id` bigint(20) DEFAULT NULL COMMENT '任务ID,0,YES,false,false,false',
  `name` varchar(255) DEFAULT NULL COMMENT '定时任务名称,input,YES,false,true,true',
  `target_bean` varchar(255) DEFAULT NULL COMMENT '定制任务执行类,input,YES,false,true,false',
  `trget_method` varchar(255) DEFAULT NULL COMMENT '定时任务执行方法,input,YES,false,true,false',
  `params` varchar(255) DEFAULT NULL COMMENT '执行参数,input,YES,false,true,false',
  `status` int(11) DEFAULT NULL COMMENT '任务状态,0,YES,false,false,false',
  `error` text COMMENT '异常消息,textarea,YES,false,false,false',
  `times` int(11) DEFAULT NULL COMMENT '执行时间,input,YES,false,true,false',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务执行日志,1';

-- ----------------------------
-- Records of quartz_task_log
-- ----------------------------


-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `label` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` int(10) DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`) USING BTREE,
  KEY `sys_dict_label` (`label`) USING BTREE,
  KEY `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表,测试表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '0', '否', 'is_or_not', '系统字段', '0', '0', '1', '2018-01-05 20:38:12', '1', '2018-01-05 20:38:15', null, '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '是', 'is_or_not', '系统字段', '1', '0', '1', '2018-01-05 20:38:40', '1', '2018-01-05 20:38:44', null, '0');
INSERT INTO `sys_dict` VALUES ('3', 'qiniu', '七牛云存储', 'sys_rescource_source', '系统字段', '0', '0', '1', '2018-01-14 06:39:57', '1', '2018-01-14 06:39:57', null, '0');
INSERT INTO `sys_dict` VALUES ('4', 'oss', '阿里云存储', 'sys_rescource_source', '系统字段', '1', '0', '1', '2018-01-14 06:39:57', '1', '2018-01-14 06:39:57', null, '0');

-- ----------------------------
-- Table structure for sys_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_group`;
CREATE TABLE `sys_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '分组名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父分组ID',
  `level` bigint(2) DEFAULT NULL,
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '分组序列号',
  `sort` smallint(6) DEFAULT NULL COMMENT '分组排序值',
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_group
-- ----------------------------

-- ----------------------------
-- Table structure for sys_group_ur
-- ----------------------------
DROP TABLE IF EXISTS `sys_group_ur`;
CREATE TABLE `sys_group_ur` (
  `group_id` bigint(20) NOT NULL COMMENT '分组ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_group_ur
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '请求类型',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '日志标题',
  `remote_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作IP地址',
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作用户昵称',
  `request_uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求URI',
  `http_method` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '操作方式',
  `class_method` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求类型.方法',
  `params` text COLLATE utf8_bin COMMENT '操作提交的数据',
  `session_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'sessionId',
  `response` longtext COLLATE utf8_bin COMMENT '返回内容',
  `use_time` bigint(11) DEFAULT NULL COMMENT '方法执行时间',
  `browser` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '浏览器信息',
  `area` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '地区',
  `province` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '省',
  `city` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '市',
  `isp` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '网络服务提供商',
  `exception` text COLLATE utf8_bin COMMENT '异常信息',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `del_flag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`) USING BTREE,
  KEY `sys_log_request_uri` (`request_uri`) USING BTREE,
  KEY `sys_log_type` (`type`) USING BTREE,
  KEY `sys_log_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'Ajax请求', '用户登录', '127.0.0.1', '系统管理员', 'http://localhost:8080/login/main', 'POST', 'com.litemanager.admin.controller.LoginController.loginMain', 0x5B226F72672E6170616368652E736869726F2E7765622E736572766C65742E536869726F48747470536572766C6574526571756573744065663161643236225D, '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', 0x7B2273756363657373223A66616C73652C226D657373616765223A22E9AA8CE8AF81E7A081E99499E8AFAF227D, '2', 'Windows-Chrome-63.0.3239.132', null, null, null, null, null, '1', '2018-02-08 13:52:23', '1', '2018-02-08 13:52:23', null, '\0');
INSERT INTO `sys_log` VALUES ('2', 'Ajax请求', '用户登录', '127.0.0.1', '系统管理员', 'http://localhost:8080/login/main', 'POST', 'com.litemanager.admin.controller.LoginController.loginMain', 0x5B226F72672E6170616368652E736869726F2E7765622E736572766C65742E536869726F48747470536572766C657452657175657374403632643065376665225D, '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', 0x7B2264617461223A7B2275726C223A22696E646578227D2C2273756363657373223A747275652C226D657373616765223A22E799BBE5BD95E68890E58A9F227D, '23', 'Windows-Chrome-63.0.3239.132', null, null, null, null, null, '1', '2018-02-08 13:52:31', '1', '2018-02-08 13:52:31', null, '\0');
INSERT INTO `sys_log` VALUES ('3', '普通请求', '跳转系统字典页面', '127.0.0.1', '系统管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.litemanager.admin.controller.system.DictController.list', 0x5B5D, '8310d5c4-f6ef-4937-8d20-e1c6c6cdb915', 0x2261646D696E2F73797374656D2F646963742F6C69737422, '1', 'Windows-Chrome-63.0.3239.132', null, null, null, null, null, '1', '2018-02-08 13:52:45', '1', '2018-02-08 13:52:45', null, '\0');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单',
  `level` bigint(2) DEFAULT NULL COMMENT '菜单层级',
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '父菜单联集',
  `sort` smallint(6) DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `bg_color` varchar(255) DEFAULT NULL COMMENT '显示背景色',
  `is_show` tinyint(2) DEFAULT NULL COMMENT '是否显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', null, '1', '1,', '20', '', null, '', null, '1', '', '1', '2018-01-16 11:29:46', '1', '2018-01-20 03:09:26', null, '0');
INSERT INTO `sys_menu` VALUES ('2', '系统用户管理', '1', '2', '1,2,', '9', '/admin/system/user/list', null, '', '#47e69c', '1', 'sys:user:list', '1', '2018-01-16 11:31:18', '1', '2018-01-20 05:59:20', null, '0');
INSERT INTO `sys_menu` VALUES ('3', '系统角色管理', '1', '2', '1,3,', '10', '/admin/system/role/list', null, '', '#c23ab9', '1', 'sys:role:list', '1', '2018-01-16 11:32:33', '1', '2018-01-20 05:58:58', null, '0');
INSERT INTO `sys_menu` VALUES ('4', '系统权限管理', '1', '2', '1,4,', '20', '/admin/system/menu/list', null, '', '#d4573b', '1', 'sys:menu:list', '1', '2018-01-16 11:33:19', '1', '2018-02-08 09:49:28', null, '0');
INSERT INTO `sys_menu` VALUES ('5', '系统资源管理', '1', '2', '1,5,', '30', '/admin/system/rescource/list', null, '', '#f5e42a', '1', 'sys:rescource:list', '1', '2018-01-16 11:34:48', '1', '2018-01-20 05:56:35', null, '0');
INSERT INTO `sys_menu` VALUES ('6', '系统日志管理', '1', '2', '1,6,', '40', '/admin/system/log/list', null, '', '#b56c18', '1', 'sys:log:list', '1', '2018-01-16 11:35:31', '1', '2018-01-20 05:12:17', null, '0');
INSERT INTO `sys_menu` VALUES ('7', '网站基本信息', '1', '2', '1,7,', '50', '/admin/system/site/show', null, '', '#95deb9', '1', 'sys:site:list', '1', '2018-01-16 11:36:50', '1', '2018-01-20 05:55:44', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '数据库管理', '1', '2', '1,8,', '60', '/admin/system/table/list', null, '', '#369e16', '1', 'sys:table:list', '1', '2018-01-16 11:38:29', '1', '2018-01-20 03:14:23', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '系统字典管理', '1', '2', '1,9,', '70', '/admin/system/dict/list', null, '', '#1bbcc2', '1', 'sys:dict:list', '1', '2018-01-16 14:51:52', '1', '2018-01-20 03:12:27', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '定时任务', null, '1', '10,', '5', '', null, '', null, '1', '', '1', '2018-01-26 22:39:35', '1', '2018-02-08 10:31:05', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '任务列表', '10', '2', '10,11,', '15', '/admin/quartzTask/list', null, '', '#d6d178', '1', 'quartz:task:list', '1', '2018-01-26 22:41:25', '1', '2018-02-08 10:31:11', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '任务执行日志', '10', '2', '10,12,', '10', '/admin/quartzTaskLog/list', null, '', '#5158d6', '1', 'quartz:log:list', '1', '2018-01-27 01:07:11', '1', '2018-02-08 10:37:51', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '新增字典', '9', '3', '1,9,13,', '0', '', null, null, null, '0', 'sys:dict:add', '1', '2018-02-08 09:39:09', '1', '2018-02-08 09:39:19', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '编辑字典', '9', '3', '1,9,14,', '10', '', null, null, null, '0', 'sys:dict:edit', '1', '2018-02-08 09:40:37', '1', '2018-02-08 09:40:46', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '编辑字典类型', '9', '3', '1,9,15,', '20', '', null, null, null, '0', 'sys:dict:editType', '1', '2018-02-08 09:42:46', '1', '2018-02-08 09:54:07', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '新增系统权限', '4', '3', '1,4,16,', '0', '', null, null, null, '0', 'sys:menu:add', '1', '2018-02-08 09:49:15', '1', '2018-02-08 09:49:38', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '编辑系统权限', '4', '3', '1,4,17,', '10', '', null, null, null, '0', 'sys:menu:edit', '1', '2018-02-08 09:50:16', '1', '2018-02-08 09:50:25', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '删除系统权限', '4', '3', '1,4,18,', '20', '', null, null, null, '0', 'sys:menu:delete', '1', '2018-02-08 09:51:53', '1', '2018-02-08 09:53:42', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '删除系统资源', '5', '3', '1,5,19,', '0', '', null, null, null, '0', 'sys:rescource:delete', '1', '2018-02-08 09:56:44', '1', '2018-02-08 09:56:53', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '新增系统角色', '3', '3', '1,3,20,', '0', '', null, null, null, '0', 'sys:role:add', '1', '2018-02-08 09:58:11', '1', '2018-02-08 09:58:11', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '编辑菜单权限', '3', '3', '1,3,21,', '10', '', null, null, null, '0', 'sys:role:edit', '1', '2018-02-08 09:59:01', '1', '2018-02-08 09:59:01', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '删除角色', '3', '3', '1,3,22,', '20', '', null, null, null, '0', 'sys:role:delete', '1', '2018-02-08 09:59:56', '1', '2018-02-08 09:59:56', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '系统日志删除', '6', '3', '1,6,23,', '0', '', null, null, null, '0', 'system:logs:delete', '1', '2018-06-16 04:30:32', '1', '2018-06-16 04:30:32', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '数据库新增', '8', '3', '1,8,24,', '0', '', null, null, null, '0', 'sys:table:add', '1', '2018-02-08 10:02:51', '1', '2018-02-08 10:02:51', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '编辑数据库', '8', '3', '1,8,25,', '10', '', null, null, null, '0', 'sys:table:edit', '1', '2018-02-08 10:03:58', '1', '2018-02-08 10:03:58', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '新增数据库字段', '8', '3', '1,8,26,', '20', '', null, null, null, '0', 'sys:table:addField', '1', '2018-02-08 10:05:11', '1', '2018-02-08 10:05:11', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '编辑数据库字段', '8', '3', '1,8,27,', '30', '', null, null, null, '0', 'sys:table:editField', '1', '2018-02-08 10:05:47', '1', '2018-02-08 10:05:47', null, '0');
INSERT INTO `sys_menu` VALUES ('28', '删除数据库字段', '8', '3', '1,8,28,', '40', '', null, null, null, '0', 'sys:table:deleteField', '1', '2018-02-08 10:07:29', '1', '2018-02-08 10:15:39', null, '0');
INSERT INTO `sys_menu` VALUES ('29', '删除数据库', '8', '3', '1,8,29,', '50', '', null, null, null, '0', 'sys:table:deleteTable', '1', '2018-02-08 10:08:16', '1', '2018-02-08 10:08:16', null, '0');
INSERT INTO `sys_menu` VALUES ('30', '下载源码', '8', '3', '1,8,30,', '60', '', null, null, null, '0', 'sys:table:download', '1', '2018-02-08 10:09:28', '1', '2018-02-08 10:09:28', null, '0');
INSERT INTO `sys_menu` VALUES ('31', '新增系统用户', '2', '3', '1,2,31,', '0', '', null, null, null, '0', 'sys:user:add', '1', '2018-02-08 10:10:32', '1', '2018-02-08 10:10:32', null, '0');
INSERT INTO `sys_menu` VALUES ('32', '编辑系统用户', '2', '3', '1,2,32,', '10', '', null, null, null, '0', 'sys:user:edit', '1', '2018-02-08 10:11:49', '1', '2018-02-08 10:11:49', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '删除系统用户', '2', '3', '1,2,33,', '20', '', null, null, null, '0', 'sys:user:delete', '1', '2018-02-08 10:12:43', '1', '2018-02-08 10:12:43', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '新增定时任务', '11', '3', '10,11,34,', '0', '', null, null, null, '0', 'quartz:task:add', '1', '2018-02-08 10:32:46', '1', '2018-02-08 10:32:46', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '编辑定时任务', '11', '3', '10,11,35,', '10', '', null, null, null, '0', 'quartz:task:edit', '1', '2018-02-08 10:34:18', '1', '2018-02-08 10:34:18', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '删除定时任务', '11', '3', '10,11,36,', '20', '', null, null, null, '0', 'quartz:task:delete', '1', '2018-02-08 10:35:07', '1', '2018-02-08 10:35:07', null, '0');
INSERT INTO `sys_menu` VALUES ('37', '暂停定时任务', '11', '3', '10,11,37,', '30', '', null, null, null, '0', 'quartz:task:paush', '1', '2018-02-08 10:35:43', '1', '2018-02-08 10:35:43', null, '0');
INSERT INTO `sys_menu` VALUES ('38', '恢复运行任务', '11', '3', '10,11,38,', '40', '', null, null, null, '0', 'quartz:task:resume', '1', '2018-02-08 10:36:26', '1', '2018-02-08 10:36:26', null, '0');
INSERT INTO `sys_menu` VALUES ('39', '立即执行运行任务', '11', '3', '10,11,39,', '50', '', null, null, null, '0', 'quartz:task:run', '1', '2018-02-08 10:36:55', '1', '2018-02-08 10:36:55', null, '0');
INSERT INTO `sys_menu` VALUES ('40', '删除定时任务日志', '12', '3', '10,12,40,', '0', '', null, null, null, '0', 'quartz:log:delete', '1', '2018-02-08 10:39:04', '1', '2018-02-08 10:39:04', null, '0');
INSERT INTO `sys_menu` VALUES ('41', '修改密码', '2', '3', '1,2,41,', '30', '', null, '', null, '0', 'sys:user:changePassword', '1', '2018-03-15 10:14:06', '1', '2018-03-15 10:14:06', null, '0');
INSERT INTO `sys_menu` VALUES ('42', '删除字典', '9', '3', '1,9,42,', '30', '', null, null, null, '0', 'sys:dict:delete', '1', '2018-03-15 10:16:55', '1', '2018-03-15 10:16:55', null, '0');
INSERT INTO `sys_menu` VALUES ('43', '七牛云存储信息', '7', '3', '1,7,43,', '10', '', null, null, null, '0', 'sys:site:editQiniu', '1', '2018-07-12 18:46:39', '1', '2018-07-12 18:46:39', null, '0');
INSERT INTO `sys_menu` VALUES ('44', '阿里云信息存储', '7', '3', '1,7,44,', '20', '', null, null, null, '0', 'sys:site:editOss', '1', '2018-07-12 18:47:05', '1', '2018-07-12 18:47:05', null, '0');
INSERT INTO `sys_menu` VALUES ('45', 'Druid数据监控', '1', '2', '1,45,', '25', '/admin/druid/list', null, '', '#7e8755', '1', 'sys:druid:list', '1', '2018-06-16 05:06:17', '1', '2018-06-16 05:06:26', null, '0');

-- ----------------------------
-- Table structure for sys_rescource
-- ----------------------------
DROP TABLE IF EXISTS `sys_rescource`;
CREATE TABLE `sys_rescource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `source` varchar(255) DEFAULT NULL COMMENT '来源',
  `web_url` varchar(500) DEFAULT NULL COMMENT '资源网络地址',
  `hash` varchar(255) DEFAULT NULL COMMENT '文件标识',
  `file_size` varchar(50) DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `original_net_url` text,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统资源';

-- ----------------------------
-- Records of sys_rescource
-- ----------------------------
INSERT INTO `sys_rescource` VALUES ('2', '77861034-25ef-4856-87ec-24da18398ecf.jpg', 'qiniu', 'https://static.litemanager.com/77861034-25ef-4856-87ec-24da18398ecf.jpg', 'FvRpJ_-DlF-eFJ4l28xVGVUsHRCX', '105kb', '.jpg', null, '2018-02-08 13:57:44', '1', '2018-02-08 13:57:44', '1', null, '0');
INSERT INTO `sys_rescource` VALUES ('3', '04ea0ce0-e53b-4eb3-b1ea-dc316063d29f.jpg', 'qiniu', 'https://static.litemanager.com/04ea0ce0-e53b-4eb3-b1ea-dc316063d29f.jpg', 'FrJ5IUYX0zMw5HpDW4fUfNvMv4Q3', '329kb', '.jpg', null, '2018-02-08 13:59:06', '1', '2018-02-08 13:59:06', '1', null, '0');
INSERT INTO `sys_rescource` VALUES ('4', '3e2baf40-f2e5-4b3c-93d1-3f97965017ec.jpg', 'qiniu', 'https://static.litemanager.com/3e2baf40-f2e5-4b3c-93d1-3f97965017ec.jpg', 'FpgHWPFgcyMX1lqNEDk8Pdnl3lsu', '228kb', '.jpg', null, '2018-03-13 12:54:36', '1', '2018-03-13 12:54:36', '1', null, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '角色名称',
  `create_date` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '2019-02-21 19:36:37', '1', '2019-02-21 19:36:37', '1', '', '0');
INSERT INTO `sys_role` VALUES ('2', '测试', '2019-02-21 14:19:07', '1', '2019-02-21 14:19:07', '1', '', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '23');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '25');
INSERT INTO `sys_role_menu` VALUES ('1', '26');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '31');
INSERT INTO `sys_role_menu` VALUES ('1', '32');
INSERT INTO `sys_role_menu` VALUES ('1', '33');
INSERT INTO `sys_role_menu` VALUES ('1', '34');
INSERT INTO `sys_role_menu` VALUES ('1', '35');
INSERT INTO `sys_role_menu` VALUES ('1', '36');
INSERT INTO `sys_role_menu` VALUES ('1', '37');
INSERT INTO `sys_role_menu` VALUES ('1', '38');
INSERT INTO `sys_role_menu` VALUES ('1', '39');
INSERT INTO `sys_role_menu` VALUES ('1', '40');
INSERT INTO `sys_role_menu` VALUES ('1', '41');
INSERT INTO `sys_role_menu` VALUES ('1', '42');
INSERT INTO `sys_role_menu` VALUES ('1', '43');
INSERT INTO `sys_role_menu` VALUES ('1', '44');
INSERT INTO `sys_role_menu` VALUES ('1', '45');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '8');
INSERT INTO `sys_role_menu` VALUES ('2', '10');
INSERT INTO `sys_role_menu` VALUES ('2', '13');



-- ----------------------------
-- Table structure for sys_site
-- ----------------------------
DROP TABLE IF EXISTS `sys_site`;
CREATE TABLE `sys_site` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL COMMENT '系统网址',
  `version` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `file_upload_type` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `database` varchar(255) DEFAULT NULL,
  `max_upload` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
   `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_site
-- ----------------------------
INSERT INTO `sys_site` VALUES ('1' ,'后台管理系统','http://ow9lg82yy.bkt.clouddn.com/24f5c360-485d-4a6d-9468-2a61c353cf37.ico', 'https://localhsot:8080', '1.0', 'xxx', 'local',  'Linux', 'mysql', '2', '系统描述', '1', '2018-12-30 22:46:15', '1', '2019-05-12 18:49:01','','0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(36) DEFAULT NULL COMMENT '登录名',
  `nick_name` varchar(40) DEFAULT NULL COMMENT '昵称',
  `icon` varchar(2000) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) DEFAULT NULL COMMENT 'shiro加密盐',
  `tel` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱地址',
  `locked` tinyint(2) DEFAULT NULL COMMENT '是否锁定',
  `create_date` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '系統管理员', 'https://static.litemanager.com/3c5b69f4-2e39-4f88-b302-a6eb48e4c43a.jpg', 'ff129eab3446a6049b173662cd2b86d1b7fbdac5', 'd00eaab78b7459e5', '15366667737', 'a@qq.com', '0', '2017-11-27 22:19:39', '1', '2018-06-16 04:27:15', '1', '密码：123456', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('1', '2');

-- ----------------------------
-- Table structure for upload_info
-- ----------------------------
DROP TABLE IF EXISTS `upload_info`;
CREATE TABLE `upload_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `local_window_url` varchar(255) DEFAULT NULL COMMENT '本地window系统上传路径,input,YES,false,true,false',
  `local_linux_url` varchar(255) DEFAULT NULL COMMENT '本地LINUX系统上传路径,input,YES,false,true,false',
  `qiniu_base_path` varchar(255) DEFAULT NULL COMMENT '七牛前缀路径,input,YES,false,true,false',
  `qiniu_bucket_name` varchar(255) DEFAULT NULL COMMENT '七牛bucket的目录名称,input,YES,false,true,false',
  `qiniu_dir` varchar(255) DEFAULT NULL COMMENT '七牛文件存储目录,input,YES,false,true,false',
  `qiniu_access_key` varchar(255) DEFAULT NULL COMMENT '七牛qiniuAccess值,input,YES,false,true,false',
  `qiniu_secret_key` varchar(255) DEFAULT NULL COMMENT '七牛qiniuKey的值,input,YES,false,true,false',
  `qiniu_test_access` bit(1) DEFAULT NULL COMMENT '七牛上传测试,switch,YES,true,true,false',
  `oss_base_path` varchar(255) DEFAULT NULL COMMENT '阿里云前缀路径,input,YES,false,true,false',
  `oss_bucket_name` varchar(255) DEFAULT NULL COMMENT '阿里云bucket的目录名称,input,YES,false,true,false',
  `oss_dir` varchar(255) DEFAULT NULL COMMENT '阿里云文件上传目录,input,YES,false,true,false',
  `oss_key_id` varchar(255) DEFAULT NULL COMMENT '阿里云ACCESS_KEY_ID值,input,YES,false,true,false',
  `oss_key_secret` varchar(255) DEFAULT NULL COMMENT '阿里云ACCESS_KEY_SECRET,input,YES,false,true,false',
  `oss_endpoint` varchar(255) DEFAULT NULL COMMENT '阿里云ENDPOINT值,input,YES,false,true,false',
  `oss_test_access` bit(1) DEFAULT NULL COMMENT '阿里云上传测试,switch,YES,true,true,false',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文件上传配置,1,switch-qiniuTestAccess-YES-true-qiniu_test_access,switch-ossTestAccess-YES-true-oss_test_access';

-- ----------------------------
-- Records of upload_info
-- ----------------------------
INSERT INTO `upload_info` VALUES ('1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-07-12 18:48:23', '1', '2018-07-12 18:48:25', '1', null, '0');
