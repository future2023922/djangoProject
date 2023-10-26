/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 80023
Source Host           : localhost:3306
Source Database       : orm_test

Target Server Type    : MYSQL
Target Server Version : 80023
File Encoding         : 65001

Date: 2023-10-26 13:35:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add user info', '7', 'add_userinfo');
INSERT INTO `auth_permission` VALUES ('26', 'Can change user info', '7', 'change_userinfo');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete user info', '7', 'delete_userinfo');
INSERT INTO `auth_permission` VALUES ('28', 'Can view user info', '7', 'view_userinfo');
INSERT INTO `auth_permission` VALUES ('29', 'Can add department', '8', 'add_department');
INSERT INTO `auth_permission` VALUES ('30', 'Can change department', '8', 'change_department');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete department', '8', 'delete_department');
INSERT INTO `auth_permission` VALUES ('32', 'Can view department', '8', 'view_department');
INSERT INTO `auth_permission` VALUES ('33', 'Can add user info', '9', 'add_userinfo');
INSERT INTO `auth_permission` VALUES ('34', 'Can change user info', '9', 'change_userinfo');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete user info', '9', 'delete_userinfo');
INSERT INTO `auth_permission` VALUES ('36', 'Can view user info', '9', 'view_userinfo');
INSERT INTO `auth_permission` VALUES ('37', 'Can add pretty num', '10', 'add_prettynum');
INSERT INTO `auth_permission` VALUES ('38', 'Can change pretty num', '10', 'change_prettynum');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete pretty num', '10', 'delete_prettynum');
INSERT INTO `auth_permission` VALUES ('40', 'Can view pretty num', '10', 'view_prettynum');
INSERT INTO `auth_permission` VALUES ('41', 'Can add admin', '11', 'add_admin');
INSERT INTO `auth_permission` VALUES ('42', 'Can change admin', '11', 'change_admin');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete admin', '11', 'delete_admin');
INSERT INTO `auth_permission` VALUES ('44', 'Can view admin', '11', 'view_admin');
INSERT INTO `auth_permission` VALUES ('45', 'Can add task', '12', 'add_task');
INSERT INTO `auth_permission` VALUES ('46', 'Can change task', '12', 'change_task');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete task', '12', 'delete_task');
INSERT INTO `auth_permission` VALUES ('48', 'Can view task', '12', 'view_task');
INSERT INTO `auth_permission` VALUES ('49', 'Can add order', '13', 'add_order');
INSERT INTO `auth_permission` VALUES ('50', 'Can change order', '13', 'change_order');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete order', '13', 'delete_order');
INSERT INTO `auth_permission` VALUES ('52', 'Can view order', '13', 'view_order');
INSERT INTO `auth_permission` VALUES ('53', 'Can add boss info', '14', 'add_bossinfo');
INSERT INTO `auth_permission` VALUES ('54', 'Can change boss info', '14', 'change_bossinfo');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete boss info', '14', 'delete_bossinfo');
INSERT INTO `auth_permission` VALUES ('56', 'Can view boss info', '14', 'view_bossinfo');
INSERT INTO `auth_permission` VALUES ('57', 'Can add city', '15', 'add_city');
INSERT INTO `auth_permission` VALUES ('58', 'Can change city', '15', 'change_city');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete city', '15', 'delete_city');
INSERT INTO `auth_permission` VALUES ('60', 'Can view city', '15', 'view_city');
INSERT INTO `auth_permission` VALUES ('61', 'Can add category', '16', 'add_category');
INSERT INTO `auth_permission` VALUES ('62', 'Can change category', '16', 'change_category');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete category', '16', 'delete_category');
INSERT INTO `auth_permission` VALUES ('64', 'Can view category', '16', 'view_category');
INSERT INTO `auth_permission` VALUES ('65', 'Can add product', '17', 'add_product');
INSERT INTO `auth_permission` VALUES ('66', 'Can change product', '17', 'change_product');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete product', '17', 'delete_product');
INSERT INTO `auth_permission` VALUES ('68', 'Can view product', '17', 'view_product');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for blog_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `blog_userinfo`;
CREATE TABLE `blog_userinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(16) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `data` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_userinfo
-- ----------------------------
INSERT INTO `blog_userinfo` VALUES ('11', 'wss', '0', '222', '女', '2321@qq.com', null);
INSERT INTO `blog_userinfo` VALUES ('12', 'gg', 'wwty', '12', '女', '2321@qq.com', null);
INSERT INTO `blog_userinfo` VALUES ('13', 'gg', 'wwty', '12', '女', '2321@qq.com', null);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('7', 'blog', 'userinfo');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('11', 'staffing_system', 'admin');
INSERT INTO `django_content_type` VALUES ('14', 'staffing_system', 'bossinfo');
INSERT INTO `django_content_type` VALUES ('16', 'staffing_system', 'category');
INSERT INTO `django_content_type` VALUES ('15', 'staffing_system', 'city');
INSERT INTO `django_content_type` VALUES ('8', 'staffing_system', 'department');
INSERT INTO `django_content_type` VALUES ('13', 'staffing_system', 'order');
INSERT INTO `django_content_type` VALUES ('10', 'staffing_system', 'prettynum');
INSERT INTO `django_content_type` VALUES ('17', 'staffing_system', 'product');
INSERT INTO `django_content_type` VALUES ('12', 'staffing_system', 'task');
INSERT INTO `django_content_type` VALUES ('9', 'staffing_system', 'userinfo');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2023-04-23 06:27:44.943970');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2023-04-23 06:27:45.664660');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2023-04-23 06:27:45.845398');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2023-04-23 06:27:45.854416');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2023-04-23 06:27:45.863409');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2023-04-23 06:27:45.981437');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2023-04-23 06:27:46.056444');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2023-04-23 06:27:46.127502');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2023-04-23 06:27:46.137843');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2023-04-23 06:27:46.196847');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2023-04-23 06:27:46.201847');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2023-04-23 06:27:46.212861');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2023-04-23 06:27:46.285448');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2023-04-23 06:27:46.355507');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2023-04-23 06:27:46.423127');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2023-04-23 06:27:46.431130');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0012_alter_user_first_name_max_length', '2023-04-23 06:27:46.497176');
INSERT INTO `django_migrations` VALUES ('18', 'blog', '0001_initial', '2023-04-23 06:27:46.541809');
INSERT INTO `django_migrations` VALUES ('19', 'sessions', '0001_initial', '2023-04-23 06:27:46.585818');
INSERT INTO `django_migrations` VALUES ('20', 'blog', '0002_userinfo_gender', '2023-04-23 06:38:11.825771');
INSERT INTO `django_migrations` VALUES ('21', 'blog', '0002_auto_20230423_1450', '2023-04-23 06:50:58.857673');
INSERT INTO `django_migrations` VALUES ('22', 'blog', '0002_auto_20230423_1454', '2023-04-23 06:54:53.430267');
INSERT INTO `django_migrations` VALUES ('23', 'blog', '0003_userinfo_email', '2023-04-23 07:31:09.671667');
INSERT INTO `django_migrations` VALUES ('24', 'blog', '0004_userinfo_data', '2023-04-23 07:33:55.158570');
INSERT INTO `django_migrations` VALUES ('25', 'blog', '0005_auto_20230423_1539', '2023-04-23 07:39:21.258065');
INSERT INTO `django_migrations` VALUES ('26', 'blog', '0006_alter_userinfo_gender', '2023-04-23 08:27:28.074119');
INSERT INTO `django_migrations` VALUES ('27', 'staffing_system', '0001_initial', '2023-04-23 15:37:07.692328');
INSERT INTO `django_migrations` VALUES ('28', 'staffing_system', '0002_auto_20230426_2153', '2023-04-26 13:53:36.250484');
INSERT INTO `django_migrations` VALUES ('29', 'staffing_system', '0003_prettynum', '2023-04-27 06:59:52.339874');
INSERT INTO `django_migrations` VALUES ('30', 'staffing_system', '0004_admin', '2023-05-11 02:18:59.146143');
INSERT INTO `django_migrations` VALUES ('31', 'staffing_system', '0005_task', '2023-05-17 01:40:56.333844');
INSERT INTO `django_migrations` VALUES ('32', 'staffing_system', '0006_rename_user_task_admin', '2023-05-17 02:12:14.161874');
INSERT INTO `django_migrations` VALUES ('33', 'staffing_system', '0007_order', '2023-05-17 12:59:09.916029');
INSERT INTO `django_migrations` VALUES ('34', 'staffing_system', '0008_alter_userinfo_password', '2023-05-20 02:36:44.870049');
INSERT INTO `django_migrations` VALUES ('35', 'staffing_system', '0009_bossinfo', '2023-05-21 13:16:43.162288');
INSERT INTO `django_migrations` VALUES ('36', 'staffing_system', '0010_city', '2023-05-22 09:41:25.322004');
INSERT INTO `django_migrations` VALUES ('37', 'staffing_system', '0011_category_product_alter_city_img', '2023-10-26 03:04:01.184166');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('05xbr48pmccxrj3dso3vasjh3opdfbzb', 'eyJpbWFnZV9jb2RlIjoiVVlJTUMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qZ4Qx:O-owO_D0GUkDJuOdO2sNUPsSNr5OgDotFShxPBJCT_4', '2023-08-24 07:08:11.667915');
INSERT INTO `django_session` VALUES ('0lwb7ebh1chpxxyz4qs6x3w5q9c5p5sk', 'eyJpbWFnZV9jb2RlIjoiV0RDTUgiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1q0Cb7:ygYMhDBnMzFuXz5R5-VKA3jstZuBHPQcP87NRhaN6tI', '2023-05-20 02:46:33.172195');
INSERT INTO `django_session` VALUES ('0lz0j71vwbbe6qk1qncuydljxu1iws5a', 'eyJpbWFnZV9jb2RlIjoiRk1aVVYiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1q0CUw:OJBNlz9sfTTc8a48USM_dELaTBVxowzpKe_k2Aq0ZrQ', '2023-05-20 02:40:10.195341');
INSERT INTO `django_session` VALUES ('1rkk0dfu1quv7ydxtsdqv57fytt0nhmc', 'eyJpbWFnZV9jb2RlIjoiUkFRQkQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qvqln:RfrR6EExG6RKpHOpECW6phAFezWAHn1xZdp8xFCy0I8', '2023-10-26 03:11:51.563246');
INSERT INTO `django_session` VALUES ('2ns8xogc2x6an6rxhi3ay92879m4frb9', 'eyJpbWFnZV9jb2RlIjoiR0NOT0QiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1pylfm:vVwSFo5vyJ0t9z0SSzINeGMBsGcNiYE7RG5RnGtx68w', '2023-05-16 03:49:26.869051');
INSERT INTO `django_session` VALUES ('3c05eky829m35uiv4dodh6utryjearqy', 'eyJpbWFnZV9jb2RlIjoiWEFMUVciLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qZ4W7:c26jAJ1CXemt0ePid2WT-XxLtHPSQ26a23zN7R51vqU', '2023-08-24 07:13:31.201073');
INSERT INTO `django_session` VALUES ('3cn7921rby5xw7lzt330s6rnkce10nrq', 'eyJpbWFnZV9jb2RlIjoiV1BQQ1MiLCJfc2Vzc2lvbl9leHBpcnkiOjYwLCJpbmZvIjp7ImlkIjoxNiwibmFtZSI6Ilx1NTE0ZFx1OGQzOSJ9fQ:1qvqe1:eLSLKwA4cXU6AFf8R5lqFYEeJqxeaC_9rqGsFo7yW70', '2023-10-26 03:03:49.169804');
INSERT INTO `django_session` VALUES ('3dur60wf7qmdvurq8brgbixzfz7vswym', 'eyJpbWFnZV9jb2RlIjoiVURDQkQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qCM0h:rT1ZWqRtV8STS0V9bkkI3DfY2UBb1NQnMrQ-UnkgBIE', '2023-06-22 15:15:11.667778');
INSERT INTO `django_session` VALUES ('4tmb9zxllgb102uwmxp9v63djp8tbjjf', 'eyJpbWFnZV9jb2RlIjoiRlBQUUIiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1pyYZw:ZcFTisg9z43NRW0AL1ew2nFAb8g62CLX0dLX9y29URU', '2023-05-15 13:50:32.361508');
INSERT INTO `django_session` VALUES ('58omrrqe2gwyvmgxj3k5oan87webj5i1', 'eyJpbWFnZV9jb2RlIjoiQ0dYTkIiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJc6p:lWShqxJ4-eZPRCy6N29kemIrWJP7EbnOLQyqOyo6uDE', '2023-07-12 15:51:31.953587');
INSERT INTO `django_session` VALUES ('5cstimv5hcc5otk2s0oky8x2t22rh7it', 'eyJpbWFnZV9jb2RlIjoiWkxaVFYiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJbuV:-3A9IzTUb0RoO9yeuf1M3vLLeIhf5-yxz3xTZ5Pgqak', '2023-07-12 15:38:47.151847');
INSERT INTO `django_session` VALUES ('5ogh9anfw07uhdz0yu0m3xu4491lf54m', 'eyJpbWFnZV9jb2RlIjoiQlNDTU8iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJclp:7_EsZ-r2cuXvkxQ7sT_nd2stCR_P4yhu81KMsu0EPUU', '2023-07-12 16:33:53.457988');
INSERT INTO `django_session` VALUES ('5r5vs2xkxnwf4wflll395uho45p29h7x', 'eyJpbWFnZV9jb2RlIjoiU0NNWFUiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1pymBq:Xk-mAXXI7UPguFCjyfSyel6PTAHO6_eWNqsA77LJQCQ', '2023-05-16 04:22:34.215192');
INSERT INTO `django_session` VALUES ('61py8gwywz4j7wyntkr1ergfrro7hp43', 'eyJpbWFnZV9jb2RlIjoiUVBEQkYiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1q0BzW:w3BgogqABYUPbHQIUj6BAnR4w_UIDlXheRuHE3WpGJk', '2023-05-20 02:07:42.877984');
INSERT INTO `django_session` VALUES ('69qvlrzgt1qioarca3vn4qcqw05f60t7', 'eyJpbWFnZV9jb2RlIjoiWlJXQVoiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJcEO:KhoZwgvQmRhRRm7WV_ZFoOuSAl0guDn8704t2oPI-qg', '2023-07-12 15:59:20.897166');
INSERT INTO `django_session` VALUES ('6uu55wtzvdiztk8v2gaviylw6rownw6g', 'eyJpbWFnZV9jb2RlIjoiUkdERUwiLCJfc2Vzc2lvbl9leHBpcnkiOjYwNDgwMCwiaW5mbyI6eyJpZCI6MSwibmFtZSI6Im9vb28ifX0:1qRap5:IuCLKMqOGt8oEPxPSO-p4ZNWUGDK0by5Sqn0NhW4J7o', '2023-08-10 16:05:11.484933');
INSERT INTO `django_session` VALUES ('854f6glzqt58unrz7mhzxqaa9r9szumh', 'eyJpbWFnZV9jb2RlIjoiQUhCS1MiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qvsnm:cWvn84W0z6Lzm8DVIDbY7aESqowHmTTaJMMzKkfV7WA', '2023-10-26 05:22:02.564043');
INSERT INTO `django_session` VALUES ('8heb8d8d6qaf4q83t6wlz60ohns7om7t', 'eyJpbWFnZV9jb2RlIjoiQUJGRk0iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1pym7q:DdIKTPaVDXyQXpLoEjeEJbY-cA1gqKVDmVeweQJC0vw', '2023-05-16 04:18:26.664698');
INSERT INTO `django_session` VALUES ('8xc5198viejjyhb1pgl22hg4t6j429nt', 'eyJpbWFnZV9jb2RlIjoiTVhZS0QiLCJfc2Vzc2lvbl9leHBpcnkiOjYwNDgwMCwiaW5mbyI6eyJpZCI6MTYsIm5hbWUiOiJcdTUxNGRcdThkMzkifX0:1qvBOM:e34e4B_Kt0vXmPMyKELK8U7uel0FbUSsxuE-C6pZY1Q', '2023-10-31 06:59:54.273881');
INSERT INTO `django_session` VALUES ('8ys4te177l3t1zdn41g53wtsw7xa18ze', 'eyJpbWFnZV9jb2RlIjoiTVVERVIiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJbsz:zRtFBufJki2b7v5X6cNmHCqjVnuauWTRdR91GVgaUZE', '2023-07-12 15:37:13.018922');
INSERT INTO `django_session` VALUES ('9hhfz7c68bly7jqru9lm9f3hql50tvdh', 'eyJpbWFnZV9jb2RlIjoiU0FEUUYiLCJfc2Vzc2lvbl9leHBpcnkiOjYwLCJpbmZvIjp7ImlkIjoxNiwibmFtZSI6Ilx1NTE0ZFx1OGQzOSJ9fQ:1q0eKO:GjAyknHIp9ore0sVHNrI4_Z7cUVb-JEI0ap7aE4_UGE', '2023-05-21 08:23:08.275373');
INSERT INTO `django_session` VALUES ('9j5uagdkcyiyf0qy93mdgin1qxd0pbdc', 'eyJpbWFnZV9jb2RlIjoiVEtDS1giLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJbxw:0hqu6FtBrxyxuV2Jxl5W-MhFrcRCfD9tCgBe9JxzQiU', '2023-07-12 15:42:20.582259');
INSERT INTO `django_session` VALUES ('9j9f8pa3mooubel4hwg61yemuf82aqa8', 'eyJpbWFnZV9jb2RlIjoiRFZDWFoiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1q0CYf:3zJOSQHU01bbehHFKdBxq4meowFn0vYF4nTb6VFKutw', '2023-05-20 02:44:01.727167');
INSERT INTO `django_session` VALUES ('9mvdzjkr4aqwk2hw4tpngg0cvzz8kpv5', 'eyJpbWFnZV9jb2RlIjoiSERNT0EiLCJfc2Vzc2lvbl9leHBpcnkiOjYwNDgwMCwiaW5mbyI6eyJpZCI6MSwibmFtZSI6Im9vb28ifX0:1qZ4uf:CG44651uzISXC5JcFa88bcF2xMEyxd-KqwL-AhBQPx8', '2023-08-31 07:37:53.269334');
INSERT INTO `django_session` VALUES ('asq5y9re2uiseby6ju0yf8z2zocsxcpz', 'eyJpbWFnZV9jb2RlIjoiQkpQT0oiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJceI:QIFaQyEQHrNOoxJeCcm5IcCVA63S5JE2RooaU8FSeb8', '2023-07-12 16:26:06.025647');
INSERT INTO `django_session` VALUES ('bcs8lc713s3uuapsq74vaihs93oejqpj', 'eyJpbWFnZV9jb2RlIjoiQkZMR0YiLCJfc2Vzc2lvbl9leHBpcnkiOjYwLCJpbmZvIjp7ImlkIjoxNiwibmFtZSI6Ilx1NTE0ZFx1OGQzOSJ9fQ:1q0eEE:YNS-WmxbuiWvRQafJ8r8Q2yyY4ggxiSFQUwm-BsPynA', '2023-05-21 08:16:46.695242');
INSERT INTO `django_session` VALUES ('bwej43cc8zz2ps0p9lhd2h09hm0kzesz', 'eyJpbWFnZV9jb2RlIjoiWkxMSlUiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qCLuy:VX1ZolD4b2slAy3Av7CRLUOr6042-PC2PI7yoPfCxTc', '2023-06-22 15:09:16.128078');
INSERT INTO `django_session` VALUES ('c3y0s1jvcj93gocleozjdnrzex3o06eu', 'eyJpbWFnZV9jb2RlIjoiUFJHT1YiLCJfc2Vzc2lvbl9leHBpcnkiOjYwLCJpbmZvIjp7ImlkIjo2LCJuYW1lIjoiXHU0ZTAwXHU2ODM5XHU3MzJiXHU2NzYxIn19:1q0BxM:6MXDSDF_tynP27ICipIj6vAUvr58cHiLhkBe09EjCUk', '2023-05-20 02:05:28.250330');
INSERT INTO `django_session` VALUES ('d40j76iziu8k3yhx954lx0medpg3doz5', 'eyJpbWFnZV9jb2RlIjoiUFhQRVIiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJcOw:2MGmNSeMXM6-wqRLUK9hlMYsbJViUJdm_s4EbgYZ2YI', '2023-07-12 16:10:14.192975');
INSERT INTO `django_session` VALUES ('dd01eie3hz06i3qbyfspbwasq4uclgp8', 'eyJpbWFnZV9jb2RlIjoiQk5DWEsiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qvqpQ:WMl6DaEd7O6MLPmYTklZNI1ScekiHM9zre00-9Lq-Cc', '2023-10-26 03:15:36.003494');
INSERT INTO `django_session` VALUES ('f6dq5k251evexzkz33afphrqfsos2zdp', 'eyJpbWFnZV9jb2RlIjoiRlNTQUoiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJcK8:RCaniZe11_lHb74_vI599HuIrdJMvd7K8_C6HqNN8qs', '2023-07-12 16:05:16.659605');
INSERT INTO `django_session` VALUES ('fcgnkd6nhlyygjtf3ujrmcq8evm4hrc6', 'eyJpbWFnZV9jb2RlIjoiQURHSVMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1pypDB:tn6AZxi1jiv8IqodElhw-MCUuAz4ydTDwBgxWXXv9_U', '2023-05-16 07:36:09.873172');
INSERT INTO `django_session` VALUES ('fsjkmwuc058lyp83ub5pso99v4geldct', 'eyJpbWFnZV9jb2RlIjoiWUVFVVAiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qvqur:UeMzy1XwNX5ekmdTIcqZG7LL2jmRZ6YUUPP9Ias2cJE', '2023-10-26 03:21:13.491658');
INSERT INTO `django_session` VALUES ('gtqv0egfv2ljgrv1ctcvemhxe8tod5on', 'eyJpbWFnZV9jb2RlIjoiWlFKU0siLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qvqtr:WwfkEU0eVSFDD0F_uKjpUOi6wlWerfLIbaaOC0T01Xo', '2023-10-26 03:20:11.341352');
INSERT INTO `django_session` VALUES ('gy6ent0xii9bs8vdfz4ndry0m7tivn60', 'eyJpbWFnZV9jb2RlIjoiQ05IWVYiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJbYL:2d6ojVSniHQyjVDfoFKA8DnP2uAKVoOg6VZWWkmTZrE', '2023-07-12 15:15:53.623424');
INSERT INTO `django_session` VALUES ('h0sqxc221n6fiqjq5p9fb6rfw9s1iok1', 'eyJpbWFnZV9jb2RlIjoiWk5LS08iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJc37:XXBeXg4EAc-CytR4srKvQMAybf7It5DA5pTlRZzIQ_s', '2023-07-12 15:47:41.737184');
INSERT INTO `django_session` VALUES ('h84mnuoapxle7hporimw7wpmsg6q76bi', 'eyJpbWFnZV9jb2RlIjoiSlRFT0QiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJbft:N5E2MBAxsyeUYB4BSk1phim_i7egpOfz-mx6Z_RCp3g', '2023-07-12 15:23:41.193968');
INSERT INTO `django_session` VALUES ('ipa870dslq0fjd0xc8hy1q02s2niiku5', 'eyJpbWFnZV9jb2RlIjoiQkFSUFUiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJcjv:l5E5f8-LPDq_iW5sT_TMuDtYXC1oGpfuH9ShXbGRqoo', '2023-07-12 16:31:55.888334');
INSERT INTO `django_session` VALUES ('j42rr96yx7lk19m7d2ujxm4sgedr6l4q', 'eyJpbWFnZV9jb2RlIjoiQk9GRUQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJcTC:DUkEFw0Tlmr5Ez1fDF8T5TioyR4Pv46ATtD1tsQlQWI', '2023-07-12 16:14:38.131411');
INSERT INTO `django_session` VALUES ('k4xj4pwrfybxi2eq1lsh1rljox6nc4fl', 'eyJpbWFnZV9jb2RlIjoiSVpQRFMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJc9p:r-6Cbu2BzEV_gMx5gNVajjxvTveOZdW2ps6BmAqFGbM', '2023-07-12 15:54:37.037355');
INSERT INTO `django_session` VALUES ('kgu68eu4gp00d3r0tb3099vdjbie3uo8', 'eyJpbWFnZV9jb2RlIjoiQk9aVloiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJbbs:IXscJ_BYwaXSx8utwrAzKYHH81z9FH3GPCZk49EUJyg', '2023-07-12 15:19:32.457399');
INSERT INTO `django_session` VALUES ('lobk4gguajvzgm8jr4bhcs57vxeb1i4e', 'eyJpbWFnZV9jb2RlIjoiU1hXVUgiLCJfc2Vzc2lvbl9leHBpcnkiOjYwNDgwMCwiaW5mbyI6eyJpZCI6MTYsIm5hbWUiOiJcdTUxNGRcdThkMzkifX0:1q0ejy:x_RiOul0yBWDOxhiwJwyWxII_79ejQ4xz7BgpDx7dUA', '2023-05-28 08:48:34.286851');
INSERT INTO `django_session` VALUES ('luwpo7ctxqgwpvvdpohlwpj759fhwrwc', 'eyJpbWFnZV9jb2RlIjoiT0RFV0oiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qZ4Up:HE7Eb96wCwEQ_jwLsDpmkDzEREs4kcaZccjtQeJtOzw', '2023-08-24 07:12:11.672506');
INSERT INTO `django_session` VALUES ('m9n546xrqp2ac16s6cilolmv8mroens4', 'eyJpbWFnZV9jb2RlIjoiR0lBUkgiLCJfc2Vzc2lvbl9leHBpcnkiOjYwNDgwMCwiaW5mbyI6eyJpZCI6MTYsIm5hbWUiOiJcdTUxNGRcdThkMzkifX0:1q5dbe:CSdoDbChyJEZ5Pq9sXAqNBoiGslx75jNnxXdTCXZWCU', '2023-06-11 02:36:34.082027');
INSERT INTO `django_session` VALUES ('meb8szxzt67p1emwv6lafiiwf1n6n0mt', 'eyJpbWFnZV9jb2RlIjoiR0JBSFQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwLCJpbmZvIjp7ImlkIjoxOSwibmFtZSI6Ilx1NTE0ZFx1OGQzOSJ9fQ:1qvr76:kpPJFT7pnu5SpG51X7NSH9a4qRuTvGXhoV8tbc7Y6AY', '2023-10-26 03:33:52.224700');
INSERT INTO `django_session` VALUES ('moum89u2bvt6rj6pjd504sfd7n5peygv', 'eyJpbWFnZV9jb2RlIjoiSFFaUloiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qvqjB:KTMp_y6VLI-nK2jPJj_QMQHSxBMDWeka2GewcG9uSXU', '2023-10-26 03:09:09.474888');
INSERT INTO `django_session` VALUES ('ny2ll9syp2yb6utx3zbl698o3hzi58t8', 'eyJpbWFnZV9jb2RlIjoiU1JFVEwiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJcgO:ILX0aCnTKe5XiDaCmD_ip1XHjlZMfZHXQLrnUwTIyKs', '2023-07-12 16:28:16.322773');
INSERT INTO `django_session` VALUES ('otch9js019c0emi6ow05qf0msofwg3ld', 'eyJpbWFnZV9jb2RlIjoiT0pWSkwiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJbIh:ST609MIFIiwoS664Dpms4irDcyFra6nM8D_-J4ieLi4', '2023-07-12 14:59:43.145949');
INSERT INTO `django_session` VALUES ('p42k9vtfkmjcwaekgqg952ls7ewxwr1w', 'eyJpbWFnZV9jb2RlIjoiVE5KQ0QiLCJfc2Vzc2lvbl9leHBpcnkiOjYwNDgwMCwiaW5mbyI6eyJpZCI6MTAsIm5hbWUiOiJ3dyJ9fQ:1qJqlu:WMIhsnt7fz2q1lJwCteV1vfuKYiylFzk5MVzIxdduEw', '2023-07-20 07:29:54.022931');
INSERT INTO `django_session` VALUES ('ro1jg0a9e76zdkpg2n6j71ee0fq7v5wv', 'eyJpbWFnZV9jb2RlIjoiWldJVkoiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJcho:mFD6hw6wmzIPRVATh849g-7L9gcSfr1qtRwqHrErb0U', '2023-07-12 16:29:44.826879');
INSERT INTO `django_session` VALUES ('rubk9drmj06h7lv2qayt5qfrnve3mk67', 'eyJpbWFnZV9jb2RlIjoiVkZWVFAiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qRamP:G0vWP9Qt27P44J5EvOoch12kwIR-KivUFhNWh6ywZo4', '2023-08-03 16:03:25.880890');
INSERT INTO `django_session` VALUES ('shhdmid5kuydfjede5gl9kov4c9c9wyk', 'eyJpbWFnZV9jb2RlIjoiVFFBQVEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qvqgI:znElTjcxPuyjfL8njNrV0K5Hn80_a_Yuclp1V77qAPY', '2023-10-26 03:06:10.366246');
INSERT INTO `django_session` VALUES ('sxryi4d1jkps9m6vdlcmfp4pl0d18ll2', 'eyJpbWFnZV9jb2RlIjoiTFJDR1IiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJboN:MWm7R5ZuiDBYvxOe43yjAz-ke-tDw_yOoYLGa4KvLSQ', '2023-07-12 15:32:27.212478');
INSERT INTO `django_session` VALUES ('tzdbkxhcjlql0zm6gtl8czhv6dkjeyyt', 'eyJpbWFnZV9jb2RlIjoiU1dYVUYiLCJfc2Vzc2lvbl9leHBpcnkiOjYwNDgwMCwiaW5mbyI6eyJpZCI6MSwibmFtZSI6Im9vb28ifX0:1qRZlr:QUy-orvvD2z4nZN3TnP0fbToxAqMVeTs2GSlUUwqrCo', '2023-08-10 14:57:47.588357');
INSERT INTO `django_session` VALUES ('ua4vsz7bqi8g8npn66uonankx8plvkx4', 'eyJpbmZvIjp7ImlkIjo2LCJuYW1lIjoiXHU0ZTAwXHU2ODM5XHU3MzJiXHU2NzYxIn19:1pxg9x:d8-_r1D-Hwq2WOiqo0EpEj1UVfwDQzhs1dsONB4bsD4', '2023-05-27 03:43:05.609807');
INSERT INTO `django_session` VALUES ('utlloy6ibb4cjlwxde1bagprafizawlt', 'eyJpbWFnZV9jb2RlIjoiUkZRQ0MiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qRZk7:4cXU0jelO3cRAh7CJPbfk_Dxr6vyM7Nm7LaW0Q2BMBs', '2023-08-03 14:56:59.626986');
INSERT INTO `django_session` VALUES ('vk3aig788gekg7fha03a6ewgm5x5zad6', 'eyJpbWFnZV9jb2RlIjoiVlFRTk8iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJqfN:qOstcXtJbmtqcWHSmEM7T1_ma7deWYLyVzkNb2Jkwug', '2023-07-13 07:24:09.085153');
INSERT INTO `django_session` VALUES ('vwtdq1m61jds4aa8ib5pdquc23af7tmn', 'eyJpbWFnZV9jb2RlIjoiQkpPTVAiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJbkS:ypc0md8-P50LjWLmUvDPVhMhvmSNNSnz8YFfFd2H0uk', '2023-07-12 15:28:24.884860');
INSERT INTO `django_session` VALUES ('x12u7xaw6rtbbpinj3qqcd11d3oqc808', 'eyJpbWFnZV9jb2RlIjoiTVZPQ1oiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qJccI:mN1LsT4r9mLl1pGECQEJlrAPWUct-e6eU_3NeKh284k', '2023-07-12 16:24:02.698103');
INSERT INTO `django_session` VALUES ('x2lcf9jrwrpe4kj8bgowbb7knf3vxwzp', 'eyJpbWFnZV9jb2RlIjoiRk5OWk0iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1pylqk:9F_sEQjVri8uPVlxHFj71M4WjpRPmnBF9jbmZ1oNTQc', '2023-05-16 04:00:46.135719');
INSERT INTO `django_session` VALUES ('zhc99dtsfzp0fa839h4f9n3ezni9a7qi', 'eyJpbWFnZV9jb2RlIjoiRkhVUEoiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qvr2h:eMCZLvfkxMTmSXGGM7lBQIjxK009yySiQOb0CZOrxE4', '2023-10-26 03:29:19.062091');

-- ----------------------------
-- Table structure for staffing_system_admin
-- ----------------------------
DROP TABLE IF EXISTS `staffing_system_admin`;
CREATE TABLE `staffing_system_admin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(32) NOT NULL,
  `admin_pwd` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staffing_system_admin
