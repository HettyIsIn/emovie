/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : localhost
 Source Database       : emovie

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : utf-8

 Date: 05/27/2015 23:09:00 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `auth_permission`
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry'), ('2', 'Can change log entry', '1', 'change_logentry'), ('3', 'Can delete log entry', '1', 'delete_logentry'), ('4', 'Can view log entry', '1', 'view_logentry'), ('5', 'Can add permission', '2', 'add_permission'), ('6', 'Can change permission', '2', 'change_permission'), ('7', 'Can delete permission', '2', 'delete_permission'), ('8', 'Can add group', '3', 'add_group'), ('9', 'Can change group', '3', 'change_group'), ('10', 'Can delete group', '3', 'delete_group'), ('11', 'Can add user', '4', 'add_user'), ('12', 'Can change user', '4', 'change_user'), ('13', 'Can delete user', '4', 'delete_user'), ('14', 'Can view group', '3', 'view_group'), ('15', 'Can view permission', '2', 'view_permission'), ('16', 'Can view user', '4', 'view_user'), ('17', 'Can add content type', '5', 'add_contenttype'), ('18', 'Can change content type', '5', 'change_contenttype'), ('19', 'Can delete content type', '5', 'delete_contenttype'), ('20', 'Can view content type', '5', 'view_contenttype'), ('21', 'Can add session', '6', 'add_session'), ('22', 'Can change session', '6', 'change_session'), ('23', 'Can delete session', '6', 'delete_session'), ('24', 'Can view session', '6', 'view_session'), ('25', 'Can add Bookmark', '7', 'add_bookmark'), ('26', 'Can change Bookmark', '7', 'change_bookmark'), ('27', 'Can delete Bookmark', '7', 'delete_bookmark'), ('28', 'Can add User Setting', '8', 'add_usersettings'), ('29', 'Can change User Setting', '8', 'change_usersettings'), ('30', 'Can delete User Setting', '8', 'delete_usersettings'), ('31', 'Can add User Widget', '9', 'add_userwidget'), ('32', 'Can change User Widget', '9', 'change_userwidget'), ('33', 'Can delete User Widget', '9', 'delete_userwidget'), ('34', 'Can view Bookmark', '7', 'view_bookmark'), ('35', 'Can view User Setting', '8', 'view_usersettings'), ('36', 'Can view User Widget', '9', 'view_userwidget'), ('37', 'Can add 影片', '10', 'add_movie'), ('38', 'Can change 影片', '10', 'change_movie'), ('39', 'Can delete 影片', '10', 'delete_movie'), ('40', 'Can add 影片图片', '11', 'add_moviestills'), ('41', 'Can change 影片图片', '11', 'change_moviestills'), ('42', 'Can delete 影片图片', '11', 'delete_moviestills'), ('43', 'Can add 电影类型', '12', 'add_moviecategory'), ('44', 'Can change 电影类型', '12', 'change_moviecategory'), ('45', 'Can delete 电影类型', '12', 'delete_moviecategory'), ('46', 'Can add 电影从业人员', '13', 'add_moviepeople'), ('47', 'Can change 电影从业人员', '13', 'change_moviepeople'), ('48', 'Can delete 电影从业人员', '13', 'delete_moviepeople'), ('49', 'Can add 人员与作品关联', '14', 'add_moviepeopleref'), ('50', 'Can change 人员与作品关联', '14', 'change_moviepeopleref'), ('51', 'Can delete 人员与作品关联', '14', 'delete_moviepeopleref'), ('52', 'Can add 影片上线提醒表', '15', 'add_movieremind'), ('53', 'Can change 影片上线提醒表', '15', 'change_movieremind'), ('54', 'Can delete 影片上线提醒表', '15', 'delete_movieremind'), ('55', 'Can view 人员与作品关联', '14', 'view_moviepeopleref'), ('56', 'Can view 影片', '10', 'view_movie'), ('57', 'Can view 影片上线提醒表', '15', 'view_movieremind'), ('58', 'Can view 影片图片', '11', 'view_moviestills'), ('59', 'Can view 电影从业人员', '13', 'view_moviepeople'), ('60', 'Can view 电影类型', '12', 'view_moviecategory'), ('61', 'Can add 排场信息', '16', 'add_moviesession'), ('62', 'Can change 排场信息', '16', 'change_moviesession'), ('63', 'Can delete 排场信息', '16', 'delete_moviesession'), ('64', 'Can view 排场信息', '16', 'view_moviesession'), ('65', 'Can add 影院表', '17', 'add_cinema'), ('66', 'Can change 影院表', '17', 'change_cinema'), ('67', 'Can delete 影院表', '17', 'delete_cinema'), ('68', 'Can add 影院特色表', '18', 'add_cinemafeature'), ('69', 'Can change 影院特色表', '18', 'change_cinemafeature'), ('70', 'Can delete 影院特色表', '18', 'delete_cinemafeature'), ('71', 'Can add 影院图片表', '19', 'add_cinemaimages'), ('72', 'Can change 影院图片表', '19', 'change_cinemaimages'), ('73', 'Can delete 影院图片表', '19', 'delete_cinemaimages'), ('74', 'Can add 影院影厅表', '20', 'add_cinemahall'), ('75', 'Can change 影院影厅表', '20', 'change_cinemahall'), ('76', 'Can delete 影院影厅表', '20', 'delete_cinemahall'), ('77', 'Can view 影院图片表', '19', 'view_cinemaimages'), ('78', 'Can view 影院影厅表', '20', 'view_cinemahall'), ('79', 'Can view 影院特色表', '18', 'view_cinemafeature'), ('80', 'Can view 影院表', '17', 'view_cinema'), ('81', 'Can add 区域', '21', 'add_cmarea'), ('82', 'Can change 区域', '21', 'change_cmarea'), ('83', 'Can delete 区域', '21', 'delete_cmarea'), ('84', 'Can view 区域', '21', 'view_cmarea');
COMMIT;

