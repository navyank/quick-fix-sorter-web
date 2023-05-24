/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.30 : Database - qfs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`qfs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `qfs`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add complaints',7,'add_complaints'),
(26,'Can change complaints',7,'change_complaints'),
(27,'Can delete complaints',7,'delete_complaints'),
(28,'Can view complaints',7,'view_complaints'),
(29,'Can add dept',8,'add_dept'),
(30,'Can change dept',8,'change_dept'),
(31,'Can delete dept',8,'delete_dept'),
(32,'Can view dept',8,'view_dept'),
(33,'Can add login',9,'add_login'),
(34,'Can change login',9,'change_login'),
(35,'Can delete login',9,'delete_login'),
(36,'Can view login',9,'view_login'),
(37,'Can add users',10,'add_users'),
(38,'Can change users',10,'change_users'),
(39,'Can delete users',10,'delete_users'),
(40,'Can view users',10,'view_users'),
(41,'Can add reason',11,'add_reason'),
(42,'Can change reason',11,'change_reason'),
(43,'Can delete reason',11,'delete_reason'),
(44,'Can view reason',11,'view_reason'),
(45,'Can add officer',12,'add_officer'),
(46,'Can change officer',12,'change_officer'),
(47,'Can delete officer',12,'delete_officer'),
(48,'Can view officer',12,'view_officer'),
(49,'Can add feedback',13,'add_feedback'),
(50,'Can change feedback',13,'change_feedback'),
(51,'Can delete feedback',13,'delete_feedback'),
(52,'Can view feedback',13,'view_feedback'),
(53,'Can add assignedcomplaints',14,'add_assignedcomplaints'),
(54,'Can change assignedcomplaints',14,'change_assignedcomplaints'),
(55,'Can delete assignedcomplaints',14,'delete_assignedcomplaints'),
(56,'Can view assignedcomplaints',14,'view_assignedcomplaints');

/*Table structure for table `auth_user` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(14,'qiuck_fix_app','assignedcomplaints'),
(7,'qiuck_fix_app','complaints'),
(8,'qiuck_fix_app','dept'),
(13,'qiuck_fix_app','feedback'),
(9,'qiuck_fix_app','login'),
(12,'qiuck_fix_app','officer'),
(11,'qiuck_fix_app','reason'),
(10,'qiuck_fix_app','users'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-02-16 06:04:19.036191'),
(2,'auth','0001_initial','2023-02-16 06:04:19.859507'),
(3,'admin','0001_initial','2023-02-16 06:04:20.026191'),
(4,'admin','0002_logentry_remove_auto_add','2023-02-16 06:04:20.045667'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-02-16 06:04:20.067609'),
(6,'contenttypes','0002_remove_content_type_name','2023-02-16 06:04:20.205957'),
(7,'auth','0002_alter_permission_name_max_length','2023-02-16 06:04:20.267399'),
(8,'auth','0003_alter_user_email_max_length','2023-02-16 06:04:20.293657'),
(9,'auth','0004_alter_user_username_opts','2023-02-16 06:04:20.303625'),
(10,'auth','0005_alter_user_last_login_null','2023-02-16 06:04:20.389449'),
(11,'auth','0006_require_contenttypes_0002','2023-02-16 06:04:20.394452'),
(12,'auth','0007_alter_validators_add_error_messages','2023-02-16 06:04:20.411410'),
(13,'auth','0008_alter_user_username_max_length','2023-02-16 06:04:20.528100'),
(14,'auth','0009_alter_user_last_name_max_length','2023-02-16 06:04:20.631588'),
(15,'auth','0010_alter_group_name_max_length','2023-02-16 06:04:20.679381'),
(16,'auth','0011_update_proxy_permissions','2023-02-16 06:04:20.702358'),
(17,'auth','0012_alter_user_first_name_max_length','2023-02-16 06:04:20.815673'),
(18,'qiuck_fix_app','0001_initial','2023-02-16 06:04:21.766573'),
(19,'sessions','0001_initial','2023-02-16 06:04:21.802162');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('gp31kaflhywjpsbkwujz520izw9h8wr4','.eJyrVsrJTFGyMtNRSs7PjQcxDYHMAhgDTNcCAM-YCrI:1pSvsF:MQGdqWw7yetaMHruUVes3Hqd8fiiVWryaT434zlOOVg','2023-03-03 08:13:43.987274'),
('i5id4tc77o0rbruogs2k1k43nstnzb0j','eyJsaWQiOjZ9:1pVvc5:YU9okSH7ZR8SF83rSizN6jGcFuigq4CmOYEy8YdpqfE','2023-03-11 14:33:25.760674'),
('jdfp232iyaszcntwr1g38vee1fodv37d','.eJyrVsrJTFGyMtZRSs7PjQcxzY2AbBDDzAzIKACzjGsB7ToLWg:1pYjWf:IWpCdQlx7SktuSb4ZqhwXbe1vDmFrLf-3yD6gRLAXl8','2023-03-19 08:15:25.215666'),
('kjn0u53gmf268yr57cf8aa4mh76y3pkz','.eJyrVsrJTFGyMtNRSi4AMYyADBBtCKTzc-NBTGMdpXywVC0AJ0UMzQ:1pTPGu:q3JVdm-WT6kWuRZ1OPfUEjqehu6vZ5nyVPMXobEEIgc','2023-03-04 15:37:08.342467'),
('on0dw8lnww5bdbx09vngw14l10ojpnmf','.eJyrVsrJTFGyMtNRSs7PjQcxDYFMGF0AZtQCAM4jCrI:1pSaWe:r8z0sohfM3x3B6izN6xh69cqelG0HNH6naBdddEFQhQ','2023-03-02 09:26:00.773532'),
('xtipg8lh7a54l4r6ty0y4m8dyge89gr3','.eJyrVsrJTFGyMtNRygfRRjpKyfm58SCmoQmQDWHUAgDUewq3:1pVosn:H9VEu7ORqqMVsG8S4jEbP_AKrpA8ExCjj5Zz96ee-LA','2023-03-11 07:22:13.464510');

/*Table structure for table `qiuck_fix_app_assignedcomplaints` */

DROP TABLE IF EXISTS `qiuck_fix_app_assignedcomplaints`;

CREATE TABLE `qiuck_fix_app_assignedcomplaints` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `complaintid_id` bigint NOT NULL,
  `officerid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qiuck_fix_app_assign_complaintid_id_92a4909c_fk_qiuck_fix` (`complaintid_id`),
  KEY `qiuck_fix_app_assign_officerid_id_cf426d7d_fk_qiuck_fix` (`officerid_id`),
  CONSTRAINT `qiuck_fix_app_assign_complaintid_id_92a4909c_fk_qiuck_fix` FOREIGN KEY (`complaintid_id`) REFERENCES `qiuck_fix_app_complaints` (`id`),
  CONSTRAINT `qiuck_fix_app_assign_officerid_id_cf426d7d_fk_qiuck_fix` FOREIGN KEY (`officerid_id`) REFERENCES `qiuck_fix_app_officer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `qiuck_fix_app_assignedcomplaints` */