-- ----------------------------
INSERT INTO `staffing_system_admin` VALUES ('1', 'oooo', 'c9b7331345f932607dfd18172d04c081');
INSERT INTO `staffing_system_admin` VALUES ('10', 'ww', 'fa360e0e9476134ee9996a3e962bbc10');
INSERT INTO `staffing_system_admin` VALUES ('11', 'JJ', 'd0873883b0c22e36950164ef26544f34');
INSERT INTO `staffing_system_admin` VALUES ('15', 'ai', '680f7df859e1408eaaa11e3b0b1908da');
INSERT INTO `staffing_system_admin` VALUES ('16', 'ww', '75187473dbc666b32a37f52a38409633');

-- ----------------------------
-- Table structure for staffing_system_bossinfo
-- ----------------------------
DROP TABLE IF EXISTS `staffing_system_bossinfo`;
CREATE TABLE `staffing_system_bossinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `age` int NOT NULL,
  `img` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staffing_system_bossinfo
-- ----------------------------
INSERT INTO `staffing_system_bossinfo` VALUES ('1', '强请', '12', 'staffing_system\\static\\img\\avatar - 副本.jpg');
INSERT INTO `staffing_system_bossinfo` VALUES ('2', '威威', '11', 'static\\img\\logo-tux.png');
INSERT INTO `staffing_system_bossinfo` VALUES ('3', 'tt', '45', 'media\\1624349014058-jtd1hi.jpg');

-- ----------------------------
-- Table structure for staffing_system_category
-- ----------------------------
DROP TABLE IF EXISTS `staffing_system_category`;
CREATE TABLE `staffing_system_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staffing_system_category
-- ----------------------------