-- ----------------------------
--  Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(75) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `auth_user`
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$15000$EQsHlfH8bIUS$cRosELPNO3WwCuqky+zRwNrNNF+oEHHOH9bh+959wEM=', '2015-05-27 23:08:36', '1', 'emovie', '', '', 'lingnck@163.com', '1', '1', '2015-05-27 23:08:36');
COMMIT;

-- ----------------------------
--  Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `cinema`
-- ----------------------------
DROP TABLE IF EXISTS `cinema`;
CREATE TABLE `cinema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `address` varchar(400) COLLATE utf8_bin NOT NULL,
  `longitude` decimal(12,6) NOT NULL,
  `latitude` decimal(12,6) NOT NULL,
  `telephone` varchar(100) COLLATE utf8_bin NOT NULL,
  `hall_count` int(11) NOT NULL,
  `desc` longtext COLLATE utf8_bin NOT NULL,
  `road_line` varchar(400) COLLATE utf8_bin NOT NULL,
  `tradearea_id` int(11) NOT NULL,
  `subway_id` int(11) NOT NULL,
  `zy_sell_flag` int(11) NOT NULL,
  `zy_score` double NOT NULL,
  `city_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `zy_id` varchar(50) COLLATE utf8_bin NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `cinema_logo` varchar(500) COLLATE utf8_bin NOT NULL,
  `inner_cinema_logo` varchar(500) COLLATE utf8_bin NOT NULL,
  `recommend` tinyint(1) NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `zy_id` (`zy_id`),
  KEY `cinema_b376980e` (`city_id`),
  KEY `cinema_da72e1ba` (`district_id`),
  KEY `cinema_d5ae539f` (`recommend`),
  CONSTRAINT `city_id_refs_id_157335fd` FOREIGN KEY (`city_id`) REFERENCES `cm_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `cinema_features`
-- ----------------------------
DROP TABLE IF EXISTS `cinema_features`;
CREATE TABLE `cinema_features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `feature_type` int(11) NOT NULL,
  `desc` varchar(200) COLLATE utf8_bin NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `feature_type` (`feature_type`,`feature_id`,`cinema_id`),
  KEY `cinema_features_719fc6bf` (`cinema_id`),
  CONSTRAINT `cinema_id_refs_id_a87116be` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `cinema_hall`
