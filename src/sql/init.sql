/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50087
Source Host           : localhost:3306
Source Database       : nbse

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2016-03-22 15:56:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) collate utf8_bin NOT NULL default '',
  `VALUE_` varchar(300) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  PRIMARY KEY  (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', '1');
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(5.14)', '1');
INSERT INTO `act_ge_property` VALUES ('schema.version', '5.14', '1');

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) collate utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `CALL_PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACT_NAME_` varchar(255) collate utf8_bin default NULL,
  `ACT_TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `URL_` varchar(4000) collate utf8_bin default NULL,
  `CONTENT_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACTION_` varchar(255) collate utf8_bin default NULL,
  `MESSAGE_` varchar(4000) collate utf8_bin default NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `ACT_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `GROUP_ID_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `START_USER_ID_` varchar(255) collate utf8_bin default NULL,
  `START_ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `END_ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) collate utf8_bin default NULL,
  `DELETE_REASON_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  UNIQUE KEY `ACT_UNIQ_HI_BUS_KEY` (`PROC_DEF_ID_`,`BUSINESS_KEY_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_DEF_KEY_` varchar(255) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `PARENT_TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `OWNER_` varchar(255) collate utf8_bin default NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime default NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `DELETE_REASON_` varchar(4000) collate utf8_bin default NULL,
  `PRIORITY_` int(11) default NULL,
  `DUE_DATE_` datetime default NULL,
  `FORM_KEY_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `USER_ID_` varchar(64) collate utf8_bin default NULL,
  `TYPE_` varchar(64) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin default NULL,
  `VALUE_` varchar(255) collate utf8_bin default NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `GROUP_ID_` varchar(64) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `FIRST_` varchar(255) collate utf8_bin default NULL,
  `LAST_` varchar(255) collate utf8_bin default NULL,
  `EMAIL_` varchar(255) collate utf8_bin default NULL,
  `PWD_` varchar(255) collate utf8_bin default NULL,
  `PICTURE_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `DEPLOY_TIME_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `CREATE_TIME_` timestamp NULL default NULL,
  `LAST_UPDATE_TIME_` timestamp NULL default NULL,
  `VERSION_` int(11) default NULL,
  `META_INFO_` varchar(4000) collate utf8_bin default NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) collate utf8_bin default NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `RESOURCE_NAME_` varchar(4000) collate utf8_bin default NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `HAS_START_FORM_KEY_` tinyint(4) default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `EVENT_TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACTIVITY_ID_` varchar(64) collate utf8_bin default NULL,
  `CONFIGURATION_` varchar(255) collate utf8_bin default NULL,
  `CREATED_` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `BUSINESS_KEY_` varchar(255) collate utf8_bin default NULL,
  `PARENT_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `SUPER_EXEC_` varchar(64) collate utf8_bin default NULL,
  `ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `IS_ACTIVE_` tinyint(4) default NULL,
  `IS_CONCURRENT_` tinyint(4) default NULL,
  `IS_SCOPE_` tinyint(4) default NULL,
  `IS_EVENT_SCOPE_` tinyint(4) default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `CACHED_ENT_STATE_` int(11) default NULL,
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `ACT_UNIQ_RU_BUS_KEY` (`PROC_DEF_ID_`,`BUSINESS_KEY_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `GROUP_ID_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL default NULL,
  `LOCK_OWNER_` varchar(255) collate utf8_bin default NULL,
  `EXCLUSIVE_` tinyint(1) default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `RETRIES_` int(11) default NULL,
  `EXCEPTION_STACK_ID_` varchar(64) collate utf8_bin default NULL,
  `EXCEPTION_MSG_` varchar(4000) collate utf8_bin default NULL,
  `DUEDATE_` timestamp NULL default NULL,
  `REPEAT_` varchar(255) collate utf8_bin default NULL,
  `HANDLER_TYPE_` varchar(255) collate utf8_bin default NULL,
  `HANDLER_CFG_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `PARENT_TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `TASK_DEF_KEY_` varchar(255) collate utf8_bin default NULL,
  `OWNER_` varchar(255) collate utf8_bin default NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `DELEGATION_` varchar(64) collate utf8_bin default NULL,
  `PRIORITY_` int(11) default NULL,
  `CREATE_TIME_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) collate utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) collate utf8_bin NOT NULL COMMENT '所有父级编号',
  `code` varchar(100) collate utf8_bin default NULL COMMENT '区域编码',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '区域名称',
  `type` char(1) collate utf8_bin default NULL COMMENT '区域类型',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_area_parent_id` USING BTREE (`parent_id`),
  KEY `sys_area_parent_ids` USING BTREE (`parent_ids`(333)),
  KEY `sys_area_del_flag` USING BTREE (`del_flag`),
  KEY `FK749F02BFE18EEA67` (`create_by`),
  KEY `FK749F02BF49B6237A` (`update_by`),
  KEY `FK749F02BF3942217F` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='区域表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '100000', '中国', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `label` varchar(100) collate utf8_bin NOT NULL COMMENT '标签名',
  `value` varchar(100) collate utf8_bin NOT NULL COMMENT '数据值',
  `type` varchar(100) collate utf8_bin NOT NULL COMMENT '类型',
  `description` varchar(100) collate utf8_bin NOT NULL COMMENT '描述',
  `sort` int(11) NOT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_dict_value` USING BTREE (`value`),
  KEY `sys_dict_label` USING BTREE (`label`),
  KEY `sys_dict_del_flag` USING BTREE (`del_flag`),
  KEY `FK74A03DE8E18EEA67` (`create_by`),
  KEY `FK74A03DE849B6237A` (`update_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '正常', '0', 'del_flag', '删除标记', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('2', '删除', '1', 'del_flag', '删除标记', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '显示', '1', 'show_hide', '显示/隐藏', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('4', '隐藏', '0', 'show_hide', '显示/隐藏', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('5', '是', '1', 'yes_no', '是/否', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('6', '否', '0', 'yes_no', '是/否', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('7', '红色', 'red', 'color', '颜色值', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('8', '绿色', 'green', 'color', '颜色值', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('9', '蓝色', 'blue', 'color', '颜色值', '30', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('10', '黄色', 'yellow', 'color', '颜色值', '40', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('11', '橙色', 'orange', 'color', '颜色值', '50', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('12', '默认主题', 'default', 'theme', '主题方案', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('13', '天蓝主题', 'cerulean', 'theme', '主题方案', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('14', '橙色主题', 'readable', 'theme', '主题方案', '30', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('15', '红色主题', 'united', 'theme', '主题方案', '40', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('16', 'Flat主题', 'flat', 'theme', '主题方案', '60', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('17', '国家', '1', 'sys_area_type', '区域类型', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('18', '省份、直辖市', '2', 'sys_area_type', '区域类型', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('19', '地市', '3', 'sys_area_type', '区域类型', '30', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('20', '区县', '4', 'sys_area_type', '区域类型', '40', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('21', '公司', '1', 'sys_office_type', '机构类型', '60', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('22', '部门', '2', 'sys_office_type', '机构类型', '70', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('23', '一级', '1', 'sys_office_grade', '机构等级', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('24', '二级', '2', 'sys_office_grade', '机构等级', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('25', '三级', '3', 'sys_office_grade', '机构等级', '30', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('26', '四级', '4', 'sys_office_grade', '机构等级', '40', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('27', '所有数据', '1', 'sys_data_scope', '数据范围', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('28', '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('29', '所在公司数据', '3', 'sys_data_scope', '数据范围', '30', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('30', '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', '40', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('31', '所在部门数据', '5', 'sys_data_scope', '数据范围', '50', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('32', '仅本人数据', '8', 'sys_data_scope', '数据范围', '90', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('33', '按明细设置', '9', 'sys_data_scope', '数据范围', '100', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('34', '系统管理', '1', 'sys_user_type', '用户类型', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('35', '部门经理', '2', 'sys_user_type', '用户类型', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('36', '普通用户', '3', 'sys_user_type', '用户类型', '30', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('37', '基础主题', 'basic', 'cms_theme', '站点主题', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('38', '蓝色主题', 'blue', 'cms_theme', '站点主题', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('39', '红色主题', 'red', 'cms_theme', '站点主题', '30', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('62', '接入日志', '1', 'sys_log_type', '日志类型', '30', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('63', '异常日志', '2', 'sys_log_type', '日志类型', '40', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) collate utf8_bin default '1' COMMENT '日志类型',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `remote_addr` varchar(255) collate utf8_bin default NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) collate utf8_bin default NULL COMMENT '用户代理',
  `request_uri` varchar(255) collate utf8_bin default NULL COMMENT '请求URI',
  `method` varchar(5) collate utf8_bin default NULL COMMENT '操作方式',
  `params` text collate utf8_bin COMMENT '操作提交的数据',
  `exception` text collate utf8_bin COMMENT '异常信息',
  PRIMARY KEY  (`id`),
  KEY `sys_log_create_by` USING BTREE (`create_by`),
  KEY `sys_log_request_uri` USING BTREE (`request_uri`),
  KEY `sys_log_type` USING BTREE (`type`),
  KEY `sys_log_create_date` USING BTREE (`create_date`),
  KEY `FK986862D2E18EEA67` (`create_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('2f033c76d5be449384f06f7fbeadef60', '1', '1', '2016-03-22 15:45:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', '/tdd/tdd/sys/menu/delete', 'GET', 0x69643D3331, '');
INSERT INTO `sys_log` VALUES ('84ac694a15fa45d6ba9e379f601df093', '2', '1', '2016-03-22 15:47:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', '/tdd/tdd/sys/area/form', 'GET', '', 0x6A6176612E6C616E672E4E756C6C506F696E746572457863657074696F6E);
INSERT INTO `sys_log` VALUES ('21451f172688466ea8a05a570c484eab', '2', '1', '2016-03-22 15:48:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', '/tdd/tdd/sys/area/form', 'GET', '', 0x6A6176612E6C616E672E4E756C6C506F696E746572457863657074696F6E);
INSERT INTO `sys_log` VALUES ('ae4a01e218324660823142dbd3001a74', '2', '1', '2016-03-22 15:50:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', '/tdd/tdd/sys/area/form', 'GET', '', 0x6A6176612E6C616E672E4E756C6C506F696E746572457863657074696F6E);
INSERT INTO `sys_log` VALUES ('1d1a2a429b4d4d23af641ecb1be08c78', '2', '1', '2016-03-22 15:51:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', '/tdd/tdd/sys/area/form', 'GET', '', 0x6A6176612E6C616E672E4E756C6C506F696E746572457863657074696F6E);
INSERT INTO `sys_log` VALUES ('a8d19ed94e634998b17f7c239f08887b', '2', '1', '2016-03-22 15:53:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', '/tdd/tdd/sys/area/form', 'GET', '', 0x6A6176612E6C616E672E4E756C6C506F696E746572457863657074696F6E);

-- ----------------------------
-- Table structure for sys_mdict
-- ----------------------------
DROP TABLE IF EXISTS `sys_mdict`;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) collate utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) collate utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '角色名称',
  `description` varchar(100) collate utf8_bin default NULL COMMENT '描述',
  `sort` int(11) default NULL COMMENT '排序（升序）',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_mdict_parent_id` USING BTREE (`parent_id`),
  KEY `sys_mdict_parent_ids` USING BTREE (`parent_ids`(333)),
  KEY `sys_mdict_del_flag` USING BTREE (`del_flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多级字典表';

-- ----------------------------
-- Records of sys_mdict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) collate utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) collate utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '菜单名称',
  `href` varchar(255) collate utf8_bin default NULL COMMENT '链接',
  `target` varchar(20) collate utf8_bin default NULL COMMENT '目标',
  `icon` varchar(100) collate utf8_bin default NULL COMMENT '图标',
  `sort` int(11) NOT NULL COMMENT '排序（升序）',
  `is_show` char(1) collate utf8_bin NOT NULL COMMENT '是否在菜单中显示',
  `is_activiti` char(1) collate utf8_bin default NULL COMMENT '是否同步工作流',
  `permission` varchar(200) collate utf8_bin default NULL COMMENT '权限标识',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_menu_parent_id` USING BTREE (`parent_id`),
  KEY `sys_menu_parent_ids` USING BTREE (`parent_ids`(333)),
  KEY `sys_menu_del_flag` USING BTREE (`del_flag`),
  KEY `FK74A44791E18EEA67` (`create_by`),
  KEY `FK74A4479149B6237A` (`update_by`),
  KEY `FK74A4479139476651` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '顶级菜单', null, null, null, '0', '1', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '', '', '', '900', '1', '0', '', '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', null, null, null, '920', '1', '0', null, '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '/sys/menu/', null, 'list-alt', '30', '1', '0', null, '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', null, null, null, '30', '0', '0', 'sys:menu:view', '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', null, null, null, '30', '0', '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '/sys/role/', null, 'lock', '50', '1', '0', null, '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', null, null, null, '30', '0', '0', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', null, null, null, '30', '0', '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '/sys/dict/', null, 'th-list', '60', '1', '0', null, '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', null, null, null, '30', '0', '0', 'sys:dict:view', '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:25', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', null, null, null, '30', '0', '0', 'sys:dict:edit', '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:25', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', null, null, null, '910', '1', '0', null, '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,1,2,13,', '区域管理', '/sys/area/', null, 'th', '50', '1', '0', null, '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,2,13,14,', '查看', null, null, null, '30', '0', '0', 'sys:area:view', '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,2,13,14,', '修改', null, null, null, '30', '0', '0', 'sys:area:edit', '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', '/sys/office/', null, 'th-large', '40', '1', '0', null, '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '查看', null, null, null, '30', '0', '0', 'sys:office:view', '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '修改', null, null, null, '30', '0', '0', 'sys:office:edit', '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '/sys/user/', null, 'user', '30', '1', '0', null, '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', null, null, null, '30', '0', '0', 'sys:user:view', '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', null, null, null, '30', '0', '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:24', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', null, null, null, '100', '1', '0', null, '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:19', null, '0');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', null, null, null, '990', '1', '0', null, '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:19', null, '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '/sys/user/info', null, 'user', '30', '1', '0', null, '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:19', null, '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '/sys/user/modifyPwd', null, 'lock', '40', '1', '0', null, '1', '2013-05-27 08:00:00', '1', '2016-02-05 16:35:19', null, '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', null, null, null, '940', '1', '0', null, '1', '2013-06-03 08:00:00', '1', '2016-02-05 16:35:25', null, '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '/sys/log', null, 'pencil', '30', '1', '0', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2016-02-05 16:35:25', null, '0');

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) collate utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) collate utf8_bin NOT NULL COMMENT '所有父级编号',
  `area_id` varchar(64) collate utf8_bin NOT NULL COMMENT '归属区域',
  `code` varchar(100) collate utf8_bin default NULL COMMENT '区域编码',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '机构名称',
  `type` char(1) collate utf8_bin NOT NULL COMMENT '机构类型',
  `grade` char(1) collate utf8_bin NOT NULL COMMENT '机构等级',
  `address` varchar(255) collate utf8_bin default NULL COMMENT '联系地址',
  `zip_code` varchar(100) collate utf8_bin default NULL COMMENT '邮政编码',
  `master` varchar(100) collate utf8_bin default NULL COMMENT '负责人',
  `phone` varchar(200) collate utf8_bin default NULL COMMENT '电话',
  `fax` varchar(200) collate utf8_bin default NULL COMMENT '传真',
  `email` varchar(200) collate utf8_bin default NULL COMMENT '邮箱',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_office_parent_id` USING BTREE (`parent_id`),
  KEY `sys_office_parent_ids` USING BTREE (`parent_ids`(333)),
  KEY `sys_office_del_flag` USING BTREE (`del_flag`),
  KEY `FKE024AC6EE18EEA67` (`create_by`),
  KEY `FKE024AC6E49B6237A` (`update_by`),
  KEY `FKE024AC6E915D2ABC` (`area_id`),
  KEY `FKE024AC6E47640F2E` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机构表';

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('1', '0', '0,', '1', '310000', '管理员', '1', '1', null, null, null, null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `office_id` varchar(64) collate utf8_bin default NULL COMMENT '归属机构',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '角色名称',
  `data_scope` char(1) collate utf8_bin default NULL COMMENT '数据范围',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_role_del_flag` USING BTREE (`del_flag`),
  KEY `FK74A6B2A8E18EEA67` (`create_by`),
  KEY `FK74A6B2A849B6237A` (`update_by`),
  KEY `FK74A6B2A845EC47DC` (`office_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '系统管理员', '1', '1', '2013-05-27 08:00:00', '1', '2016-02-01 14:21:53', null, '0');
INSERT INTO `sys_role` VALUES ('2', '1', '公司管理员', '2', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('3', '1', '本公司管理员', '3', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('4', '1', '部门管理员', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('5', '1', '本部门管理员', '5', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('6', '1', '普通用户', '8', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) collate utf8_bin NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) collate utf8_bin NOT NULL COMMENT '菜单编号',
  PRIMARY KEY  (`role_id`,`menu_id`),
  KEY `FK65D48496F686217C` (`menu_id`),
  KEY `FK65D48496FF4B61C` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '01bbdfb6f60e432696fc0c1fd3642835');
INSERT INTO `sys_role_menu` VALUES ('1', '072db6d53c424cae8a9b2fc263a3a1b7');
INSERT INTO `sys_role_menu` VALUES ('1', '0b3cfd1ccdfa4af098fcfe873a224ad5');
INSERT INTO `sys_role_menu` VALUES ('1', '0ddf6228371743699702e973c361c1ef');
INSERT INTO `sys_role_menu` VALUES ('1', '1');
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
INSERT INTO `sys_role_menu` VALUES ('1', '1cf0619e1e204074af9946e2617e9887');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '25');
INSERT INTO `sys_role_menu` VALUES ('1', '26');
INSERT INTO `sys_role_menu` VALUES ('1', '26df6e8d18224361930161230483ab85');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '27173cd083b64c56b219b100242e9d71');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '2cf9c0e8ab9e4a4f87e391dc3c27c625');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '31');
INSERT INTO `sys_role_menu` VALUES ('1', '32');
INSERT INTO `sys_role_menu` VALUES ('1', '320453ff96ef47c8ac3abfe2e66cc70e');
INSERT INTO `sys_role_menu` VALUES ('1', '33');
INSERT INTO `sys_role_menu` VALUES ('1', '332d0d26b95c413b937f290c5156f4f3');
INSERT INTO `sys_role_menu` VALUES ('1', '34');
INSERT INTO `sys_role_menu` VALUES ('1', '34115f92273d4061830732d02a993495');
INSERT INTO `sys_role_menu` VALUES ('1', '34cd35b35b244845ba622e67301a57fc');
INSERT INTO `sys_role_menu` VALUES ('1', '35');
INSERT INTO `sys_role_menu` VALUES ('1', '36');
INSERT INTO `sys_role_menu` VALUES ('1', '37');
INSERT INTO `sys_role_menu` VALUES ('1', '38');
INSERT INTO `sys_role_menu` VALUES ('1', '39');
INSERT INTO `sys_role_menu` VALUES ('1', '3a15e232ba1a4ce6bb9e4091ea46c64c');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '40');
INSERT INTO `sys_role_menu` VALUES ('1', '41');
INSERT INTO `sys_role_menu` VALUES ('1', '42');
INSERT INTO `sys_role_menu` VALUES ('1', '43');
INSERT INTO `sys_role_menu` VALUES ('1', '4384f82a3675456da1f7405a9ed11c60');
INSERT INTO `sys_role_menu` VALUES ('1', '44');
INSERT INTO `sys_role_menu` VALUES ('1', '45');
INSERT INTO `sys_role_menu` VALUES ('1', '46');
INSERT INTO `sys_role_menu` VALUES ('1', '47');
INSERT INTO `sys_role_menu` VALUES ('1', '47ffeb8507b24d85877d95877910743f');
INSERT INTO `sys_role_menu` VALUES ('1', '48');
INSERT INTO `sys_role_menu` VALUES ('1', '49');
INSERT INTO `sys_role_menu` VALUES ('1', '4b4f2f03d4f9447f8ce4899aab8c363d');
INSERT INTO `sys_role_menu` VALUES ('1', '4ddec0bf7e7848ea978fb73fd3c4c606');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '50');
INSERT INTO `sys_role_menu` VALUES ('1', '500e6959c56d4390bbf71cfd40f0d0b3');
INSERT INTO `sys_role_menu` VALUES ('1', '51');
INSERT INTO `sys_role_menu` VALUES ('1', '52');
INSERT INTO `sys_role_menu` VALUES ('1', '524ef798436c488a8e7752642a16b487');
INSERT INTO `sys_role_menu` VALUES ('1', '53');
INSERT INTO `sys_role_menu` VALUES ('1', '54');
INSERT INTO `sys_role_menu` VALUES ('1', '55');
INSERT INTO `sys_role_menu` VALUES ('1', '56');
INSERT INTO `sys_role_menu` VALUES ('1', '57');
INSERT INTO `sys_role_menu` VALUES ('1', '58');
INSERT INTO `sys_role_menu` VALUES ('1', '59');
INSERT INTO `sys_role_menu` VALUES ('1', '59377c48afbb403989ee0eb4aeb61506');
INSERT INTO `sys_role_menu` VALUES ('1', '5ef85995a72148aea62f527af530ca87');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '60');
INSERT INTO `sys_role_menu` VALUES ('1', '61');
INSERT INTO `sys_role_menu` VALUES ('1', '65b703c22aaa4c098d556318ce68719b');
INSERT INTO `sys_role_menu` VALUES ('1', '67');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '6d4382eb4323402883929009d15c2b17');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '73');
INSERT INTO `sys_role_menu` VALUES ('1', '74');
INSERT INTO `sys_role_menu` VALUES ('1', '75');
INSERT INTO `sys_role_menu` VALUES ('1', '75ff981bcfa34d3ea7b730a40e7cadd1');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '8152f73d5546420299fc6ca27889b5d6');
INSERT INTO `sys_role_menu` VALUES ('1', '83deaa609ba5453abb8fdb98431baccd');
INSERT INTO `sys_role_menu` VALUES ('1', '8784942c4871499d9480f0a6b9dc72dd');
INSERT INTO `sys_role_menu` VALUES ('1', '8939f5ac824b487d88453d2accb5b5d4');
INSERT INTO `sys_role_menu` VALUES ('1', '8adea27c83fa48d7af2c12770d1c5975');
INSERT INTO `sys_role_menu` VALUES ('1', '8bf75535518049d4898c9532591999b5');
INSERT INTO `sys_role_menu` VALUES ('1', '8e0566ea154143d79e084a2066ae81a4');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '96516e61e8b64a539878c5d5199b3a6c');
INSERT INTO `sys_role_menu` VALUES ('1', '99c5f0a02b5f464fbfdeef000ab544ac');
INSERT INTO `sys_role_menu` VALUES ('1', '9bb08f65b3614ee99dfa79fb2006821f');
INSERT INTO `sys_role_menu` VALUES ('1', 'a6c30479695a43c9bc55545c6e3e7bb9');
INSERT INTO `sys_role_menu` VALUES ('1', 'b06649a47b734d69b71772d63036a173');
INSERT INTO `sys_role_menu` VALUES ('1', 'b68eee18da6d489181fa172211bf51f0');
INSERT INTO `sys_role_menu` VALUES ('1', 'bd358d1fb8784206afa68cb609265d79');
INSERT INTO `sys_role_menu` VALUES ('1', 'c69328832310429797e81c1bf2953156');
INSERT INTO `sys_role_menu` VALUES ('1', 'd3b693ea5e564538a6cc339c10cafcf7');
INSERT INTO `sys_role_menu` VALUES ('1', 'dac0660816934a3c8822bf26025c19ce');
INSERT INTO `sys_role_menu` VALUES ('1', 'dc516f79665b4f89a3d423194293a5dd');
INSERT INTO `sys_role_menu` VALUES ('1', 'e30effd59dcb41549935d8a9aef04345');
INSERT INTO `sys_role_menu` VALUES ('1', 'e8d082c585834649a7d2dabedcc94b3b');
INSERT INTO `sys_role_menu` VALUES ('1', 'ff432c84853f40808093ea556500093c');
INSERT INTO `sys_role_menu` VALUES ('1', 'fffe993a8ab64bf0ae2ab0a10e86c87b');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '10');
INSERT INTO `sys_role_menu` VALUES ('2', '11');
INSERT INTO `sys_role_menu` VALUES ('2', '12');
INSERT INTO `sys_role_menu` VALUES ('2', '13');
INSERT INTO `sys_role_menu` VALUES ('2', '14');
INSERT INTO `sys_role_menu` VALUES ('2', '15');
INSERT INTO `sys_role_menu` VALUES ('2', '16');
INSERT INTO `sys_role_menu` VALUES ('2', '17');
INSERT INTO `sys_role_menu` VALUES ('2', '18');
INSERT INTO `sys_role_menu` VALUES ('2', '19');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '21');
INSERT INTO `sys_role_menu` VALUES ('2', '22');
INSERT INTO `sys_role_menu` VALUES ('2', '23');
INSERT INTO `sys_role_menu` VALUES ('2', '24');
INSERT INTO `sys_role_menu` VALUES ('2', '25');
INSERT INTO `sys_role_menu` VALUES ('2', '26');
INSERT INTO `sys_role_menu` VALUES ('2', '27');
INSERT INTO `sys_role_menu` VALUES ('2', '28');
INSERT INTO `sys_role_menu` VALUES ('2', '29');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '30');
INSERT INTO `sys_role_menu` VALUES ('2', '31');
INSERT INTO `sys_role_menu` VALUES ('2', '32');
INSERT INTO `sys_role_menu` VALUES ('2', '33');
INSERT INTO `sys_role_menu` VALUES ('2', '34');
INSERT INTO `sys_role_menu` VALUES ('2', '35');
INSERT INTO `sys_role_menu` VALUES ('2', '36');
INSERT INTO `sys_role_menu` VALUES ('2', '37');
INSERT INTO `sys_role_menu` VALUES ('2', '38');
INSERT INTO `sys_role_menu` VALUES ('2', '39');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '40');
INSERT INTO `sys_role_menu` VALUES ('2', '41');
INSERT INTO `sys_role_menu` VALUES ('2', '42');
INSERT INTO `sys_role_menu` VALUES ('2', '43');
INSERT INTO `sys_role_menu` VALUES ('2', '44');
INSERT INTO `sys_role_menu` VALUES ('2', '45');
INSERT INTO `sys_role_menu` VALUES ('2', '46');
INSERT INTO `sys_role_menu` VALUES ('2', '47');
INSERT INTO `sys_role_menu` VALUES ('2', '48');
INSERT INTO `sys_role_menu` VALUES ('2', '49');
INSERT INTO `sys_role_menu` VALUES ('2', '5');
INSERT INTO `sys_role_menu` VALUES ('2', '50');
INSERT INTO `sys_role_menu` VALUES ('2', '51');
INSERT INTO `sys_role_menu` VALUES ('2', '52');
INSERT INTO `sys_role_menu` VALUES ('2', '53');
INSERT INTO `sys_role_menu` VALUES ('2', '54');
INSERT INTO `sys_role_menu` VALUES ('2', '55');
INSERT INTO `sys_role_menu` VALUES ('2', '56');
INSERT INTO `sys_role_menu` VALUES ('2', '57');
INSERT INTO `sys_role_menu` VALUES ('2', '58');
INSERT INTO `sys_role_menu` VALUES ('2', '59');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '60');
INSERT INTO `sys_role_menu` VALUES ('2', '61');
INSERT INTO `sys_role_menu` VALUES ('2', '62');
INSERT INTO `sys_role_menu` VALUES ('2', '63');
INSERT INTO `sys_role_menu` VALUES ('2', '64');
INSERT INTO `sys_role_menu` VALUES ('2', '65');
INSERT INTO `sys_role_menu` VALUES ('2', '66');
INSERT INTO `sys_role_menu` VALUES ('2', '67');
INSERT INTO `sys_role_menu` VALUES ('2', '68');
INSERT INTO `sys_role_menu` VALUES ('2', '69');
INSERT INTO `sys_role_menu` VALUES ('2', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '70');
INSERT INTO `sys_role_menu` VALUES ('2', '8');
INSERT INTO `sys_role_menu` VALUES ('2', '9');
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '10');
INSERT INTO `sys_role_menu` VALUES ('3', '11');
INSERT INTO `sys_role_menu` VALUES ('3', '12');
INSERT INTO `sys_role_menu` VALUES ('3', '13');
INSERT INTO `sys_role_menu` VALUES ('3', '14');
INSERT INTO `sys_role_menu` VALUES ('3', '15');
INSERT INTO `sys_role_menu` VALUES ('3', '16');
INSERT INTO `sys_role_menu` VALUES ('3', '17');
INSERT INTO `sys_role_menu` VALUES ('3', '18');
INSERT INTO `sys_role_menu` VALUES ('3', '19');
INSERT INTO `sys_role_menu` VALUES ('3', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '20');
INSERT INTO `sys_role_menu` VALUES ('3', '21');
INSERT INTO `sys_role_menu` VALUES ('3', '22');
INSERT INTO `sys_role_menu` VALUES ('3', '23');
INSERT INTO `sys_role_menu` VALUES ('3', '24');
INSERT INTO `sys_role_menu` VALUES ('3', '25');
INSERT INTO `sys_role_menu` VALUES ('3', '26');
INSERT INTO `sys_role_menu` VALUES ('3', '27');
INSERT INTO `sys_role_menu` VALUES ('3', '28');
INSERT INTO `sys_role_menu` VALUES ('3', '29');
INSERT INTO `sys_role_menu` VALUES ('3', '3');
INSERT INTO `sys_role_menu` VALUES ('3', '30');
INSERT INTO `sys_role_menu` VALUES ('3', '31');
INSERT INTO `sys_role_menu` VALUES ('3', '32');
INSERT INTO `sys_role_menu` VALUES ('3', '33');
INSERT INTO `sys_role_menu` VALUES ('3', '34');
INSERT INTO `sys_role_menu` VALUES ('3', '35');
INSERT INTO `sys_role_menu` VALUES ('3', '36');
INSERT INTO `sys_role_menu` VALUES ('3', '37');
INSERT INTO `sys_role_menu` VALUES ('3', '38');
INSERT INTO `sys_role_menu` VALUES ('3', '39');
INSERT INTO `sys_role_menu` VALUES ('3', '4');
INSERT INTO `sys_role_menu` VALUES ('3', '40');
INSERT INTO `sys_role_menu` VALUES ('3', '41');
INSERT INTO `sys_role_menu` VALUES ('3', '42');
INSERT INTO `sys_role_menu` VALUES ('3', '43');
INSERT INTO `sys_role_menu` VALUES ('3', '44');
INSERT INTO `sys_role_menu` VALUES ('3', '45');
INSERT INTO `sys_role_menu` VALUES ('3', '46');
INSERT INTO `sys_role_menu` VALUES ('3', '47');
INSERT INTO `sys_role_menu` VALUES ('3', '48');
INSERT INTO `sys_role_menu` VALUES ('3', '49');
INSERT INTO `sys_role_menu` VALUES ('3', '5');
INSERT INTO `sys_role_menu` VALUES ('3', '50');
INSERT INTO `sys_role_menu` VALUES ('3', '51');
INSERT INTO `sys_role_menu` VALUES ('3', '52');
INSERT INTO `sys_role_menu` VALUES ('3', '53');
INSERT INTO `sys_role_menu` VALUES ('3', '54');
INSERT INTO `sys_role_menu` VALUES ('3', '55');
INSERT INTO `sys_role_menu` VALUES ('3', '56');
INSERT INTO `sys_role_menu` VALUES ('3', '57');
INSERT INTO `sys_role_menu` VALUES ('3', '58');
INSERT INTO `sys_role_menu` VALUES ('3', '59');
INSERT INTO `sys_role_menu` VALUES ('3', '6');
INSERT INTO `sys_role_menu` VALUES ('3', '60');
INSERT INTO `sys_role_menu` VALUES ('3', '61');
INSERT INTO `sys_role_menu` VALUES ('3', '62');
INSERT INTO `sys_role_menu` VALUES ('3', '63');
INSERT INTO `sys_role_menu` VALUES ('3', '64');
INSERT INTO `sys_role_menu` VALUES ('3', '65');
INSERT INTO `sys_role_menu` VALUES ('3', '66');
INSERT INTO `sys_role_menu` VALUES ('3', '67');
INSERT INTO `sys_role_menu` VALUES ('3', '68');
INSERT INTO `sys_role_menu` VALUES ('3', '69');
INSERT INTO `sys_role_menu` VALUES ('3', '7');
INSERT INTO `sys_role_menu` VALUES ('3', '70');
INSERT INTO `sys_role_menu` VALUES ('3', '8');
INSERT INTO `sys_role_menu` VALUES ('3', '9');
INSERT INTO `sys_role_menu` VALUES ('4', '1');
INSERT INTO `sys_role_menu` VALUES ('4', '10');
INSERT INTO `sys_role_menu` VALUES ('4', '11');
INSERT INTO `sys_role_menu` VALUES ('4', '12');
INSERT INTO `sys_role_menu` VALUES ('4', '13');
INSERT INTO `sys_role_menu` VALUES ('4', '14');
INSERT INTO `sys_role_menu` VALUES ('4', '15');
INSERT INTO `sys_role_menu` VALUES ('4', '16');
INSERT INTO `sys_role_menu` VALUES ('4', '17');
INSERT INTO `sys_role_menu` VALUES ('4', '18');
INSERT INTO `sys_role_menu` VALUES ('4', '19');
INSERT INTO `sys_role_menu` VALUES ('4', '2');
INSERT INTO `sys_role_menu` VALUES ('4', '20');
INSERT INTO `sys_role_menu` VALUES ('4', '21');
INSERT INTO `sys_role_menu` VALUES ('4', '22');
INSERT INTO `sys_role_menu` VALUES ('4', '23');
INSERT INTO `sys_role_menu` VALUES ('4', '24');
INSERT INTO `sys_role_menu` VALUES ('4', '25');
INSERT INTO `sys_role_menu` VALUES ('4', '26');
INSERT INTO `sys_role_menu` VALUES ('4', '27');
INSERT INTO `sys_role_menu` VALUES ('4', '28');
INSERT INTO `sys_role_menu` VALUES ('4', '29');
INSERT INTO `sys_role_menu` VALUES ('4', '3');
INSERT INTO `sys_role_menu` VALUES ('4', '30');
INSERT INTO `sys_role_menu` VALUES ('4', '31');
INSERT INTO `sys_role_menu` VALUES ('4', '32');
INSERT INTO `sys_role_menu` VALUES ('4', '33');
INSERT INTO `sys_role_menu` VALUES ('4', '34');
INSERT INTO `sys_role_menu` VALUES ('4', '35');
INSERT INTO `sys_role_menu` VALUES ('4', '36');
INSERT INTO `sys_role_menu` VALUES ('4', '37');
INSERT INTO `sys_role_menu` VALUES ('4', '38');
INSERT INTO `sys_role_menu` VALUES ('4', '39');
INSERT INTO `sys_role_menu` VALUES ('4', '4');
INSERT INTO `sys_role_menu` VALUES ('4', '40');
INSERT INTO `sys_role_menu` VALUES ('4', '41');
INSERT INTO `sys_role_menu` VALUES ('4', '42');
INSERT INTO `sys_role_menu` VALUES ('4', '43');
INSERT INTO `sys_role_menu` VALUES ('4', '44');
INSERT INTO `sys_role_menu` VALUES ('4', '45');
INSERT INTO `sys_role_menu` VALUES ('4', '46');
INSERT INTO `sys_role_menu` VALUES ('4', '47');
INSERT INTO `sys_role_menu` VALUES ('4', '48');
INSERT INTO `sys_role_menu` VALUES ('4', '49');
INSERT INTO `sys_role_menu` VALUES ('4', '5');
INSERT INTO `sys_role_menu` VALUES ('4', '50');
INSERT INTO `sys_role_menu` VALUES ('4', '51');
INSERT INTO `sys_role_menu` VALUES ('4', '52');
INSERT INTO `sys_role_menu` VALUES ('4', '53');
INSERT INTO `sys_role_menu` VALUES ('4', '54');
INSERT INTO `sys_role_menu` VALUES ('4', '55');
INSERT INTO `sys_role_menu` VALUES ('4', '56');
INSERT INTO `sys_role_menu` VALUES ('4', '57');
INSERT INTO `sys_role_menu` VALUES ('4', '58');
INSERT INTO `sys_role_menu` VALUES ('4', '59');
INSERT INTO `sys_role_menu` VALUES ('4', '6');
INSERT INTO `sys_role_menu` VALUES ('4', '60');
INSERT INTO `sys_role_menu` VALUES ('4', '61');
INSERT INTO `sys_role_menu` VALUES ('4', '62');
INSERT INTO `sys_role_menu` VALUES ('4', '63');
INSERT INTO `sys_role_menu` VALUES ('4', '64');
INSERT INTO `sys_role_menu` VALUES ('4', '65');
INSERT INTO `sys_role_menu` VALUES ('4', '66');
INSERT INTO `sys_role_menu` VALUES ('4', '67');
INSERT INTO `sys_role_menu` VALUES ('4', '68');
INSERT INTO `sys_role_menu` VALUES ('4', '69');
INSERT INTO `sys_role_menu` VALUES ('4', '7');
INSERT INTO `sys_role_menu` VALUES ('4', '70');
INSERT INTO `sys_role_menu` VALUES ('4', '8');
INSERT INTO `sys_role_menu` VALUES ('4', '9');
INSERT INTO `sys_role_menu` VALUES ('5', '1');
INSERT INTO `sys_role_menu` VALUES ('5', '10');
INSERT INTO `sys_role_menu` VALUES ('5', '11');
INSERT INTO `sys_role_menu` VALUES ('5', '12');
INSERT INTO `sys_role_menu` VALUES ('5', '13');
INSERT INTO `sys_role_menu` VALUES ('5', '14');
INSERT INTO `sys_role_menu` VALUES ('5', '15');
INSERT INTO `sys_role_menu` VALUES ('5', '16');
INSERT INTO `sys_role_menu` VALUES ('5', '17');
INSERT INTO `sys_role_menu` VALUES ('5', '18');
INSERT INTO `sys_role_menu` VALUES ('5', '19');
INSERT INTO `sys_role_menu` VALUES ('5', '2');
INSERT INTO `sys_role_menu` VALUES ('5', '20');
INSERT INTO `sys_role_menu` VALUES ('5', '21');
INSERT INTO `sys_role_menu` VALUES ('5', '22');
INSERT INTO `sys_role_menu` VALUES ('5', '23');
INSERT INTO `sys_role_menu` VALUES ('5', '24');
INSERT INTO `sys_role_menu` VALUES ('5', '25');
INSERT INTO `sys_role_menu` VALUES ('5', '26');
INSERT INTO `sys_role_menu` VALUES ('5', '27');
INSERT INTO `sys_role_menu` VALUES ('5', '28');
INSERT INTO `sys_role_menu` VALUES ('5', '29');
INSERT INTO `sys_role_menu` VALUES ('5', '3');
INSERT INTO `sys_role_menu` VALUES ('5', '30');
INSERT INTO `sys_role_menu` VALUES ('5', '31');
INSERT INTO `sys_role_menu` VALUES ('5', '32');
INSERT INTO `sys_role_menu` VALUES ('5', '33');
INSERT INTO `sys_role_menu` VALUES ('5', '34');
INSERT INTO `sys_role_menu` VALUES ('5', '35');
INSERT INTO `sys_role_menu` VALUES ('5', '36');
INSERT INTO `sys_role_menu` VALUES ('5', '37');
INSERT INTO `sys_role_menu` VALUES ('5', '38');
INSERT INTO `sys_role_menu` VALUES ('5', '39');
INSERT INTO `sys_role_menu` VALUES ('5', '4');
INSERT INTO `sys_role_menu` VALUES ('5', '40');
INSERT INTO `sys_role_menu` VALUES ('5', '41');
INSERT INTO `sys_role_menu` VALUES ('5', '42');
INSERT INTO `sys_role_menu` VALUES ('5', '43');
INSERT INTO `sys_role_menu` VALUES ('5', '44');
INSERT INTO `sys_role_menu` VALUES ('5', '45');
INSERT INTO `sys_role_menu` VALUES ('5', '46');
INSERT INTO `sys_role_menu` VALUES ('5', '47');
INSERT INTO `sys_role_menu` VALUES ('5', '48');
INSERT INTO `sys_role_menu` VALUES ('5', '49');
INSERT INTO `sys_role_menu` VALUES ('5', '5');
INSERT INTO `sys_role_menu` VALUES ('5', '50');
INSERT INTO `sys_role_menu` VALUES ('5', '51');
INSERT INTO `sys_role_menu` VALUES ('5', '52');
INSERT INTO `sys_role_menu` VALUES ('5', '53');
INSERT INTO `sys_role_menu` VALUES ('5', '54');
INSERT INTO `sys_role_menu` VALUES ('5', '55');
INSERT INTO `sys_role_menu` VALUES ('5', '56');
INSERT INTO `sys_role_menu` VALUES ('5', '57');
INSERT INTO `sys_role_menu` VALUES ('5', '58');
INSERT INTO `sys_role_menu` VALUES ('5', '59');
INSERT INTO `sys_role_menu` VALUES ('5', '6');
INSERT INTO `sys_role_menu` VALUES ('5', '60');
INSERT INTO `sys_role_menu` VALUES ('5', '61');
INSERT INTO `sys_role_menu` VALUES ('5', '62');
INSERT INTO `sys_role_menu` VALUES ('5', '63');
INSERT INTO `sys_role_menu` VALUES ('5', '64');
INSERT INTO `sys_role_menu` VALUES ('5', '65');
INSERT INTO `sys_role_menu` VALUES ('5', '66');
INSERT INTO `sys_role_menu` VALUES ('5', '67');
INSERT INTO `sys_role_menu` VALUES ('5', '68');
INSERT INTO `sys_role_menu` VALUES ('5', '69');
INSERT INTO `sys_role_menu` VALUES ('5', '7');
INSERT INTO `sys_role_menu` VALUES ('5', '70');
INSERT INTO `sys_role_menu` VALUES ('5', '8');
INSERT INTO `sys_role_menu` VALUES ('5', '9');
INSERT INTO `sys_role_menu` VALUES ('6', '1');
INSERT INTO `sys_role_menu` VALUES ('6', '10');
INSERT INTO `sys_role_menu` VALUES ('6', '11');
INSERT INTO `sys_role_menu` VALUES ('6', '12');
INSERT INTO `sys_role_menu` VALUES ('6', '13');
INSERT INTO `sys_role_menu` VALUES ('6', '14');
INSERT INTO `sys_role_menu` VALUES ('6', '15');
INSERT INTO `sys_role_menu` VALUES ('6', '16');
INSERT INTO `sys_role_menu` VALUES ('6', '17');
INSERT INTO `sys_role_menu` VALUES ('6', '18');
INSERT INTO `sys_role_menu` VALUES ('6', '19');
INSERT INTO `sys_role_menu` VALUES ('6', '2');
INSERT INTO `sys_role_menu` VALUES ('6', '20');
INSERT INTO `sys_role_menu` VALUES ('6', '21');
INSERT INTO `sys_role_menu` VALUES ('6', '22');
INSERT INTO `sys_role_menu` VALUES ('6', '23');
INSERT INTO `sys_role_menu` VALUES ('6', '24');
INSERT INTO `sys_role_menu` VALUES ('6', '25');
INSERT INTO `sys_role_menu` VALUES ('6', '26');
INSERT INTO `sys_role_menu` VALUES ('6', '27');
INSERT INTO `sys_role_menu` VALUES ('6', '28');
INSERT INTO `sys_role_menu` VALUES ('6', '29');
INSERT INTO `sys_role_menu` VALUES ('6', '3');
INSERT INTO `sys_role_menu` VALUES ('6', '30');
INSERT INTO `sys_role_menu` VALUES ('6', '31');
INSERT INTO `sys_role_menu` VALUES ('6', '32');
INSERT INTO `sys_role_menu` VALUES ('6', '33');
INSERT INTO `sys_role_menu` VALUES ('6', '34');
INSERT INTO `sys_role_menu` VALUES ('6', '35');
INSERT INTO `sys_role_menu` VALUES ('6', '36');
INSERT INTO `sys_role_menu` VALUES ('6', '37');
INSERT INTO `sys_role_menu` VALUES ('6', '38');
INSERT INTO `sys_role_menu` VALUES ('6', '39');
INSERT INTO `sys_role_menu` VALUES ('6', '4');
INSERT INTO `sys_role_menu` VALUES ('6', '40');
INSERT INTO `sys_role_menu` VALUES ('6', '41');
INSERT INTO `sys_role_menu` VALUES ('6', '42');
INSERT INTO `sys_role_menu` VALUES ('6', '43');
INSERT INTO `sys_role_menu` VALUES ('6', '44');
INSERT INTO `sys_role_menu` VALUES ('6', '45');
INSERT INTO `sys_role_menu` VALUES ('6', '46');
INSERT INTO `sys_role_menu` VALUES ('6', '47');
INSERT INTO `sys_role_menu` VALUES ('6', '48');
INSERT INTO `sys_role_menu` VALUES ('6', '49');
INSERT INTO `sys_role_menu` VALUES ('6', '5');
INSERT INTO `sys_role_menu` VALUES ('6', '50');
INSERT INTO `sys_role_menu` VALUES ('6', '51');
INSERT INTO `sys_role_menu` VALUES ('6', '52');
INSERT INTO `sys_role_menu` VALUES ('6', '53');
INSERT INTO `sys_role_menu` VALUES ('6', '54');
INSERT INTO `sys_role_menu` VALUES ('6', '55');
INSERT INTO `sys_role_menu` VALUES ('6', '56');
INSERT INTO `sys_role_menu` VALUES ('6', '57');
INSERT INTO `sys_role_menu` VALUES ('6', '58');
INSERT INTO `sys_role_menu` VALUES ('6', '59');
INSERT INTO `sys_role_menu` VALUES ('6', '6');
INSERT INTO `sys_role_menu` VALUES ('6', '60');
INSERT INTO `sys_role_menu` VALUES ('6', '61');
INSERT INTO `sys_role_menu` VALUES ('6', '62');
INSERT INTO `sys_role_menu` VALUES ('6', '63');
INSERT INTO `sys_role_menu` VALUES ('6', '64');
INSERT INTO `sys_role_menu` VALUES ('6', '65');
INSERT INTO `sys_role_menu` VALUES ('6', '66');
INSERT INTO `sys_role_menu` VALUES ('6', '67');
INSERT INTO `sys_role_menu` VALUES ('6', '68');
INSERT INTO `sys_role_menu` VALUES ('6', '69');
INSERT INTO `sys_role_menu` VALUES ('6', '7');
INSERT INTO `sys_role_menu` VALUES ('6', '70');
INSERT INTO `sys_role_menu` VALUES ('6', '8');
INSERT INTO `sys_role_menu` VALUES ('6', '9');
INSERT INTO `sys_role_menu` VALUES ('7', '1');
INSERT INTO `sys_role_menu` VALUES ('7', '10');
INSERT INTO `sys_role_menu` VALUES ('7', '11');
INSERT INTO `sys_role_menu` VALUES ('7', '12');
INSERT INTO `sys_role_menu` VALUES ('7', '13');
INSERT INTO `sys_role_menu` VALUES ('7', '14');
INSERT INTO `sys_role_menu` VALUES ('7', '15');
INSERT INTO `sys_role_menu` VALUES ('7', '16');
INSERT INTO `sys_role_menu` VALUES ('7', '17');
INSERT INTO `sys_role_menu` VALUES ('7', '18');
INSERT INTO `sys_role_menu` VALUES ('7', '19');
INSERT INTO `sys_role_menu` VALUES ('7', '2');
INSERT INTO `sys_role_menu` VALUES ('7', '20');
INSERT INTO `sys_role_menu` VALUES ('7', '21');
INSERT INTO `sys_role_menu` VALUES ('7', '22');
INSERT INTO `sys_role_menu` VALUES ('7', '23');
INSERT INTO `sys_role_menu` VALUES ('7', '24');
INSERT INTO `sys_role_menu` VALUES ('7', '25');
INSERT INTO `sys_role_menu` VALUES ('7', '26');
INSERT INTO `sys_role_menu` VALUES ('7', '27');
INSERT INTO `sys_role_menu` VALUES ('7', '28');
INSERT INTO `sys_role_menu` VALUES ('7', '29');
INSERT INTO `sys_role_menu` VALUES ('7', '3');
INSERT INTO `sys_role_menu` VALUES ('7', '30');
INSERT INTO `sys_role_menu` VALUES ('7', '31');
INSERT INTO `sys_role_menu` VALUES ('7', '32');
INSERT INTO `sys_role_menu` VALUES ('7', '33');
INSERT INTO `sys_role_menu` VALUES ('7', '34');
INSERT INTO `sys_role_menu` VALUES ('7', '35');
INSERT INTO `sys_role_menu` VALUES ('7', '36');
INSERT INTO `sys_role_menu` VALUES ('7', '37');
INSERT INTO `sys_role_menu` VALUES ('7', '38');
INSERT INTO `sys_role_menu` VALUES ('7', '39');
INSERT INTO `sys_role_menu` VALUES ('7', '4');
INSERT INTO `sys_role_menu` VALUES ('7', '40');
INSERT INTO `sys_role_menu` VALUES ('7', '41');
INSERT INTO `sys_role_menu` VALUES ('7', '42');
INSERT INTO `sys_role_menu` VALUES ('7', '43');
INSERT INTO `sys_role_menu` VALUES ('7', '44');
INSERT INTO `sys_role_menu` VALUES ('7', '45');
INSERT INTO `sys_role_menu` VALUES ('7', '46');
INSERT INTO `sys_role_menu` VALUES ('7', '47');
INSERT INTO `sys_role_menu` VALUES ('7', '48');
INSERT INTO `sys_role_menu` VALUES ('7', '49');
INSERT INTO `sys_role_menu` VALUES ('7', '5');
INSERT INTO `sys_role_menu` VALUES ('7', '50');
INSERT INTO `sys_role_menu` VALUES ('7', '51');
INSERT INTO `sys_role_menu` VALUES ('7', '52');
INSERT INTO `sys_role_menu` VALUES ('7', '53');
INSERT INTO `sys_role_menu` VALUES ('7', '54');
INSERT INTO `sys_role_menu` VALUES ('7', '55');
INSERT INTO `sys_role_menu` VALUES ('7', '56');
INSERT INTO `sys_role_menu` VALUES ('7', '57');
INSERT INTO `sys_role_menu` VALUES ('7', '58');
INSERT INTO `sys_role_menu` VALUES ('7', '59');
INSERT INTO `sys_role_menu` VALUES ('7', '6');
INSERT INTO `sys_role_menu` VALUES ('7', '60');
INSERT INTO `sys_role_menu` VALUES ('7', '61');
INSERT INTO `sys_role_menu` VALUES ('7', '62');
INSERT INTO `sys_role_menu` VALUES ('7', '63');
INSERT INTO `sys_role_menu` VALUES ('7', '64');
INSERT INTO `sys_role_menu` VALUES ('7', '65');
INSERT INTO `sys_role_menu` VALUES ('7', '66');
INSERT INTO `sys_role_menu` VALUES ('7', '67');
INSERT INTO `sys_role_menu` VALUES ('7', '68');
INSERT INTO `sys_role_menu` VALUES ('7', '69');
INSERT INTO `sys_role_menu` VALUES ('7', '7');
INSERT INTO `sys_role_menu` VALUES ('7', '70');
INSERT INTO `sys_role_menu` VALUES ('7', '8');
INSERT INTO `sys_role_menu` VALUES ('7', '9');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) collate utf8_bin NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) collate utf8_bin NOT NULL COMMENT '机构编号',
  PRIMARY KEY  (`role_id`,`office_id`),
  KEY `FK4639BC3345EC47DC` (`office_id`),
  KEY `FK4639BC33FF4B61C` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-机构';

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------
INSERT INTO `sys_role_office` VALUES ('7', '10');
INSERT INTO `sys_role_office` VALUES ('7', '11');
INSERT INTO `sys_role_office` VALUES ('7', '12');
INSERT INTO `sys_role_office` VALUES ('7', '13');
INSERT INTO `sys_role_office` VALUES ('7', '14');
INSERT INTO `sys_role_office` VALUES ('7', '15');
INSERT INTO `sys_role_office` VALUES ('7', '16');
INSERT INTO `sys_role_office` VALUES ('7', '17');
INSERT INTO `sys_role_office` VALUES ('7', '18');
INSERT INTO `sys_role_office` VALUES ('7', '19');
INSERT INTO `sys_role_office` VALUES ('7', '20');
INSERT INTO `sys_role_office` VALUES ('7', '21');
INSERT INTO `sys_role_office` VALUES ('7', '22');
INSERT INTO `sys_role_office` VALUES ('7', '23');
INSERT INTO `sys_role_office` VALUES ('7', '24');
INSERT INTO `sys_role_office` VALUES ('7', '25');
INSERT INTO `sys_role_office` VALUES ('7', '26');
INSERT INTO `sys_role_office` VALUES ('7', '7');
INSERT INTO `sys_role_office` VALUES ('7', '8');
INSERT INTO `sys_role_office` VALUES ('7', '9');

-- ----------------------------
-- Table structure for sys_sequence
-- ----------------------------
DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE `sys_sequence` (
  `name` varchar(50) NOT NULL,
  `current_value` int(11) NOT NULL,
  `increment` int(11) NOT NULL default '1',
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_sequence
-- ----------------------------
INSERT INTO `sys_sequence` VALUES ('booking_no', '10', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '编号',
  `company_id` varchar(64) collate utf8_bin NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) collate utf8_bin NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) collate utf8_bin NOT NULL COMMENT '登录名',
  `password` varchar(100) collate utf8_bin NOT NULL COMMENT '密码',
  `no` varchar(100) collate utf8_bin default NULL COMMENT '工号',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '姓名',
  `email` varchar(200) collate utf8_bin default NULL COMMENT '邮箱',
  `phone` varchar(200) collate utf8_bin default NULL COMMENT '电话',
  `mobile` varchar(200) collate utf8_bin default NULL COMMENT '手机',
  `user_type` char(1) collate utf8_bin default NULL COMMENT '用户类型',
  `login_ip` varchar(100) collate utf8_bin default NULL COMMENT '最后登陆IP',
  `login_date` datetime default NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_user_office_id` USING BTREE (`office_id`),
  KEY `sys_user_login_name` USING BTREE (`login_name`),
  KEY `sys_user_company_id` USING BTREE (`company_id`),
  KEY `sys_user_update_date` USING BTREE (`update_date`),
  KEY `sys_user_del_flag` USING BTREE (`del_flag`),
  KEY `FK74A81DFDE18EEA67` (`create_by`),
  KEY `FK74A81DFD49B6237A` (`update_by`),
  KEY `FK74A81DFD9976E67B` (`company_id`),
  KEY `FK74A81DFD45EC47DC` (`office_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('2', '1', '1', 'admin1', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0001', 'Thinkgem', 'thinkgem@163.com', '8675', '8675', null, '127.0.0.1', '2016-01-13 17:04:03', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '最高管理员', '0');
INSERT INTO `sys_user` VALUES ('1', '1', '1', 'admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0002', '管理员', 'thinkgem@163.com', '8675', '8675', '1', '127.0.0.1', '2016-03-22 15:54:25', '1', '2013-05-27 08:00:00', '1', '2016-01-13 15:42:56', '管理员', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) collate utf8_bin NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) collate utf8_bin NOT NULL COMMENT '角色编号',
  PRIMARY KEY  (`user_id`,`role_id`),
  KEY `FK660C5178FF4B61C` (`role_id`),
  KEY `FK660C5178B51F79FC` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户-角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