-- ----------------------------
-- Table structure for staffing_system_city
-- ----------------------------
DROP TABLE IF EXISTS `staffing_system_city`;
CREATE TABLE `staffing_system_city` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `count` int NOT NULL,
  `img` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staffing_system_city
-- ----------------------------
INSERT INTO `staffing_system_city` VALUES ('2', '武汉', '999', 'city/logo-tux.png');
INSERT INTO `staffing_system_city` VALUES ('3', '邯郸', '888', 'city/1611057478605.jpeg');

-- ----------------------------
-- Table structure for staffing_system_department
-- ----------------------------
DROP TABLE IF EXISTS `staffing_system_department`;
CREATE TABLE `staffing_system_department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staffing_system_department
-- ----------------------------
INSERT INTO `staffing_system_department` VALUES ('7', '营销部');
INSERT INTO `staffing_system_department` VALUES ('8', '策划部');
INSERT INTO `staffing_system_department` VALUES ('9', '品牌部');
INSERT INTO `staffing_system_department` VALUES ('10', '战略投资部');
INSERT INTO `staffing_system_department` VALUES ('11', '运营部');

-- ----------------------------
-- Table structure for staffing_system_order
-- ----------------------------
DROP TABLE IF EXISTS `staffing_system_order`;
CREATE TABLE `staffing_system_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `oid` varchar(64) NOT NULL,
  `title` varchar(32) NOT NULL,
  `price` int NOT NULL,
  `status` smallint NOT NULL,
  `admin_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staffing_system_orde_admin_id_b5b77174_fk_staffing_` (`admin_id`),
  CONSTRAINT `staffing_system_orde_admin_id_b5b77174_fk_staffing_` FOREIGN KEY (`admin_id`) REFERENCES `staffing_system_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staffing_system_order
-- ----------------------------
INSERT INTO `staffing_system_order` VALUES ('1', '202305172231107390', 'dd', '228', '1', '1');
INSERT INTO `staffing_system_order` VALUES ('13', '202307131530375248', '11', '11', '1', '10');
INSERT INTO `staffing_system_order` VALUES ('14', '202308241538263300', '营销', '123', '1', '1');

-- ----------------------------
-- Table structure for staffing_system_prettynum
-- ----------------------------
DROP TABLE IF EXISTS `staffing_system_prettynum`;
CREATE TABLE `staffing_system_prettynum` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `price` int NOT NULL,
  `level` smallint NOT NULL,
  `status` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staffing_system_prettynum
-- ----------------------------
INSERT INTO `staffing_system_prettynum` VALUES ('4', '111111111', '19', '1', '1');
INSERT INTO `staffing_system_prettynum` VALUES ('5', '17758913871', '12', '3', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('8', '12345678993', '0', '4', '1');
INSERT INTO `staffing_system_prettynum` VALUES ('9', '17283891', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('11', '122222', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('12', '17283891228', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('13', '17283891220', '0', '4', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('14', '17283891222', '0', '4', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('15', '17283891223', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('17', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('18', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('19', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('20', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('21', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('22', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('23', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('24', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('25', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('26', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('27', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('28', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('29', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('30', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('31', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('32', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('33', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('34', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('35', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('36', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('37', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('38', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('39', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('40', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('41', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('42', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('43', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('44', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('45', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('46', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('47', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('48', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('49', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('50', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('51', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('52', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('53', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('54', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('55', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('56', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('57', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('59', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('60', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('61', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('62', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('63', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('64', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('65', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('66', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('67', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('68', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('69', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('70', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('71', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('72', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('73', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('74', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('75', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('76', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('77', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('78', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('79', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('80', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('81', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('82', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('83', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('84', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('85', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('86', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('87', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('88', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('89', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('90', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('91', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('92', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('93', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('94', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('95', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('96', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('97', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('98', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('99', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('100', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('101', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('102', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('103', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('104', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('105', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('106', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('107', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('108', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('109', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('110', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('111', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('112', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('113', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('114', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('115', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('116', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('117', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('118', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('119', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('120', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('121', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('122', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('123', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('124', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('125', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('126', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('127', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('128', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('129', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('130', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('131', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('132', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('133', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('134', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('135', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('136', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('137', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('138', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('139', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('140', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('141', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('142', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('143', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('144', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('145', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('146', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('147', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('148', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('149', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('150', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('151', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('152', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('153', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('154', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('155', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('156', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('157', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('158', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('159', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('160', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('161', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('162', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('163', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('164', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('165', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('166', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('167', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('168', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('169', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('170', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('171', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('172', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('173', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('174', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('175', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('176', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('177', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('178', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('179', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('180', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('181', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('182', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('183', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('184', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('185', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('186', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('187', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('188', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('189', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('190', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('191', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('192', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('193', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('194', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('195', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('196', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('197', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('198', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('199', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('200', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('201', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('202', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('203', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('204', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('205', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('206', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('207', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('208', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('209', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('210', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('211', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('212', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('213', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('214', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('215', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('216', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('217', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('218', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('219', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('220', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('221', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('222', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('223', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('224', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('225', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('226', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('227', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('228', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('229', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('230', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('231', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('232', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('233', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('234', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('235', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('236', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('237', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('238', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('239', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('240', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('241', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('242', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('243', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('244', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('245', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('246', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('247', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('248', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('249', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('250', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('251', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('252', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('253', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('254', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('255', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('256', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('257', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('258', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('259', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('260', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('261', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('262', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('263', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('264', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('265', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('266', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('267', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('268', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('269', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('270', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('271', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('272', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('273', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('274', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('275', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('276', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('277', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('278', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('279', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('280', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('281', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('282', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('283', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('284', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('285', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('286', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('287', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('288', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('289', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('290', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('291', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('292', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('293', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('294', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('295', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('296', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('297', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('298', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('299', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('300', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('301', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('302', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('303', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('304', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('305', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('306', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('307', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('308', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('309', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('310', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('311', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('312', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('313', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('314', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('315', '19989898989', '0', '1', '0');
INSERT INTO `staffing_system_prettynum` VALUES ('316', '19989898989', '0', '1', '0');

-- ----------------------------
-- Table structure for staffing_system_product
-- ----------------------------
DROP TABLE IF EXISTS `staffing_system_product`;
CREATE TABLE `staffing_system_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staffing_system_product
-- ----------------------------