-- ----------------------------
DROP TABLE IF EXISTS `cinema_hall`;
CREATE TABLE `cinema_hall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `cinema_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `zy_id` varchar(50) COLLATE utf8_bin NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `zy_id` (`zy_id`),
  KEY `cinema_hall_b376980e` (`city_id`),
  KEY `cinema_hall_719fc6bf` (`cinema_id`),
  CONSTRAINT `cinema_id_refs_id_7912074a` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`id`),
  CONSTRAINT `city_id_refs_id_de57c161` FOREIGN KEY (`city_id`) REFERENCES `cm_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `cinema_images`
-- ----------------------------
DROP TABLE IF EXISTS `cinema_images`;
CREATE TABLE `cinema_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_id` int(11) NOT NULL,
  `image_uri` varchar(500) COLLATE utf8_bin NOT NULL,
  `image_uri_md5` varchar(35) COLLATE utf8_bin NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_uri_md5` (`image_uri_md5`),
  KEY `cinema_images_719fc6bf` (`cinema_id`),
  CONSTRAINT `cinema_id_refs_id_1e6150ff` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `cm_area`
-- ----------------------------
DROP TABLE IF EXISTS `cm_area`;
CREATE TABLE `cm_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `center_longitude` decimal(12,6) NOT NULL,
  `center_latitude` decimal(12,6) NOT NULL,
  `adcode` int(11) NOT NULL,
  `citycode` varchar(10) COLLATE utf8_bin NOT NULL,
  `pinyin` varchar(100) COLLATE utf8_bin NOT NULL,
  `level` int(11) NOT NULL,
  `sell_ticket` tinyint(1) NOT NULL,
  `zy_id` int(11) NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adcode` (`adcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `django_content_type`
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES ('1', 'log entry', 'admin', 'logentry'), ('2', 'permission', 'auth', 'permission'), ('3', 'group', 'auth', 'group'), ('4', 'user', 'auth', 'user'), ('5', 'content type', 'contenttypes', 'contenttype'), ('6', 'session', 'sessions', 'session'), ('7', 'Bookmark', 'xadmin', 'bookmark'), ('8', 'User Setting', 'xadmin', 'usersettings'), ('9', 'User Widget', 'xadmin', 'userwidget'), ('10', '影片', 'movie', 'movie'), ('11', '影片图片', 'movie', 'moviestills'), ('12', '电影类型', 'movie', 'moviecategory'), ('13', '电影从业人员', 'movie', 'moviepeople'), ('14', '人员与作品关联', 'movie', 'moviepeopleref'), ('15', '影片上线提醒表', 'movie', 'movieremind'), ('16', '排场信息', 'movie_session', 'moviesession'), ('17', '影院表', 'cinema', 'cinema'), ('18', '影院特色表', 'cinema', 'cinemafeature'), ('19', '影院图片表', 'cinema', 'cinemaimages'), ('20', '影院影厅表', 'cinema', 'cinemahall'), ('21', '区域', 'cm', 'cmarea');
COMMIT;

-- ----------------------------
--  Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `django_migrations`
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2015-05-27 23:08:17'), ('2', 'auth', '0001_initial', '2015-05-27 23:08:18'), ('3', 'admin', '0001_initial', '2015-05-27 23:08:18'), ('4', 'sessions', '0001_initial', '2015-05-27 23:08:18');
COMMIT;

-- ----------------------------
--  Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `movie`
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `nickname` varchar(100) COLLATE utf8_bin NOT NULL,
  `showtime` date NOT NULL,
  `small_vertical_photo` varchar(100) COLLATE utf8_bin NOT NULL,
  `large_vertical_photo` varchar(100) COLLATE utf8_bin NOT NULL,
  `horizontal_photo` varchar(100) COLLATE utf8_bin NOT NULL,
  `inner_small_vertical_photo` varchar(100) COLLATE utf8_bin NOT NULL,
  `inner_large_vertical_photo` varchar(100) COLLATE utf8_bin NOT NULL,
  `inner_horizontal_photo` varchar(100) COLLATE utf8_bin NOT NULL,
  `duration` int(11) NOT NULL,
  `score` decimal(3,1) NOT NULL,
  `desc` longtext COLLATE utf8_bin NOT NULL,
  `language` varchar(50) COLLATE utf8_bin NOT NULL,
  `area` varchar(50) COLLATE utf8_bin NOT NULL,
  `company` varchar(150) COLLATE utf8_bin NOT NULL,
  `show_type` int(11) NOT NULL,
  `off_show_date` date NOT NULL,
  `presale_start_date` date NOT NULL,
  `presale_end_date` date NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `recommend` tinyint(1) NOT NULL,
  `pub_status` tinyint(1) NOT NULL,
  `zy_id` int(11) NOT NULL,
  `douban_id` int(11) NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `zy_id` (`zy_id`),
  KEY `movie_d5ae539f` (`recommend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `movie_category`
-- ----------------------------
DROP TABLE IF EXISTS `movie_category`;
CREATE TABLE `movie_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `category` varchar(100) COLLATE utf8_bin NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movie_id` (`movie_id`,`category`),
  KEY `movie_category_d06c534f` (`movie_id`),
  CONSTRAINT `movie_id_refs_id_f40381a6` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `movie_people`
-- ----------------------------
DROP TABLE IF EXISTS `movie_people`;
CREATE TABLE `movie_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `name_en` varchar(100) COLLATE utf8_bin NOT NULL,
  `gender` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `born_place` varchar(100) COLLATE utf8_bin NOT NULL,
  `professions` varchar(100) COLLATE utf8_bin NOT NULL,
  `constellation` varchar(50) COLLATE utf8_bin NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `movie_people_ref`
-- ----------------------------
DROP TABLE IF EXISTS `movie_people_ref`;
CREATE TABLE `movie_people_ref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `people_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `profession_id` int(11) NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movie_id` (`movie_id`,`people_id`,`profession_id`),
  KEY `movie_people_ref_3cff102f` (`people_id`),
  KEY `movie_people_ref_d06c534f` (`movie_id`),
  CONSTRAINT `movie_id_refs_id_6338ab41` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `people_id_refs_id_1242ec23` FOREIGN KEY (`people_id`) REFERENCES `movie_people` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `movie_remind`
-- ----------------------------
DROP TABLE IF EXISTS `movie_remind`;
CREATE TABLE `movie_remind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `showtime` datetime NOT NULL,
  `showtime_type` tinyint(1) NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_remind_d06c534f` (`movie_id`),
  KEY `movie_remind_1ffdedc6` (`user_id`),
  KEY `movie_remind_496f8d6d` (`movie_id`,`user_id`),
  CONSTRAINT `movie_id_refs_id_6d76509a` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `movie_session`
-- ----------------------------
DROP TABLE IF EXISTS `movie_session`;
CREATE TABLE `movie_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `cinema_id` int(11) NOT NULL,
  `hall_id` int(11) NOT NULL,
  `hall_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `show_type` int(11) NOT NULL,
  `language` varchar(10) COLLATE utf8_bin NOT NULL,
  `show_date` date NOT NULL,
  `show_time` time NOT NULL,
  `price` double NOT NULL,
  `out_id` varchar(50) COLLATE utf8_bin NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `out_id` (`out_id`),
  UNIQUE KEY `hall_id` (`hall_id`,`show_date`,`show_time`),
  KEY `movie_session_d06c534f` (`movie_id`),
  KEY `movie_session_b376980e` (`city_id`),
  KEY `movie_session_719fc6bf` (`cinema_id`),
  KEY `movie_session_e2be1039` (`hall_id`),
  CONSTRAINT `cinema_id_refs_id_f050f2c2` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`id`),
  CONSTRAINT `city_id_refs_id_240a9bfa` FOREIGN KEY (`city_id`) REFERENCES `cm_area` (`id`),
  CONSTRAINT `hall_id_refs_id_411ec830` FOREIGN KEY (`hall_id`) REFERENCES `cinema_hall` (`id`),
  CONSTRAINT `movie_id_refs_id_b5da1031` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `movie_stills`
-- ----------------------------
DROP TABLE IF EXISTS `movie_stills`;
CREATE TABLE `movie_stills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `image_uri` varchar(500) COLLATE utf8_bin NOT NULL,
  `image_uri_md5` varchar(35) COLLATE utf8_bin NOT NULL,
  `inner_image_uri` varchar(500) COLLATE utf8_bin NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_uri_md5` (`image_uri_md5`),
  KEY `movie_stills_d06c534f` (`movie_id`),
  CONSTRAINT `movie_id_refs_id_cfcd9654` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `xadmin_bookmark`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `url_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `query` varchar(1000) COLLATE utf8_bin NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_6340c63c` (`user_id`),
  KEY `xadmin_bookmark_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `xadmin_usersettings`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(256) COLLATE utf8_bin NOT NULL,
  `value` longtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_6340c63c` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `xadmin_userwidget`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `page_id` varchar(256) COLLATE utf8_bin NOT NULL,
  `widget_type` varchar(50) COLLATE utf8_bin NOT NULL,
  `value` longtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_6340c63c` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

SET FOREIGN_KEY_CHECKS = 1;