insert  into `qiuck_fix_app_assignedcomplaints`(`id`,`date`,`status`,`complaintid_id`,`officerid_id`) values 
(9,'2023-03-04','pending',62,2),
(10,'2023-03-04','40%',66,1),
(11,'2023-03-04','pending',68,4),
(12,'2023-03-04','pending',63,5),
(13,'2023-03-04','10%',56,6),
(14,'2023-03-04','pending',64,5),
(15,'2023-03-05','pending',59,1);

/*Table structure for table `qiuck_fix_app_complaints` */

DROP TABLE IF EXISTS `qiuck_fix_app_complaints`;

CREATE TABLE `qiuck_fix_app_complaints` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `altitude` varchar(50) NOT NULL,
  `current_status` varchar(50) NOT NULL,
  `depid_id` bigint NOT NULL,
  `userid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qiuck_fix_app_compla_depid_id_646e9d7d_fk_qiuck_fix` (`depid_id`),
  KEY `qiuck_fix_app_compla_userid_id_932868ae_fk_qiuck_fix` (`userid_id`),
  CONSTRAINT `qiuck_fix_app_compla_depid_id_646e9d7d_fk_qiuck_fix` FOREIGN KEY (`depid_id`) REFERENCES `qiuck_fix_app_dept` (`id`),
  CONSTRAINT `qiuck_fix_app_compla_userid_id_932868ae_fk_qiuck_fix` FOREIGN KEY (`userid_id`) REFERENCES `qiuck_fix_app_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `qiuck_fix_app_complaints` */

insert  into `qiuck_fix_app_complaints`(`id`,`complaint`,`date`,`latitude`,`altitude`,`current_status`,`depid_id`,`userid_id`) values 
(39,'1677320566743.png','2023-02-25','11.45678765','75.7654567','rejected',2,1),
(54,'1677562483735.png','2023-02-28','11.45678765','75.7654567','rejected',2,1),
(56,'1677939022632.png','2023-03-04','10.950493333333334','76.10306166666666','assigned',7,2),
(57,'1677939052026.png','2023-03-04','10.950493333333334','76.10306166666666','pending',7,2),
(59,'1677939106364.png','2023-03-04','10.950493333333334','76.10306166666666','assigned',2,2),
(61,'1677939548521.png','2023-03-04','10.951140000000002','76.10274833333332','pending',3,2),
(62,'1677939574677.png','2023-03-04','10.951140000000002','76.10274833333332','assigned',3,2),
(63,'1677939623765.png','2023-03-04','10.950496666666668','76.10336666666667','rejected',4,2),
(64,'1677939655345.png','2023-03-04','10.950496666666668','76.10336666666667','assigned',4,2),
(65,'1677939677512.png','2023-03-04','10.950496666666668','76.10336666666667','pending',4,2),
(66,'1677939702463.png','2023-03-04','10.950496666666668','76.10336666666667','assigned',2,2),
(68,'1677939760504.png','2023-03-04','10.950496666666668','76.10336666666667','assigned',6,2),
(69,'1677939791500.png','2023-03-04','10.950496666666668','76.10336666666667','pending',6,2),
(70,'1677994949903.png','2023-03-05','11.257781','75.7845286','pending',7,2),
(71,'1678003700689.png','2023-03-05','11.2577763','75.7845238','pending',3,2),
(72,'1678003895832.png','2023-03-05','11.2577805','75.7845248','pending',2,2),
(73,'1678004222294.png','2023-03-05','11.2577869','75.7845413','pending',3,2),
(74,'1678004290111.png','2023-03-05','11.2577865','75.7845365','pending',3,2),
(75,'1678008300969.png','2023-03-05','11.2577846','75.7845382','pending',2,2);

/*Table structure for table `qiuck_fix_app_dept` */

DROP TABLE IF EXISTS `qiuck_fix_app_dept`;

CREATE TABLE `qiuck_fix_app_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deptName` varchar(50) NOT NULL,
  `details` varchar(50) NOT NULL,
  `contact_no` bigint NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `post_office` varchar(50) NOT NULL,
  `pin_code` int NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qiuck_fix_app_dept_lid_id_c3195200_fk_qiuck_fix_app_login_id` (`lid_id`),
  CONSTRAINT `qiuck_fix_app_dept_lid_id_c3195200_fk_qiuck_fix_app_login_id` FOREIGN KEY (`lid_id`) REFERENCES `qiuck_fix_app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `qiuck_fix_app_dept` */

insert  into `qiuck_fix_app_dept`(`id`,`deptName`,`details`,`contact_no`,`email_id`,`place`,`post_office`,`pin_code`,`lid_id`) values 
(2,'Municipality','pang ',9123456789,'muni@gmail.com','pang','kondotty',678967,3),
(3,'kseb','kondotty',9876543245,'kseb@gmail.com','malappuram','pang',678967,4),
(4,'water authority','kannur',9123456789,'karthika@gmail.com','kannur','kannur',678967,5),
(6,'PWD','wayanad pwd ',9876543245,'pwd@gmail.com','malappuram','kondotty',678967,11),
(7,'hospital','hospital kannur',8943646675,'hospital@gmail.com','kannur','parshinikadavu',678972,12);

/*Table structure for table `qiuck_fix_app_feedback` */

DROP TABLE IF EXISTS `qiuck_fix_app_feedback`;

CREATE TABLE `qiuck_fix_app_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(80) NOT NULL,
  `date` date NOT NULL,
  `userid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qiuck_fix_app_feedba_userid_id_88275592_fk_qiuck_fix` (`userid_id`),
  CONSTRAINT `qiuck_fix_app_feedba_userid_id_88275592_fk_qiuck_fix` FOREIGN KEY (`userid_id`) REFERENCES `qiuck_fix_app_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `qiuck_fix_app_feedback` */

insert  into `qiuck_fix_app_feedback`(`id`,`feedback`,`date`,`userid_id`) values 
(1,'good','2023-03-01',1),
(2,'good','2023-02-18',1),
(3,'nice','2023-02-23',1),
(4,'good work','2023-02-25',1),
(5,'this app is very helpfull','2023-03-04',2);

/*Table structure for table `qiuck_fix_app_login` */

DROP TABLE IF EXISTS `qiuck_fix_app_login`;

CREATE TABLE `qiuck_fix_app_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `qiuck_fix_app_login` */