-- ----------------------------
-- Table structure for staffing_system_task
-- ----------------------------
DROP TABLE IF EXISTS `staffing_system_task`;
CREATE TABLE `staffing_system_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `level` smallint NOT NULL,
  `title` varchar(64) NOT NULL,
  `detail` longtext NOT NULL,
  `admin_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staffing_system_task_admin_id_ffac62b7_fk_staffing_` (`admin_id`),
  CONSTRAINT `staffing_system_task_admin_id_ffac62b7_fk_staffing_` FOREIGN KEY (`admin_id`) REFERENCES `staffing_system_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staffing_system_task
-- ----------------------------
INSERT INTO `staffing_system_task` VALUES ('1', '1', 'kill bill', 'fewfsfzfwe', '1');

-- ----------------------------
-- Table structure for staffing_system_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `staffing_system_userinfo`;
CREATE TABLE `staffing_system_userinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(64) NOT NULL,
  `age` int NOT NULL,
  `account` decimal(10,2) NOT NULL,
  `create_time` date NOT NULL,
  `gender` smallint NOT NULL,
  `depart_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staffing_system_user_depart_id_cd8052a1_fk_staffing_` (`depart_id`),
  CONSTRAINT `staffing_system_user_depart_id_cd8052a1_fk_staffing_` FOREIGN KEY (`depart_id`) REFERENCES `staffing_system_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staffing_system_userinfo
-- ----------------------------
INSERT INTO `staffing_system_userinfo` VALUES ('18', '冰墩墩', 'f0524b2b8f0bec1209c55d247b2f7509', '22', '232.00', '2023-10-20', '1', '10');
INSERT INTO `staffing_system_userinfo` VALUES ('19', '免费', 'mf', '12', '1231.00', '2023-10-26', '1', '8');