insert  into `qiuck_fix_app_login`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(3,'municipality','Municipality@123','department'),
(4,'kseb','Kseb@123','department'),
(5,'water','Water@123','department'),
(6,'luka','Luka@123','officer'),
(7,'ashmu','123','user'),
(8,'vismaya','Vismaya@123','officer'),
(9,'manu','Manu@123','officer'),
(11,'pwd','Pwd@1234','department'),
(12,'hospital','Hospital@123','department'),
(13,'Aishu','123','user'),
(14,'sanju','Sanju@123','officer'),
(15,'Aiswarya','Aishu@123','officer'),
(16,'smijith','Smijith@123','officer');

/*Table structure for table `qiuck_fix_app_officer` */

DROP TABLE IF EXISTS `qiuck_fix_app_officer`;

CREATE TABLE `qiuck_fix_app_officer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `post_office` varchar(50) NOT NULL,
  `pin_code` int NOT NULL,
  `phone_number` bigint NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `deptid_id` bigint NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qiuck_fix_app_office_deptid_id_cbd6255f_fk_qiuck_fix` (`deptid_id`),
  KEY `qiuck_fix_app_officer_lid_id_0b14385e_fk_qiuck_fix_app_login_id` (`lid_id`),
  CONSTRAINT `qiuck_fix_app_office_deptid_id_cbd6255f_fk_qiuck_fix` FOREIGN KEY (`deptid_id`) REFERENCES `qiuck_fix_app_dept` (`id`),
  CONSTRAINT `qiuck_fix_app_officer_lid_id_0b14385e_fk_qiuck_fix_app_login_id` FOREIGN KEY (`lid_id`) REFERENCES `qiuck_fix_app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `qiuck_fix_app_officer` */

insert  into `qiuck_fix_app_officer`(`id`,`Fname`,`Lname`,`place`,`post_office`,`pin_code`,`phone_number`,`gender`,`dob`,`email_id`,`deptid_id`,`lid_id`) values 
(1,'luka','jr','pang','pang south',687654,8834567890,'male','2023-02-16','navyank001@gmail.com',2,6),
(2,'vismaya','sajayan','manjeri','kondotty ',678967,9876543249,'female','2023-02-23','vismaya12@gmail.com',3,8),
(4,'sanju','raj','pang','pang south',679338,9876543210,'male','2023-03-21','pwd@gmail.com',6,14),
(5,'aiswarya','c','malapuram','kottappuram',678967,9876543245,'female','2023-03-08','aishu@gmail.com',4,15),
(6,'smijith','nk','pang','south pang',687654,9234567890,'male','2023-03-15','sdfghjk@gmail.com',7,16);

/*Table structure for table `qiuck_fix_app_reason` */

DROP TABLE IF EXISTS `qiuck_fix_app_reason`;

CREATE TABLE `qiuck_fix_app_reason` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `Reason` varchar(60) NOT NULL,
  `complaintid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qiuck_fix_app_reason_complaintid_id_e1968925_fk_qiuck_fix` (`complaintid_id`),
  CONSTRAINT `qiuck_fix_app_reason_complaintid_id_e1968925_fk_qiuck_fix` FOREIGN KEY (`complaintid_id`) REFERENCES `qiuck_fix_app_complaints` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `qiuck_fix_app_reason` */

insert  into `qiuck_fix_app_reason`(`id`,`date`,`Reason`,`complaintid_id`) values 
(1,'2023-02-27','the loction is not correct',39),
(2,'2023-02-28','asdfgh',54),
(3,'2023-03-04','this complaint is not valid',63);

/*Table structure for table `qiuck_fix_app_users` */

DROP TABLE IF EXISTS `qiuck_fix_app_users`;

CREATE TABLE `qiuck_fix_app_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `post_office` varchar(50) NOT NULL,
  `pin_code` int NOT NULL,
  `phone_number` bigint NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qiuck_fix_app_users_lid_id_97dbcfc2_fk_qiuck_fix_app_login_id` (`lid_id`),
  CONSTRAINT `qiuck_fix_app_users_lid_id_97dbcfc2_fk_qiuck_fix_app_login_id` FOREIGN KEY (`lid_id`) REFERENCES `qiuck_fix_app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `qiuck_fix_app_users` */

insert  into `qiuck_fix_app_users`(`id`,`Fname`,`Lname`,`place`,`post_office`,`pin_code`,`phone_number`,`gender`,`dob`,`email_id`,`lid_id`) values 
(1,'faki','nayyira','kondotty','krlm',456789,918765478,'female','2023-02-16','fakigmail.com',7),
(2,'aiswarya','c','pang','south pang',689338,9876587898,'female','2023-02-22','aiswaryac@gmail.com',13);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
