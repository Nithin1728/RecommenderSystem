/*
SQLyog - Free MySQL GUI v5.0
Host - 5.0.45-community-nt : Database - fitness
*********************************************************************
Server version : 5.0.45-community-nt
*/


create database if not exists `fitness`;

USE `fitness`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert into `auth_permission` values 
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
(25,'Can add excercisesdata',7,'add_excercisesdata'),
(26,'Can change excercisesdata',7,'change_excercisesdata'),
(27,'Can delete excercisesdata',7,'delete_excercisesdata'),
(28,'Can view excercisesdata',7,'view_excercisesdata'),
(29,'Can add upload',8,'add_upload'),
(30,'Can change upload',8,'change_upload'),
(31,'Can delete upload',8,'delete_upload'),
(32,'Can view upload',8,'view_upload'),
(33,'Can add userregistrationmodel',9,'add_userregistrationmodel'),
(34,'Can change userregistrationmodel',9,'change_userregistrationmodel'),
(35,'Can delete userregistrationmodel',9,'delete_userregistrationmodel'),
(36,'Can view userregistrationmodel',9,'view_userregistrationmodel');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `password` varchar(128) NOT NULL,
  `last_login` datetime default NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert into `django_content_type` values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(7,'simple','excercisesdata'),
(8,'simple','upload'),
(9,'simple','userregistrationmodel');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL auto_increment,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) default NULL,
  `session_data` longtext,
  `expire_date` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert into `django_session` values 
('a4xrnspimzfp04d120j482sqjrsjaba7','NDFkNzhlM2JhZmM4YjFjZTEzZTUzOTBjY2ZlOWU5MjM1NWNjYWZlZjp7InN0dWlkIjoic2hhYmFyaSIsImxvZ2dlZHN0dSI6InNoYWJhcmkiLCJhZ2UiOiIyMyIsIndlaWdodCI6IjY4IiwiZW1haWwiOiJzaGFiYXJpQGdtYWlsLmNvbSJ9','2019-10-07 06:27:19'),
('8ezhv5hejchvi17lhlbbaxyy63wvd3e3','ZjExODM1ZWE4N2JjMjZhMDg4OWE2MGZmOWYzZWRlMjBmMzJjZTUzMTp7InN0dWlkIjoibWVnaGFuYSIsImxvZ2dlZHN0dSI6Im1lZ2hhbmEiLCJhZ2UiOiI1NiIsIndlaWdodCI6IjU0IiwiZW1haWwiOiJtZWdoYW5hQGdtYWlsLmNvbSJ9','2019-10-11 03:46:15'),
('6paklhrboiiqzo0aai35aihre5zzsr27','OWYwNjUxNDZhNjQwMTA3YzAyMzkxODQyODlkN2I3YzRhOTQwZTFmODp7InN0dWlkIjoiYWxleCIsImxvZ2dlZHN0dSI6ImFsZXgiLCJhZ2UiOiIzNCIsIndlaWdodCI6IjY2IiwiZW1haWwiOiJseDE2MGNtQGdtYWlsLmNvbSJ9','2019-10-17 11:36:20'),
('yccj8kabco80a3sma7aq0fjbztl4ssxu','OWYwNjUxNDZhNjQwMTA3YzAyMzkxODQyODlkN2I3YzRhOTQwZTFmODp7InN0dWlkIjoiYWxleCIsImxvZ2dlZHN0dSI6ImFsZXgiLCJhZ2UiOiIzNCIsIndlaWdodCI6IjY2IiwiZW1haWwiOiJseDE2MGNtQGdtYWlsLmNvbSJ9','2019-10-18 06:31:19'),
('45pmt2rcxazmisd3rfwr0m03rhibt029','OWYwNjUxNDZhNjQwMTA3YzAyMzkxODQyODlkN2I3YzRhOTQwZTFmODp7InN0dWlkIjoiYWxleCIsImxvZ2dlZHN0dSI6ImFsZXgiLCJhZ2UiOiIzNCIsIndlaWdodCI6IjY2IiwiZW1haWwiOiJseDE2MGNtQGdtYWlsLmNvbSJ9','2019-10-18 07:52:03'),
('vf5wyogn99do1j7oan57vcfokgi3daqb','OWYwNjUxNDZhNjQwMTA3YzAyMzkxODQyODlkN2I3YzRhOTQwZTFmODp7InN0dWlkIjoiYWxleCIsImxvZ2dlZHN0dSI6ImFsZXgiLCJhZ2UiOiIzNCIsIndlaWdodCI6IjY2IiwiZW1haWwiOiJseDE2MGNtQGdtYWlsLmNvbSJ9','2019-10-18 11:39:00');

/*Table structure for table `simple_dailystatus` */

DROP TABLE IF EXISTS `simple_dailystatus`;

CREATE TABLE `simple_dailystatus` (
  `id` int(100) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `excercise` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `contact` varchar(100) default NULL,
  `date` date default NULL,
  `duration` varchar(100) default NULL,
  `caloriesburned` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `simple_dailystatus` */

insert into `simple_dailystatus` values 

(1,'alex','foam roller','lx160cm@gmail.com','9849098490','2019-10-04','01:30:00','360');

/*Table structure for table `simple_excercisesdata` */

DROP TABLE IF EXISTS `simple_excercisesdata`;

CREATE TABLE `simple_excercisesdata` (
  `id` int(11) NOT NULL auto_increment,
  `age` varchar(500) NOT NULL,
  `weight` varchar(300) NOT NULL,
  `excercise1` varchar(300) NOT NULL,
  `excercise2` varchar(300) NOT NULL,
  `diet` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4401 DEFAULT CHARSET=latin1;

/*Data for the table `simple_excercisesdata` */

insert into `simple_excercisesdata` values 
(1,'21','41','chest-workout','shoulder-workout','salads'),
(2,'21','42','chest-workout','shoulder-workout','salads'),
(3,'21','43','chest-workout','shoulder-workout','salads'),
(4,'21','44','chest-workout','shoulder-workout','salads'),
(5,'21','45','chest-workout','shoulder-workout','salads'),
(6,'21','46','chest-workout','shoulder-workout','salads'),
(7,'21','47','chest-workout','shoulder-workout','salads'),
(8,'21','48','chest-workout','shoulder-workout','salads'),
(9,'21','49','chest-workout','shoulder-workout','salads'),
(10,'21','50','chest-workout','shoulder-workout','salads'),
(11,'21','51','dumb-bell','dead lift','brownrice'),
(12,'21','52','dumb-bell','dead lift','brownrice'),
(13,'21','53','dumb-bell','dead lift','brownrice'),
(14,'21','54','dumb-bell','dead lift','brownrice'),
(15,'21','55','dumb-bell','dead lift','brownrice'),
(16,'21','56','dumb-bell','dead lift','brownrice'),
(17,'21','57','dumb-bell','dead lift','brownrice'),
(18,'21','58','dumb-bell','dead lift','brownrice'),
(19,'21','59','dumb-bell','dead lift','brownrice'),
(20,'21','60','dumb-bell','dead lift','brownrice'),
(21,'21','61','dumb-bell','dead lift','brownrice'),
(22,'21','62','dumb-bell','dead lift','brownrice'),
(23,'21','63','dumb-bell','dead lift','brownrice'),
(24,'21','64','dumb-bell','dead lift','brownrice'),
(25,'21','65','dumb-bell','dead lift','brownrice'),
(26,'21','66','dumb-bell','dead lift','brownrice'),
(27,'21','67','dumb-bell','dead lift','brownrice'),
(28,'21','68','dumb-bell','dead lift','brownrice'),
(29,'21','69','dumb-bell','dead lift','brownrice'),
(30,'21','70','dumb-bell','dead lift','brownrice'),
(31,'21','71','jogging','legpress','vegetables'),
(32,'21','72','jogging','legpress','vegetables'),
(33,'21','73','jogging','legpress','vegetables'),
(34,'21','74','jogging','legpress','vegetables'),
(35,'21','75','jogging','legpress','vegetables'),
(36,'21','76','jogging','legpress','vegetables'),
(37,'21','77','jogging','legpress','vegetables'),
(38,'21','78','jogging','legpress','vegetables'),
(39,'21','79','jogging','legpress','vegetables'),
(40,'21','80','jogging','legpress','vegetables'),
(41,'21','81','jogging','legpress','vegetables'),
(42,'21','82','jogging','legpress','vegetables'),
(43,'21','83','jogging','legpress','vegetables'),
(44,'21','84','jogging','legpress','vegetables'),
(45,'21','85','jogging','legpress','vegetables'),
(46,'21','86','jogging','legpress','vegetables'),
(47,'21','87','jogging','legpress','vegetables'),
(48,'21','88','jogging','legpress','vegetables'),
(49,'21','89','jogging','legpress','vegetables'),
(50,'21','90','jogging','legpress','vegetables'),
(51,'21','91','jogging','legpress','vegetables'),
(52,'21','92','jogging','legpress','vegetables'),
(53,'21','93','jogging','legpress','vegetables'),
(54,'21','94','jogging','legpress','vegetables'),
(55,'21','95','jogging','legpress','vegetables'),
(56,'21','96','jogging','legpress','vegetables'),
(57,'21','97','jogging','legpress','vegetables'),
(58,'21','98','jogging','legpress','vegetables'),
(59,'21','99','jogging','legpress','vegetables'),
(60,'21','100','jogging','legpress','vegetables'),
(61,'21','101','tred-mill','walking','vegetables'),
(62,'21','102','tred-mill','walking','vegetables'),
(63,'21','103','tred-mill','walking','vegetables'),
(64,'21','104','tred-mill','walking','vegetables'),
(65,'21','105','tred-mill','walking','vegetables'),
(66,'21','106','tred-mill','walking','vegetables'),
(67,'21','107','tred-mill','walking','vegetables'),
(68,'21','108','tred-mill','walking','vegetables'),
(69,'21','109','tred-mill','walking','vegetables'),
(70,'21','110','tred-mill','walking','vegetables'),
(71,'21','111','tred-mill','walking','vegetables'),
(72,'21','112','tred-mill','walking','vegetables'),
(73,'21','113','tred-mill','walking','vegetables'),
(74,'21','114','tred-mill','walking','vegetables'),
(75,'21','115','tred-mill','walking','vegetables'),
(76,'21','116','tred-mill','walking','vegetables'),
(77,'21','117','tred-mill','walking','vegetables'),
(78,'21','118','tred-mill','walking','vegetables'),
(79,'21','119','tred-mill','walking','vegetables'),
(80,'21','120','tred-mill','walking','vegetables'),
(81,'21','121','tred-mill','walking','vegetables'),
(82,'21','122','tred-mill','walking','vegetables'),
(83,'21','123','tred-mill','walking','vegetables'),
(84,'21','124','tred-mill','walking','vegetables'),
(85,'21','125','tred-mill','walking','vegetables'),
(86,'21','126','tred-mill','walking','vegetables'),
(87,'21','127','tred-mill','walking','vegetables'),
(88,'21','128','tred-mill','walking','vegetables'),
(89,'21','129','tred-mill','walking','vegetables'),
(90,'21','130','tred-mill','walking','vegetables'),
(91,'21','131','tred-mill','walking','vegetables'),
(92,'21','132','tred-mill','walking','vegetables'),
(93,'21','133','tred-mill','walking','vegetables'),
(94,'21','134','tred-mill','walking','vegetables'),
(95,'21','135','tred-mill','walking','vegetables'),
(96,'21','136','tred-mill','walking','vegetables'),
(97,'21','137','tred-mill','walking','vegetables'),
(98,'21','138','tred-mill','walking','vegetables'),
(99,'21','139','tred-mill','walking','vegetables'),
(100,'21','140','tred-mill','walking','vegetables'),
(101,'21','141','tred-mill','walking','vegetables'),
(102,'21','142','tred-mill','walking','vegetables'),
(103,'21','143','tred-mill','walking','vegetables'),
(104,'21','144','tred-mill','walking','vegetables'),
(105,'21','145','tred-mill','walking','vegetables'),
(106,'21','146','tred-mill','walking','vegetables'),
(107,'21','147','tred-mill','walking','vegetables'),
(108,'21','148','tred-mill','walking','vegetables'),
(109,'21','149','tred-mill','walking','vegetables'),
(110,'21','150','tred-mill','walking','vegetables'),
(111,'22','41','chest-workout','shoulder-workout','salads'),
(112,'22','42','chest-workout','shoulder-workout','salads'),
(113,'22','43','chest-workout','shoulder-workout','salads'),
(114,'22','44','chest-workout','shoulder-workout','salads'),
(115,'22','45','chest-workout','shoulder-workout','salads'),
(116,'22','46','chest-workout','shoulder-workout','salads'),
(117,'22','47','chest-workout','shoulder-workout','salads'),
(118,'22','48','chest-workout','shoulder-workout','salads'),
(119,'22','49','chest-workout','shoulder-workout','salads'),
(120,'22','50','chest-workout','shoulder-workout','salads'),
(121,'22','51','dumb-bell','dead lift','brownrice'),
(122,'22','52','dumb-bell','dead lift','brownrice'),
(123,'22','53','dumb-bell','dead lift','brownrice'),
(124,'22','54','dumb-bell','dead lift','brownrice'),
(125,'22','55','dumb-bell','dead lift','brownrice'),
(126,'22','56','dumb-bell','dead lift','brownrice'),
(127,'22','57','dumb-bell','dead lift','brownrice'),
(128,'22','58','dumb-bell','dead lift','brownrice'),
(129,'22','59','dumb-bell','dead lift','brownrice'),
(130,'22','60','dumb-bell','dead lift','brownrice'),
(131,'22','61','dumb-bell','dead lift','brownrice'),
(132,'22','62','dumb-bell','dead lift','brownrice'),
(133,'22','63','dumb-bell','dead lift','brownrice'),
(134,'22','64','dumb-bell','dead lift','brownrice'),
(135,'22','65','dumb-bell','dead lift','brownrice'),
(136,'22','66','dumb-bell','dead lift','brownrice'),
(137,'22','67','dumb-bell','dead lift','brownrice'),
(138,'22','68','dumb-bell','dead lift','brownrice'),
(139,'22','69','dumb-bell','dead lift','brownrice'),
(140,'22','70','dumb-bell','dead lift','brownrice'),
(141,'22','71','jogging','legpress','vegetables'),
(142,'22','72','jogging','legpress','vegetables'),
(143,'22','73','jogging','legpress','vegetables'),
(144,'22','74','jogging','legpress','vegetables'),
(145,'22','75','jogging','legpress','vegetables'),
(146,'22','76','jogging','legpress','vegetables'),
(147,'22','77','jogging','legpress','vegetables'),
(148,'22','78','jogging','legpress','vegetables'),
(149,'22','79','jogging','legpress','vegetables'),
(150,'22','80','jogging','legpress','vegetables'),
(151,'22','81','jogging','legpress','vegetables'),
(152,'22','82','jogging','legpress','vegetables'),
(153,'22','83','jogging','legpress','vegetables'),
(154,'22','84','jogging','legpress','vegetables'),
(155,'22','85','jogging','legpress','vegetables'),
(156,'22','86','jogging','legpress','vegetables'),
(157,'22','87','jogging','legpress','vegetables'),
(158,'22','88','jogging','legpress','vegetables'),
(159,'22','89','jogging','legpress','vegetables'),
(160,'22','90','jogging','legpress','vegetables'),
(161,'22','91','jogging','legpress','vegetables'),
(162,'22','92','jogging','legpress','vegetables'),
(163,'22','93','jogging','legpress','vegetables'),
(164,'22','94','jogging','legpress','vegetables'),
(165,'22','95','jogging','legpress','vegetables'),
(166,'22','96','jogging','legpress','vegetables'),
(167,'22','97','jogging','legpress','vegetables'),
(168,'22','98','jogging','legpress','vegetables'),
(169,'22','99','jogging','legpress','vegetables'),
(170,'22','100','jogging','legpress','vegetables'),
(171,'22','101','tred-mill','walking','vegetables'),
(172,'22','102','tred-mill','walking','vegetables'),
(173,'22','103','tred-mill','walking','vegetables'),
(174,'22','104','tred-mill','walking','vegetables'),
(175,'22','105','tred-mill','walking','vegetables'),
(176,'22','106','tred-mill','walking','vegetables'),
(177,'22','107','tred-mill','walking','vegetables'),
(178,'22','108','tred-mill','walking','vegetables'),
(179,'22','109','tred-mill','walking','vegetables'),
(180,'22','110','tred-mill','walking','vegetables'),
(181,'22','111','tred-mill','walking','vegetables'),
(182,'22','112','tred-mill','walking','vegetables'),
(183,'22','113','tred-mill','walking','vegetables'),
(184,'22','114','tred-mill','walking','vegetables'),
(185,'22','115','tred-mill','walking','vegetables'),
(186,'22','116','tred-mill','walking','vegetables'),
(187,'22','117','tred-mill','walking','vegetables'),
(188,'22','118','tred-mill','walking','vegetables'),
(189,'22','119','tred-mill','walking','vegetables'),
(190,'22','120','tred-mill','walking','vegetables'),
(191,'22','121','tred-mill','walking','vegetables'),
(192,'22','122','tred-mill','walking','vegetables'),
(193,'22','123','tred-mill','walking','vegetables'),
(194,'22','124','tred-mill','walking','vegetables'),
(195,'22','125','tred-mill','walking','vegetables'),
(196,'22','126','tred-mill','walking','vegetables'),
(197,'22','127','tred-mill','walking','vegetables'),
(198,'22','128','tred-mill','walking','vegetables'),
(199,'22','129','tred-mill','walking','vegetables'),
(200,'22','130','tred-mill','walking','vegetables'),
(201,'22','131','tred-mill','walking','vegetables'),
(202,'22','132','tred-mill','walking','vegetables'),
(203,'22','133','tred-mill','walking','vegetables'),
(204,'22','134','tred-mill','walking','vegetables'),
(205,'22','135','tred-mill','walking','vegetables'),
(206,'22','136','tred-mill','walking','vegetables'),
(207,'22','137','tred-mill','walking','vegetables'),
(208,'22','138','tred-mill','walking','vegetables'),
(209,'22','139','tred-mill','walking','vegetables'),
(210,'22','140','tred-mill','walking','vegetables'),
(211,'22','141','tred-mill','walking','vegetables'),
(212,'22','142','tred-mill','walking','vegetables'),
(213,'22','143','tred-mill','walking','vegetables'),
(214,'22','144','tred-mill','walking','vegetables'),
(215,'22','145','tred-mill','walking','vegetables'),
(216,'22','146','tred-mill','walking','vegetables'),
(217,'22','147','tred-mill','walking','vegetables'),
(218,'22','148','tred-mill','walking','vegetables'),
(219,'22','149','tred-mill','walking','vegetables'),
(220,'22','150','tred-mill','walking','vegetables'),
(221,'23','41','chest-workout','shoulder-workout','salads'),
(222,'23','42','chest-workout','shoulder-workout','salads'),
(223,'23','43','chest-workout','shoulder-workout','salads'),
(224,'23','44','chest-workout','shoulder-workout','salads'),
(225,'23','45','chest-workout','shoulder-workout','salads'),
(226,'23','46','chest-workout','shoulder-workout','salads'),
(227,'23','47','chest-workout','shoulder-workout','salads'),
(228,'23','48','chest-workout','shoulder-workout','salads'),
(229,'23','49','chest-workout','shoulder-workout','salads'),
(230,'23','50','chest-workout','shoulder-workout','salads'),
(231,'23','51','dumb-bell','dead lift','brownrice'),
(232,'23','52','dumb-bell','dead lift','brownrice'),
(233,'23','53','dumb-bell','dead lift','brownrice'),
(234,'23','54','dumb-bell','dead lift','brownrice'),
(235,'23','55','dumb-bell','dead lift','brownrice'),
(236,'23','56','dumb-bell','dead lift','brownrice'),
(237,'23','57','dumb-bell','dead lift','brownrice'),
(238,'23','58','dumb-bell','dead lift','brownrice'),
(239,'23','59','dumb-bell','dead lift','brownrice'),
(240,'23','60','dumb-bell','dead lift','brownrice'),
(241,'23','61','dumb-bell','dead lift','brownrice'),
(242,'23','62','dumb-bell','dead lift','brownrice'),
(243,'23','63','dumb-bell','dead lift','brownrice'),
(244,'23','64','dumb-bell','dead lift','brownrice'),
(245,'23','65','dumb-bell','dead lift','brownrice'),
(246,'23','66','dumb-bell','dead lift','brownrice'),
(247,'23','67','dumb-bell','dead lift','brownrice'),
(248,'23','68','dumb-bell','dead lift','brownrice'),
(249,'23','69','dumb-bell','dead lift','brownrice'),
(250,'23','70','dumb-bell','dead lift','brownrice'),
(251,'23','71','jogging','legpress','vegetables'),
(252,'23','72','jogging','legpress','vegetables'),
(253,'23','73','jogging','legpress','vegetables'),
(254,'23','74','jogging','legpress','vegetables'),
(255,'23','75','jogging','legpress','vegetables'),
(256,'23','76','jogging','legpress','vegetables'),
(257,'23','77','jogging','legpress','vegetables'),
(258,'23','78','jogging','legpress','vegetables'),
(259,'23','79','jogging','legpress','vegetables'),
(260,'23','80','jogging','legpress','vegetables'),
(261,'23','81','jogging','legpress','vegetables'),
(262,'23','82','jogging','legpress','vegetables'),
(263,'23','83','jogging','legpress','vegetables'),
(264,'23','84','jogging','legpress','vegetables'),
(265,'23','85','jogging','legpress','vegetables'),
(266,'23','86','jogging','legpress','vegetables'),
(267,'23','87','jogging','legpress','vegetables'),
(268,'23','88','jogging','legpress','vegetables'),
(269,'23','89','jogging','legpress','vegetables'),
(270,'23','90','jogging','legpress','vegetables'),
(271,'23','91','jogging','legpress','vegetables'),
(272,'23','92','jogging','legpress','vegetables'),
(273,'23','93','jogging','legpress','vegetables'),
(274,'23','94','jogging','legpress','vegetables'),
(275,'23','95','jogging','legpress','vegetables'),
(276,'23','96','jogging','legpress','vegetables'),
(277,'23','97','jogging','legpress','vegetables'),
(278,'23','98','jogging','legpress','vegetables'),
(279,'23','99','jogging','legpress','vegetables'),
(280,'23','100','jogging','legpress','vegetables'),
(281,'23','101','tred-mill','walking','vegetables'),
(282,'23','102','tred-mill','walking','vegetables'),
(283,'23','103','tred-mill','walking','vegetables'),
(284,'23','104','tred-mill','walking','vegetables'),
(285,'23','105','tred-mill','walking','vegetables'),
(286,'23','106','tred-mill','walking','vegetables'),
(287,'23','107','tred-mill','walking','vegetables'),
(288,'23','108','tred-mill','walking','vegetables'),
(289,'23','109','tred-mill','walking','vegetables'),
(290,'23','110','tred-mill','walking','vegetables'),
(291,'23','111','tred-mill','walking','vegetables'),
(292,'23','112','tred-mill','walking','vegetables'),
(293,'23','113','tred-mill','walking','vegetables'),
(294,'23','114','tred-mill','walking','vegetables'),
(295,'23','115','tred-mill','walking','vegetables'),
(296,'23','116','tred-mill','walking','vegetables'),
(297,'23','117','tred-mill','walking','vegetables'),
(298,'23','118','tred-mill','walking','vegetables'),
(299,'23','119','tred-mill','walking','vegetables'),
(300,'23','120','tred-mill','walking','vegetables'),
(301,'23','121','tred-mill','walking','vegetables'),
(302,'23','122','tred-mill','walking','vegetables'),
(303,'23','123','tred-mill','walking','vegetables'),
(304,'23','124','tred-mill','walking','vegetables'),
(305,'23','125','tred-mill','walking','vegetables'),
(306,'23','126','tred-mill','walking','vegetables'),
(307,'23','127','tred-mill','walking','vegetables'),
(308,'23','128','tred-mill','walking','vegetables'),
(309,'23','129','tred-mill','walking','vegetables'),
(310,'23','130','tred-mill','walking','vegetables'),
(311,'23','131','tred-mill','walking','vegetables'),
(312,'23','132','tred-mill','walking','vegetables'),
(313,'23','133','tred-mill','walking','vegetables'),
(314,'23','134','tred-mill','walking','vegetables'),
(315,'23','135','tred-mill','walking','vegetables'),
(316,'23','136','tred-mill','walking','vegetables'),
(317,'23','137','tred-mill','walking','vegetables'),
(318,'23','138','tred-mill','walking','vegetables'),
(319,'23','139','tred-mill','walking','vegetables'),
(320,'23','140','tred-mill','walking','vegetables'),
(321,'23','141','tred-mill','walking','vegetables'),
(322,'23','142','tred-mill','walking','vegetables'),
(323,'23','143','tred-mill','walking','vegetables'),
(324,'23','144','tred-mill','walking','vegetables'),
(325,'23','145','tred-mill','walking','vegetables'),
(326,'23','146','tred-mill','walking','vegetables'),
(327,'23','147','tred-mill','walking','vegetables'),
(328,'23','148','tred-mill','walking','vegetables'),
(329,'23','149','tred-mill','walking','vegetables'),
(330,'23','150','tred-mill','walking','vegetables'),
(331,'24','41','chest-workout','shoulder-workout','salads'),
(332,'24','42','chest-workout','shoulder-workout','salads'),
(333,'24','43','chest-workout','shoulder-workout','salads'),
(334,'24','44','chest-workout','shoulder-workout','salads'),
(335,'24','45','chest-workout','shoulder-workout','salads'),
(336,'24','46','chest-workout','shoulder-workout','salads'),
(337,'24','47','chest-workout','shoulder-workout','salads'),
(338,'24','48','chest-workout','shoulder-workout','salads'),
(339,'24','49','chest-workout','shoulder-workout','salads'),
(340,'24','50','chest-workout','shoulder-workout','salads'),
(341,'24','51','dumb-bell','dead lift','brownrice'),
(342,'24','52','dumb-bell','dead lift','brownrice'),
(343,'24','53','dumb-bell','dead lift','brownrice'),
(344,'24','54','dumb-bell','dead lift','brownrice'),
(345,'24','55','dumb-bell','dead lift','brownrice'),
(346,'24','56','dumb-bell','dead lift','brownrice'),
(347,'24','57','dumb-bell','dead lift','brownrice'),
(348,'24','58','dumb-bell','dead lift','brownrice'),
(349,'24','59','dumb-bell','dead lift','brownrice'),
(350,'24','60','dumb-bell','dead lift','brownrice'),
(351,'24','61','dumb-bell','dead lift','brownrice'),
(352,'24','62','dumb-bell','dead lift','brownrice'),
(353,'24','63','dumb-bell','dead lift','brownrice'),
(354,'24','64','dumb-bell','dead lift','brownrice'),
(355,'24','65','dumb-bell','dead lift','brownrice'),
(356,'24','66','dumb-bell','dead lift','brownrice'),
(357,'24','67','dumb-bell','dead lift','brownrice'),
(358,'24','68','dumb-bell','dead lift','brownrice'),
(359,'24','69','dumb-bell','dead lift','brownrice'),
(360,'24','70','dumb-bell','dead lift','brownrice'),
(361,'24','71','jogging','legpress','vegetables'),
(362,'24','72','jogging','legpress','vegetables'),
(363,'24','73','jogging','legpress','vegetables'),
(364,'24','74','jogging','legpress','vegetables'),
(365,'24','75','jogging','legpress','vegetables'),
(366,'24','76','jogging','legpress','vegetables'),
(367,'24','77','jogging','legpress','vegetables'),
(368,'24','78','jogging','legpress','vegetables'),
(369,'24','79','jogging','legpress','vegetables'),
(370,'24','80','jogging','legpress','vegetables'),
(371,'24','81','jogging','legpress','vegetables'),
(372,'24','82','jogging','legpress','vegetables'),
(373,'24','83','jogging','legpress','vegetables'),
(374,'24','84','jogging','legpress','vegetables'),
(375,'24','85','jogging','legpress','vegetables'),
(376,'24','86','jogging','legpress','vegetables'),
(377,'24','87','jogging','legpress','vegetables'),
(378,'24','88','jogging','legpress','vegetables'),
(379,'24','89','jogging','legpress','vegetables'),
(380,'24','90','jogging','legpress','vegetables'),
(381,'24','91','jogging','legpress','vegetables'),
(382,'24','92','jogging','legpress','vegetables'),
(383,'24','93','jogging','legpress','vegetables'),
(384,'24','94','jogging','legpress','vegetables'),
(385,'24','95','jogging','legpress','vegetables'),
(386,'24','96','jogging','legpress','vegetables'),
(387,'24','97','jogging','legpress','vegetables'),
(388,'24','98','jogging','legpress','vegetables'),
(389,'24','99','jogging','legpress','vegetables'),
(390,'24','100','jogging','legpress','vegetables'),
(391,'24','101','tred-mill','walking','vegetables'),
(392,'24','102','tred-mill','walking','vegetables'),
(393,'24','103','tred-mill','walking','vegetables'),
(394,'24','104','tred-mill','walking','vegetables'),
(395,'24','105','tred-mill','walking','vegetables'),
(396,'24','106','tred-mill','walking','vegetables'),
(397,'24','107','tred-mill','walking','vegetables'),
(398,'24','108','tred-mill','walking','vegetables'),
(399,'24','109','tred-mill','walking','vegetables'),
(400,'24','110','tred-mill','walking','vegetables'),
(401,'24','111','tred-mill','walking','vegetables'),
(402,'24','112','tred-mill','walking','vegetables'),
(403,'24','113','tred-mill','walking','vegetables'),
(404,'24','114','tred-mill','walking','vegetables'),
(405,'24','115','tred-mill','walking','vegetables'),
(406,'24','116','tred-mill','walking','vegetables'),
(407,'24','117','tred-mill','walking','vegetables'),
(408,'24','118','tred-mill','walking','vegetables'),
(409,'24','119','tred-mill','walking','vegetables'),
(410,'24','120','tred-mill','walking','vegetables'),
(411,'24','121','tred-mill','walking','vegetables'),
(412,'24','122','tred-mill','walking','vegetables'),
(413,'24','123','tred-mill','walking','vegetables'),
(414,'24','124','tred-mill','walking','vegetables'),
(415,'24','125','tred-mill','walking','vegetables'),
(416,'24','126','tred-mill','walking','vegetables'),
(417,'24','127','tred-mill','walking','vegetables'),
(418,'24','128','tred-mill','walking','vegetables'),
(419,'24','129','tred-mill','walking','vegetables'),
(420,'24','130','tred-mill','walking','vegetables'),
(421,'24','131','tred-mill','walking','vegetables'),
(422,'24','132','tred-mill','walking','vegetables'),
(423,'24','133','tred-mill','walking','vegetables'),
(424,'24','134','tred-mill','walking','vegetables'),
(425,'24','135','tred-mill','walking','vegetables'),
(426,'24','136','tred-mill','walking','vegetables'),
(427,'24','137','tred-mill','walking','vegetables'),
(428,'24','138','tred-mill','walking','vegetables'),
(429,'24','139','tred-mill','walking','vegetables'),
(430,'24','140','tred-mill','walking','vegetables'),
(431,'24','141','tred-mill','walking','vegetables'),
(432,'24','142','tred-mill','walking','vegetables'),
(433,'24','143','tred-mill','walking','vegetables'),
(434,'24','144','tred-mill','walking','vegetables'),
(435,'24','145','tred-mill','walking','vegetables'),
(436,'24','146','tred-mill','walking','vegetables'),
(437,'24','147','tred-mill','walking','vegetables'),
(438,'24','148','tred-mill','walking','vegetables'),
(439,'24','149','tred-mill','walking','vegetables'),
(440,'24','150','tred-mill','walking','vegetables'),
(441,'25','41','chest-workout','shoulder-workout','salads'),
(442,'25','42','chest-workout','shoulder-workout','salads'),
(443,'25','43','chest-workout','shoulder-workout','salads'),
(444,'25','44','chest-workout','shoulder-workout','salads'),
(445,'25','45','chest-workout','shoulder-workout','salads'),
(446,'25','46','chest-workout','shoulder-workout','salads'),
(447,'25','47','chest-workout','shoulder-workout','salads'),
(448,'25','48','chest-workout','shoulder-workout','salads'),
(449,'25','49','chest-workout','shoulder-workout','salads'),
(450,'25','50','chest-workout','shoulder-workout','salads'),
(451,'25','51','dumb-bell','dead lift','brownrice'),
(452,'25','52','dumb-bell','dead lift','brownrice'),
(453,'25','53','dumb-bell','dead lift','brownrice'),
(454,'25','54','dumb-bell','dead lift','brownrice'),
(455,'25','55','dumb-bell','dead lift','brownrice'),
(456,'25','56','dumb-bell','dead lift','brownrice'),
(457,'25','57','dumb-bell','dead lift','brownrice'),
(458,'25','58','dumb-bell','dead lift','brownrice'),
(459,'25','59','dumb-bell','dead lift','brownrice'),
(460,'25','60','dumb-bell','dead lift','brownrice'),
(461,'25','61','dumb-bell','dead lift','brownrice'),
(462,'25','62','dumb-bell','dead lift','brownrice'),
(463,'25','63','dumb-bell','dead lift','brownrice'),
(464,'25','64','dumb-bell','dead lift','brownrice'),
(465,'25','65','dumb-bell','dead lift','brownrice'),
(466,'25','66','dumb-bell','dead lift','brownrice'),
(467,'25','67','dumb-bell','dead lift','brownrice'),
(468,'25','68','dumb-bell','dead lift','brownrice'),
(469,'25','69','dumb-bell','dead lift','brownrice'),
(470,'25','70','dumb-bell','dead lift','brownrice'),
(471,'25','71','jogging','legpress','vegetables'),
(472,'25','72','jogging','legpress','vegetables'),
(473,'25','73','jogging','legpress','vegetables'),
(474,'25','74','jogging','legpress','vegetables'),
(475,'25','75','jogging','legpress','vegetables'),
(476,'25','76','jogging','legpress','vegetables'),
(477,'25','77','jogging','legpress','vegetables'),
(478,'25','78','jogging','legpress','vegetables'),
(479,'25','79','jogging','legpress','vegetables'),
(480,'25','80','jogging','legpress','vegetables'),
(481,'25','81','jogging','legpress','vegetables'),
(482,'25','82','jogging','legpress','vegetables'),
(483,'25','83','jogging','legpress','vegetables'),
(484,'25','84','jogging','legpress','vegetables'),
(485,'25','85','jogging','legpress','vegetables'),
(486,'25','86','jogging','legpress','vegetables'),
(487,'25','87','jogging','legpress','vegetables'),
(488,'25','88','jogging','legpress','vegetables'),
(489,'25','89','jogging','legpress','vegetables'),
(490,'25','90','jogging','legpress','vegetables'),
(491,'25','91','jogging','legpress','vegetables'),
(492,'25','92','jogging','legpress','vegetables'),
(493,'25','93','jogging','legpress','vegetables'),
(494,'25','94','jogging','legpress','vegetables'),
(495,'25','95','jogging','legpress','vegetables'),
(496,'25','96','jogging','legpress','vegetables'),
(497,'25','97','jogging','legpress','vegetables'),
(498,'25','98','jogging','legpress','vegetables'),
(499,'25','99','jogging','legpress','vegetables'),
(500,'25','100','jogging','legpress','vegetables'),
(501,'25','101','tred-mill','walking','vegetables'),
(502,'25','102','tred-mill','walking','vegetables'),
(503,'25','103','tred-mill','walking','vegetables'),
(504,'25','104','tred-mill','walking','vegetables'),
(505,'25','105','tred-mill','walking','vegetables'),
(506,'25','106','tred-mill','walking','vegetables'),
(507,'25','107','tred-mill','walking','vegetables'),
(508,'25','108','tred-mill','walking','vegetables'),
(509,'25','109','tred-mill','walking','vegetables'),
(510,'25','110','tred-mill','walking','vegetables'),
(511,'25','111','tred-mill','walking','vegetables'),
(512,'25','112','tred-mill','walking','vegetables'),
(513,'25','113','tred-mill','walking','vegetables'),
(514,'25','114','tred-mill','walking','vegetables'),
(515,'25','115','tred-mill','walking','vegetables'),
(516,'25','116','tred-mill','walking','vegetables'),
(517,'25','117','tred-mill','walking','vegetables'),
(518,'25','118','tred-mill','walking','vegetables'),
(519,'25','119','tred-mill','walking','vegetables'),
(520,'25','120','tred-mill','walking','vegetables'),
(521,'25','121','tred-mill','walking','vegetables'),
(522,'25','122','tred-mill','walking','vegetables'),
(523,'25','123','tred-mill','walking','vegetables'),
(524,'25','124','tred-mill','walking','vegetables'),
(525,'25','125','tred-mill','walking','vegetables'),
(526,'25','126','tred-mill','walking','vegetables'),
(527,'25','127','tred-mill','walking','vegetables'),
(528,'25','128','tred-mill','walking','vegetables'),
(529,'25','129','tred-mill','walking','vegetables'),
(530,'25','130','tred-mill','walking','vegetables'),
(531,'25','131','tred-mill','walking','vegetables'),
(532,'25','132','tred-mill','walking','vegetables'),
(533,'25','133','tred-mill','walking','vegetables'),
(534,'25','134','tred-mill','walking','vegetables'),
(535,'25','135','tred-mill','walking','vegetables'),
(536,'25','136','tred-mill','walking','vegetables'),
(537,'25','137','tred-mill','walking','vegetables'),
(538,'25','138','tred-mill','walking','vegetables'),
(539,'25','139','tred-mill','walking','vegetables'),
(540,'25','140','tred-mill','walking','vegetables'),
(541,'25','141','tred-mill','walking','vegetables'),
(542,'25','142','tred-mill','walking','vegetables'),
(543,'25','143','tred-mill','walking','vegetables'),
(544,'25','144','tred-mill','walking','vegetables'),
(545,'25','145','tred-mill','walking','vegetables'),
(546,'25','146','tred-mill','walking','vegetables'),
(547,'25','147','tred-mill','walking','vegetables'),
(548,'25','148','tred-mill','walking','vegetables'),
(549,'25','149','tred-mill','walking','vegetables'),
(550,'25','150','tred-mill','walking','vegetables'),
(551,'26','41','chest-workout','shoulder-workout','salads'),
(552,'26','42','chest-workout','shoulder-workout','salads'),
(553,'26','43','chest-workout','shoulder-workout','salads'),
(554,'26','44','chest-workout','shoulder-workout','salads'),
(555,'26','45','chest-workout','shoulder-workout','salads'),
(556,'26','46','chest-workout','shoulder-workout','salads'),
(557,'26','47','chest-workout','shoulder-workout','salads'),
(558,'26','48','chest-workout','shoulder-workout','salads'),
(559,'26','49','chest-workout','shoulder-workout','salads'),
(560,'26','50','chest-workout','shoulder-workout','salads'),
(561,'26','51','dumb-bell','dead lift','brownrice'),
(562,'26','52','dumb-bell','dead lift','brownrice'),
(563,'26','53','dumb-bell','dead lift','brownrice'),
(564,'26','54','dumb-bell','dead lift','brownrice'),
(565,'26','55','dumb-bell','dead lift','brownrice'),
(566,'26','56','dumb-bell','dead lift','brownrice'),
(567,'26','57','dumb-bell','dead lift','brownrice'),
(568,'26','58','dumb-bell','dead lift','brownrice'),
(569,'26','59','dumb-bell','dead lift','brownrice'),
(570,'26','60','dumb-bell','dead lift','brownrice'),
(571,'26','61','dumb-bell','dead lift','brownrice'),
(572,'26','62','dumb-bell','dead lift','brownrice'),
(573,'26','63','dumb-bell','dead lift','brownrice'),
(574,'26','64','dumb-bell','dead lift','brownrice'),
(575,'26','65','dumb-bell','dead lift','brownrice'),
(576,'26','66','dumb-bell','dead lift','brownrice'),
(577,'26','67','dumb-bell','dead lift','brownrice'),
(578,'26','68','dumb-bell','dead lift','brownrice'),
(579,'26','69','dumb-bell','dead lift','brownrice'),
(580,'26','70','dumb-bell','dead lift','brownrice'),
(581,'26','71','jogging','legpress','vegetables'),
(582,'26','72','jogging','legpress','vegetables'),
(583,'26','73','jogging','legpress','vegetables'),
(584,'26','74','jogging','legpress','vegetables'),
(585,'26','75','jogging','legpress','vegetables'),
(586,'26','76','jogging','legpress','vegetables'),
(587,'26','77','jogging','legpress','vegetables'),
(588,'26','78','jogging','legpress','vegetables'),
(589,'26','79','jogging','legpress','vegetables'),
(590,'26','80','jogging','legpress','vegetables'),
(591,'26','81','jogging','legpress','vegetables'),
(592,'26','82','jogging','legpress','vegetables'),
(593,'26','83','jogging','legpress','vegetables'),
(594,'26','84','jogging','legpress','vegetables'),
(595,'26','85','jogging','legpress','vegetables'),
(596,'26','86','jogging','legpress','vegetables'),
(597,'26','87','jogging','legpress','vegetables'),
(598,'26','88','jogging','legpress','vegetables'),
(599,'26','89','jogging','legpress','vegetables'),
(600,'26','90','jogging','legpress','vegetables'),
(601,'26','91','jogging','legpress','vegetables'),
(602,'26','92','jogging','legpress','vegetables'),
(603,'26','93','jogging','legpress','vegetables'),
(604,'26','94','jogging','legpress','vegetables'),
(605,'26','95','jogging','legpress','vegetables'),
(606,'26','96','jogging','legpress','vegetables'),
(607,'26','97','jogging','legpress','vegetables'),
(608,'26','98','jogging','legpress','vegetables'),
(609,'26','99','jogging','legpress','vegetables'),
(610,'26','100','jogging','legpress','vegetables'),
(611,'26','101','tred-mill','walking','vegetables'),
(612,'26','102','tred-mill','walking','vegetables'),
(613,'26','103','tred-mill','walking','vegetables'),
(614,'26','104','tred-mill','walking','vegetables'),
(615,'26','105','tred-mill','walking','vegetables'),
(616,'26','106','tred-mill','walking','vegetables'),
(617,'26','107','tred-mill','walking','vegetables'),
(618,'26','108','tred-mill','walking','vegetables'),
(619,'26','109','tred-mill','walking','vegetables'),
(620,'26','110','tred-mill','walking','vegetables'),
(621,'26','111','tred-mill','walking','vegetables'),
(622,'26','112','tred-mill','walking','vegetables'),
(623,'26','113','tred-mill','walking','vegetables'),
(624,'26','114','tred-mill','walking','vegetables'),
(625,'26','115','tred-mill','walking','vegetables'),
(626,'26','116','tred-mill','walking','vegetables'),
(627,'26','117','tred-mill','walking','vegetables'),
(628,'26','118','tred-mill','walking','vegetables'),
(629,'26','119','tred-mill','walking','vegetables'),
(630,'26','120','tred-mill','walking','vegetables'),
(631,'26','121','tred-mill','walking','vegetables'),
(632,'26','122','tred-mill','walking','vegetables'),
(633,'26','123','tred-mill','walking','vegetables'),
(634,'26','124','tred-mill','walking','vegetables'),
(635,'26','125','tred-mill','walking','vegetables'),
(636,'26','126','tred-mill','walking','vegetables'),
(637,'26','127','tred-mill','walking','vegetables'),
(638,'26','128','tred-mill','walking','vegetables'),
(639,'26','129','tred-mill','walking','vegetables'),
(640,'26','130','tred-mill','walking','vegetables'),
(641,'26','131','tred-mill','walking','vegetables'),
(642,'26','132','tred-mill','walking','vegetables'),
(643,'26','133','tred-mill','walking','vegetables'),
(644,'26','134','tred-mill','walking','vegetables'),
(645,'26','135','tred-mill','walking','vegetables'),
(646,'26','136','tred-mill','walking','vegetables'),
(647,'26','137','tred-mill','walking','vegetables'),
(648,'26','138','tred-mill','walking','vegetables'),
(649,'26','139','tred-mill','walking','vegetables'),
(650,'26','140','tred-mill','walking','vegetables'),
(651,'26','141','tred-mill','walking','vegetables'),
(652,'26','142','tred-mill','walking','vegetables'),
(653,'26','143','tred-mill','walking','vegetables'),
(654,'26','144','tred-mill','walking','vegetables'),
(655,'26','145','tred-mill','walking','vegetables'),
(656,'26','146','tred-mill','walking','vegetables'),
(657,'26','147','tred-mill','walking','vegetables'),
(658,'26','148','tred-mill','walking','vegetables'),
(659,'26','149','tred-mill','walking','vegetables'),
(660,'26','150','tred-mill','walking','vegetables'),
(661,'27','41','chest-workout','shoulder-workout','salads'),
(662,'27','42','chest-workout','shoulder-workout','salads'),
(663,'27','43','chest-workout','shoulder-workout','salads'),
(664,'27','44','chest-workout','shoulder-workout','salads'),
(665,'27','45','chest-workout','shoulder-workout','salads'),
(666,'27','46','chest-workout','shoulder-workout','salads'),
(667,'27','47','chest-workout','shoulder-workout','salads'),
(668,'27','48','chest-workout','shoulder-workout','salads'),
(669,'27','49','chest-workout','shoulder-workout','salads'),
(670,'27','50','chest-workout','shoulder-workout','salads'),
(671,'27','51','dumb-bell','dead lift','brownrice'),
(672,'27','52','dumb-bell','dead lift','brownrice'),
(673,'27','53','dumb-bell','dead lift','brownrice'),
(674,'27','54','dumb-bell','dead lift','brownrice'),
(675,'27','55','dumb-bell','dead lift','brownrice'),
(676,'27','56','dumb-bell','dead lift','brownrice'),
(677,'27','57','dumb-bell','dead lift','brownrice'),
(678,'27','58','dumb-bell','dead lift','brownrice'),
(679,'27','59','dumb-bell','dead lift','brownrice'),
(680,'27','60','dumb-bell','dead lift','brownrice'),
(681,'27','61','dumb-bell','dead lift','brownrice'),
(682,'27','62','dumb-bell','dead lift','brownrice'),
(683,'27','63','dumb-bell','dead lift','brownrice'),
(684,'27','64','dumb-bell','dead lift','brownrice'),
(685,'27','65','dumb-bell','dead lift','brownrice'),
(686,'27','66','dumb-bell','dead lift','brownrice'),
(687,'27','67','dumb-bell','dead lift','brownrice'),
(688,'27','68','dumb-bell','dead lift','brownrice'),
(689,'27','69','dumb-bell','dead lift','brownrice'),
(690,'27','70','dumb-bell','dead lift','brownrice'),
(691,'27','71','jogging','legpress','vegetables'),
(692,'27','72','jogging','legpress','vegetables'),
(693,'27','73','jogging','legpress','vegetables'),
(694,'27','74','jogging','legpress','vegetables'),
(695,'27','75','jogging','legpress','vegetables'),
(696,'27','76','jogging','legpress','vegetables'),
(697,'27','77','jogging','legpress','vegetables'),
(698,'27','78','jogging','legpress','vegetables'),
(699,'27','79','jogging','legpress','vegetables'),
(700,'27','80','jogging','legpress','vegetables'),
(701,'27','81','jogging','legpress','vegetables'),
(702,'27','82','jogging','legpress','vegetables'),
(703,'27','83','jogging','legpress','vegetables'),
(704,'27','84','jogging','legpress','vegetables'),
(705,'27','85','jogging','legpress','vegetables'),
(706,'27','86','jogging','legpress','vegetables'),
(707,'27','87','jogging','legpress','vegetables'),
(708,'27','88','jogging','legpress','vegetables'),
(709,'27','89','jogging','legpress','vegetables'),
(710,'27','90','jogging','legpress','vegetables'),
(711,'27','91','jogging','legpress','vegetables'),
(712,'27','92','jogging','legpress','vegetables'),
(713,'27','93','jogging','legpress','vegetables'),
(714,'27','94','jogging','legpress','vegetables'),
(715,'27','95','jogging','legpress','vegetables'),
(716,'27','96','jogging','legpress','vegetables'),
(717,'27','97','jogging','legpress','vegetables'),
(718,'27','98','jogging','legpress','vegetables'),
(719,'27','99','jogging','legpress','vegetables'),
(720,'27','100','jogging','legpress','vegetables'),
(721,'27','101','tred-mill','walking','vegetables'),
(722,'27','102','tred-mill','walking','vegetables'),
(723,'27','103','tred-mill','walking','vegetables'),
(724,'27','104','tred-mill','walking','vegetables'),
(725,'27','105','tred-mill','walking','vegetables'),
(726,'27','106','tred-mill','walking','vegetables'),
(727,'27','107','tred-mill','walking','vegetables'),
(728,'27','108','tred-mill','walking','vegetables'),
(729,'27','109','tred-mill','walking','vegetables'),
(730,'27','110','tred-mill','walking','vegetables'),
(731,'27','111','tred-mill','walking','vegetables'),
(732,'27','112','tred-mill','walking','vegetables'),
(733,'27','113','tred-mill','walking','vegetables'),
(734,'27','114','tred-mill','walking','vegetables'),
(735,'27','115','tred-mill','walking','vegetables'),
(736,'27','116','tred-mill','walking','vegetables'),
(737,'27','117','tred-mill','walking','vegetables'),
(738,'27','118','tred-mill','walking','vegetables'),
(739,'27','119','tred-mill','walking','vegetables'),
(740,'27','120','tred-mill','walking','vegetables'),
(741,'27','121','tred-mill','walking','vegetables'),
(742,'27','122','tred-mill','walking','vegetables'),
(743,'27','123','tred-mill','walking','vegetables'),
(744,'27','124','tred-mill','walking','vegetables'),
(745,'27','125','tred-mill','walking','vegetables'),
(746,'27','126','tred-mill','walking','vegetables'),
(747,'27','127','tred-mill','walking','vegetables'),
(748,'27','128','tred-mill','walking','vegetables'),
(749,'27','129','tred-mill','walking','vegetables'),
(750,'27','130','tred-mill','walking','vegetables'),
(751,'27','131','tred-mill','walking','vegetables'),
(752,'27','132','tred-mill','walking','vegetables'),
(753,'27','133','tred-mill','walking','vegetables'),
(754,'27','134','tred-mill','walking','vegetables'),
(755,'27','135','tred-mill','walking','vegetables'),
(756,'27','136','tred-mill','walking','vegetables'),
(757,'27','137','tred-mill','walking','vegetables'),
(758,'27','138','tred-mill','walking','vegetables'),
(759,'27','139','tred-mill','walking','vegetables'),
(760,'27','140','tred-mill','walking','vegetables'),
(761,'27','141','tred-mill','walking','vegetables'),
(762,'27','142','tred-mill','walking','vegetables'),
(763,'27','143','tred-mill','walking','vegetables'),
(764,'27','144','tred-mill','walking','vegetables'),
(765,'27','145','tred-mill','walking','vegetables'),
(766,'27','146','tred-mill','walking','vegetables'),
(767,'27','147','tred-mill','walking','vegetables'),
(768,'27','148','tred-mill','walking','vegetables'),
(769,'27','149','tred-mill','walking','vegetables'),
(770,'27','150','tred-mill','walking','vegetables'),
(771,'28','41','chest-workout','shoulder-workout','salads'),
(772,'28','42','chest-workout','shoulder-workout','salads'),
(773,'28','43','chest-workout','shoulder-workout','salads'),
(774,'28','44','chest-workout','shoulder-workout','salads'),
(775,'28','45','chest-workout','shoulder-workout','salads'),
(776,'28','46','chest-workout','shoulder-workout','salads'),
(777,'28','47','chest-workout','shoulder-workout','salads'),
(778,'28','48','chest-workout','shoulder-workout','salads'),
(779,'28','49','chest-workout','shoulder-workout','salads'),
(780,'28','50','chest-workout','shoulder-workout','salads'),
(781,'28','51','dumb-bell','dead lift','brownrice'),
(782,'28','52','dumb-bell','dead lift','brownrice'),
(783,'28','53','dumb-bell','dead lift','brownrice'),
(784,'28','54','dumb-bell','dead lift','brownrice'),
(785,'28','55','dumb-bell','dead lift','brownrice'),
(786,'28','56','dumb-bell','dead lift','brownrice'),
(787,'28','57','dumb-bell','dead lift','brownrice'),
(788,'28','58','dumb-bell','dead lift','brownrice'),
(789,'28','59','dumb-bell','dead lift','brownrice'),
(790,'28','60','dumb-bell','dead lift','brownrice'),
(791,'28','61','dumb-bell','dead lift','brownrice'),
(792,'28','62','dumb-bell','dead lift','brownrice'),
(793,'28','63','dumb-bell','dead lift','brownrice'),
(794,'28','64','dumb-bell','dead lift','brownrice'),
(795,'28','65','dumb-bell','dead lift','brownrice'),
(796,'28','66','dumb-bell','dead lift','brownrice'),
(797,'28','67','dumb-bell','dead lift','brownrice'),
(798,'28','68','dumb-bell','dead lift','brownrice'),
(799,'28','69','dumb-bell','dead lift','brownrice'),
(800,'28','70','dumb-bell','dead lift','brownrice'),
(801,'28','71','jogging','legpress','vegetables'),
(802,'28','72','jogging','legpress','vegetables'),
(803,'28','73','jogging','legpress','vegetables'),
(804,'28','74','jogging','legpress','vegetables'),
(805,'28','75','jogging','legpress','vegetables'),
(806,'28','76','jogging','legpress','vegetables'),
(807,'28','77','jogging','legpress','vegetables'),
(808,'28','78','jogging','legpress','vegetables'),
(809,'28','79','jogging','legpress','vegetables'),
(810,'28','80','jogging','legpress','vegetables'),
(811,'28','81','jogging','legpress','vegetables'),
(812,'28','82','jogging','legpress','vegetables'),
(813,'28','83','jogging','legpress','vegetables'),
(814,'28','84','jogging','legpress','vegetables'),
(815,'28','85','jogging','legpress','vegetables'),
(816,'28','86','jogging','legpress','vegetables'),
(817,'28','87','jogging','legpress','vegetables'),
(818,'28','88','jogging','legpress','vegetables'),
(819,'28','89','jogging','legpress','vegetables'),
(820,'28','90','jogging','legpress','vegetables'),
(821,'28','91','jogging','legpress','vegetables'),
(822,'28','92','jogging','legpress','vegetables'),
(823,'28','93','jogging','legpress','vegetables'),
(824,'28','94','jogging','legpress','vegetables'),
(825,'28','95','jogging','legpress','vegetables'),
(826,'28','96','jogging','legpress','vegetables'),
(827,'28','97','jogging','legpress','vegetables'),
(828,'28','98','jogging','legpress','vegetables'),
(829,'28','99','jogging','legpress','vegetables'),
(830,'28','100','jogging','legpress','vegetables'),
(831,'28','101','tred-mill','walking','vegetables'),
(832,'28','102','tred-mill','walking','vegetables'),
(833,'28','103','tred-mill','walking','vegetables'),
(834,'28','104','tred-mill','walking','vegetables'),
(835,'28','105','tred-mill','walking','vegetables'),
(836,'28','106','tred-mill','walking','vegetables'),
(837,'28','107','tred-mill','walking','vegetables'),
(838,'28','108','tred-mill','walking','vegetables'),
(839,'28','109','tred-mill','walking','vegetables'),
(840,'28','110','tred-mill','walking','vegetables'),
(841,'28','111','tred-mill','walking','vegetables'),
(842,'28','112','tred-mill','walking','vegetables'),
(843,'28','113','tred-mill','walking','vegetables'),
(844,'28','114','tred-mill','walking','vegetables'),
(845,'28','115','tred-mill','walking','vegetables'),
(846,'28','116','tred-mill','walking','vegetables'),
(847,'28','117','tred-mill','walking','vegetables'),
(848,'28','118','tred-mill','walking','vegetables'),
(849,'28','119','tred-mill','walking','vegetables'),
(850,'28','120','tred-mill','walking','vegetables'),
(851,'28','121','tred-mill','walking','vegetables'),
(852,'28','122','tred-mill','walking','vegetables'),
(853,'28','123','tred-mill','walking','vegetables'),
(854,'28','124','tred-mill','walking','vegetables'),
(855,'28','125','tred-mill','walking','vegetables'),
(856,'28','126','tred-mill','walking','vegetables'),
(857,'28','127','tred-mill','walking','vegetables'),
(858,'28','128','tred-mill','walking','vegetables'),
(859,'28','129','tred-mill','walking','vegetables'),
(860,'28','130','tred-mill','walking','vegetables'),
(861,'28','131','tred-mill','walking','vegetables'),
(862,'28','132','tred-mill','walking','vegetables'),
(863,'28','133','tred-mill','walking','vegetables'),
(864,'28','134','tred-mill','walking','vegetables'),
(865,'28','135','tred-mill','walking','vegetables'),
(866,'28','136','tred-mill','walking','vegetables'),
(867,'28','137','tred-mill','walking','vegetables'),
(868,'28','138','tred-mill','walking','vegetables'),
(869,'28','139','tred-mill','walking','vegetables'),
(870,'28','140','tred-mill','walking','vegetables'),
(871,'28','141','tred-mill','walking','vegetables'),
(872,'28','142','tred-mill','walking','vegetables'),
(873,'28','143','tred-mill','walking','vegetables'),
(874,'28','144','tred-mill','walking','vegetables'),
(875,'28','145','tred-mill','walking','vegetables'),
(876,'28','146','tred-mill','walking','vegetables'),
(877,'28','147','tred-mill','walking','vegetables'),
(878,'28','148','tred-mill','walking','vegetables'),
(879,'28','149','tred-mill','walking','vegetables'),
(880,'28','150','tred-mill','walking','vegetables'),
(881,'29','41','chest-workout','shoulder-workout','salads'),
(882,'29','42','chest-workout','shoulder-workout','salads'),
(883,'29','43','chest-workout','shoulder-workout','salads'),
(884,'29','44','chest-workout','shoulder-workout','salads'),
(885,'29','45','chest-workout','shoulder-workout','salads'),
(886,'29','46','chest-workout','shoulder-workout','salads'),
(887,'29','47','chest-workout','shoulder-workout','salads'),
(888,'29','48','chest-workout','shoulder-workout','salads'),
(889,'29','49','chest-workout','shoulder-workout','salads'),
(890,'29','50','chest-workout','shoulder-workout','salads'),
(891,'29','51','dumb-bell','dead lift','brownrice'),
(892,'29','52','dumb-bell','dead lift','brownrice'),
(893,'29','53','dumb-bell','dead lift','brownrice'),
(894,'29','54','dumb-bell','dead lift','brownrice'),
(895,'29','55','dumb-bell','dead lift','brownrice'),
(896,'29','56','dumb-bell','dead lift','brownrice'),
(897,'29','57','dumb-bell','dead lift','brownrice'),
(898,'29','58','dumb-bell','dead lift','brownrice'),
(899,'29','59','dumb-bell','dead lift','brownrice'),
(900,'29','60','dumb-bell','dead lift','brownrice'),
(901,'29','61','dumb-bell','dead lift','brownrice'),
(902,'29','62','dumb-bell','dead lift','brownrice'),
(903,'29','63','dumb-bell','dead lift','brownrice'),
(904,'29','64','dumb-bell','dead lift','brownrice'),
(905,'29','65','dumb-bell','dead lift','brownrice'),
(906,'29','66','dumb-bell','dead lift','brownrice'),
(907,'29','67','dumb-bell','dead lift','brownrice'),
(908,'29','68','dumb-bell','dead lift','brownrice'),
(909,'29','69','dumb-bell','dead lift','brownrice'),
(910,'29','70','dumb-bell','dead lift','brownrice'),
(911,'29','71','jogging','legpress','vegetables'),
(912,'29','72','jogging','legpress','vegetables'),
(913,'29','73','jogging','legpress','vegetables'),
(914,'29','74','jogging','legpress','vegetables'),
(915,'29','75','jogging','legpress','vegetables'),
(916,'29','76','jogging','legpress','vegetables'),
(917,'29','77','jogging','legpress','vegetables'),
(918,'29','78','jogging','legpress','vegetables'),
(919,'29','79','jogging','legpress','vegetables'),
(920,'29','80','jogging','legpress','vegetables'),
(921,'29','81','jogging','legpress','vegetables'),
(922,'29','82','jogging','legpress','vegetables'),
(923,'29','83','jogging','legpress','vegetables'),
(924,'29','84','jogging','legpress','vegetables'),
(925,'29','85','jogging','legpress','vegetables'),
(926,'29','86','jogging','legpress','vegetables'),
(927,'29','87','jogging','legpress','vegetables'),
(928,'29','88','jogging','legpress','vegetables'),
(929,'29','89','jogging','legpress','vegetables'),
(930,'29','90','jogging','legpress','vegetables'),
(931,'29','91','jogging','legpress','vegetables'),
(932,'29','92','jogging','legpress','vegetables'),
(933,'29','93','jogging','legpress','vegetables'),
(934,'29','94','jogging','legpress','vegetables'),
(935,'29','95','jogging','legpress','vegetables'),
(936,'29','96','jogging','legpress','vegetables'),
(937,'29','97','jogging','legpress','vegetables'),
(938,'29','98','jogging','legpress','vegetables'),
(939,'29','99','jogging','legpress','vegetables'),
(940,'29','100','jogging','legpress','vegetables'),
(941,'29','101','tred-mill','walking','vegetables'),
(942,'29','102','tred-mill','walking','vegetables'),
(943,'29','103','tred-mill','walking','vegetables'),
(944,'29','104','tred-mill','walking','vegetables'),
(945,'29','105','tred-mill','walking','vegetables'),
(946,'29','106','tred-mill','walking','vegetables'),
(947,'29','107','tred-mill','walking','vegetables'),
(948,'29','108','tred-mill','walking','vegetables'),
(949,'29','109','tred-mill','walking','vegetables'),
(950,'29','110','tred-mill','walking','vegetables'),
(951,'29','111','tred-mill','walking','vegetables'),
(952,'29','112','tred-mill','walking','vegetables'),
(953,'29','113','tred-mill','walking','vegetables'),
(954,'29','114','tred-mill','walking','vegetables'),
(955,'29','115','tred-mill','walking','vegetables'),
(956,'29','116','tred-mill','walking','vegetables'),
(957,'29','117','tred-mill','walking','vegetables'),
(958,'29','118','tred-mill','walking','vegetables'),
(959,'29','119','tred-mill','walking','vegetables'),
(960,'29','120','tred-mill','walking','vegetables'),
(961,'29','121','tred-mill','walking','vegetables'),
(962,'29','122','tred-mill','walking','vegetables'),
(963,'29','123','tred-mill','walking','vegetables'),
(964,'29','124','tred-mill','walking','vegetables'),
(965,'29','125','tred-mill','walking','vegetables'),
(966,'29','126','tred-mill','walking','vegetables'),
(967,'29','127','tred-mill','walking','vegetables'),
(968,'29','128','tred-mill','walking','vegetables'),
(969,'29','129','tred-mill','walking','vegetables'),
(970,'29','130','tred-mill','walking','vegetables'),
(971,'29','131','tred-mill','walking','vegetables'),
(972,'29','132','tred-mill','walking','vegetables'),
(973,'29','133','tred-mill','walking','vegetables'),
(974,'29','134','tred-mill','walking','vegetables'),
(975,'29','135','tred-mill','walking','vegetables'),
(976,'29','136','tred-mill','walking','vegetables'),
(977,'29','137','tred-mill','walking','vegetables'),
(978,'29','138','tred-mill','walking','vegetables'),
(979,'29','139','tred-mill','walking','vegetables'),
(980,'29','140','tred-mill','walking','vegetables'),
(981,'29','141','tred-mill','walking','vegetables'),
(982,'29','142','tred-mill','walking','vegetables'),
(983,'29','143','tred-mill','walking','vegetables'),
(984,'29','144','tred-mill','walking','vegetables'),
(985,'29','145','tred-mill','walking','vegetables'),
(986,'29','146','tred-mill','walking','vegetables'),
(987,'29','147','tred-mill','walking','vegetables'),
(988,'29','148','tred-mill','walking','vegetables'),
(989,'29','149','tred-mill','walking','vegetables'),
(990,'29','150','tred-mill','walking','vegetables'),
(991,'30','41','chest-workout','shoulder-workout','salads'),
(992,'30','42','chest-workout','shoulder-workout','salads'),
(993,'30','43','chest-workout','shoulder-workout','salads'),
(994,'30','44','chest-workout','shoulder-workout','salads'),
(995,'30','45','chest-workout','shoulder-workout','salads'),
(996,'30','46','chest-workout','shoulder-workout','salads'),
(997,'30','47','chest-workout','shoulder-workout','salads'),
(998,'30','48','chest-workout','shoulder-workout','salads'),
(999,'30','49','chest-workout','shoulder-workout','salads'),
(1000,'30','50','chest-workout','shoulder-workout','salads'),
(1001,'30','51','dumb-bell','dead lift','brownrice'),
(1002,'30','52','dumb-bell','dead lift','brownrice'),
(1003,'30','53','dumb-bell','dead lift','brownrice'),
(1004,'30','54','dumb-bell','dead lift','brownrice'),
(1005,'30','55','dumb-bell','dead lift','brownrice'),
(1006,'30','56','dumb-bell','dead lift','brownrice'),
(1007,'30','57','dumb-bell','dead lift','brownrice'),
(1008,'30','58','dumb-bell','dead lift','brownrice'),
(1009,'30','59','dumb-bell','dead lift','brownrice'),
(1010,'30','60','dumb-bell','dead lift','brownrice'),
(1011,'30','61','dumb-bell','dead lift','brownrice'),
(1012,'30','62','dumb-bell','dead lift','brownrice'),
(1013,'30','63','dumb-bell','dead lift','brownrice'),
(1014,'30','64','dumb-bell','dead lift','brownrice'),
(1015,'30','65','dumb-bell','dead lift','brownrice'),
(1016,'30','66','dumb-bell','dead lift','brownrice'),
(1017,'30','67','dumb-bell','dead lift','brownrice'),
(1018,'30','68','dumb-bell','dead lift','brownrice'),
(1019,'30','69','dumb-bell','dead lift','brownrice'),
(1020,'30','70','dumb-bell','dead lift','brownrice'),
(1021,'30','71','jogging','legpress','vegetables'),
(1022,'30','72','jogging','legpress','vegetables'),
(1023,'30','73','jogging','legpress','vegetables'),
(1024,'30','74','jogging','legpress','vegetables'),
(1025,'30','75','jogging','legpress','vegetables'),
(1026,'30','76','jogging','legpress','vegetables'),
(1027,'30','77','jogging','legpress','vegetables'),
(1028,'30','78','jogging','legpress','vegetables'),
(1029,'30','79','jogging','legpress','vegetables'),
(1030,'30','80','jogging','legpress','vegetables'),
(1031,'30','81','jogging','legpress','vegetables'),
(1032,'30','82','jogging','legpress','vegetables'),
(1033,'30','83','jogging','legpress','vegetables'),
(1034,'30','84','jogging','legpress','vegetables'),
(1035,'30','85','jogging','legpress','vegetables'),
(1036,'30','86','jogging','legpress','vegetables'),
(1037,'30','87','jogging','legpress','vegetables'),
(1038,'30','88','jogging','legpress','vegetables'),
(1039,'30','89','jogging','legpress','vegetables'),
(1040,'30','90','jogging','legpress','vegetables'),
(1041,'30','91','jogging','legpress','vegetables'),
(1042,'30','92','jogging','legpress','vegetables'),
(1043,'30','93','jogging','legpress','vegetables'),
(1044,'30','94','jogging','legpress','vegetables'),
(1045,'30','95','jogging','legpress','vegetables'),
(1046,'30','96','jogging','legpress','vegetables'),
(1047,'30','97','jogging','legpress','vegetables'),
(1048,'30','98','jogging','legpress','vegetables'),
(1049,'30','99','jogging','legpress','vegetables'),
(1050,'30','100','jogging','legpress','vegetables'),
(1051,'30','101','tred-mill','walking','vegetables'),
(1052,'30','102','tred-mill','walking','vegetables'),
(1053,'30','103','tred-mill','walking','vegetables'),
(1054,'30','104','tred-mill','walking','vegetables'),
(1055,'30','105','tred-mill','walking','vegetables'),
(1056,'30','106','tred-mill','walking','vegetables'),
(1057,'30','107','tred-mill','walking','vegetables'),
(1058,'30','108','tred-mill','walking','vegetables'),
(1059,'30','109','tred-mill','walking','vegetables'),
(1060,'30','110','tred-mill','walking','vegetables'),
(1061,'30','111','tred-mill','walking','vegetables'),
(1062,'30','112','tred-mill','walking','vegetables'),
(1063,'30','113','tred-mill','walking','vegetables'),
(1064,'30','114','tred-mill','walking','vegetables'),
(1065,'30','115','tred-mill','walking','vegetables'),
(1066,'30','116','tred-mill','walking','vegetables'),
(1067,'30','117','tred-mill','walking','vegetables'),
(1068,'30','118','tred-mill','walking','vegetables'),
(1069,'30','119','tred-mill','walking','vegetables'),
(1070,'30','120','tred-mill','walking','vegetables'),
(1071,'30','121','tred-mill','walking','vegetables'),
(1072,'30','122','tred-mill','walking','vegetables'),
(1073,'30','123','tred-mill','walking','vegetables'),
(1074,'30','124','tred-mill','walking','vegetables'),
(1075,'30','125','tred-mill','walking','vegetables'),
(1076,'30','126','tred-mill','walking','vegetables'),
(1077,'30','127','tred-mill','walking','vegetables'),
(1078,'30','128','tred-mill','walking','vegetables'),
(1079,'30','129','tred-mill','walking','vegetables'),
(1080,'30','130','tred-mill','walking','vegetables'),
(1081,'30','131','tred-mill','walking','vegetables'),
(1082,'30','132','tred-mill','walking','vegetables'),
(1083,'30','133','tred-mill','walking','vegetables'),
(1084,'30','134','tred-mill','walking','vegetables'),
(1085,'30','135','tred-mill','walking','vegetables'),
(1086,'30','136','tred-mill','walking','vegetables'),
(1087,'30','137','tred-mill','walking','vegetables'),
(1088,'30','138','tred-mill','walking','vegetables'),
(1089,'30','139','tred-mill','walking','vegetables'),
(1090,'30','140','tred-mill','walking','vegetables'),
(1091,'30','141','tred-mill','walking','vegetables'),
(1092,'30','142','tred-mill','walking','vegetables'),
(1093,'30','143','tred-mill','walking','vegetables'),
(1094,'30','144','tred-mill','walking','vegetables'),
(1095,'30','145','tred-mill','walking','vegetables'),
(1096,'30','146','tred-mill','walking','vegetables'),
(1097,'30','147','tred-mill','walking','vegetables'),
(1098,'30','148','tred-mill','walking','vegetables'),
(1099,'30','149','tred-mill','walking','vegetables'),
(1100,'30','150','tred-mill','walking','vegetables'),
(1101,'31','41','machine fly','russian twist','oats and fruits'),
(1102,'31','42','machine fly','russian twist','oats and fruits'),
(1103,'31','43','machine fly','russian twist','oats and fruits'),
(1104,'31','44','machine fly','russian twist','oats and fruits'),
(1105,'31','45','machine fly','russian twist','oats and fruits'),
(1106,'31','46','machine fly','russian twist','oats and fruits'),
(1107,'31','47','machine fly','russian twist','oats and fruits'),
(1108,'31','48','machine fly','russian twist','oats and fruits'),
(1109,'31','49','machine fly','russian twist','oats and fruits'),
(1110,'31','50','machine fly','russian twist','oats and fruits'),
(1111,'31','51','foam roller','dead lift','eggs and almonds'),
(1112,'31','52','foam roller','dead lift','eggs and almonds'),
(1113,'31','53','foam roller','dead lift','eggs and almonds'),
(1114,'31','54','foam roller','dead lift','eggs and almonds'),
(1115,'31','55','foam roller','dead lift','eggs and almonds'),
(1116,'31','56','foam roller','dead lift','eggs and almonds'),
(1117,'31','57','foam roller','dead lift','eggs and almonds'),
(1118,'31','58','foam roller','dead lift','eggs and almonds'),
(1119,'31','59','foam roller','dead lift','eggs and almonds'),
(1120,'31','60','foam roller','dead lift','eggs and almonds'),
(1121,'31','61','foam roller','dead lift','eggs and almonds'),
(1122,'31','62','foam roller','dead lift','eggs and almonds'),
(1123,'31','63','foam roller','dead lift','eggs and almonds'),
(1124,'31','64','foam roller','dead lift','eggs and almonds'),
(1125,'31','65','foam roller','dead lift','eggs and almonds'),
(1126,'31','66','foam roller','dead lift','eggs and almonds'),
(1127,'31','67','foam roller','dead lift','eggs and almonds'),
(1128,'31','68','foam roller','dead lift','eggs and almonds'),
(1129,'31','69','foam roller','dead lift','eggs and almonds'),
(1130,'31','70','foam roller','dead lift','eggs and almonds'),
(1131,'31','71','pull-down','legpress','vegetables'),
(1132,'31','72','pull-down','legpress','vegetables'),
(1133,'31','73','pull-down','legpress','vegetables'),
(1134,'31','74','pull-down','legpress','vegetables'),
(1135,'31','75','pull-down','legpress','vegetables'),
(1136,'31','76','pull-down','legpress','vegetables'),
(1137,'31','77','pull-down','legpress','vegetables'),
(1138,'31','78','pull-down','legpress','vegetables'),
(1139,'31','79','pull-down','legpress','vegetables'),
(1140,'31','80','pull-down','legpress','vegetables'),
(1141,'31','81','pull-down','legpress','vegetables'),
(1142,'31','82','pull-down','legpress','vegetables'),
(1143,'31','83','pull-down','legpress','vegetables'),
(1144,'31','84','pull-down','legpress','vegetables'),
(1145,'31','85','pull-down','legpress','vegetables'),
(1146,'31','86','pull-down','legpress','vegetables'),
(1147,'31','87','pull-down','legpress','vegetables'),
(1148,'31','88','pull-down','legpress','vegetables'),
(1149,'31','89','pull-down','legpress','vegetables'),
(1150,'31','90','pull-down','legpress','vegetables'),
(1151,'31','91','pull-down','legpress','vegetables'),
(1152,'31','92','pull-down','legpress','vegetables'),
(1153,'31','93','pull-down','legpress','vegetables'),
(1154,'31','94','pull-down','legpress','vegetables'),
(1155,'31','95','pull-down','legpress','vegetables'),
(1156,'31','96','pull-down','legpress','vegetables'),
(1157,'31','97','pull-down','legpress','vegetables'),
(1158,'31','98','pull-down','legpress','vegetables'),
(1159,'31','99','pull-down','legpress','vegetables'),
(1160,'31','100','pull-down','legpress','vegetables'),
(1161,'31','101','tred-mill','walking','vegetables'),
(1162,'31','102','tred-mill','walking','vegetables'),
(1163,'31','103','tred-mill','walking','vegetables'),
(1164,'31','104','tred-mill','walking','vegetables'),
(1165,'31','105','tred-mill','walking','vegetables'),
(1166,'31','106','tred-mill','walking','vegetables'),
(1167,'31','107','tred-mill','walking','vegetables'),
(1168,'31','108','tred-mill','walking','vegetables'),
(1169,'31','109','tred-mill','walking','vegetables'),
(1170,'31','110','tred-mill','walking','vegetables'),
(1171,'31','111','tred-mill','walking','vegetables'),
(1172,'31','112','tred-mill','walking','vegetables'),
(1173,'31','113','tred-mill','walking','vegetables'),
(1174,'31','114','tred-mill','walking','vegetables'),
(1175,'31','115','tred-mill','walking','vegetables'),
(1176,'31','116','tred-mill','walking','vegetables'),
(1177,'31','117','tred-mill','walking','vegetables'),
(1178,'31','118','tred-mill','walking','vegetables'),
(1179,'31','119','tred-mill','walking','vegetables'),
(1180,'31','120','tred-mill','walking','vegetables'),
(1181,'31','121','tred-mill','walking','vegetables'),
(1182,'31','122','tred-mill','walking','vegetables'),
(1183,'31','123','tred-mill','walking','vegetables'),
(1184,'31','124','tred-mill','walking','vegetables'),
(1185,'31','125','tred-mill','walking','vegetables'),
(1186,'31','126','tred-mill','walking','vegetables'),
(1187,'31','127','tred-mill','walking','vegetables'),
(1188,'31','128','tred-mill','walking','vegetables'),
(1189,'31','129','tred-mill','walking','vegetables'),
(1190,'31','130','tred-mill','walking','vegetables'),
(1191,'31','131','tred-mill','walking','vegetables'),
(1192,'31','132','tred-mill','walking','vegetables'),
(1193,'31','133','tred-mill','walking','vegetables'),
(1194,'31','134','tred-mill','walking','vegetables'),
(1195,'31','135','tred-mill','walking','vegetables'),
(1196,'31','136','tred-mill','walking','vegetables'),
(1197,'31','137','tred-mill','walking','vegetables'),
(1198,'31','138','tred-mill','walking','vegetables'),
(1199,'31','139','tred-mill','walking','vegetables'),
(1200,'31','140','tred-mill','walking','vegetables'),
(1201,'31','141','tred-mill','walking','vegetables'),
(1202,'31','142','tred-mill','walking','vegetables'),
(1203,'31','143','tred-mill','walking','vegetables'),
(1204,'31','144','tred-mill','walking','vegetables'),
(1205,'31','145','tred-mill','walking','vegetables'),
(1206,'31','146','tred-mill','walking','vegetables'),
(1207,'31','147','tred-mill','walking','vegetables'),
(1208,'31','148','tred-mill','walking','vegetables'),
(1209,'31','149','tred-mill','walking','vegetables'),
(1210,'31','150','tred-mill','walking','vegetables'),
(1211,'32','41','machine fly','russian twist','oats and fruits'),
(1212,'32','42','machine fly','russian twist','oats and fruits'),
(1213,'32','43','machine fly','russian twist','oats and fruits'),
(1214,'32','44','machine fly','russian twist','oats and fruits'),
(1215,'32','45','machine fly','russian twist','oats and fruits'),
(1216,'32','46','machine fly','russian twist','oats and fruits'),
(1217,'32','47','machine fly','russian twist','oats and fruits'),
(1218,'32','48','machine fly','russian twist','oats and fruits'),
(1219,'32','49','machine fly','russian twist','oats and fruits'),
(1220,'32','50','machine fly','russian twist','oats and fruits'),
(1221,'32','51','foam roller','dead lift','eggs and almonds'),
(1222,'32','52','foam roller','dead lift','eggs and almonds'),
(1223,'32','53','foam roller','dead lift','eggs and almonds'),
(1224,'32','54','foam roller','dead lift','eggs and almonds'),
(1225,'32','55','foam roller','dead lift','eggs and almonds'),
(1226,'32','56','foam roller','dead lift','eggs and almonds'),
(1227,'32','57','foam roller','dead lift','eggs and almonds'),
(1228,'32','58','foam roller','dead lift','eggs and almonds'),
(1229,'32','59','foam roller','dead lift','eggs and almonds'),
(1230,'32','60','foam roller','dead lift','eggs and almonds'),
(1231,'32','61','foam roller','dead lift','eggs and almonds'),
(1232,'32','62','foam roller','dead lift','eggs and almonds'),
(1233,'32','63','foam roller','dead lift','eggs and almonds'),
(1234,'32','64','foam roller','dead lift','eggs and almonds'),
(1235,'32','65','foam roller','dead lift','eggs and almonds'),
(1236,'32','66','foam roller','dead lift','eggs and almonds'),
(1237,'32','67','foam roller','dead lift','eggs and almonds'),
(1238,'32','68','foam roller','dead lift','eggs and almonds'),
(1239,'32','69','foam roller','dead lift','eggs and almonds'),
(1240,'32','70','foam roller','dead lift','eggs and almonds'),
(1241,'32','71','pull-down','legpress','vegetables'),
(1242,'32','72','pull-down','legpress','vegetables'),
(1243,'32','73','pull-down','legpress','vegetables'),
(1244,'32','74','pull-down','legpress','vegetables'),
(1245,'32','75','pull-down','legpress','vegetables'),
(1246,'32','76','pull-down','legpress','vegetables'),
(1247,'32','77','pull-down','legpress','vegetables'),
(1248,'32','78','pull-down','legpress','vegetables'),
(1249,'32','79','pull-down','legpress','vegetables'),
(1250,'32','80','pull-down','legpress','vegetables'),
(1251,'32','81','pull-down','legpress','vegetables'),
(1252,'32','82','pull-down','legpress','vegetables'),
(1253,'32','83','pull-down','legpress','vegetables'),
(1254,'32','84','pull-down','legpress','vegetables'),
(1255,'32','85','pull-down','legpress','vegetables'),
(1256,'32','86','pull-down','legpress','vegetables'),
(1257,'32','87','pull-down','legpress','vegetables'),
(1258,'32','88','pull-down','legpress','vegetables'),
(1259,'32','89','pull-down','legpress','vegetables'),
(1260,'32','90','pull-down','legpress','vegetables'),
(1261,'32','91','pull-down','legpress','vegetables'),
(1262,'32','92','pull-down','legpress','vegetables'),
(1263,'32','93','pull-down','legpress','vegetables'),
(1264,'32','94','pull-down','legpress','vegetables'),
(1265,'32','95','pull-down','legpress','vegetables'),
(1266,'32','96','pull-down','legpress','vegetables'),
(1267,'32','97','pull-down','legpress','vegetables'),
(1268,'32','98','pull-down','legpress','vegetables'),
(1269,'32','99','pull-down','legpress','vegetables'),
(1270,'32','100','pull-down','legpress','vegetables'),
(1271,'32','101','tred-mill','walking','vegetables'),
(1272,'32','102','tred-mill','walking','vegetables'),
(1273,'32','103','tred-mill','walking','vegetables'),
(1274,'32','104','tred-mill','walking','vegetables'),
(1275,'32','105','tred-mill','walking','vegetables'),
(1276,'32','106','tred-mill','walking','vegetables'),
(1277,'32','107','tred-mill','walking','vegetables'),
(1278,'32','108','tred-mill','walking','vegetables'),
(1279,'32','109','tred-mill','walking','vegetables'),
(1280,'32','110','tred-mill','walking','vegetables'),
(1281,'32','111','tred-mill','walking','vegetables'),
(1282,'32','112','tred-mill','walking','vegetables'),
(1283,'32','113','tred-mill','walking','vegetables'),
(1284,'32','114','tred-mill','walking','vegetables'),
(1285,'32','115','tred-mill','walking','vegetables'),
(1286,'32','116','tred-mill','walking','vegetables'),
(1287,'32','117','tred-mill','walking','vegetables'),
(1288,'32','118','tred-mill','walking','vegetables'),
(1289,'32','119','tred-mill','walking','vegetables'),
(1290,'32','120','tred-mill','walking','vegetables'),
(1291,'32','121','tred-mill','walking','vegetables'),
(1292,'32','122','tred-mill','walking','vegetables'),
(1293,'32','123','tred-mill','walking','vegetables'),
(1294,'32','124','tred-mill','walking','vegetables'),
(1295,'32','125','tred-mill','walking','vegetables'),
(1296,'32','126','tred-mill','walking','vegetables'),
(1297,'32','127','tred-mill','walking','vegetables'),
(1298,'32','128','tred-mill','walking','vegetables'),
(1299,'32','129','tred-mill','walking','vegetables'),
(1300,'32','130','tred-mill','walking','vegetables'),
(1301,'32','131','tred-mill','walking','vegetables'),
(1302,'32','132','tred-mill','walking','vegetables'),
(1303,'32','133','tred-mill','walking','vegetables'),
(1304,'32','134','tred-mill','walking','vegetables'),
(1305,'32','135','tred-mill','walking','vegetables'),
(1306,'32','136','tred-mill','walking','vegetables'),
(1307,'32','137','tred-mill','walking','vegetables'),
(1308,'32','138','tred-mill','walking','vegetables'),
(1309,'32','139','tred-mill','walking','vegetables'),
(1310,'32','140','tred-mill','walking','vegetables'),
(1311,'32','141','tred-mill','walking','vegetables'),
(1312,'32','142','tred-mill','walking','vegetables'),
(1313,'32','143','tred-mill','walking','vegetables'),
(1314,'32','144','tred-mill','walking','vegetables'),
(1315,'32','145','tred-mill','walking','vegetables'),
(1316,'32','146','tred-mill','walking','vegetables'),
(1317,'32','147','tred-mill','walking','vegetables'),
(1318,'32','148','tred-mill','walking','vegetables'),
(1319,'32','149','tred-mill','walking','vegetables'),
(1320,'32','150','tred-mill','walking','vegetables'),
(1321,'33','41','machine fly','russian twist','oats and fruits'),
(1322,'33','42','machine fly','russian twist','oats and fruits'),
(1323,'33','43','machine fly','russian twist','oats and fruits'),
(1324,'33','44','machine fly','russian twist','oats and fruits'),
(1325,'33','45','machine fly','russian twist','oats and fruits'),
(1326,'33','46','machine fly','russian twist','oats and fruits'),
(1327,'33','47','machine fly','russian twist','oats and fruits'),
(1328,'33','48','machine fly','russian twist','oats and fruits'),
(1329,'33','49','machine fly','russian twist','oats and fruits'),
(1330,'33','50','machine fly','russian twist','oats and fruits'),
(1331,'33','51','foam roller','dead lift','eggs and almonds'),
(1332,'33','52','foam roller','dead lift','eggs and almonds'),
(1333,'33','53','foam roller','dead lift','eggs and almonds'),
(1334,'33','54','foam roller','dead lift','eggs and almonds'),
(1335,'33','55','foam roller','dead lift','eggs and almonds'),
(1336,'33','56','foam roller','dead lift','eggs and almonds'),
(1337,'33','57','foam roller','dead lift','eggs and almonds'),
(1338,'33','58','foam roller','dead lift','eggs and almonds'),
(1339,'33','59','foam roller','dead lift','eggs and almonds'),
(1340,'33','60','foam roller','dead lift','eggs and almonds'),
(1341,'33','61','foam roller','dead lift','eggs and almonds'),
(1342,'33','62','foam roller','dead lift','eggs and almonds'),
(1343,'33','63','foam roller','dead lift','eggs and almonds'),
(1344,'33','64','foam roller','dead lift','eggs and almonds'),
(1345,'33','65','foam roller','dead lift','eggs and almonds'),
(1346,'33','66','foam roller','dead lift','eggs and almonds'),
(1347,'33','67','foam roller','dead lift','eggs and almonds'),
(1348,'33','68','foam roller','dead lift','eggs and almonds'),
(1349,'33','69','foam roller','dead lift','eggs and almonds'),
(1350,'33','70','foam roller','dead lift','eggs and almonds'),
(1351,'33','71','pull-down','legpress','vegetables'),
(1352,'33','72','pull-down','legpress','vegetables'),
(1353,'33','73','pull-down','legpress','vegetables'),
(1354,'33','74','pull-down','legpress','vegetables'),
(1355,'33','75','pull-down','legpress','vegetables'),
(1356,'33','76','pull-down','legpress','vegetables'),
(1357,'33','77','pull-down','legpress','vegetables'),
(1358,'33','78','pull-down','legpress','vegetables'),
(1359,'33','79','pull-down','legpress','vegetables'),
(1360,'33','80','pull-down','legpress','vegetables'),
(1361,'33','81','pull-down','legpress','vegetables'),
(1362,'33','82','pull-down','legpress','vegetables'),
(1363,'33','83','pull-down','legpress','vegetables'),
(1364,'33','84','pull-down','legpress','vegetables'),
(1365,'33','85','pull-down','legpress','vegetables'),
(1366,'33','86','pull-down','legpress','vegetables'),
(1367,'33','87','pull-down','legpress','vegetables'),
(1368,'33','88','pull-down','legpress','vegetables'),
(1369,'33','89','pull-down','legpress','vegetables'),
(1370,'33','90','pull-down','legpress','vegetables'),
(1371,'33','91','pull-down','legpress','vegetables'),
(1372,'33','92','pull-down','legpress','vegetables'),
(1373,'33','93','pull-down','legpress','vegetables'),
(1374,'33','94','pull-down','legpress','vegetables'),
(1375,'33','95','pull-down','legpress','vegetables'),
(1376,'33','96','pull-down','legpress','vegetables'),
(1377,'33','97','pull-down','legpress','vegetables'),
(1378,'33','98','pull-down','legpress','vegetables'),
(1379,'33','99','pull-down','legpress','vegetables'),
(1380,'33','100','pull-down','legpress','vegetables'),
(1381,'33','101','tred-mill','walking','vegetables'),
(1382,'33','102','tred-mill','walking','vegetables'),
(1383,'33','103','tred-mill','walking','vegetables'),
(1384,'33','104','tred-mill','walking','vegetables'),
(1385,'33','105','tred-mill','walking','vegetables'),
(1386,'33','106','tred-mill','walking','vegetables'),
(1387,'33','107','tred-mill','walking','vegetables'),
(1388,'33','108','tred-mill','walking','vegetables'),
(1389,'33','109','tred-mill','walking','vegetables'),
(1390,'33','110','tred-mill','walking','vegetables'),
(1391,'33','111','tred-mill','walking','vegetables'),
(1392,'33','112','tred-mill','walking','vegetables'),
(1393,'33','113','tred-mill','walking','vegetables'),
(1394,'33','114','tred-mill','walking','vegetables'),
(1395,'33','115','tred-mill','walking','vegetables'),
(1396,'33','116','tred-mill','walking','vegetables'),
(1397,'33','117','tred-mill','walking','vegetables'),
(1398,'33','118','tred-mill','walking','vegetables'),
(1399,'33','119','tred-mill','walking','vegetables'),
(1400,'33','120','tred-mill','walking','vegetables'),
(1401,'33','121','tred-mill','walking','vegetables'),
(1402,'33','122','tred-mill','walking','vegetables'),
(1403,'33','123','tred-mill','walking','vegetables'),
(1404,'33','124','tred-mill','walking','vegetables'),
(1405,'33','125','tred-mill','walking','vegetables'),
(1406,'33','126','tred-mill','walking','vegetables'),
(1407,'33','127','tred-mill','walking','vegetables'),
(1408,'33','128','tred-mill','walking','vegetables'),
(1409,'33','129','tred-mill','walking','vegetables'),
(1410,'33','130','tred-mill','walking','vegetables'),
(1411,'33','131','tred-mill','walking','vegetables'),
(1412,'33','132','tred-mill','walking','vegetables'),
(1413,'33','133','tred-mill','walking','vegetables'),
(1414,'33','134','tred-mill','walking','vegetables'),
(1415,'33','135','tred-mill','walking','vegetables'),
(1416,'33','136','tred-mill','walking','vegetables'),
(1417,'33','137','tred-mill','walking','vegetables'),
(1418,'33','138','tred-mill','walking','vegetables'),
(1419,'33','139','tred-mill','walking','vegetables'),
(1420,'33','140','tred-mill','walking','vegetables'),
(1421,'33','141','tred-mill','walking','vegetables'),
(1422,'33','142','tred-mill','walking','vegetables'),
(1423,'33','143','tred-mill','walking','vegetables'),
(1424,'33','144','tred-mill','walking','vegetables'),
(1425,'33','145','tred-mill','walking','vegetables'),
(1426,'33','146','tred-mill','walking','vegetables'),
(1427,'33','147','tred-mill','walking','vegetables'),
(1428,'33','148','tred-mill','walking','vegetables'),
(1429,'33','149','tred-mill','walking','vegetables'),
(1430,'33','150','tred-mill','walking','vegetables'),
(1431,'34','41','machine fly','russian twist','oats and fruits'),
(1432,'34','42','machine fly','russian twist','oats and fruits'),
(1433,'34','43','machine fly','russian twist','oats and fruits'),
(1434,'34','44','machine fly','russian twist','oats and fruits'),
(1435,'34','45','machine fly','russian twist','oats and fruits'),
(1436,'34','46','machine fly','russian twist','oats and fruits'),
(1437,'34','47','machine fly','russian twist','oats and fruits'),
(1438,'34','48','machine fly','russian twist','oats and fruits'),
(1439,'34','49','machine fly','russian twist','oats and fruits'),
(1440,'34','50','machine fly','russian twist','oats and fruits'),
(1441,'34','51','foam roller','dead lift','eggs and almonds'),
(1442,'34','52','foam roller','dead lift','eggs and almonds'),
(1443,'34','53','foam roller','dead lift','eggs and almonds'),
(1444,'34','54','foam roller','dead lift','eggs and almonds'),
(1445,'34','55','foam roller','dead lift','eggs and almonds'),
(1446,'34','56','foam roller','dead lift','eggs and almonds'),
(1447,'34','57','foam roller','dead lift','eggs and almonds'),
(1448,'34','58','foam roller','dead lift','eggs and almonds'),
(1449,'34','59','foam roller','dead lift','eggs and almonds'),
(1450,'34','60','foam roller','dead lift','eggs and almonds'),
(1451,'34','61','foam roller','dead lift','eggs and almonds'),
(1452,'34','62','foam roller','dead lift','eggs and almonds'),
(1453,'34','63','foam roller','dead lift','eggs and almonds'),
(1454,'34','64','foam roller','dead lift','eggs and almonds'),
(1455,'34','65','foam roller','dead lift','eggs and almonds'),
(1456,'34','66','foam roller','dead lift','eggs and almonds'),
(1457,'34','67','foam roller','dead lift','eggs and almonds'),
(1458,'34','68','foam roller','dead lift','eggs and almonds'),
(1459,'34','69','foam roller','dead lift','eggs and almonds'),
(1460,'34','70','foam roller','dead lift','eggs and almonds'),
(1461,'34','71','pull-down','legpress','vegetables'),
(1462,'34','72','pull-down','legpress','vegetables'),
(1463,'34','73','pull-down','legpress','vegetables'),
(1464,'34','74','pull-down','legpress','vegetables'),
(1465,'34','75','pull-down','legpress','vegetables'),
(1466,'34','76','pull-down','legpress','vegetables'),
(1467,'34','77','pull-down','legpress','vegetables'),
(1468,'34','78','pull-down','legpress','vegetables'),
(1469,'34','79','pull-down','legpress','vegetables'),
(1470,'34','80','pull-down','legpress','vegetables'),
(1471,'34','81','pull-down','legpress','vegetables'),
(1472,'34','82','pull-down','legpress','vegetables'),
(1473,'34','83','pull-down','legpress','vegetables'),
(1474,'34','84','pull-down','legpress','vegetables'),
(1475,'34','85','pull-down','legpress','vegetables'),
(1476,'34','86','pull-down','legpress','vegetables'),
(1477,'34','87','pull-down','legpress','vegetables'),
(1478,'34','88','pull-down','legpress','vegetables'),
(1479,'34','89','pull-down','legpress','vegetables'),
(1480,'34','90','pull-down','legpress','vegetables'),
(1481,'34','91','pull-down','legpress','vegetables'),
(1482,'34','92','pull-down','legpress','vegetables'),
(1483,'34','93','pull-down','legpress','vegetables'),
(1484,'34','94','pull-down','legpress','vegetables'),
(1485,'34','95','pull-down','legpress','vegetables'),
(1486,'34','96','pull-down','legpress','vegetables'),
(1487,'34','97','pull-down','legpress','vegetables'),
(1488,'34','98','pull-down','legpress','vegetables'),
(1489,'34','99','pull-down','legpress','vegetables'),
(1490,'34','100','pull-down','legpress','vegetables'),
(1491,'34','101','tred-mill','walking','vegetables'),
(1492,'34','102','tred-mill','walking','vegetables'),
(1493,'34','103','tred-mill','walking','vegetables'),
(1494,'34','104','tred-mill','walking','vegetables'),
(1495,'34','105','tred-mill','walking','vegetables'),
(1496,'34','106','tred-mill','walking','vegetables'),
(1497,'34','107','tred-mill','walking','vegetables'),
(1498,'34','108','tred-mill','walking','vegetables'),
(1499,'34','109','tred-mill','walking','vegetables'),
(1500,'34','110','tred-mill','walking','vegetables'),
(1501,'34','111','tred-mill','walking','vegetables'),
(1502,'34','112','tred-mill','walking','vegetables'),
(1503,'34','113','tred-mill','walking','vegetables'),
(1504,'34','114','tred-mill','walking','vegetables'),
(1505,'34','115','tred-mill','walking','vegetables'),
(1506,'34','116','tred-mill','walking','vegetables'),
(1507,'34','117','tred-mill','walking','vegetables'),
(1508,'34','118','tred-mill','walking','vegetables'),
(1509,'34','119','tred-mill','walking','vegetables'),
(1510,'34','120','tred-mill','walking','vegetables'),
(1511,'34','121','tred-mill','walking','vegetables'),
(1512,'34','122','tred-mill','walking','vegetables'),
(1513,'34','123','tred-mill','walking','vegetables'),
(1514,'34','124','tred-mill','walking','vegetables'),
(1515,'34','125','tred-mill','walking','vegetables'),
(1516,'34','126','tred-mill','walking','vegetables'),
(1517,'34','127','tred-mill','walking','vegetables'),
(1518,'34','128','tred-mill','walking','vegetables'),
(1519,'34','129','tred-mill','walking','vegetables'),
(1520,'34','130','tred-mill','walking','vegetables'),
(1521,'34','131','tred-mill','walking','vegetables'),
(1522,'34','132','tred-mill','walking','vegetables'),
(1523,'34','133','tred-mill','walking','vegetables'),
(1524,'34','134','tred-mill','walking','vegetables'),
(1525,'34','135','tred-mill','walking','vegetables'),
(1526,'34','136','tred-mill','walking','vegetables'),
(1527,'34','137','tred-mill','walking','vegetables'),
(1528,'34','138','tred-mill','walking','vegetables'),
(1529,'34','139','tred-mill','walking','vegetables'),
(1530,'34','140','tred-mill','walking','vegetables'),
(1531,'34','141','tred-mill','walking','vegetables'),
(1532,'34','142','tred-mill','walking','vegetables'),
(1533,'34','143','tred-mill','walking','vegetables'),
(1534,'34','144','tred-mill','walking','vegetables'),
(1535,'34','145','tred-mill','walking','vegetables'),
(1536,'34','146','tred-mill','walking','vegetables'),
(1537,'34','147','tred-mill','walking','vegetables'),
(1538,'34','148','tred-mill','walking','vegetables'),
(1539,'34','149','tred-mill','walking','vegetables'),
(1540,'34','150','tred-mill','walking','vegetables'),
(1541,'35','41','machine fly','russian twist','oats and fruits'),
(1542,'35','42','machine fly','russian twist','oats and fruits'),
(1543,'35','43','machine fly','russian twist','oats and fruits'),
(1544,'35','44','machine fly','russian twist','oats and fruits'),
(1545,'35','45','machine fly','russian twist','oats and fruits'),
(1546,'35','46','machine fly','russian twist','oats and fruits'),
(1547,'35','47','machine fly','russian twist','oats and fruits'),
(1548,'35','48','machine fly','russian twist','oats and fruits'),
(1549,'35','49','machine fly','russian twist','oats and fruits'),
(1550,'35','50','machine fly','russian twist','oats and fruits'),
(1551,'35','51','foam roller','dead lift','eggs and almonds'),
(1552,'35','52','foam roller','dead lift','eggs and almonds'),
(1553,'35','53','foam roller','dead lift','eggs and almonds'),
(1554,'35','54','foam roller','dead lift','eggs and almonds'),
(1555,'35','55','foam roller','dead lift','eggs and almonds'),
(1556,'35','56','foam roller','dead lift','eggs and almonds'),
(1557,'35','57','foam roller','dead lift','eggs and almonds'),
(1558,'35','58','foam roller','dead lift','eggs and almonds'),
(1559,'35','59','foam roller','dead lift','eggs and almonds'),
(1560,'35','60','foam roller','dead lift','eggs and almonds'),
(1561,'35','61','foam roller','dead lift','eggs and almonds'),
(1562,'35','62','foam roller','dead lift','eggs and almonds'),
(1563,'35','63','foam roller','dead lift','eggs and almonds'),
(1564,'35','64','foam roller','dead lift','eggs and almonds'),
(1565,'35','65','foam roller','dead lift','eggs and almonds'),
(1566,'35','66','foam roller','dead lift','eggs and almonds'),
(1567,'35','67','foam roller','dead lift','eggs and almonds'),
(1568,'35','68','foam roller','dead lift','eggs and almonds'),
(1569,'35','69','foam roller','dead lift','eggs and almonds'),
(1570,'35','70','foam roller','dead lift','eggs and almonds'),
(1571,'35','71','pull-down','legpress','vegetables'),
(1572,'35','72','pull-down','legpress','vegetables'),
(1573,'35','73','pull-down','legpress','vegetables'),
(1574,'35','74','pull-down','legpress','vegetables'),
(1575,'35','75','pull-down','legpress','vegetables'),
(1576,'35','76','pull-down','legpress','vegetables'),
(1577,'35','77','pull-down','legpress','vegetables'),
(1578,'35','78','pull-down','legpress','vegetables'),
(1579,'35','79','pull-down','legpress','vegetables'),
(1580,'35','80','pull-down','legpress','vegetables'),
(1581,'35','81','pull-down','legpress','vegetables'),
(1582,'35','82','pull-down','legpress','vegetables'),
(1583,'35','83','pull-down','legpress','vegetables'),
(1584,'35','84','pull-down','legpress','vegetables'),
(1585,'35','85','pull-down','legpress','vegetables'),
(1586,'35','86','pull-down','legpress','vegetables'),
(1587,'35','87','pull-down','legpress','vegetables'),
(1588,'35','88','pull-down','legpress','vegetables'),
(1589,'35','89','pull-down','legpress','vegetables'),
(1590,'35','90','pull-down','legpress','vegetables'),
(1591,'35','91','pull-down','legpress','vegetables'),
(1592,'35','92','pull-down','legpress','vegetables'),
(1593,'35','93','pull-down','legpress','vegetables'),
(1594,'35','94','pull-down','legpress','vegetables'),
(1595,'35','95','pull-down','legpress','vegetables'),
(1596,'35','96','pull-down','legpress','vegetables'),
(1597,'35','97','pull-down','legpress','vegetables'),
(1598,'35','98','pull-down','legpress','vegetables'),
(1599,'35','99','pull-down','legpress','vegetables'),
(1600,'35','100','pull-down','legpress','vegetables'),
(1601,'35','101','tred-mill','walking','vegetables'),
(1602,'35','102','tred-mill','walking','vegetables'),
(1603,'35','103','tred-mill','walking','vegetables'),
(1604,'35','104','tred-mill','walking','vegetables'),
(1605,'35','105','tred-mill','walking','vegetables'),
(1606,'35','106','tred-mill','walking','vegetables'),
(1607,'35','107','tred-mill','walking','vegetables'),
(1608,'35','108','tred-mill','walking','vegetables'),
(1609,'35','109','tred-mill','walking','vegetables'),
(1610,'35','110','tred-mill','walking','vegetables'),
(1611,'35','111','tred-mill','walking','vegetables'),
(1612,'35','112','tred-mill','walking','vegetables'),
(1613,'35','113','tred-mill','walking','vegetables'),
(1614,'35','114','tred-mill','walking','vegetables'),
(1615,'35','115','tred-mill','walking','vegetables'),
(1616,'35','116','tred-mill','walking','vegetables'),
(1617,'35','117','tred-mill','walking','vegetables'),
(1618,'35','118','tred-mill','walking','vegetables'),
(1619,'35','119','tred-mill','walking','vegetables'),
(1620,'35','120','tred-mill','walking','vegetables'),
(1621,'35','121','tred-mill','walking','vegetables'),
(1622,'35','122','tred-mill','walking','vegetables'),
(1623,'35','123','tred-mill','walking','vegetables'),
(1624,'35','124','tred-mill','walking','vegetables'),
(1625,'35','125','tred-mill','walking','vegetables'),
(1626,'35','126','tred-mill','walking','vegetables'),
(1627,'35','127','tred-mill','walking','vegetables'),
(1628,'35','128','tred-mill','walking','vegetables'),
(1629,'35','129','tred-mill','walking','vegetables'),
(1630,'35','130','tred-mill','walking','vegetables'),
(1631,'35','131','tred-mill','walking','vegetables'),
(1632,'35','132','tred-mill','walking','vegetables'),
(1633,'35','133','tred-mill','walking','vegetables'),
(1634,'35','134','tred-mill','walking','vegetables'),
(1635,'35','135','tred-mill','walking','vegetables'),
(1636,'35','136','tred-mill','walking','vegetables'),
(1637,'35','137','tred-mill','walking','vegetables'),
(1638,'35','138','tred-mill','walking','vegetables'),
(1639,'35','139','tred-mill','walking','vegetables'),
(1640,'35','140','tred-mill','walking','vegetables'),
(1641,'35','141','tred-mill','walking','vegetables'),
(1642,'35','142','tred-mill','walking','vegetables'),
(1643,'35','143','tred-mill','walking','vegetables'),
(1644,'35','144','tred-mill','walking','vegetables'),
(1645,'35','145','tred-mill','walking','vegetables'),
(1646,'35','146','tred-mill','walking','vegetables'),
(1647,'35','147','tred-mill','walking','vegetables'),
(1648,'35','148','tred-mill','walking','vegetables'),
(1649,'35','149','tred-mill','walking','vegetables'),
(1650,'35','150','tred-mill','walking','vegetables'),
(1651,'36','41','machine fly','russian twist','oats and fruits'),
(1652,'36','42','machine fly','russian twist','oats and fruits'),
(1653,'36','43','machine fly','russian twist','oats and fruits'),
(1654,'36','44','machine fly','russian twist','oats and fruits'),
(1655,'36','45','machine fly','russian twist','oats and fruits'),
(1656,'36','46','machine fly','russian twist','oats and fruits'),
(1657,'36','47','machine fly','russian twist','oats and fruits'),
(1658,'36','48','machine fly','russian twist','oats and fruits'),
(1659,'36','49','machine fly','russian twist','oats and fruits'),
(1660,'36','50','machine fly','russian twist','oats and fruits'),
(1661,'36','51','foam roller','dead lift','eggs and almonds'),
(1662,'36','52','foam roller','dead lift','eggs and almonds'),
(1663,'36','53','foam roller','dead lift','eggs and almonds'),
(1664,'36','54','foam roller','dead lift','eggs and almonds'),
(1665,'36','55','foam roller','dead lift','eggs and almonds'),
(1666,'36','56','foam roller','dead lift','eggs and almonds'),
(1667,'36','57','foam roller','dead lift','eggs and almonds'),
(1668,'36','58','foam roller','dead lift','eggs and almonds'),
(1669,'36','59','foam roller','dead lift','eggs and almonds'),
(1670,'36','60','foam roller','dead lift','eggs and almonds'),
(1671,'36','61','foam roller','dead lift','eggs and almonds'),
(1672,'36','62','foam roller','dead lift','eggs and almonds'),
(1673,'36','63','foam roller','dead lift','eggs and almonds'),
(1674,'36','64','foam roller','dead lift','eggs and almonds'),
(1675,'36','65','foam roller','dead lift','eggs and almonds'),
(1676,'36','66','foam roller','dead lift','eggs and almonds'),
(1677,'36','67','foam roller','dead lift','eggs and almonds'),
(1678,'36','68','foam roller','dead lift','eggs and almonds'),
(1679,'36','69','foam roller','dead lift','eggs and almonds'),
(1680,'36','70','foam roller','dead lift','eggs and almonds'),
(1681,'36','71','pull-down','legpress','vegetables'),
(1682,'36','72','pull-down','legpress','vegetables'),
(1683,'36','73','pull-down','legpress','vegetables'),
(1684,'36','74','pull-down','legpress','vegetables'),
(1685,'36','75','pull-down','legpress','vegetables'),
(1686,'36','76','pull-down','legpress','vegetables'),
(1687,'36','77','pull-down','legpress','vegetables'),
(1688,'36','78','pull-down','legpress','vegetables'),
(1689,'36','79','pull-down','legpress','vegetables'),
(1690,'36','80','pull-down','legpress','vegetables'),
(1691,'36','81','pull-down','legpress','vegetables'),
(1692,'36','82','pull-down','legpress','vegetables'),
(1693,'36','83','pull-down','legpress','vegetables'),
(1694,'36','84','pull-down','legpress','vegetables'),
(1695,'36','85','pull-down','legpress','vegetables'),
(1696,'36','86','pull-down','legpress','vegetables'),
(1697,'36','87','pull-down','legpress','vegetables'),
(1698,'36','88','pull-down','legpress','vegetables'),
(1699,'36','89','pull-down','legpress','vegetables'),
(1700,'36','90','pull-down','legpress','vegetables'),
(1701,'36','91','pull-down','legpress','vegetables'),
(1702,'36','92','pull-down','legpress','vegetables'),
(1703,'36','93','pull-down','legpress','vegetables'),
(1704,'36','94','pull-down','legpress','vegetables'),
(1705,'36','95','pull-down','legpress','vegetables'),
(1706,'36','96','pull-down','legpress','vegetables'),
(1707,'36','97','pull-down','legpress','vegetables'),
(1708,'36','98','pull-down','legpress','vegetables'),
(1709,'36','99','pull-down','legpress','vegetables'),
(1710,'36','100','pull-down','legpress','vegetables'),
(1711,'36','101','tred-mill','walking','vegetables'),
(1712,'36','102','tred-mill','walking','vegetables'),
(1713,'36','103','tred-mill','walking','vegetables'),
(1714,'36','104','tred-mill','walking','vegetables'),
(1715,'36','105','tred-mill','walking','vegetables'),
(1716,'36','106','tred-mill','walking','vegetables'),
(1717,'36','107','tred-mill','walking','vegetables'),
(1718,'36','108','tred-mill','walking','vegetables'),
(1719,'36','109','tred-mill','walking','vegetables'),
(1720,'36','110','tred-mill','walking','vegetables'),
(1721,'36','111','tred-mill','walking','vegetables'),
(1722,'36','112','tred-mill','walking','vegetables'),
(1723,'36','113','tred-mill','walking','vegetables'),
(1724,'36','114','tred-mill','walking','vegetables'),
(1725,'36','115','tred-mill','walking','vegetables'),
(1726,'36','116','tred-mill','walking','vegetables'),
(1727,'36','117','tred-mill','walking','vegetables'),
(1728,'36','118','tred-mill','walking','vegetables'),
(1729,'36','119','tred-mill','walking','vegetables'),
(1730,'36','120','tred-mill','walking','vegetables'),
(1731,'36','121','tred-mill','walking','vegetables'),
(1732,'36','122','tred-mill','walking','vegetables'),
(1733,'36','123','tred-mill','walking','vegetables'),
(1734,'36','124','tred-mill','walking','vegetables'),
(1735,'36','125','tred-mill','walking','vegetables'),
(1736,'36','126','tred-mill','walking','vegetables'),
(1737,'36','127','tred-mill','walking','vegetables'),
(1738,'36','128','tred-mill','walking','vegetables'),
(1739,'36','129','tred-mill','walking','vegetables'),
(1740,'36','130','tred-mill','walking','vegetables'),
(1741,'36','131','tred-mill','walking','vegetables'),
(1742,'36','132','tred-mill','walking','vegetables'),
(1743,'36','133','tred-mill','walking','vegetables'),
(1744,'36','134','tred-mill','walking','vegetables'),
(1745,'36','135','tred-mill','walking','vegetables'),
(1746,'36','136','tred-mill','walking','vegetables'),
(1747,'36','137','tred-mill','walking','vegetables'),
(1748,'36','138','tred-mill','walking','vegetables'),
(1749,'36','139','tred-mill','walking','vegetables'),
(1750,'36','140','tred-mill','walking','vegetables'),
(1751,'36','141','tred-mill','walking','vegetables'),
(1752,'36','142','tred-mill','walking','vegetables'),
(1753,'36','143','tred-mill','walking','vegetables'),
(1754,'36','144','tred-mill','walking','vegetables'),
(1755,'36','145','tred-mill','walking','vegetables'),
(1756,'36','146','tred-mill','walking','vegetables'),
(1757,'36','147','tred-mill','walking','vegetables'),
(1758,'36','148','tred-mill','walking','vegetables'),
(1759,'36','149','tred-mill','walking','vegetables'),
(1760,'36','150','tred-mill','walking','vegetables'),
(1761,'37','41','machine fly','russian twist','oats and fruits'),
(1762,'37','42','machine fly','russian twist','oats and fruits'),
(1763,'37','43','machine fly','russian twist','oats and fruits'),
(1764,'37','44','machine fly','russian twist','oats and fruits'),
(1765,'37','45','machine fly','russian twist','oats and fruits'),
(1766,'37','46','machine fly','russian twist','oats and fruits'),
(1767,'37','47','machine fly','russian twist','oats and fruits'),
(1768,'37','48','machine fly','russian twist','oats and fruits'),
(1769,'37','49','machine fly','russian twist','oats and fruits'),
(1770,'37','50','machine fly','russian twist','oats and fruits'),
(1771,'37','51','foam roller','dead lift','eggs and almonds'),
(1772,'37','52','foam roller','dead lift','eggs and almonds'),
(1773,'37','53','foam roller','dead lift','eggs and almonds'),
(1774,'37','54','foam roller','dead lift','eggs and almonds'),
(1775,'37','55','foam roller','dead lift','eggs and almonds'),
(1776,'37','56','foam roller','dead lift','eggs and almonds'),
(1777,'37','57','foam roller','dead lift','eggs and almonds'),
(1778,'37','58','foam roller','dead lift','eggs and almonds'),
(1779,'37','59','foam roller','dead lift','eggs and almonds'),
(1780,'37','60','foam roller','dead lift','eggs and almonds'),
(1781,'37','61','foam roller','dead lift','eggs and almonds'),
(1782,'37','62','foam roller','dead lift','eggs and almonds'),
(1783,'37','63','foam roller','dead lift','eggs and almonds'),
(1784,'37','64','foam roller','dead lift','eggs and almonds'),
(1785,'37','65','foam roller','dead lift','eggs and almonds'),
(1786,'37','66','foam roller','dead lift','eggs and almonds'),
(1787,'37','67','foam roller','dead lift','eggs and almonds'),
(1788,'37','68','foam roller','dead lift','eggs and almonds'),
(1789,'37','69','foam roller','dead lift','eggs and almonds'),
(1790,'37','70','foam roller','dead lift','eggs and almonds'),
(1791,'37','71','pull-down','legpress','vegetables'),
(1792,'37','72','pull-down','legpress','vegetables'),
(1793,'37','73','pull-down','legpress','vegetables'),
(1794,'37','74','pull-down','legpress','vegetables'),
(1795,'37','75','pull-down','legpress','vegetables'),
(1796,'37','76','pull-down','legpress','vegetables'),
(1797,'37','77','pull-down','legpress','vegetables'),
(1798,'37','78','pull-down','legpress','vegetables'),
(1799,'37','79','pull-down','legpress','vegetables'),
(1800,'37','80','pull-down','legpress','vegetables'),
(1801,'37','81','pull-down','legpress','vegetables'),
(1802,'37','82','pull-down','legpress','vegetables'),
(1803,'37','83','pull-down','legpress','vegetables'),
(1804,'37','84','pull-down','legpress','vegetables'),
(1805,'37','85','pull-down','legpress','vegetables'),
(1806,'37','86','pull-down','legpress','vegetables'),
(1807,'37','87','pull-down','legpress','vegetables'),
(1808,'37','88','pull-down','legpress','vegetables'),
(1809,'37','89','pull-down','legpress','vegetables'),
(1810,'37','90','pull-down','legpress','vegetables'),
(1811,'37','91','pull-down','legpress','vegetables'),
(1812,'37','92','pull-down','legpress','vegetables'),
(1813,'37','93','pull-down','legpress','vegetables'),
(1814,'37','94','pull-down','legpress','vegetables'),
(1815,'37','95','pull-down','legpress','vegetables'),
(1816,'37','96','pull-down','legpress','vegetables'),
(1817,'37','97','pull-down','legpress','vegetables'),
(1818,'37','98','pull-down','legpress','vegetables'),
(1819,'37','99','pull-down','legpress','vegetables'),
(1820,'37','100','pull-down','legpress','vegetables'),
(1821,'37','101','tred-mill','walking','vegetables'),
(1822,'37','102','tred-mill','walking','vegetables'),
(1823,'37','103','tred-mill','walking','vegetables'),
(1824,'37','104','tred-mill','walking','vegetables'),
(1825,'37','105','tred-mill','walking','vegetables'),
(1826,'37','106','tred-mill','walking','vegetables'),
(1827,'37','107','tred-mill','walking','vegetables'),
(1828,'37','108','tred-mill','walking','vegetables'),
(1829,'37','109','tred-mill','walking','vegetables'),
(1830,'37','110','tred-mill','walking','vegetables'),
(1831,'37','111','tred-mill','walking','vegetables'),
(1832,'37','112','tred-mill','walking','vegetables'),
(1833,'37','113','tred-mill','walking','vegetables'),
(1834,'37','114','tred-mill','walking','vegetables'),
(1835,'37','115','tred-mill','walking','vegetables'),
(1836,'37','116','tred-mill','walking','vegetables'),
(1837,'37','117','tred-mill','walking','vegetables'),
(1838,'37','118','tred-mill','walking','vegetables'),
(1839,'37','119','tred-mill','walking','vegetables'),
(1840,'37','120','tred-mill','walking','vegetables'),
(1841,'37','121','tred-mill','walking','vegetables'),
(1842,'37','122','tred-mill','walking','vegetables'),
(1843,'37','123','tred-mill','walking','vegetables'),
(1844,'37','124','tred-mill','walking','vegetables'),
(1845,'37','125','tred-mill','walking','vegetables'),
(1846,'37','126','tred-mill','walking','vegetables'),
(1847,'37','127','tred-mill','walking','vegetables'),
(1848,'37','128','tred-mill','walking','vegetables'),
(1849,'37','129','tred-mill','walking','vegetables'),
(1850,'37','130','tred-mill','walking','vegetables'),
(1851,'37','131','tred-mill','walking','vegetables'),
(1852,'37','132','tred-mill','walking','vegetables'),
(1853,'37','133','tred-mill','walking','vegetables'),
(1854,'37','134','tred-mill','walking','vegetables'),
(1855,'37','135','tred-mill','walking','vegetables'),
(1856,'37','136','tred-mill','walking','vegetables'),
(1857,'37','137','tred-mill','walking','vegetables'),
(1858,'37','138','tred-mill','walking','vegetables'),
(1859,'37','139','tred-mill','walking','vegetables'),
(1860,'37','140','tred-mill','walking','vegetables'),
(1861,'37','141','tred-mill','walking','vegetables'),
(1862,'37','142','tred-mill','walking','vegetables'),
(1863,'37','143','tred-mill','walking','vegetables'),
(1864,'37','144','tred-mill','walking','vegetables'),
(1865,'37','145','tred-mill','walking','vegetables'),
(1866,'37','146','tred-mill','walking','vegetables'),
(1867,'37','147','tred-mill','walking','vegetables'),
(1868,'37','148','tred-mill','walking','vegetables'),
(1869,'37','149','tred-mill','walking','vegetables'),
(1870,'37','150','tred-mill','walking','vegetables'),
(1871,'38','41','machine fly','russian twist','oats and fruits'),
(1872,'38','42','machine fly','russian twist','oats and fruits'),
(1873,'38','43','machine fly','russian twist','oats and fruits'),
(1874,'38','44','machine fly','russian twist','oats and fruits'),
(1875,'38','45','machine fly','russian twist','oats and fruits'),
(1876,'38','46','machine fly','russian twist','oats and fruits'),
(1877,'38','47','machine fly','russian twist','oats and fruits'),
(1878,'38','48','machine fly','russian twist','oats and fruits'),
(1879,'38','49','machine fly','russian twist','oats and fruits'),
(1880,'38','50','machine fly','russian twist','oats and fruits'),
(1881,'38','51','foam roller','dead lift','eggs and almonds'),
(1882,'38','52','foam roller','dead lift','eggs and almonds'),
(1883,'38','53','foam roller','dead lift','eggs and almonds'),
(1884,'38','54','foam roller','dead lift','eggs and almonds'),
(1885,'38','55','foam roller','dead lift','eggs and almonds'),
(1886,'38','56','foam roller','dead lift','eggs and almonds'),
(1887,'38','57','foam roller','dead lift','eggs and almonds'),
(1888,'38','58','foam roller','dead lift','eggs and almonds'),
(1889,'38','59','foam roller','dead lift','eggs and almonds'),
(1890,'38','60','foam roller','dead lift','eggs and almonds'),
(1891,'38','61','foam roller','dead lift','eggs and almonds'),
(1892,'38','62','foam roller','dead lift','eggs and almonds'),
(1893,'38','63','foam roller','dead lift','eggs and almonds'),
(1894,'38','64','foam roller','dead lift','eggs and almonds'),
(1895,'38','65','foam roller','dead lift','eggs and almonds'),
(1896,'38','66','foam roller','dead lift','eggs and almonds'),
(1897,'38','67','foam roller','dead lift','eggs and almonds'),
(1898,'38','68','foam roller','dead lift','eggs and almonds'),
(1899,'38','69','foam roller','dead lift','eggs and almonds'),
(1900,'38','70','foam roller','dead lift','eggs and almonds'),
(1901,'38','71','pull-down','legpress','vegetables'),
(1902,'38','72','pull-down','legpress','vegetables'),
(1903,'38','73','pull-down','legpress','vegetables'),
(1904,'38','74','pull-down','legpress','vegetables'),
(1905,'38','75','pull-down','legpress','vegetables'),
(1906,'38','76','pull-down','legpress','vegetables'),
(1907,'38','77','pull-down','legpress','vegetables'),
(1908,'38','78','pull-down','legpress','vegetables'),
(1909,'38','79','pull-down','legpress','vegetables'),
(1910,'38','80','pull-down','legpress','vegetables'),
(1911,'38','81','pull-down','legpress','vegetables'),
(1912,'38','82','pull-down','legpress','vegetables'),
(1913,'38','83','pull-down','legpress','vegetables'),
(1914,'38','84','pull-down','legpress','vegetables'),
(1915,'38','85','pull-down','legpress','vegetables'),
(1916,'38','86','pull-down','legpress','vegetables'),
(1917,'38','87','pull-down','legpress','vegetables'),
(1918,'38','88','pull-down','legpress','vegetables'),
(1919,'38','89','pull-down','legpress','vegetables'),
(1920,'38','90','pull-down','legpress','vegetables'),
(1921,'38','91','pull-down','legpress','vegetables'),
(1922,'38','92','pull-down','legpress','vegetables'),
(1923,'38','93','pull-down','legpress','vegetables'),
(1924,'38','94','pull-down','legpress','vegetables'),
(1925,'38','95','pull-down','legpress','vegetables'),
(1926,'38','96','pull-down','legpress','vegetables'),
(1927,'38','97','pull-down','legpress','vegetables'),
(1928,'38','98','pull-down','legpress','vegetables'),
(1929,'38','99','pull-down','legpress','vegetables'),
(1930,'38','100','pull-down','legpress','vegetables'),
(1931,'38','101','tred-mill','walking','vegetables'),
(1932,'38','102','tred-mill','walking','vegetables'),
(1933,'38','103','tred-mill','walking','vegetables'),
(1934,'38','104','tred-mill','walking','vegetables'),
(1935,'38','105','tred-mill','walking','vegetables'),
(1936,'38','106','tred-mill','walking','vegetables'),
(1937,'38','107','tred-mill','walking','vegetables'),
(1938,'38','108','tred-mill','walking','vegetables'),
(1939,'38','109','tred-mill','walking','vegetables'),
(1940,'38','110','tred-mill','walking','vegetables'),
(1941,'38','111','tred-mill','walking','vegetables'),
(1942,'38','112','tred-mill','walking','vegetables'),
(1943,'38','113','tred-mill','walking','vegetables'),
(1944,'38','114','tred-mill','walking','vegetables'),
(1945,'38','115','tred-mill','walking','vegetables'),
(1946,'38','116','tred-mill','walking','vegetables'),
(1947,'38','117','tred-mill','walking','vegetables'),
(1948,'38','118','tred-mill','walking','vegetables'),
(1949,'38','119','tred-mill','walking','vegetables'),
(1950,'38','120','tred-mill','walking','vegetables'),
(1951,'38','121','tred-mill','walking','vegetables'),
(1952,'38','122','tred-mill','walking','vegetables'),
(1953,'38','123','tred-mill','walking','vegetables'),
(1954,'38','124','tred-mill','walking','vegetables'),
(1955,'38','125','tred-mill','walking','vegetables'),
(1956,'38','126','tred-mill','walking','vegetables'),
(1957,'38','127','tred-mill','walking','vegetables'),
(1958,'38','128','tred-mill','walking','vegetables'),
(1959,'38','129','tred-mill','walking','vegetables'),
(1960,'38','130','tred-mill','walking','vegetables'),
(1961,'38','131','tred-mill','walking','vegetables'),
(1962,'38','132','tred-mill','walking','vegetables'),
(1963,'38','133','tred-mill','walking','vegetables'),
(1964,'38','134','tred-mill','walking','vegetables'),
(1965,'38','135','tred-mill','walking','vegetables'),
(1966,'38','136','tred-mill','walking','vegetables'),
(1967,'38','137','tred-mill','walking','vegetables'),
(1968,'38','138','tred-mill','walking','vegetables'),
(1969,'38','139','tred-mill','walking','vegetables'),
(1970,'38','140','tred-mill','walking','vegetables'),
(1971,'38','141','tred-mill','walking','vegetables'),
(1972,'38','142','tred-mill','walking','vegetables'),
(1973,'38','143','tred-mill','walking','vegetables'),
(1974,'38','144','tred-mill','walking','vegetables'),
(1975,'38','145','tred-mill','walking','vegetables'),
(1976,'38','146','tred-mill','walking','vegetables'),
(1977,'38','147','tred-mill','walking','vegetables'),
(1978,'38','148','tred-mill','walking','vegetables'),
(1979,'38','149','tred-mill','walking','vegetables'),
(1980,'38','150','tred-mill','walking','vegetables'),
(1981,'39','41','machine fly','russian twist','oats and fruits'),
(1982,'39','42','machine fly','russian twist','oats and fruits'),
(1983,'39','43','machine fly','russian twist','oats and fruits'),
(1984,'39','44','machine fly','russian twist','oats and fruits'),
(1985,'39','45','machine fly','russian twist','oats and fruits'),
(1986,'39','46','machine fly','russian twist','oats and fruits'),
(1987,'39','47','machine fly','russian twist','oats and fruits'),
(1988,'39','48','machine fly','russian twist','oats and fruits'),
(1989,'39','49','machine fly','russian twist','oats and fruits'),
(1990,'39','50','machine fly','russian twist','oats and fruits'),
(1991,'39','51','foam roller','dead lift','eggs and almonds'),
(1992,'39','52','foam roller','dead lift','eggs and almonds'),
(1993,'39','53','foam roller','dead lift','eggs and almonds'),
(1994,'39','54','foam roller','dead lift','eggs and almonds'),
(1995,'39','55','foam roller','dead lift','eggs and almonds'),
(1996,'39','56','foam roller','dead lift','eggs and almonds'),
(1997,'39','57','foam roller','dead lift','eggs and almonds'),
(1998,'39','58','foam roller','dead lift','eggs and almonds'),
(1999,'39','59','foam roller','dead lift','eggs and almonds'),
(2000,'39','60','foam roller','dead lift','eggs and almonds'),
(2001,'39','61','foam roller','dead lift','eggs and almonds'),
(2002,'39','62','foam roller','dead lift','eggs and almonds'),
(2003,'39','63','foam roller','dead lift','eggs and almonds'),
(2004,'39','64','foam roller','dead lift','eggs and almonds'),
(2005,'39','65','foam roller','dead lift','eggs and almonds'),
(2006,'39','66','foam roller','dead lift','eggs and almonds'),
(2007,'39','67','foam roller','dead lift','eggs and almonds'),
(2008,'39','68','foam roller','dead lift','eggs and almonds'),
(2009,'39','69','foam roller','dead lift','eggs and almonds'),
(2010,'39','70','foam roller','dead lift','eggs and almonds'),
(2011,'39','71','pull-down','legpress','vegetables'),
(2012,'39','72','pull-down','legpress','vegetables'),
(2013,'39','73','pull-down','legpress','vegetables'),
(2014,'39','74','pull-down','legpress','vegetables'),
(2015,'39','75','pull-down','legpress','vegetables'),
(2016,'39','76','pull-down','legpress','vegetables'),
(2017,'39','77','pull-down','legpress','vegetables'),
(2018,'39','78','pull-down','legpress','vegetables'),
(2019,'39','79','pull-down','legpress','vegetables'),
(2020,'39','80','pull-down','legpress','vegetables'),
(2021,'39','81','pull-down','legpress','vegetables'),
(2022,'39','82','pull-down','legpress','vegetables'),
(2023,'39','83','pull-down','legpress','vegetables'),
(2024,'39','84','pull-down','legpress','vegetables'),
(2025,'39','85','pull-down','legpress','vegetables'),
(2026,'39','86','pull-down','legpress','vegetables'),
(2027,'39','87','pull-down','legpress','vegetables'),
(2028,'39','88','pull-down','legpress','vegetables'),
(2029,'39','89','pull-down','legpress','vegetables'),
(2030,'39','90','pull-down','legpress','vegetables'),
(2031,'39','91','pull-down','legpress','vegetables'),
(2032,'39','92','pull-down','legpress','vegetables'),
(2033,'39','93','pull-down','legpress','vegetables'),
(2034,'39','94','pull-down','legpress','vegetables'),
(2035,'39','95','pull-down','legpress','vegetables'),
(2036,'39','96','pull-down','legpress','vegetables'),
(2037,'39','97','pull-down','legpress','vegetables'),
(2038,'39','98','pull-down','legpress','vegetables'),
(2039,'39','99','pull-down','legpress','vegetables'),
(2040,'39','100','pull-down','legpress','vegetables'),
(2041,'39','101','tred-mill','walking','vegetables'),
(2042,'39','102','tred-mill','walking','vegetables'),
(2043,'39','103','tred-mill','walking','vegetables'),
(2044,'39','104','tred-mill','walking','vegetables'),
(2045,'39','105','tred-mill','walking','vegetables'),
(2046,'39','106','tred-mill','walking','vegetables'),
(2047,'39','107','tred-mill','walking','vegetables'),
(2048,'39','108','tred-mill','walking','vegetables'),
(2049,'39','109','tred-mill','walking','vegetables'),
(2050,'39','110','tred-mill','walking','vegetables'),
(2051,'39','111','tred-mill','walking','vegetables'),
(2052,'39','112','tred-mill','walking','vegetables'),
(2053,'39','113','tred-mill','walking','vegetables'),
(2054,'39','114','tred-mill','walking','vegetables'),
(2055,'39','115','tred-mill','walking','vegetables'),
(2056,'39','116','tred-mill','walking','vegetables'),
(2057,'39','117','tred-mill','walking','vegetables'),
(2058,'39','118','tred-mill','walking','vegetables'),
(2059,'39','119','tred-mill','walking','vegetables'),
(2060,'39','120','tred-mill','walking','vegetables'),
(2061,'39','121','tred-mill','walking','vegetables'),
(2062,'39','122','tred-mill','walking','vegetables'),
(2063,'39','123','tred-mill','walking','vegetables'),
(2064,'39','124','tred-mill','walking','vegetables'),
(2065,'39','125','tred-mill','walking','vegetables'),
(2066,'39','126','tred-mill','walking','vegetables'),
(2067,'39','127','tred-mill','walking','vegetables'),
(2068,'39','128','tred-mill','walking','vegetables'),
(2069,'39','129','tred-mill','walking','vegetables'),
(2070,'39','130','tred-mill','walking','vegetables'),
(2071,'39','131','tred-mill','walking','vegetables'),
(2072,'39','132','tred-mill','walking','vegetables'),
(2073,'39','133','tred-mill','walking','vegetables'),
(2074,'39','134','tred-mill','walking','vegetables'),
(2075,'39','135','tred-mill','walking','vegetables'),
(2076,'39','136','tred-mill','walking','vegetables'),
(2077,'39','137','tred-mill','walking','vegetables'),
(2078,'39','138','tred-mill','walking','vegetables'),
(2079,'39','139','tred-mill','walking','vegetables'),
(2080,'39','140','tred-mill','walking','vegetables'),
(2081,'39','141','tred-mill','walking','vegetables'),
(2082,'39','142','tred-mill','walking','vegetables'),
(2083,'39','143','tred-mill','walking','vegetables'),
(2084,'39','144','tred-mill','walking','vegetables'),
(2085,'39','145','tred-mill','walking','vegetables'),
(2086,'39','146','tred-mill','walking','vegetables'),
(2087,'39','147','tred-mill','walking','vegetables'),
(2088,'39','148','tred-mill','walking','vegetables'),
(2089,'39','149','tred-mill','walking','vegetables'),
(2090,'39','150','tred-mill','walking','vegetables'),
(2091,'40','41','machine fly','russian twist','oats and fruits'),
(2092,'40','42','machine fly','russian twist','oats and fruits'),
(2093,'40','43','machine fly','russian twist','oats and fruits'),
(2094,'40','44','machine fly','russian twist','oats and fruits'),
(2095,'40','45','machine fly','russian twist','oats and fruits'),
(2096,'40','46','machine fly','russian twist','oats and fruits'),
(2097,'40','47','machine fly','russian twist','oats and fruits'),
(2098,'40','48','machine fly','russian twist','oats and fruits'),
(2099,'40','49','machine fly','russian twist','oats and fruits'),
(2100,'40','50','machine fly','russian twist','oats and fruits'),
(2101,'40','51','foam roller','dead lift','eggs and almonds'),
(2102,'40','52','foam roller','dead lift','eggs and almonds'),
(2103,'40','53','foam roller','dead lift','eggs and almonds'),
(2104,'40','54','foam roller','dead lift','eggs and almonds'),
(2105,'40','55','foam roller','dead lift','eggs and almonds'),
(2106,'40','56','foam roller','dead lift','eggs and almonds'),
(2107,'40','57','foam roller','dead lift','eggs and almonds'),
(2108,'40','58','foam roller','dead lift','eggs and almonds'),
(2109,'40','59','foam roller','dead lift','eggs and almonds'),
(2110,'40','60','foam roller','dead lift','eggs and almonds'),
(2111,'40','61','foam roller','dead lift','eggs and almonds'),
(2112,'40','62','foam roller','dead lift','eggs and almonds'),
(2113,'40','63','foam roller','dead lift','eggs and almonds'),
(2114,'40','64','foam roller','dead lift','eggs and almonds'),
(2115,'40','65','foam roller','dead lift','eggs and almonds'),
(2116,'40','66','foam roller','dead lift','eggs and almonds'),
(2117,'40','67','foam roller','dead lift','eggs and almonds'),
(2118,'40','68','foam roller','dead lift','eggs and almonds'),
(2119,'40','69','foam roller','dead lift','eggs and almonds'),
(2120,'40','70','foam roller','dead lift','eggs and almonds'),
(2121,'40','71','pull-down','legpress','vegetables'),
(2122,'40','72','pull-down','legpress','vegetables'),
(2123,'40','73','pull-down','legpress','vegetables'),
(2124,'40','74','pull-down','legpress','vegetables'),
(2125,'40','75','pull-down','legpress','vegetables'),
(2126,'40','76','pull-down','legpress','vegetables'),
(2127,'40','77','pull-down','legpress','vegetables'),
(2128,'40','78','pull-down','legpress','vegetables'),
(2129,'40','79','pull-down','legpress','vegetables'),
(2130,'40','80','pull-down','legpress','vegetables'),
(2131,'40','81','pull-down','legpress','vegetables'),
(2132,'40','82','pull-down','legpress','vegetables'),
(2133,'40','83','pull-down','legpress','vegetables'),
(2134,'40','84','pull-down','legpress','vegetables'),
(2135,'40','85','pull-down','legpress','vegetables'),
(2136,'40','86','pull-down','legpress','vegetables'),
(2137,'40','87','pull-down','legpress','vegetables'),
(2138,'40','88','pull-down','legpress','vegetables'),
(2139,'40','89','pull-down','legpress','vegetables'),
(2140,'40','90','pull-down','legpress','vegetables'),
(2141,'40','91','pull-down','legpress','vegetables'),
(2142,'40','92','pull-down','legpress','vegetables'),
(2143,'40','93','pull-down','legpress','vegetables'),
(2144,'40','94','pull-down','legpress','vegetables'),
(2145,'40','95','pull-down','legpress','vegetables'),
(2146,'40','96','pull-down','legpress','vegetables'),
(2147,'40','97','pull-down','legpress','vegetables'),
(2148,'40','98','pull-down','legpress','vegetables'),
(2149,'40','99','pull-down','legpress','vegetables'),
(2150,'40','100','pull-down','legpress','vegetables'),
(2151,'40','101','tred-mill','walking','vegetables'),
(2152,'40','102','tred-mill','walking','vegetables'),
(2153,'40','103','tred-mill','walking','vegetables'),
(2154,'40','104','tred-mill','walking','vegetables'),
(2155,'40','105','tred-mill','walking','vegetables'),
(2156,'40','106','tred-mill','walking','vegetables'),
(2157,'40','107','tred-mill','walking','vegetables'),
(2158,'40','108','tred-mill','walking','vegetables'),
(2159,'40','109','tred-mill','walking','vegetables'),
(2160,'40','110','tred-mill','walking','vegetables'),
(2161,'40','111','tred-mill','walking','vegetables'),
(2162,'40','112','tred-mill','walking','vegetables'),
(2163,'40','113','tred-mill','walking','vegetables'),
(2164,'40','114','tred-mill','walking','vegetables'),
(2165,'40','115','tred-mill','walking','vegetables'),
(2166,'40','116','tred-mill','walking','vegetables'),
(2167,'40','117','tred-mill','walking','vegetables'),
(2168,'40','118','tred-mill','walking','vegetables'),
(2169,'40','119','tred-mill','walking','vegetables'),
(2170,'40','120','tred-mill','walking','vegetables'),
(2171,'40','121','tred-mill','walking','vegetables'),
(2172,'40','122','tred-mill','walking','vegetables'),
(2173,'40','123','tred-mill','walking','vegetables'),
(2174,'40','124','tred-mill','walking','vegetables'),
(2175,'40','125','tred-mill','walking','vegetables'),
(2176,'40','126','tred-mill','walking','vegetables'),
(2177,'40','127','tred-mill','walking','vegetables'),
(2178,'40','128','tred-mill','walking','vegetables'),
(2179,'40','129','tred-mill','walking','vegetables'),
(2180,'40','130','tred-mill','walking','vegetables'),
(2181,'40','131','tred-mill','walking','vegetables'),
(2182,'40','132','tred-mill','walking','vegetables'),
(2183,'40','133','tred-mill','walking','vegetables'),
(2184,'40','134','tred-mill','walking','vegetables'),
(2185,'40','135','tred-mill','walking','vegetables'),
(2186,'40','136','tred-mill','walking','vegetables'),
(2187,'40','137','tred-mill','walking','vegetables'),
(2188,'40','138','tred-mill','walking','vegetables'),
(2189,'40','139','tred-mill','walking','vegetables'),
(2190,'40','140','tred-mill','walking','vegetables'),
(2191,'40','141','tred-mill','walking','vegetables'),
(2192,'40','142','tred-mill','walking','vegetables'),
(2193,'40','143','tred-mill','walking','vegetables'),
(2194,'40','144','tred-mill','walking','vegetables'),
(2195,'40','145','tred-mill','walking','vegetables'),
(2196,'40','146','tred-mill','walking','vegetables'),
(2197,'40','147','tred-mill','walking','vegetables'),
(2198,'40','148','tred-mill','walking','vegetables'),
(2199,'40','149','tred-mill','walking','vegetables'),
(2200,'40','150','tred-mill','walking','vegetables'),
(2201,'41','41','bench press','russian twist','oats and fruits'),
(2202,'41','42','bench press','russian twist','oats and fruits'),
(2203,'41','43','bench press','russian twist','oats and fruits'),
(2204,'41','44','bench press','russian twist','oats and fruits'),
(2205,'41','45','bench press','russian twist','oats and fruits'),
(2206,'41','46','bench press','russian twist','oats and fruits'),
(2207,'41','47','bench press','russian twist','oats and fruits'),
(2208,'41','48','bench press','russian twist','oats and fruits'),
(2209,'41','49','bench press','russian twist','oats and fruits'),
(2210,'41','50','bench press','russian twist','oats and fruits'),
(2211,'41','51','dumble flys','incline rod','eggs and almonds'),
(2212,'41','52','dumble flys','incline rod','eggs and almonds'),
(2213,'41','53','dumble flys','incline rod','eggs and almonds'),
(2214,'41','54','dumble flys','incline rod','eggs and almonds'),
(2215,'41','55','dumble flys','incline rod','eggs and almonds'),
(2216,'41','56','dumble flys','incline rod','eggs and almonds'),
(2217,'41','57','dumble flys','incline rod','eggs and almonds'),
(2218,'41','58','dumble flys','incline rod','eggs and almonds'),
(2219,'41','59','dumble flys','incline rod','eggs and almonds'),
(2220,'41','60','dumble flys','incline rod','eggs and almonds'),
(2221,'41','61','dumble flys','incline rod','eggs and almonds'),
(2222,'41','62','dumble flys','incline rod','eggs and almonds'),
(2223,'41','63','dumble flys','incline rod','eggs and almonds'),
(2224,'41','64','dumble flys','incline rod','eggs and almonds'),
(2225,'41','65','dumble flys','incline rod','eggs and almonds'),
(2226,'41','66','dumble flys','incline rod','eggs and almonds'),
(2227,'41','67','dumble flys','incline rod','eggs and almonds'),
(2228,'41','68','dumble flys','incline rod','eggs and almonds'),
(2229,'41','69','dumble flys','incline rod','eggs and almonds'),
(2230,'41','70','dumble flys','incline rod','eggs and almonds'),
(2231,'41','71','cycling','legpress','oats and jucies'),
(2232,'41','72','cycling','legpress','oats and jucies'),
(2233,'41','73','cycling','legpress','oats and jucies'),
(2234,'41','74','cycling','legpress','oats and jucies'),
(2235,'41','75','cycling','legpress','oats and jucies'),
(2236,'41','76','cycling','legpress','oats and jucies'),
(2237,'41','77','cycling','legpress','oats and jucies'),
(2238,'41','78','cycling','legpress','oats and jucies'),
(2239,'41','79','cycling','legpress','oats and jucies'),
(2240,'41','80','cycling','legpress','oats and jucies'),
(2241,'41','81','cycling','legpress','oats and jucies'),
(2242,'41','82','cycling','legpress','oats and jucies'),
(2243,'41','83','cycling','legpress','oats and jucies'),
(2244,'41','84','cycling','legpress','oats and jucies'),
(2245,'41','85','cycling','legpress','oats and jucies'),
(2246,'41','86','cycling','legpress','oats and jucies'),
(2247,'41','87','cycling','legpress','oats and jucies'),
(2248,'41','88','cycling','legpress','oats and jucies'),
(2249,'41','89','cycling','legpress','oats and jucies'),
(2250,'41','90','cycling','legpress','oats and jucies'),
(2251,'41','91','cycling','legpress','oats and jucies'),
(2252,'41','92','cycling','legpress','oats and jucies'),
(2253,'41','93','cycling','legpress','oats and jucies'),
(2254,'41','94','cycling','legpress','oats and jucies'),
(2255,'41','95','cycling','legpress','oats and jucies'),
(2256,'41','96','cycling','legpress','oats and jucies'),
(2257,'41','97','cycling','legpress','oats and jucies'),
(2258,'41','98','cycling','legpress','oats and jucies'),
(2259,'41','99','cycling','legpress','oats and jucies'),
(2260,'41','100','cycling','legpress','oats and jucies'),
(2261,'41','101','tred-mill','walking','fruits and vegetables'),
(2262,'41','102','tred-mill','walking','fruits and vegetables'),
(2263,'41','103','tred-mill','walking','fruits and vegetables'),
(2264,'41','104','tred-mill','walking','fruits and vegetables'),
(2265,'41','105','tred-mill','walking','fruits and vegetables'),
(2266,'41','106','tred-mill','walking','fruits and vegetables'),
(2267,'41','107','tred-mill','walking','fruits and vegetables'),
(2268,'41','108','tred-mill','walking','fruits and vegetables'),
(2269,'41','109','tred-mill','walking','fruits and vegetables'),
(2270,'41','110','tred-mill','walking','fruits and vegetables'),
(2271,'41','111','tred-mill','walking','fruits and vegetables'),
(2272,'41','112','tred-mill','walking','fruits and vegetables'),
(2273,'41','113','tred-mill','walking','fruits and vegetables'),
(2274,'41','114','tred-mill','walking','fruits and vegetables'),
(2275,'41','115','tred-mill','walking','fruits and vegetables'),
(2276,'41','116','tred-mill','walking','fruits and vegetables'),
(2277,'41','117','tred-mill','walking','fruits and vegetables'),
(2278,'41','118','tred-mill','walking','fruits and vegetables'),
(2279,'41','119','tred-mill','walking','fruits and vegetables'),
(2280,'41','120','tred-mill','walking','fruits and vegetables'),
(2281,'41','121','tred-mill','walking','fruits and vegetables'),
(2282,'41','122','tred-mill','walking','fruits and vegetables'),
(2283,'41','123','tred-mill','walking','fruits and vegetables'),
(2284,'41','124','tred-mill','walking','fruits and vegetables'),
(2285,'41','125','tred-mill','walking','fruits and vegetables'),
(2286,'41','126','tred-mill','walking','fruits and vegetables'),
(2287,'41','127','tred-mill','walking','fruits and vegetables'),
(2288,'41','128','tred-mill','walking','fruits and vegetables'),
(2289,'41','129','tred-mill','walking','fruits and vegetables'),
(2290,'41','130','tred-mill','walking','fruits and vegetables'),
(2291,'41','131','tred-mill','walking','fruits and vegetables'),
(2292,'41','132','tred-mill','walking','fruits and vegetables'),
(2293,'41','133','tred-mill','walking','fruits and vegetables'),
(2294,'41','134','tred-mill','walking','fruits and vegetables'),
(2295,'41','135','tred-mill','walking','fruits and vegetables'),
(2296,'41','136','tred-mill','walking','fruits and vegetables'),
(2297,'41','137','tred-mill','walking','fruits and vegetables'),
(2298,'41','138','tred-mill','walking','fruits and vegetables'),
(2299,'41','139','tred-mill','walking','fruits and vegetables'),
(2300,'41','140','tred-mill','walking','fruits and vegetables'),
(2301,'41','141','tred-mill','walking','fruits and vegetables'),
(2302,'41','142','tred-mill','walking','fruits and vegetables'),
(2303,'41','143','tred-mill','walking','fruits and vegetables'),
(2304,'41','144','tred-mill','walking','fruits and vegetables'),
(2305,'41','145','tred-mill','walking','fruits and vegetables'),
(2306,'41','146','tred-mill','walking','fruits and vegetables'),
(2307,'41','147','tred-mill','walking','fruits and vegetables'),
(2308,'41','148','tred-mill','walking','fruits and vegetables'),
(2309,'41','149','tred-mill','walking','fruits and vegetables'),
(2310,'41','150','tred-mill','walking','fruits and vegetables'),
(2311,'42','41','bench press','russian twist','oats and fruits'),
(2312,'42','42','bench press','russian twist','oats and fruits'),
(2313,'42','43','bench press','russian twist','oats and fruits'),
(2314,'42','44','bench press','russian twist','oats and fruits'),
(2315,'42','45','bench press','russian twist','oats and fruits'),
(2316,'42','46','bench press','russian twist','oats and fruits'),
(2317,'42','47','bench press','russian twist','oats and fruits'),
(2318,'42','48','bench press','russian twist','oats and fruits'),
(2319,'42','49','bench press','russian twist','oats and fruits'),
(2320,'42','50','bench press','russian twist','oats and fruits'),
(2321,'42','51','dumble flys','incline rod','eggs and almonds'),
(2322,'42','52','dumble flys','incline rod','eggs and almonds'),
(2323,'42','53','dumble flys','incline rod','eggs and almonds'),
(2324,'42','54','dumble flys','incline rod','eggs and almonds'),
(2325,'42','55','dumble flys','incline rod','eggs and almonds'),
(2326,'42','56','dumble flys','incline rod','eggs and almonds'),
(2327,'42','57','dumble flys','incline rod','eggs and almonds'),
(2328,'42','58','dumble flys','incline rod','eggs and almonds'),
(2329,'42','59','dumble flys','incline rod','eggs and almonds'),
(2330,'42','60','dumble flys','incline rod','eggs and almonds'),
(2331,'42','61','dumble flys','incline rod','eggs and almonds'),
(2332,'42','62','dumble flys','incline rod','eggs and almonds'),
(2333,'42','63','dumble flys','incline rod','eggs and almonds'),
(2334,'42','64','dumble flys','incline rod','eggs and almonds'),
(2335,'42','65','dumble flys','incline rod','eggs and almonds'),
(2336,'42','66','dumble flys','incline rod','eggs and almonds'),
(2337,'42','67','dumble flys','incline rod','eggs and almonds'),
(2338,'42','68','dumble flys','incline rod','eggs and almonds'),
(2339,'42','69','dumble flys','incline rod','eggs and almonds'),
(2340,'42','70','dumble flys','incline rod','eggs and almonds'),
(2341,'42','71','cycling','legpress','oats and jucies'),
(2342,'42','72','cycling','legpress','oats and jucies'),
(2343,'42','73','cycling','legpress','oats and jucies'),
(2344,'42','74','cycling','legpress','oats and jucies'),
(2345,'42','75','cycling','legpress','oats and jucies'),
(2346,'42','76','cycling','legpress','oats and jucies'),
(2347,'42','77','cycling','legpress','oats and jucies'),
(2348,'42','78','cycling','legpress','oats and jucies'),
(2349,'42','79','cycling','legpress','oats and jucies'),
(2350,'42','80','cycling','legpress','oats and jucies'),
(2351,'42','81','cycling','legpress','oats and jucies'),
(2352,'42','82','cycling','legpress','oats and jucies'),
(2353,'42','83','cycling','legpress','oats and jucies'),
(2354,'42','84','cycling','legpress','oats and jucies'),
(2355,'42','85','cycling','legpress','oats and jucies'),
(2356,'42','86','cycling','legpress','oats and jucies'),
(2357,'42','87','cycling','legpress','oats and jucies'),
(2358,'42','88','cycling','legpress','oats and jucies'),
(2359,'42','89','cycling','legpress','oats and jucies'),
(2360,'42','90','cycling','legpress','oats and jucies'),
(2361,'42','91','cycling','legpress','oats and jucies'),
(2362,'42','92','cycling','legpress','oats and jucies'),
(2363,'42','93','cycling','legpress','oats and jucies'),
(2364,'42','94','cycling','legpress','oats and jucies'),
(2365,'42','95','cycling','legpress','oats and jucies'),
(2366,'42','96','cycling','legpress','oats and jucies'),
(2367,'42','97','cycling','legpress','oats and jucies'),
(2368,'42','98','cycling','legpress','oats and jucies'),
(2369,'42','99','cycling','legpress','oats and jucies'),
(2370,'42','100','cycling','legpress','oats and jucies'),
(2371,'42','101','tred-mill','walking','fruits and vegetables'),
(2372,'42','102','tred-mill','walking','fruits and vegetables'),
(2373,'42','103','tred-mill','walking','fruits and vegetables'),
(2374,'42','104','tred-mill','walking','fruits and vegetables'),
(2375,'42','105','tred-mill','walking','fruits and vegetables'),
(2376,'42','106','tred-mill','walking','fruits and vegetables'),
(2377,'42','107','tred-mill','walking','fruits and vegetables'),
(2378,'42','108','tred-mill','walking','fruits and vegetables'),
(2379,'42','109','tred-mill','walking','fruits and vegetables'),
(2380,'42','110','tred-mill','walking','fruits and vegetables'),
(2381,'42','111','tred-mill','walking','fruits and vegetables'),
(2382,'42','112','tred-mill','walking','fruits and vegetables'),
(2383,'42','113','tred-mill','walking','fruits and vegetables'),
(2384,'42','114','tred-mill','walking','fruits and vegetables'),
(2385,'42','115','tred-mill','walking','fruits and vegetables'),
(2386,'42','116','tred-mill','walking','fruits and vegetables'),
(2387,'42','117','tred-mill','walking','fruits and vegetables'),
(2388,'42','118','tred-mill','walking','fruits and vegetables'),
(2389,'42','119','tred-mill','walking','fruits and vegetables'),
(2390,'42','120','tred-mill','walking','fruits and vegetables'),
(2391,'42','121','tred-mill','walking','fruits and vegetables'),
(2392,'42','122','tred-mill','walking','fruits and vegetables'),
(2393,'42','123','tred-mill','walking','fruits and vegetables'),
(2394,'42','124','tred-mill','walking','fruits and vegetables'),
(2395,'42','125','tred-mill','walking','fruits and vegetables'),
(2396,'42','126','tred-mill','walking','fruits and vegetables'),
(2397,'42','127','tred-mill','walking','fruits and vegetables'),
(2398,'42','128','tred-mill','walking','fruits and vegetables'),
(2399,'42','129','tred-mill','walking','fruits and vegetables'),
(2400,'42','130','tred-mill','walking','fruits and vegetables'),
(2401,'42','131','tred-mill','walking','fruits and vegetables'),
(2402,'42','132','tred-mill','walking','fruits and vegetables'),
(2403,'42','133','tred-mill','walking','fruits and vegetables'),
(2404,'42','134','tred-mill','walking','fruits and vegetables'),
(2405,'42','135','tred-mill','walking','fruits and vegetables'),
(2406,'42','136','tred-mill','walking','fruits and vegetables'),
(2407,'42','137','tred-mill','walking','fruits and vegetables'),
(2408,'42','138','tred-mill','walking','fruits and vegetables'),
(2409,'42','139','tred-mill','walking','fruits and vegetables'),
(2410,'42','140','tred-mill','walking','fruits and vegetables'),
(2411,'42','141','tred-mill','walking','fruits and vegetables'),
(2412,'42','142','tred-mill','walking','fruits and vegetables'),
(2413,'42','143','tred-mill','walking','fruits and vegetables'),
(2414,'42','144','tred-mill','walking','fruits and vegetables'),
(2415,'42','145','tred-mill','walking','fruits and vegetables'),
(2416,'42','146','tred-mill','walking','fruits and vegetables'),
(2417,'42','147','tred-mill','walking','fruits and vegetables'),
(2418,'42','148','tred-mill','walking','fruits and vegetables'),
(2419,'42','149','tred-mill','walking','fruits and vegetables'),
(2420,'42','150','tred-mill','walking','fruits and vegetables'),
(2421,'43','41','bench press','russian twist','oats and fruits'),
(2422,'43','42','bench press','russian twist','oats and fruits'),
(2423,'43','43','bench press','russian twist','oats and fruits'),
(2424,'43','44','bench press','russian twist','oats and fruits'),
(2425,'43','45','bench press','russian twist','oats and fruits'),
(2426,'43','46','bench press','russian twist','oats and fruits'),
(2427,'43','47','bench press','russian twist','oats and fruits'),
(2428,'43','48','bench press','russian twist','oats and fruits'),
(2429,'43','49','bench press','russian twist','oats and fruits'),
(2430,'43','50','bench press','russian twist','oats and fruits'),
(2431,'43','51','dumble flys','incline rod','eggs and almonds'),
(2432,'43','52','dumble flys','incline rod','eggs and almonds'),
(2433,'43','53','dumble flys','incline rod','eggs and almonds'),
(2434,'43','54','dumble flys','incline rod','eggs and almonds'),
(2435,'43','55','dumble flys','incline rod','eggs and almonds'),
(2436,'43','56','dumble flys','incline rod','eggs and almonds'),
(2437,'43','57','dumble flys','incline rod','eggs and almonds'),
(2438,'43','58','dumble flys','incline rod','eggs and almonds'),
(2439,'43','59','dumble flys','incline rod','eggs and almonds'),
(2440,'43','60','dumble flys','incline rod','eggs and almonds'),
(2441,'43','61','dumble flys','incline rod','eggs and almonds'),
(2442,'43','62','dumble flys','incline rod','eggs and almonds'),
(2443,'43','63','dumble flys','incline rod','eggs and almonds'),
(2444,'43','64','dumble flys','incline rod','eggs and almonds'),
(2445,'43','65','dumble flys','incline rod','eggs and almonds'),
(2446,'43','66','dumble flys','incline rod','eggs and almonds'),
(2447,'43','67','dumble flys','incline rod','eggs and almonds'),
(2448,'43','68','dumble flys','incline rod','eggs and almonds'),
(2449,'43','69','dumble flys','incline rod','eggs and almonds'),
(2450,'43','70','dumble flys','incline rod','eggs and almonds'),
(2451,'43','71','cycling','legpress','oats and jucies'),
(2452,'43','72','cycling','legpress','oats and jucies'),
(2453,'43','73','cycling','legpress','oats and jucies'),
(2454,'43','74','cycling','legpress','oats and jucies'),
(2455,'43','75','cycling','legpress','oats and jucies'),
(2456,'43','76','cycling','legpress','oats and jucies'),
(2457,'43','77','cycling','legpress','oats and jucies'),
(2458,'43','78','cycling','legpress','oats and jucies'),
(2459,'43','79','cycling','legpress','oats and jucies'),
(2460,'43','80','cycling','legpress','oats and jucies'),
(2461,'43','81','cycling','legpress','oats and jucies'),
(2462,'43','82','cycling','legpress','oats and jucies'),
(2463,'43','83','cycling','legpress','oats and jucies'),
(2464,'43','84','cycling','legpress','oats and jucies'),
(2465,'43','85','cycling','legpress','oats and jucies'),
(2466,'43','86','cycling','legpress','oats and jucies'),
(2467,'43','87','cycling','legpress','oats and jucies'),
(2468,'43','88','cycling','legpress','oats and jucies'),
(2469,'43','89','cycling','legpress','oats and jucies'),
(2470,'43','90','cycling','legpress','oats and jucies'),
(2471,'43','91','cycling','legpress','oats and jucies'),
(2472,'43','92','cycling','legpress','oats and jucies'),
(2473,'43','93','cycling','legpress','oats and jucies'),
(2474,'43','94','cycling','legpress','oats and jucies'),
(2475,'43','95','cycling','legpress','oats and jucies'),
(2476,'43','96','cycling','legpress','oats and jucies'),
(2477,'43','97','cycling','legpress','oats and jucies'),
(2478,'43','98','cycling','legpress','oats and jucies'),
(2479,'43','99','cycling','legpress','oats and jucies'),
(2480,'43','100','cycling','legpress','oats and jucies'),
(2481,'43','101','tred-mill','walking','fruits and vegetables'),
(2482,'43','102','tred-mill','walking','fruits and vegetables'),
(2483,'43','103','tred-mill','walking','fruits and vegetables'),
(2484,'43','104','tred-mill','walking','fruits and vegetables'),
(2485,'43','105','tred-mill','walking','fruits and vegetables'),
(2486,'43','106','tred-mill','walking','fruits and vegetables'),
(2487,'43','107','tred-mill','walking','fruits and vegetables'),
(2488,'43','108','tred-mill','walking','fruits and vegetables'),
(2489,'43','109','tred-mill','walking','fruits and vegetables'),
(2490,'43','110','tred-mill','walking','fruits and vegetables'),
(2491,'43','111','tred-mill','walking','fruits and vegetables'),
(2492,'43','112','tred-mill','walking','fruits and vegetables'),
(2493,'43','113','tred-mill','walking','fruits and vegetables'),
(2494,'43','114','tred-mill','walking','fruits and vegetables'),
(2495,'43','115','tred-mill','walking','fruits and vegetables'),
(2496,'43','116','tred-mill','walking','fruits and vegetables'),
(2497,'43','117','tred-mill','walking','fruits and vegetables'),
(2498,'43','118','tred-mill','walking','fruits and vegetables'),
(2499,'43','119','tred-mill','walking','fruits and vegetables'),
(2500,'43','120','tred-mill','walking','fruits and vegetables'),
(2501,'43','121','tred-mill','walking','fruits and vegetables'),
(2502,'43','122','tred-mill','walking','fruits and vegetables'),
(2503,'43','123','tred-mill','walking','fruits and vegetables'),
(2504,'43','124','tred-mill','walking','fruits and vegetables'),
(2505,'43','125','tred-mill','walking','fruits and vegetables'),
(2506,'43','126','tred-mill','walking','fruits and vegetables'),
(2507,'43','127','tred-mill','walking','fruits and vegetables'),
(2508,'43','128','tred-mill','walking','fruits and vegetables'),
(2509,'43','129','tred-mill','walking','fruits and vegetables'),
(2510,'43','130','tred-mill','walking','fruits and vegetables'),
(2511,'43','131','tred-mill','walking','fruits and vegetables'),
(2512,'43','132','tred-mill','walking','fruits and vegetables'),
(2513,'43','133','tred-mill','walking','fruits and vegetables'),
(2514,'43','134','tred-mill','walking','fruits and vegetables'),
(2515,'43','135','tred-mill','walking','fruits and vegetables'),
(2516,'43','136','tred-mill','walking','fruits and vegetables'),
(2517,'43','137','tred-mill','walking','fruits and vegetables'),
(2518,'43','138','tred-mill','walking','fruits and vegetables'),
(2519,'43','139','tred-mill','walking','fruits and vegetables'),
(2520,'43','140','tred-mill','walking','fruits and vegetables'),
(2521,'43','141','tred-mill','walking','fruits and vegetables'),
(2522,'43','142','tred-mill','walking','fruits and vegetables'),
(2523,'43','143','tred-mill','walking','fruits and vegetables'),
(2524,'43','144','tred-mill','walking','fruits and vegetables'),
(2525,'43','145','tred-mill','walking','fruits and vegetables'),
(2526,'43','146','tred-mill','walking','fruits and vegetables'),
(2527,'43','147','tred-mill','walking','fruits and vegetables'),
(2528,'43','148','tred-mill','walking','fruits and vegetables'),
(2529,'43','149','tred-mill','walking','fruits and vegetables'),
(2530,'43','150','tred-mill','walking','fruits and vegetables'),
(2531,'44','41','bench press','russian twist','oats and fruits'),
(2532,'44','42','bench press','russian twist','oats and fruits'),
(2533,'44','43','bench press','russian twist','oats and fruits'),
(2534,'44','44','bench press','russian twist','oats and fruits'),
(2535,'44','45','bench press','russian twist','oats and fruits'),
(2536,'44','46','bench press','russian twist','oats and fruits'),
(2537,'44','47','bench press','russian twist','oats and fruits'),
(2538,'44','48','bench press','russian twist','oats and fruits'),
(2539,'44','49','bench press','russian twist','oats and fruits'),
(2540,'44','50','bench press','russian twist','oats and fruits'),
(2541,'44','51','dumble flys','incline rod','eggs and almonds'),
(2542,'44','52','dumble flys','incline rod','eggs and almonds'),
(2543,'44','53','dumble flys','incline rod','eggs and almonds'),
(2544,'44','54','dumble flys','incline rod','eggs and almonds'),
(2545,'44','55','dumble flys','incline rod','eggs and almonds'),
(2546,'44','56','dumble flys','incline rod','eggs and almonds'),
(2547,'44','57','dumble flys','incline rod','eggs and almonds'),
(2548,'44','58','dumble flys','incline rod','eggs and almonds'),
(2549,'44','59','dumble flys','incline rod','eggs and almonds'),
(2550,'44','60','dumble flys','incline rod','eggs and almonds'),
(2551,'44','61','dumble flys','incline rod','eggs and almonds'),
(2552,'44','62','dumble flys','incline rod','eggs and almonds'),
(2553,'44','63','dumble flys','incline rod','eggs and almonds'),
(2554,'44','64','dumble flys','incline rod','eggs and almonds'),
(2555,'44','65','dumble flys','incline rod','eggs and almonds'),
(2556,'44','66','dumble flys','incline rod','eggs and almonds'),
(2557,'44','67','dumble flys','incline rod','eggs and almonds'),
(2558,'44','68','dumble flys','incline rod','eggs and almonds'),
(2559,'44','69','dumble flys','incline rod','eggs and almonds'),
(2560,'44','70','dumble flys','incline rod','eggs and almonds'),
(2561,'44','71','cycling','legpress','oats and jucies'),
(2562,'44','72','cycling','legpress','oats and jucies'),
(2563,'44','73','cycling','legpress','oats and jucies'),
(2564,'44','74','cycling','legpress','oats and jucies'),
(2565,'44','75','cycling','legpress','oats and jucies'),
(2566,'44','76','cycling','legpress','oats and jucies'),
(2567,'44','77','cycling','legpress','oats and jucies'),
(2568,'44','78','cycling','legpress','oats and jucies'),
(2569,'44','79','cycling','legpress','oats and jucies'),
(2570,'44','80','cycling','legpress','oats and jucies'),
(2571,'44','81','cycling','legpress','oats and jucies'),
(2572,'44','82','cycling','legpress','oats and jucies'),
(2573,'44','83','cycling','legpress','oats and jucies'),
(2574,'44','84','cycling','legpress','oats and jucies'),
(2575,'44','85','cycling','legpress','oats and jucies'),
(2576,'44','86','cycling','legpress','oats and jucies'),
(2577,'44','87','cycling','legpress','oats and jucies'),
(2578,'44','88','cycling','legpress','oats and jucies'),
(2579,'44','89','cycling','legpress','oats and jucies'),
(2580,'44','90','cycling','legpress','oats and jucies'),
(2581,'44','91','cycling','legpress','oats and jucies'),
(2582,'44','92','cycling','legpress','oats and jucies'),
(2583,'44','93','cycling','legpress','oats and jucies'),
(2584,'44','94','cycling','legpress','oats and jucies'),
(2585,'44','95','cycling','legpress','oats and jucies'),
(2586,'44','96','cycling','legpress','oats and jucies'),
(2587,'44','97','cycling','legpress','oats and jucies'),
(2588,'44','98','cycling','legpress','oats and jucies'),
(2589,'44','99','cycling','legpress','oats and jucies'),
(2590,'44','100','cycling','legpress','oats and jucies'),
(2591,'44','101','tred-mill','walking','fruits and vegetables'),
(2592,'44','102','tred-mill','walking','fruits and vegetables'),
(2593,'44','103','tred-mill','walking','fruits and vegetables'),
(2594,'44','104','tred-mill','walking','fruits and vegetables'),
(2595,'44','105','tred-mill','walking','fruits and vegetables'),
(2596,'44','106','tred-mill','walking','fruits and vegetables'),
(2597,'44','107','tred-mill','walking','fruits and vegetables'),
(2598,'44','108','tred-mill','walking','fruits and vegetables'),
(2599,'44','109','tred-mill','walking','fruits and vegetables'),
(2600,'44','110','tred-mill','walking','fruits and vegetables'),
(2601,'44','111','tred-mill','walking','fruits and vegetables'),
(2602,'44','112','tred-mill','walking','fruits and vegetables'),
(2603,'44','113','tred-mill','walking','fruits and vegetables'),
(2604,'44','114','tred-mill','walking','fruits and vegetables'),
(2605,'44','115','tred-mill','walking','fruits and vegetables'),
(2606,'44','116','tred-mill','walking','fruits and vegetables'),
(2607,'44','117','tred-mill','walking','fruits and vegetables'),
(2608,'44','118','tred-mill','walking','fruits and vegetables'),
(2609,'44','119','tred-mill','walking','fruits and vegetables'),
(2610,'44','120','tred-mill','walking','fruits and vegetables'),
(2611,'44','121','tred-mill','walking','fruits and vegetables'),
(2612,'44','122','tred-mill','walking','fruits and vegetables'),
(2613,'44','123','tred-mill','walking','fruits and vegetables'),
(2614,'44','124','tred-mill','walking','fruits and vegetables'),
(2615,'44','125','tred-mill','walking','fruits and vegetables'),
(2616,'44','126','tred-mill','walking','fruits and vegetables'),
(2617,'44','127','tred-mill','walking','fruits and vegetables'),
(2618,'44','128','tred-mill','walking','fruits and vegetables'),
(2619,'44','129','tred-mill','walking','fruits and vegetables'),
(2620,'44','130','tred-mill','walking','fruits and vegetables'),
(2621,'44','131','tred-mill','walking','fruits and vegetables'),
(2622,'44','132','tred-mill','walking','fruits and vegetables'),
(2623,'44','133','tred-mill','walking','fruits and vegetables'),
(2624,'44','134','tred-mill','walking','fruits and vegetables'),
(2625,'44','135','tred-mill','walking','fruits and vegetables'),
(2626,'44','136','tred-mill','walking','fruits and vegetables'),
(2627,'44','137','tred-mill','walking','fruits and vegetables'),
(2628,'44','138','tred-mill','walking','fruits and vegetables'),
(2629,'44','139','tred-mill','walking','fruits and vegetables'),
(2630,'44','140','tred-mill','walking','fruits and vegetables'),
(2631,'44','141','tred-mill','walking','fruits and vegetables'),
(2632,'44','142','tred-mill','walking','fruits and vegetables'),
(2633,'44','143','tred-mill','walking','fruits and vegetables'),
(2634,'44','144','tred-mill','walking','fruits and vegetables'),
(2635,'44','145','tred-mill','walking','fruits and vegetables'),
(2636,'44','146','tred-mill','walking','fruits and vegetables'),
(2637,'44','147','tred-mill','walking','fruits and vegetables'),
(2638,'44','148','tred-mill','walking','fruits and vegetables'),
(2639,'44','149','tred-mill','walking','fruits and vegetables'),
(2640,'44','150','tred-mill','walking','fruits and vegetables'),
(2641,'45','41','bench press','russian twist','oats and fruits'),
(2642,'45','42','bench press','russian twist','oats and fruits'),
(2643,'45','43','bench press','russian twist','oats and fruits'),
(2644,'45','44','bench press','russian twist','oats and fruits'),
(2645,'45','45','bench press','russian twist','oats and fruits'),
(2646,'45','46','bench press','russian twist','oats and fruits'),
(2647,'45','47','bench press','russian twist','oats and fruits'),
(2648,'45','48','bench press','russian twist','oats and fruits'),
(2649,'45','49','bench press','russian twist','oats and fruits'),
(2650,'45','50','bench press','russian twist','oats and fruits'),
(2651,'45','51','dumble flys','incline rod','eggs and almonds'),
(2652,'45','52','dumble flys','incline rod','eggs and almonds'),
(2653,'45','53','dumble flys','incline rod','eggs and almonds'),
(2654,'45','54','dumble flys','incline rod','eggs and almonds'),
(2655,'45','55','dumble flys','incline rod','eggs and almonds'),
(2656,'45','56','dumble flys','incline rod','eggs and almonds'),
(2657,'45','57','dumble flys','incline rod','eggs and almonds'),
(2658,'45','58','dumble flys','incline rod','eggs and almonds'),
(2659,'45','59','dumble flys','incline rod','eggs and almonds'),
(2660,'45','60','dumble flys','incline rod','eggs and almonds'),
(2661,'45','61','dumble flys','incline rod','eggs and almonds'),
(2662,'45','62','dumble flys','incline rod','eggs and almonds'),
(2663,'45','63','dumble flys','incline rod','eggs and almonds'),
(2664,'45','64','dumble flys','incline rod','eggs and almonds'),
(2665,'45','65','dumble flys','incline rod','eggs and almonds'),
(2666,'45','66','dumble flys','incline rod','eggs and almonds'),
(2667,'45','67','dumble flys','incline rod','eggs and almonds'),
(2668,'45','68','dumble flys','incline rod','eggs and almonds'),
(2669,'45','69','dumble flys','incline rod','eggs and almonds'),
(2670,'45','70','dumble flys','incline rod','eggs and almonds'),
(2671,'45','71','cycling','legpress','oats and jucies'),
(2672,'45','72','cycling','legpress','oats and jucies'),
(2673,'45','73','cycling','legpress','oats and jucies'),
(2674,'45','74','cycling','legpress','oats and jucies'),
(2675,'45','75','cycling','legpress','oats and jucies'),
(2676,'45','76','cycling','legpress','oats and jucies'),
(2677,'45','77','cycling','legpress','oats and jucies'),
(2678,'45','78','cycling','legpress','oats and jucies'),
(2679,'45','79','cycling','legpress','oats and jucies'),
(2680,'45','80','cycling','legpress','oats and jucies'),
(2681,'45','81','cycling','legpress','oats and jucies'),
(2682,'45','82','cycling','legpress','oats and jucies'),
(2683,'45','83','cycling','legpress','oats and jucies'),
(2684,'45','84','cycling','legpress','oats and jucies'),
(2685,'45','85','cycling','legpress','oats and jucies'),
(2686,'45','86','cycling','legpress','oats and jucies'),
(2687,'45','87','cycling','legpress','oats and jucies'),
(2688,'45','88','cycling','legpress','oats and jucies'),
(2689,'45','89','cycling','legpress','oats and jucies'),
(2690,'45','90','cycling','legpress','oats and jucies'),
(2691,'45','91','cycling','legpress','oats and jucies'),
(2692,'45','92','cycling','legpress','oats and jucies'),
(2693,'45','93','cycling','legpress','oats and jucies'),
(2694,'45','94','cycling','legpress','oats and jucies'),
(2695,'45','95','cycling','legpress','oats and jucies'),
(2696,'45','96','cycling','legpress','oats and jucies'),
(2697,'45','97','cycling','legpress','oats and jucies'),
(2698,'45','98','cycling','legpress','oats and jucies'),
(2699,'45','99','cycling','legpress','oats and jucies'),
(2700,'45','100','cycling','legpress','oats and jucies'),
(2701,'45','101','tred-mill','walking','fruits and vegetables'),
(2702,'45','102','tred-mill','walking','fruits and vegetables'),
(2703,'45','103','tred-mill','walking','fruits and vegetables'),
(2704,'45','104','tred-mill','walking','fruits and vegetables'),
(2705,'45','105','tred-mill','walking','fruits and vegetables'),
(2706,'45','106','tred-mill','walking','fruits and vegetables'),
(2707,'45','107','tred-mill','walking','fruits and vegetables'),
(2708,'45','108','tred-mill','walking','fruits and vegetables'),
(2709,'45','109','tred-mill','walking','fruits and vegetables'),
(2710,'45','110','tred-mill','walking','fruits and vegetables'),
(2711,'45','111','tred-mill','walking','fruits and vegetables'),
(2712,'45','112','tred-mill','walking','fruits and vegetables'),
(2713,'45','113','tred-mill','walking','fruits and vegetables'),
(2714,'45','114','tred-mill','walking','fruits and vegetables'),
(2715,'45','115','tred-mill','walking','fruits and vegetables'),
(2716,'45','116','tred-mill','walking','fruits and vegetables'),
(2717,'45','117','tred-mill','walking','fruits and vegetables'),
(2718,'45','118','tred-mill','walking','fruits and vegetables'),
(2719,'45','119','tred-mill','walking','fruits and vegetables'),
(2720,'45','120','tred-mill','walking','fruits and vegetables'),
(2721,'45','121','tred-mill','walking','fruits and vegetables'),
(2722,'45','122','tred-mill','walking','fruits and vegetables'),
(2723,'45','123','tred-mill','walking','fruits and vegetables'),
(2724,'45','124','tred-mill','walking','fruits and vegetables'),
(2725,'45','125','tred-mill','walking','fruits and vegetables'),
(2726,'45','126','tred-mill','walking','fruits and vegetables'),
(2727,'45','127','tred-mill','walking','fruits and vegetables'),
(2728,'45','128','tred-mill','walking','fruits and vegetables'),
(2729,'45','129','tred-mill','walking','fruits and vegetables'),
(2730,'45','130','tred-mill','walking','fruits and vegetables'),
(2731,'45','131','tred-mill','walking','fruits and vegetables'),
(2732,'45','132','tred-mill','walking','fruits and vegetables'),
(2733,'45','133','tred-mill','walking','fruits and vegetables'),
(2734,'45','134','tred-mill','walking','fruits and vegetables'),
(2735,'45','135','tred-mill','walking','fruits and vegetables'),
(2736,'45','136','tred-mill','walking','fruits and vegetables'),
(2737,'45','137','tred-mill','walking','fruits and vegetables'),
(2738,'45','138','tred-mill','walking','fruits and vegetables'),
(2739,'45','139','tred-mill','walking','fruits and vegetables'),
(2740,'45','140','tred-mill','walking','fruits and vegetables'),
(2741,'45','141','tred-mill','walking','fruits and vegetables'),
(2742,'45','142','tred-mill','walking','fruits and vegetables'),
(2743,'45','143','tred-mill','walking','fruits and vegetables'),
(2744,'45','144','tred-mill','walking','fruits and vegetables'),
(2745,'45','145','tred-mill','walking','fruits and vegetables'),
(2746,'45','146','tred-mill','walking','fruits and vegetables'),
(2747,'45','147','tred-mill','walking','fruits and vegetables'),
(2748,'45','148','tred-mill','walking','fruits and vegetables'),
(2749,'45','149','tred-mill','walking','fruits and vegetables'),
(2750,'45','150','tred-mill','walking','fruits and vegetables'),
(2751,'46','41','bench press','russian twist','oats and fruits'),
(2752,'46','42','bench press','russian twist','oats and fruits'),
(2753,'46','43','bench press','russian twist','oats and fruits'),
(2754,'46','44','bench press','russian twist','oats and fruits'),
(2755,'46','45','bench press','russian twist','oats and fruits'),
(2756,'46','46','bench press','russian twist','oats and fruits'),
(2757,'46','47','bench press','russian twist','oats and fruits'),
(2758,'46','48','bench press','russian twist','oats and fruits'),
(2759,'46','49','bench press','russian twist','oats and fruits'),
(2760,'46','50','bench press','russian twist','oats and fruits'),
(2761,'46','51','dumble flys','incline rod','eggs and almonds'),
(2762,'46','52','dumble flys','incline rod','eggs and almonds'),
(2763,'46','53','dumble flys','incline rod','eggs and almonds'),
(2764,'46','54','dumble flys','incline rod','eggs and almonds'),
(2765,'46','55','dumble flys','incline rod','eggs and almonds'),
(2766,'46','56','dumble flys','incline rod','eggs and almonds'),
(2767,'46','57','dumble flys','incline rod','eggs and almonds'),
(2768,'46','58','dumble flys','incline rod','eggs and almonds'),
(2769,'46','59','dumble flys','incline rod','eggs and almonds'),
(2770,'46','60','dumble flys','incline rod','eggs and almonds'),
(2771,'46','61','dumble flys','incline rod','eggs and almonds'),
(2772,'46','62','dumble flys','incline rod','eggs and almonds'),
(2773,'46','63','dumble flys','incline rod','eggs and almonds'),
(2774,'46','64','dumble flys','incline rod','eggs and almonds'),
(2775,'46','65','dumble flys','incline rod','eggs and almonds'),
(2776,'46','66','dumble flys','incline rod','eggs and almonds'),
(2777,'46','67','dumble flys','incline rod','eggs and almonds'),
(2778,'46','68','dumble flys','incline rod','eggs and almonds'),
(2779,'46','69','dumble flys','incline rod','eggs and almonds'),
(2780,'46','70','dumble flys','incline rod','eggs and almonds'),
(2781,'46','71','cycling','legpress','oats and jucies'),
(2782,'46','72','cycling','legpress','oats and jucies'),
(2783,'46','73','cycling','legpress','oats and jucies'),
(2784,'46','74','cycling','legpress','oats and jucies'),
(2785,'46','75','cycling','legpress','oats and jucies'),
(2786,'46','76','cycling','legpress','oats and jucies'),
(2787,'46','77','cycling','legpress','oats and jucies'),
(2788,'46','78','cycling','legpress','oats and jucies'),
(2789,'46','79','cycling','legpress','oats and jucies'),
(2790,'46','80','cycling','legpress','oats and jucies'),
(2791,'46','81','cycling','legpress','oats and jucies'),
(2792,'46','82','cycling','legpress','oats and jucies'),
(2793,'46','83','cycling','legpress','oats and jucies'),
(2794,'46','84','cycling','legpress','oats and jucies'),
(2795,'46','85','cycling','legpress','oats and jucies'),
(2796,'46','86','cycling','legpress','oats and jucies'),
(2797,'46','87','cycling','legpress','oats and jucies'),
(2798,'46','88','cycling','legpress','oats and jucies'),
(2799,'46','89','cycling','legpress','oats and jucies'),
(2800,'46','90','cycling','legpress','oats and jucies'),
(2801,'46','91','cycling','legpress','oats and jucies'),
(2802,'46','92','cycling','legpress','oats and jucies'),
(2803,'46','93','cycling','legpress','oats and jucies'),
(2804,'46','94','cycling','legpress','oats and jucies'),
(2805,'46','95','cycling','legpress','oats and jucies'),
(2806,'46','96','cycling','legpress','oats and jucies'),
(2807,'46','97','cycling','legpress','oats and jucies'),
(2808,'46','98','cycling','legpress','oats and jucies'),
(2809,'46','99','cycling','legpress','oats and jucies'),
(2810,'46','100','cycling','legpress','oats and jucies'),
(2811,'46','101','tred-mill','walking','fruits and vegetables'),
(2812,'46','102','tred-mill','walking','fruits and vegetables'),
(2813,'46','103','tred-mill','walking','fruits and vegetables'),
(2814,'46','104','tred-mill','walking','fruits and vegetables'),
(2815,'46','105','tred-mill','walking','fruits and vegetables'),
(2816,'46','106','tred-mill','walking','fruits and vegetables'),
(2817,'46','107','tred-mill','walking','fruits and vegetables'),
(2818,'46','108','tred-mill','walking','fruits and vegetables'),
(2819,'46','109','tred-mill','walking','fruits and vegetables'),
(2820,'46','110','tred-mill','walking','fruits and vegetables'),
(2821,'46','111','tred-mill','walking','fruits and vegetables'),
(2822,'46','112','tred-mill','walking','fruits and vegetables'),
(2823,'46','113','tred-mill','walking','fruits and vegetables'),
(2824,'46','114','tred-mill','walking','fruits and vegetables'),
(2825,'46','115','tred-mill','walking','fruits and vegetables'),
(2826,'46','116','tred-mill','walking','fruits and vegetables'),
(2827,'46','117','tred-mill','walking','fruits and vegetables'),
(2828,'46','118','tred-mill','walking','fruits and vegetables'),
(2829,'46','119','tred-mill','walking','fruits and vegetables'),
(2830,'46','120','tred-mill','walking','fruits and vegetables'),
(2831,'46','121','tred-mill','walking','fruits and vegetables'),
(2832,'46','122','tred-mill','walking','fruits and vegetables'),
(2833,'46','123','tred-mill','walking','fruits and vegetables'),
(2834,'46','124','tred-mill','walking','fruits and vegetables'),
(2835,'46','125','tred-mill','walking','fruits and vegetables'),
(2836,'46','126','tred-mill','walking','fruits and vegetables'),
(2837,'46','127','tred-mill','walking','fruits and vegetables'),
(2838,'46','128','tred-mill','walking','fruits and vegetables'),
(2839,'46','129','tred-mill','walking','fruits and vegetables'),
(2840,'46','130','tred-mill','walking','fruits and vegetables'),
(2841,'46','131','tred-mill','walking','fruits and vegetables'),
(2842,'46','132','tred-mill','walking','fruits and vegetables'),
(2843,'46','133','tred-mill','walking','fruits and vegetables'),
(2844,'46','134','tred-mill','walking','fruits and vegetables'),
(2845,'46','135','tred-mill','walking','fruits and vegetables'),
(2846,'46','136','tred-mill','walking','fruits and vegetables'),
(2847,'46','137','tred-mill','walking','fruits and vegetables'),
(2848,'46','138','tred-mill','walking','fruits and vegetables'),
(2849,'46','139','tred-mill','walking','fruits and vegetables'),
(2850,'46','140','tred-mill','walking','fruits and vegetables'),
(2851,'46','141','tred-mill','walking','fruits and vegetables'),
(2852,'46','142','tred-mill','walking','fruits and vegetables'),
(2853,'46','143','tred-mill','walking','fruits and vegetables'),
(2854,'46','144','tred-mill','walking','fruits and vegetables'),
(2855,'46','145','tred-mill','walking','fruits and vegetables'),
(2856,'46','146','tred-mill','walking','fruits and vegetables'),
(2857,'46','147','tred-mill','walking','fruits and vegetables'),
(2858,'46','148','tred-mill','walking','fruits and vegetables'),
(2859,'46','149','tred-mill','walking','fruits and vegetables'),
(2860,'46','150','tred-mill','walking','fruits and vegetables'),
(2861,'47','41','bench press','russian twist','oats and fruits'),
(2862,'47','42','bench press','russian twist','oats and fruits'),
(2863,'47','43','bench press','russian twist','oats and fruits'),
(2864,'47','44','bench press','russian twist','oats and fruits'),
(2865,'47','45','bench press','russian twist','oats and fruits'),
(2866,'47','46','bench press','russian twist','oats and fruits'),
(2867,'47','47','bench press','russian twist','oats and fruits'),
(2868,'47','48','bench press','russian twist','oats and fruits'),
(2869,'47','49','bench press','russian twist','oats and fruits'),
(2870,'47','50','bench press','russian twist','oats and fruits'),
(2871,'47','51','dumble flys','incline rod','eggs and almonds'),
(2872,'47','52','dumble flys','incline rod','eggs and almonds'),
(2873,'47','53','dumble flys','incline rod','eggs and almonds'),
(2874,'47','54','dumble flys','incline rod','eggs and almonds'),
(2875,'47','55','dumble flys','incline rod','eggs and almonds'),
(2876,'47','56','dumble flys','incline rod','eggs and almonds'),
(2877,'47','57','dumble flys','incline rod','eggs and almonds'),
(2878,'47','58','dumble flys','incline rod','eggs and almonds'),
(2879,'47','59','dumble flys','incline rod','eggs and almonds'),
(2880,'47','60','dumble flys','incline rod','eggs and almonds'),
(2881,'47','61','dumble flys','incline rod','eggs and almonds'),
(2882,'47','62','dumble flys','incline rod','eggs and almonds'),
(2883,'47','63','dumble flys','incline rod','eggs and almonds'),
(2884,'47','64','dumble flys','incline rod','eggs and almonds'),
(2885,'47','65','dumble flys','incline rod','eggs and almonds'),
(2886,'47','66','dumble flys','incline rod','eggs and almonds'),
(2887,'47','67','dumble flys','incline rod','eggs and almonds'),
(2888,'47','68','dumble flys','incline rod','eggs and almonds'),
(2889,'47','69','dumble flys','incline rod','eggs and almonds'),
(2890,'47','70','dumble flys','incline rod','eggs and almonds'),
(2891,'47','71','cycling','legpress','oats and jucies'),
(2892,'47','72','cycling','legpress','oats and jucies'),
(2893,'47','73','cycling','legpress','oats and jucies'),
(2894,'47','74','cycling','legpress','oats and jucies'),
(2895,'47','75','cycling','legpress','oats and jucies'),
(2896,'47','76','cycling','legpress','oats and jucies'),
(2897,'47','77','cycling','legpress','oats and jucies'),
(2898,'47','78','cycling','legpress','oats and jucies'),
(2899,'47','79','cycling','legpress','oats and jucies'),
(2900,'47','80','cycling','legpress','oats and jucies'),
(2901,'47','81','cycling','legpress','oats and jucies'),
(2902,'47','82','cycling','legpress','oats and jucies'),
(2903,'47','83','cycling','legpress','oats and jucies'),
(2904,'47','84','cycling','legpress','oats and jucies'),
(2905,'47','85','cycling','legpress','oats and jucies'),
(2906,'47','86','cycling','legpress','oats and jucies'),
(2907,'47','87','cycling','legpress','oats and jucies'),
(2908,'47','88','cycling','legpress','oats and jucies'),
(2909,'47','89','cycling','legpress','oats and jucies'),
(2910,'47','90','cycling','legpress','oats and jucies'),
(2911,'47','91','cycling','legpress','oats and jucies'),
(2912,'47','92','cycling','legpress','oats and jucies'),
(2913,'47','93','cycling','legpress','oats and jucies'),
(2914,'47','94','cycling','legpress','oats and jucies'),
(2915,'47','95','cycling','legpress','oats and jucies'),
(2916,'47','96','cycling','legpress','oats and jucies'),
(2917,'47','97','cycling','legpress','oats and jucies'),
(2918,'47','98','cycling','legpress','oats and jucies'),
(2919,'47','99','cycling','legpress','oats and jucies'),
(2920,'47','100','cycling','legpress','oats and jucies'),
(2921,'47','101','tred-mill','walking','fruits and vegetables'),
(2922,'47','102','tred-mill','walking','fruits and vegetables'),
(2923,'47','103','tred-mill','walking','fruits and vegetables'),
(2924,'47','104','tred-mill','walking','fruits and vegetables'),
(2925,'47','105','tred-mill','walking','fruits and vegetables'),
(2926,'47','106','tred-mill','walking','fruits and vegetables'),
(2927,'47','107','tred-mill','walking','fruits and vegetables'),
(2928,'47','108','tred-mill','walking','fruits and vegetables'),
(2929,'47','109','tred-mill','walking','fruits and vegetables'),
(2930,'47','110','tred-mill','walking','fruits and vegetables'),
(2931,'47','111','tred-mill','walking','fruits and vegetables'),
(2932,'47','112','tred-mill','walking','fruits and vegetables'),
(2933,'47','113','tred-mill','walking','fruits and vegetables'),
(2934,'47','114','tred-mill','walking','fruits and vegetables'),
(2935,'47','115','tred-mill','walking','fruits and vegetables'),
(2936,'47','116','tred-mill','walking','fruits and vegetables'),
(2937,'47','117','tred-mill','walking','fruits and vegetables'),
(2938,'47','118','tred-mill','walking','fruits and vegetables'),
(2939,'47','119','tred-mill','walking','fruits and vegetables'),
(2940,'47','120','tred-mill','walking','fruits and vegetables'),
(2941,'47','121','tred-mill','walking','fruits and vegetables'),
(2942,'47','122','tred-mill','walking','fruits and vegetables'),
(2943,'47','123','tred-mill','walking','fruits and vegetables'),
(2944,'47','124','tred-mill','walking','fruits and vegetables'),
(2945,'47','125','tred-mill','walking','fruits and vegetables'),
(2946,'47','126','tred-mill','walking','fruits and vegetables'),
(2947,'47','127','tred-mill','walking','fruits and vegetables'),
(2948,'47','128','tred-mill','walking','fruits and vegetables'),
(2949,'47','129','tred-mill','walking','fruits and vegetables'),
(2950,'47','130','tred-mill','walking','fruits and vegetables'),
(2951,'47','131','tred-mill','walking','fruits and vegetables'),
(2952,'47','132','tred-mill','walking','fruits and vegetables'),
(2953,'47','133','tred-mill','walking','fruits and vegetables'),
(2954,'47','134','tred-mill','walking','fruits and vegetables'),
(2955,'47','135','tred-mill','walking','fruits and vegetables'),
(2956,'47','136','tred-mill','walking','fruits and vegetables'),
(2957,'47','137','tred-mill','walking','fruits and vegetables'),
(2958,'47','138','tred-mill','walking','fruits and vegetables'),
(2959,'47','139','tred-mill','walking','fruits and vegetables'),
(2960,'47','140','tred-mill','walking','fruits and vegetables'),
(2961,'47','141','tred-mill','walking','fruits and vegetables'),
(2962,'47','142','tred-mill','walking','fruits and vegetables'),
(2963,'47','143','tred-mill','walking','fruits and vegetables'),
(2964,'47','144','tred-mill','walking','fruits and vegetables'),
(2965,'47','145','tred-mill','walking','fruits and vegetables'),
(2966,'47','146','tred-mill','walking','fruits and vegetables'),
(2967,'47','147','tred-mill','walking','fruits and vegetables'),
(2968,'47','148','tred-mill','walking','fruits and vegetables'),
(2969,'47','149','tred-mill','walking','fruits and vegetables'),
(2970,'47','150','tred-mill','walking','fruits and vegetables'),
(2971,'48','41','bench press','russian twist','oats and fruits'),
(2972,'48','42','bench press','russian twist','oats and fruits'),
(2973,'48','43','bench press','russian twist','oats and fruits'),
(2974,'48','44','bench press','russian twist','oats and fruits'),
(2975,'48','45','bench press','russian twist','oats and fruits'),
(2976,'48','46','bench press','russian twist','oats and fruits'),
(2977,'48','47','bench press','russian twist','oats and fruits'),
(2978,'48','48','bench press','russian twist','oats and fruits'),
(2979,'48','49','bench press','russian twist','oats and fruits'),
(2980,'48','50','bench press','russian twist','oats and fruits'),
(2981,'48','51','dumble flys','incline rod','eggs and almonds'),
(2982,'48','52','dumble flys','incline rod','eggs and almonds'),
(2983,'48','53','dumble flys','incline rod','eggs and almonds'),
(2984,'48','54','dumble flys','incline rod','eggs and almonds'),
(2985,'48','55','dumble flys','incline rod','eggs and almonds'),
(2986,'48','56','dumble flys','incline rod','eggs and almonds'),
(2987,'48','57','dumble flys','incline rod','eggs and almonds'),
(2988,'48','58','dumble flys','incline rod','eggs and almonds'),
(2989,'48','59','dumble flys','incline rod','eggs and almonds'),
(2990,'48','60','dumble flys','incline rod','eggs and almonds'),
(2991,'48','61','dumble flys','incline rod','eggs and almonds'),
(2992,'48','62','dumble flys','incline rod','eggs and almonds'),
(2993,'48','63','dumble flys','incline rod','eggs and almonds'),
(2994,'48','64','dumble flys','incline rod','eggs and almonds'),
(2995,'48','65','dumble flys','incline rod','eggs and almonds'),
(2996,'48','66','dumble flys','incline rod','eggs and almonds'),
(2997,'48','67','dumble flys','incline rod','eggs and almonds'),
(2998,'48','68','dumble flys','incline rod','eggs and almonds'),
(2999,'48','69','dumble flys','incline rod','eggs and almonds'),
(3000,'48','70','dumble flys','incline rod','eggs and almonds'),
(3001,'48','71','cycling','legpress','oats and jucies'),
(3002,'48','72','cycling','legpress','oats and jucies'),
(3003,'48','73','cycling','legpress','oats and jucies'),
(3004,'48','74','cycling','legpress','oats and jucies'),
(3005,'48','75','cycling','legpress','oats and jucies'),
(3006,'48','76','cycling','legpress','oats and jucies'),
(3007,'48','77','cycling','legpress','oats and jucies'),
(3008,'48','78','cycling','legpress','oats and jucies'),
(3009,'48','79','cycling','legpress','oats and jucies'),
(3010,'48','80','cycling','legpress','oats and jucies'),
(3011,'48','81','cycling','legpress','oats and jucies'),
(3012,'48','82','cycling','legpress','oats and jucies'),
(3013,'48','83','cycling','legpress','oats and jucies'),
(3014,'48','84','cycling','legpress','oats and jucies'),
(3015,'48','85','cycling','legpress','oats and jucies'),
(3016,'48','86','cycling','legpress','oats and jucies'),
(3017,'48','87','cycling','legpress','oats and jucies'),
(3018,'48','88','cycling','legpress','oats and jucies'),
(3019,'48','89','cycling','legpress','oats and jucies'),
(3020,'48','90','cycling','legpress','oats and jucies'),
(3021,'48','91','cycling','legpress','oats and jucies'),
(3022,'48','92','cycling','legpress','oats and jucies'),
(3023,'48','93','cycling','legpress','oats and jucies'),
(3024,'48','94','cycling','legpress','oats and jucies'),
(3025,'48','95','cycling','legpress','oats and jucies'),
(3026,'48','96','cycling','legpress','oats and jucies'),
(3027,'48','97','cycling','legpress','oats and jucies'),
(3028,'48','98','cycling','legpress','oats and jucies'),
(3029,'48','99','cycling','legpress','oats and jucies'),
(3030,'48','100','cycling','legpress','oats and jucies'),
(3031,'48','101','tred-mill','walking','fruits and vegetables'),
(3032,'48','102','tred-mill','walking','fruits and vegetables'),
(3033,'48','103','tred-mill','walking','fruits and vegetables'),
(3034,'48','104','tred-mill','walking','fruits and vegetables'),
(3035,'48','105','tred-mill','walking','fruits and vegetables'),
(3036,'48','106','tred-mill','walking','fruits and vegetables'),
(3037,'48','107','tred-mill','walking','fruits and vegetables'),
(3038,'48','108','tred-mill','walking','fruits and vegetables'),
(3039,'48','109','tred-mill','walking','fruits and vegetables'),
(3040,'48','110','tred-mill','walking','fruits and vegetables'),
(3041,'48','111','tred-mill','walking','fruits and vegetables'),
(3042,'48','112','tred-mill','walking','fruits and vegetables'),
(3043,'48','113','tred-mill','walking','fruits and vegetables'),
(3044,'48','114','tred-mill','walking','fruits and vegetables'),
(3045,'48','115','tred-mill','walking','fruits and vegetables'),
(3046,'48','116','tred-mill','walking','fruits and vegetables'),
(3047,'48','117','tred-mill','walking','fruits and vegetables'),
(3048,'48','118','tred-mill','walking','fruits and vegetables'),
(3049,'48','119','tred-mill','walking','fruits and vegetables'),
(3050,'48','120','tred-mill','walking','fruits and vegetables'),
(3051,'48','121','tred-mill','walking','fruits and vegetables'),
(3052,'48','122','tred-mill','walking','fruits and vegetables'),
(3053,'48','123','tred-mill','walking','fruits and vegetables'),
(3054,'48','124','tred-mill','walking','fruits and vegetables'),
(3055,'48','125','tred-mill','walking','fruits and vegetables'),
(3056,'48','126','tred-mill','walking','fruits and vegetables'),
(3057,'48','127','tred-mill','walking','fruits and vegetables'),
(3058,'48','128','tred-mill','walking','fruits and vegetables'),
(3059,'48','129','tred-mill','walking','fruits and vegetables'),
(3060,'48','130','tred-mill','walking','fruits and vegetables'),
(3061,'48','131','tred-mill','walking','fruits and vegetables'),
(3062,'48','132','tred-mill','walking','fruits and vegetables'),
(3063,'48','133','tred-mill','walking','fruits and vegetables'),
(3064,'48','134','tred-mill','walking','fruits and vegetables'),
(3065,'48','135','tred-mill','walking','fruits and vegetables'),
(3066,'48','136','tred-mill','walking','fruits and vegetables'),
(3067,'48','137','tred-mill','walking','fruits and vegetables'),
(3068,'48','138','tred-mill','walking','fruits and vegetables'),
(3069,'48','139','tred-mill','walking','fruits and vegetables'),
(3070,'48','140','tred-mill','walking','fruits and vegetables'),
(3071,'48','141','tred-mill','walking','fruits and vegetables'),
(3072,'48','142','tred-mill','walking','fruits and vegetables'),
(3073,'48','143','tred-mill','walking','fruits and vegetables'),
(3074,'48','144','tred-mill','walking','fruits and vegetables'),
(3075,'48','145','tred-mill','walking','fruits and vegetables'),
(3076,'48','146','tred-mill','walking','fruits and vegetables'),
(3077,'48','147','tred-mill','walking','fruits and vegetables'),
(3078,'48','148','tred-mill','walking','fruits and vegetables'),
(3079,'48','149','tred-mill','walking','fruits and vegetables'),
(3080,'48','150','tred-mill','walking','fruits and vegetables'),
(3081,'49','41','bench press','russian twist','oats and fruits'),
(3082,'49','42','bench press','russian twist','oats and fruits'),
(3083,'49','43','bench press','russian twist','oats and fruits'),
(3084,'49','44','bench press','russian twist','oats and fruits'),
(3085,'49','45','bench press','russian twist','oats and fruits'),
(3086,'49','46','bench press','russian twist','oats and fruits'),
(3087,'49','47','bench press','russian twist','oats and fruits'),
(3088,'49','48','bench press','russian twist','oats and fruits'),
(3089,'49','49','bench press','russian twist','oats and fruits'),
(3090,'49','50','bench press','russian twist','oats and fruits'),
(3091,'49','51','dumble flys','incline rod','eggs and almonds'),
(3092,'49','52','dumble flys','incline rod','eggs and almonds'),
(3093,'49','53','dumble flys','incline rod','eggs and almonds'),
(3094,'49','54','dumble flys','incline rod','eggs and almonds'),
(3095,'49','55','dumble flys','incline rod','eggs and almonds'),
(3096,'49','56','dumble flys','incline rod','eggs and almonds'),
(3097,'49','57','dumble flys','incline rod','eggs and almonds'),
(3098,'49','58','dumble flys','incline rod','eggs and almonds'),
(3099,'49','59','dumble flys','incline rod','eggs and almonds'),
(3100,'49','60','dumble flys','incline rod','eggs and almonds'),
(3101,'49','61','dumble flys','incline rod','eggs and almonds'),
(3102,'49','62','dumble flys','incline rod','eggs and almonds'),
(3103,'49','63','dumble flys','incline rod','eggs and almonds'),
(3104,'49','64','dumble flys','incline rod','eggs and almonds'),
(3105,'49','65','dumble flys','incline rod','eggs and almonds'),
(3106,'49','66','dumble flys','incline rod','eggs and almonds'),
(3107,'49','67','dumble flys','incline rod','eggs and almonds'),
(3108,'49','68','dumble flys','incline rod','eggs and almonds'),
(3109,'49','69','dumble flys','incline rod','eggs and almonds'),
(3110,'49','70','dumble flys','incline rod','eggs and almonds'),
(3111,'49','71','cycling','legpress','oats and jucies'),
(3112,'49','72','cycling','legpress','oats and jucies'),
(3113,'49','73','cycling','legpress','oats and jucies'),
(3114,'49','74','cycling','legpress','oats and jucies'),
(3115,'49','75','cycling','legpress','oats and jucies'),
(3116,'49','76','cycling','legpress','oats and jucies'),
(3117,'49','77','cycling','legpress','oats and jucies'),
(3118,'49','78','cycling','legpress','oats and jucies'),
(3119,'49','79','cycling','legpress','oats and jucies'),
(3120,'49','80','cycling','legpress','oats and jucies'),
(3121,'49','81','cycling','legpress','oats and jucies'),
(3122,'49','82','cycling','legpress','oats and jucies'),
(3123,'49','83','cycling','legpress','oats and jucies'),
(3124,'49','84','cycling','legpress','oats and jucies'),
(3125,'49','85','cycling','legpress','oats and jucies'),
(3126,'49','86','cycling','legpress','oats and jucies'),
(3127,'49','87','cycling','legpress','oats and jucies'),
(3128,'49','88','cycling','legpress','oats and jucies'),
(3129,'49','89','cycling','legpress','oats and jucies'),
(3130,'49','90','cycling','legpress','oats and jucies'),
(3131,'49','91','cycling','legpress','oats and jucies'),
(3132,'49','92','cycling','legpress','oats and jucies'),
(3133,'49','93','cycling','legpress','oats and jucies'),
(3134,'49','94','cycling','legpress','oats and jucies'),
(3135,'49','95','cycling','legpress','oats and jucies'),
(3136,'49','96','cycling','legpress','oats and jucies'),
(3137,'49','97','cycling','legpress','oats and jucies'),
(3138,'49','98','cycling','legpress','oats and jucies'),
(3139,'49','99','cycling','legpress','oats and jucies'),
(3140,'49','100','cycling','legpress','oats and jucies'),
(3141,'49','101','tred-mill','walking','fruits and vegetables'),
(3142,'49','102','tred-mill','walking','fruits and vegetables'),
(3143,'49','103','tred-mill','walking','fruits and vegetables'),
(3144,'49','104','tred-mill','walking','fruits and vegetables'),
(3145,'49','105','tred-mill','walking','fruits and vegetables'),
(3146,'49','106','tred-mill','walking','fruits and vegetables'),
(3147,'49','107','tred-mill','walking','fruits and vegetables'),
(3148,'49','108','tred-mill','walking','fruits and vegetables'),
(3149,'49','109','tred-mill','walking','fruits and vegetables'),
(3150,'49','110','tred-mill','walking','fruits and vegetables'),
(3151,'49','111','tred-mill','walking','fruits and vegetables'),
(3152,'49','112','tred-mill','walking','fruits and vegetables'),
(3153,'49','113','tred-mill','walking','fruits and vegetables'),
(3154,'49','114','tred-mill','walking','fruits and vegetables'),
(3155,'49','115','tred-mill','walking','fruits and vegetables'),
(3156,'49','116','tred-mill','walking','fruits and vegetables'),
(3157,'49','117','tred-mill','walking','fruits and vegetables'),
(3158,'49','118','tred-mill','walking','fruits and vegetables'),
(3159,'49','119','tred-mill','walking','fruits and vegetables'),
(3160,'49','120','tred-mill','walking','fruits and vegetables'),
(3161,'49','121','tred-mill','walking','fruits and vegetables'),
(3162,'49','122','tred-mill','walking','fruits and vegetables'),
(3163,'49','123','tred-mill','walking','fruits and vegetables'),
(3164,'49','124','tred-mill','walking','fruits and vegetables'),
(3165,'49','125','tred-mill','walking','fruits and vegetables'),
(3166,'49','126','tred-mill','walking','fruits and vegetables'),
(3167,'49','127','tred-mill','walking','fruits and vegetables'),
(3168,'49','128','tred-mill','walking','fruits and vegetables'),
(3169,'49','129','tred-mill','walking','fruits and vegetables'),
(3170,'49','130','tred-mill','walking','fruits and vegetables'),
(3171,'49','131','tred-mill','walking','fruits and vegetables'),
(3172,'49','132','tred-mill','walking','fruits and vegetables'),
(3173,'49','133','tred-mill','walking','fruits and vegetables'),
(3174,'49','134','tred-mill','walking','fruits and vegetables'),
(3175,'49','135','tred-mill','walking','fruits and vegetables'),
(3176,'49','136','tred-mill','walking','fruits and vegetables'),
(3177,'49','137','tred-mill','walking','fruits and vegetables'),
(3178,'49','138','tred-mill','walking','fruits and vegetables'),
(3179,'49','139','tred-mill','walking','fruits and vegetables'),
(3180,'49','140','tred-mill','walking','fruits and vegetables'),
(3181,'49','141','tred-mill','walking','fruits and vegetables'),
(3182,'49','142','tred-mill','walking','fruits and vegetables'),
(3183,'49','143','tred-mill','walking','fruits and vegetables'),
(3184,'49','144','tred-mill','walking','fruits and vegetables'),
(3185,'49','145','tred-mill','walking','fruits and vegetables'),
(3186,'49','146','tred-mill','walking','fruits and vegetables'),
(3187,'49','147','tred-mill','walking','fruits and vegetables'),
(3188,'49','148','tred-mill','walking','fruits and vegetables'),
(3189,'49','149','tred-mill','walking','fruits and vegetables'),
(3190,'49','150','tred-mill','walking','fruits and vegetables'),
(3191,'50','41','bench press','russian twist','oats and fruits'),
(3192,'50','42','bench press','russian twist','oats and fruits'),
(3193,'50','43','bench press','russian twist','oats and fruits'),
(3194,'50','44','bench press','russian twist','oats and fruits'),
(3195,'50','45','bench press','russian twist','oats and fruits'),
(3196,'50','46','bench press','russian twist','oats and fruits'),
(3197,'50','47','bench press','russian twist','oats and fruits'),
(3198,'50','48','bench press','russian twist','oats and fruits'),
(3199,'50','49','bench press','russian twist','oats and fruits'),
(3200,'50','50','bench press','russian twist','oats and fruits'),
(3201,'50','51','dumble flys','incline rod','eggs and almonds'),
(3202,'50','52','dumble flys','incline rod','eggs and almonds'),
(3203,'50','53','dumble flys','incline rod','eggs and almonds'),
(3204,'50','54','dumble flys','incline rod','eggs and almonds'),
(3205,'50','55','dumble flys','incline rod','eggs and almonds'),
(3206,'50','56','dumble flys','incline rod','eggs and almonds'),
(3207,'50','57','dumble flys','incline rod','eggs and almonds'),
(3208,'50','58','dumble flys','incline rod','eggs and almonds'),
(3209,'50','59','dumble flys','incline rod','eggs and almonds'),
(3210,'50','60','dumble flys','incline rod','eggs and almonds'),
(3211,'50','61','dumble flys','incline rod','eggs and almonds'),
(3212,'50','62','dumble flys','incline rod','eggs and almonds'),
(3213,'50','63','dumble flys','incline rod','eggs and almonds'),
(3214,'50','64','dumble flys','incline rod','eggs and almonds'),
(3215,'50','65','dumble flys','incline rod','eggs and almonds'),
(3216,'50','66','dumble flys','incline rod','eggs and almonds'),
(3217,'50','67','dumble flys','incline rod','eggs and almonds'),
(3218,'50','68','dumble flys','incline rod','eggs and almonds'),
(3219,'50','69','dumble flys','incline rod','eggs and almonds'),
(3220,'50','70','dumble flys','incline rod','eggs and almonds'),
(3221,'50','71','cycling','legpress','oats and jucies'),
(3222,'50','72','cycling','legpress','oats and jucies'),
(3223,'50','73','cycling','legpress','oats and jucies'),
(3224,'50','74','cycling','legpress','oats and jucies'),
(3225,'50','75','cycling','legpress','oats and jucies'),
(3226,'50','76','cycling','legpress','oats and jucies'),
(3227,'50','77','cycling','legpress','oats and jucies'),
(3228,'50','78','cycling','legpress','oats and jucies'),
(3229,'50','79','cycling','legpress','oats and jucies'),
(3230,'50','80','cycling','legpress','oats and jucies'),
(3231,'50','81','cycling','legpress','oats and jucies'),
(3232,'50','82','cycling','legpress','oats and jucies'),
(3233,'50','83','cycling','legpress','oats and jucies'),
(3234,'50','84','cycling','legpress','oats and jucies'),
(3235,'50','85','cycling','legpress','oats and jucies'),
(3236,'50','86','cycling','legpress','oats and jucies'),
(3237,'50','87','cycling','legpress','oats and jucies'),
(3238,'50','88','cycling','legpress','oats and jucies'),
(3239,'50','89','cycling','legpress','oats and jucies'),
(3240,'50','90','cycling','legpress','oats and jucies'),
(3241,'50','91','cycling','legpress','oats and jucies'),
(3242,'50','92','cycling','legpress','oats and jucies'),
(3243,'50','93','cycling','legpress','oats and jucies'),
(3244,'50','94','cycling','legpress','oats and jucies'),
(3245,'50','95','cycling','legpress','oats and jucies'),
(3246,'50','96','cycling','legpress','oats and jucies'),
(3247,'50','97','cycling','legpress','oats and jucies'),
(3248,'50','98','cycling','legpress','oats and jucies'),
(3249,'50','99','cycling','legpress','oats and jucies'),
(3250,'50','100','cycling','legpress','oats and jucies'),
(3251,'50','101','tred-mill','walking','fruits and vegetables'),
(3252,'50','102','tred-mill','walking','fruits and vegetables'),
(3253,'50','103','tred-mill','walking','fruits and vegetables'),
(3254,'50','104','tred-mill','walking','fruits and vegetables'),
(3255,'50','105','tred-mill','walking','fruits and vegetables'),
(3256,'50','106','tred-mill','walking','fruits and vegetables'),
(3257,'50','107','tred-mill','walking','fruits and vegetables'),
(3258,'50','108','tred-mill','walking','fruits and vegetables'),
(3259,'50','109','tred-mill','walking','fruits and vegetables'),
(3260,'50','110','tred-mill','walking','fruits and vegetables'),
(3261,'50','111','tred-mill','walking','fruits and vegetables'),
(3262,'50','112','tred-mill','walking','fruits and vegetables'),
(3263,'50','113','tred-mill','walking','fruits and vegetables'),
(3264,'50','114','tred-mill','walking','fruits and vegetables'),
(3265,'50','115','tred-mill','walking','fruits and vegetables'),
(3266,'50','116','tred-mill','walking','fruits and vegetables'),
(3267,'50','117','tred-mill','walking','fruits and vegetables'),
(3268,'50','118','tred-mill','walking','fruits and vegetables'),
(3269,'50','119','tred-mill','walking','fruits and vegetables'),
(3270,'50','120','tred-mill','walking','fruits and vegetables'),
(3271,'50','121','tred-mill','walking','fruits and vegetables'),
(3272,'50','122','tred-mill','walking','fruits and vegetables'),
(3273,'50','123','tred-mill','walking','fruits and vegetables'),
(3274,'50','124','tred-mill','walking','fruits and vegetables'),
(3275,'50','125','tred-mill','walking','fruits and vegetables'),
(3276,'50','126','tred-mill','walking','fruits and vegetables'),
(3277,'50','127','tred-mill','walking','fruits and vegetables'),
(3278,'50','128','tred-mill','walking','fruits and vegetables'),
(3279,'50','129','tred-mill','walking','fruits and vegetables'),
(3280,'50','130','tred-mill','walking','fruits and vegetables'),
(3281,'50','131','tred-mill','walking','fruits and vegetables'),
(3282,'50','132','tred-mill','walking','fruits and vegetables'),
(3283,'50','133','tred-mill','walking','fruits and vegetables'),
(3284,'50','134','tred-mill','walking','fruits and vegetables'),
(3285,'50','135','tred-mill','walking','fruits and vegetables'),
(3286,'50','136','tred-mill','walking','fruits and vegetables'),
(3287,'50','137','tred-mill','walking','fruits and vegetables'),
(3288,'50','138','tred-mill','walking','fruits and vegetables'),
(3289,'50','139','tred-mill','walking','fruits and vegetables'),
(3290,'50','140','tred-mill','walking','fruits and vegetables'),
(3291,'50','141','tred-mill','walking','fruits and vegetables'),
(3292,'50','142','tred-mill','walking','fruits and vegetables'),
(3293,'50','143','tred-mill','walking','fruits and vegetables'),
(3294,'50','144','tred-mill','walking','fruits and vegetables'),
(3295,'50','145','tred-mill','walking','fruits and vegetables'),
(3296,'50','146','tred-mill','walking','fruits and vegetables'),
(3297,'50','147','tred-mill','walking','fruits and vegetables'),
(3298,'50','148','tred-mill','walking','fruits and vegetables'),
(3299,'50','149','tred-mill','walking','fruits and vegetables'),
(3300,'50','150','tred-mill','walking','fruits and vegetables'),
(3301,'51','41','dip','walking','oats and fruits'),
(3302,'51','42','dip','walking','oats and fruits'),
(3303,'51','43','dip','walking','oats and fruits'),
(3304,'51','44','dip','walking','oats and fruits'),
(3305,'51','45','dip','walking','oats and fruits'),
(3306,'51','46','dip','walking','oats and fruits'),
(3307,'51','47','dip','walking','oats and fruits'),
(3308,'51','48','dip','walking','oats and fruits'),
(3309,'51','49','dip','walking','oats and fruits'),
(3310,'51','50','dip','walking','oats and fruits'),
(3311,'51','51',' jogging','walking','eggs and almonds'),
(3312,'51','52',' jogging','walking','eggs and almonds'),
(3313,'51','53',' jogging','walking','eggs and almonds'),
(3314,'51','54',' jogging','walking','eggs and almonds'),
(3315,'51','55',' jogging','walking','eggs and almonds'),
(3316,'51','56',' jogging','walking','eggs and almonds'),
(3317,'51','57',' jogging','walking','eggs and almonds'),
(3318,'51','58',' jogging','walking','eggs and almonds'),
(3319,'51','59',' jogging','walking','eggs and almonds'),
(3320,'51','60',' jogging','walking','eggs and almonds'),
(3321,'51','61',' jogging','walking','eggs and almonds'),
(3322,'51','62',' jogging','walking','eggs and almonds'),
(3323,'51','63',' jogging','walking','eggs and almonds'),
(3324,'51','64',' jogging','walking','eggs and almonds'),
(3325,'51','65',' jogging','walking','eggs and almonds'),
(3326,'51','66',' jogging','walking','eggs and almonds'),
(3327,'51','67',' jogging','walking','eggs and almonds'),
(3328,'51','68',' jogging','walking','eggs and almonds'),
(3329,'51','69',' jogging','walking','eggs and almonds'),
(3330,'51','70',' jogging','walking','eggs and almonds'),
(3331,'51','71','cycling','legpress','vegetables and salads'),
(3332,'51','72','cycling','legpress','vegetables and salads'),
(3333,'51','73','cycling','legpress','vegetables and salads'),
(3334,'51','74','cycling','legpress','vegetables and salads'),
(3335,'51','75','cycling','legpress','vegetables and salads'),
(3336,'51','76','cycling','legpress','vegetables and salads'),
(3337,'51','77','cycling','legpress','vegetables and salads'),
(3338,'51','78','cycling','legpress','vegetables and salads'),
(3339,'51','79','cycling','legpress','vegetables and salads'),
(3340,'51','80','cycling','legpress','vegetables and salads'),
(3341,'51','81','cycling','legpress','vegetables and salads'),
(3342,'51','82','cycling','legpress','vegetables and salads'),
(3343,'51','83','cycling','legpress','vegetables and salads'),
(3344,'51','84','cycling','legpress','vegetables and salads'),
(3345,'51','85','cycling','legpress','vegetables and salads'),
(3346,'51','86','cycling','legpress','vegetables and salads'),
(3347,'51','87','cycling','legpress','vegetables and salads'),
(3348,'51','88','cycling','legpress','vegetables and salads'),
(3349,'51','89','cycling','legpress','vegetables and salads'),
(3350,'51','90','cycling','legpress','vegetables and salads'),
(3351,'51','91','cycling','legpress','vegetables and salads'),
(3352,'51','92','cycling','legpress','vegetables and salads'),
(3353,'51','93','cycling','legpress','vegetables and salads'),
(3354,'51','94','cycling','legpress','vegetables and salads'),
(3355,'51','95','cycling','legpress','vegetables and salads'),
(3356,'51','96','cycling','legpress','vegetables and salads'),
(3357,'51','97','cycling','legpress','vegetables and salads'),
(3358,'51','98','cycling','legpress','vegetables and salads'),
(3359,'51','99','cycling','legpress','vegetables and salads'),
(3360,'51','100','cycling','legpress','vegetables and salads'),
(3361,'51','101','tred-mill','walking','fruits and vegetables'),
(3362,'51','102','tred-mill','walking','fruits and vegetables'),
(3363,'51','103','tred-mill','walking','fruits and vegetables'),
(3364,'51','104','tred-mill','walking','fruits and vegetables'),
(3365,'51','105','tred-mill','walking','fruits and vegetables'),
(3366,'51','106','tred-mill','walking','fruits and vegetables'),
(3367,'51','107','tred-mill','walking','fruits and vegetables'),
(3368,'51','108','tred-mill','walking','fruits and vegetables'),
(3369,'51','109','tred-mill','walking','fruits and vegetables'),
(3370,'51','110','tred-mill','walking','fruits and vegetables'),
(3371,'51','111','tred-mill','walking','fruits and vegetables'),
(3372,'51','112','tred-mill','walking','fruits and vegetables'),
(3373,'51','113','tred-mill','walking','fruits and vegetables'),
(3374,'51','114','tred-mill','walking','fruits and vegetables'),
(3375,'51','115','tred-mill','walking','fruits and vegetables'),
(3376,'51','116','tred-mill','walking','fruits and vegetables'),
(3377,'51','117','tred-mill','walking','fruits and vegetables'),
(3378,'51','118','tred-mill','walking','fruits and vegetables'),
(3379,'51','119','tred-mill','walking','fruits and vegetables'),
(3380,'51','120','tred-mill','walking','fruits and vegetables'),
(3381,'51','121','tred-mill','walking','fruits and vegetables'),
(3382,'51','122','tred-mill','walking','fruits and vegetables'),
(3383,'51','123','tred-mill','walking','fruits and vegetables'),
(3384,'51','124','tred-mill','walking','fruits and vegetables'),
(3385,'51','125','tred-mill','walking','fruits and vegetables'),
(3386,'51','126','tred-mill','walking','fruits and vegetables'),
(3387,'51','127','tred-mill','walking','fruits and vegetables'),
(3388,'51','128','tred-mill','walking','fruits and vegetables'),
(3389,'51','129','tred-mill','walking','fruits and vegetables'),
(3390,'51','130','tred-mill','walking','fruits and vegetables'),
(3391,'51','131','tred-mill','walking','fruits and vegetables'),
(3392,'51','132','tred-mill','walking','fruits and vegetables'),
(3393,'51','133','tred-mill','walking','fruits and vegetables'),
(3394,'51','134','tred-mill','walking','fruits and vegetables'),
(3395,'51','135','tred-mill','walking','fruits and vegetables'),
(3396,'51','136','tred-mill','walking','fruits and vegetables'),
(3397,'51','137','tred-mill','walking','fruits and vegetables'),
(3398,'51','138','tred-mill','walking','fruits and vegetables'),
(3399,'51','139','tred-mill','walking','fruits and vegetables'),
(3400,'51','140','tred-mill','walking','fruits and vegetables'),
(3401,'51','141','tred-mill','walking','fruits and vegetables'),
(3402,'51','142','tred-mill','walking','fruits and vegetables'),
(3403,'51','143','tred-mill','walking','fruits and vegetables'),
(3404,'51','144','tred-mill','walking','fruits and vegetables'),
(3405,'51','145','tred-mill','walking','fruits and vegetables'),
(3406,'51','146','tred-mill','walking','fruits and vegetables'),
(3407,'51','147','tred-mill','walking','fruits and vegetables'),
(3408,'51','148','tred-mill','walking','fruits and vegetables'),
(3409,'51','149','tred-mill','walking','fruits and vegetables'),
(3410,'51','150','tred-mill','walking','fruits and vegetables'),
(3411,'52','41','dip','walking','oats and fruits'),
(3412,'52','42','dip','walking','oats and fruits'),
(3413,'52','43','dip','walking','oats and fruits'),
(3414,'52','44','dip','walking','oats and fruits'),
(3415,'52','45','dip','walking','oats and fruits'),
(3416,'52','46','dip','walking','oats and fruits'),
(3417,'52','47','dip','walking','oats and fruits'),
(3418,'52','48','dip','walking','oats and fruits'),
(3419,'52','49','dip','walking','oats and fruits'),
(3420,'52','50','dip','walking','oats and fruits'),
(3421,'52','51',' jogging','walking','eggs and almonds'),
(3422,'52','52',' jogging','walking','eggs and almonds'),
(3423,'52','53',' jogging','walking','eggs and almonds'),
(3424,'52','54',' jogging','walking','eggs and almonds'),
(3425,'52','55',' jogging','walking','eggs and almonds'),
(3426,'52','56',' jogging','walking','eggs and almonds'),
(3427,'52','57',' jogging','walking','eggs and almonds'),
(3428,'52','58',' jogging','walking','eggs and almonds'),
(3429,'52','59',' jogging','walking','eggs and almonds'),
(3430,'52','60',' jogging','walking','eggs and almonds'),
(3431,'52','61',' jogging','walking','eggs and almonds'),
(3432,'52','62',' jogging','walking','eggs and almonds'),
(3433,'52','63',' jogging','walking','eggs and almonds'),
(3434,'52','64',' jogging','walking','eggs and almonds'),
(3435,'52','65',' jogging','walking','eggs and almonds'),
(3436,'52','66',' jogging','walking','eggs and almonds'),
(3437,'52','67',' jogging','walking','eggs and almonds'),
(3438,'52','68',' jogging','walking','eggs and almonds'),
(3439,'52','69',' jogging','walking','eggs and almonds'),
(3440,'52','70',' jogging','walking','eggs and almonds'),
(3441,'52','71','cycling','legpress','vegetables and salads'),
(3442,'52','72','cycling','legpress','vegetables and salads'),
(3443,'52','73','cycling','legpress','vegetables and salads'),
(3444,'52','74','cycling','legpress','vegetables and salads'),
(3445,'52','75','cycling','legpress','vegetables and salads'),
(3446,'52','76','cycling','legpress','vegetables and salads'),
(3447,'52','77','cycling','legpress','vegetables and salads'),
(3448,'52','78','cycling','legpress','vegetables and salads'),
(3449,'52','79','cycling','legpress','vegetables and salads'),
(3450,'52','80','cycling','legpress','vegetables and salads'),
(3451,'52','81','cycling','legpress','vegetables and salads'),
(3452,'52','82','cycling','legpress','vegetables and salads'),
(3453,'52','83','cycling','legpress','vegetables and salads'),
(3454,'52','84','cycling','legpress','vegetables and salads'),
(3455,'52','85','cycling','legpress','vegetables and salads'),
(3456,'52','86','cycling','legpress','vegetables and salads'),
(3457,'52','87','cycling','legpress','vegetables and salads'),
(3458,'52','88','cycling','legpress','vegetables and salads'),
(3459,'52','89','cycling','legpress','vegetables and salads'),
(3460,'52','90','cycling','legpress','vegetables and salads'),
(3461,'52','91','cycling','legpress','vegetables and salads'),
(3462,'52','92','cycling','legpress','vegetables and salads'),
(3463,'52','93','cycling','legpress','vegetables and salads'),
(3464,'52','94','cycling','legpress','vegetables and salads'),
(3465,'52','95','cycling','legpress','vegetables and salads'),
(3466,'52','96','cycling','legpress','vegetables and salads'),
(3467,'52','97','cycling','legpress','vegetables and salads'),
(3468,'52','98','cycling','legpress','vegetables and salads'),
(3469,'52','99','cycling','legpress','vegetables and salads'),
(3470,'52','100','cycling','legpress','vegetables and salads'),
(3471,'52','101','tred-mill','walking','fruits and vegetables'),
(3472,'52','102','tred-mill','walking','fruits and vegetables'),
(3473,'52','103','tred-mill','walking','fruits and vegetables'),
(3474,'52','104','tred-mill','walking','fruits and vegetables'),
(3475,'52','105','tred-mill','walking','fruits and vegetables'),
(3476,'52','106','tred-mill','walking','fruits and vegetables'),
(3477,'52','107','tred-mill','walking','fruits and vegetables'),
(3478,'52','108','tred-mill','walking','fruits and vegetables'),
(3479,'52','109','tred-mill','walking','fruits and vegetables'),
(3480,'52','110','tred-mill','walking','fruits and vegetables'),
(3481,'52','111','tred-mill','walking','fruits and vegetables'),
(3482,'52','112','tred-mill','walking','fruits and vegetables'),
(3483,'52','113','tred-mill','walking','fruits and vegetables'),
(3484,'52','114','tred-mill','walking','fruits and vegetables'),
(3485,'52','115','tred-mill','walking','fruits and vegetables'),
(3486,'52','116','tred-mill','walking','fruits and vegetables'),
(3487,'52','117','tred-mill','walking','fruits and vegetables'),
(3488,'52','118','tred-mill','walking','fruits and vegetables'),
(3489,'52','119','tred-mill','walking','fruits and vegetables'),
(3490,'52','120','tred-mill','walking','fruits and vegetables'),
(3491,'52','121','tred-mill','walking','fruits and vegetables'),
(3492,'52','122','tred-mill','walking','fruits and vegetables'),
(3493,'52','123','tred-mill','walking','fruits and vegetables'),
(3494,'52','124','tred-mill','walking','fruits and vegetables'),
(3495,'52','125','tred-mill','walking','fruits and vegetables'),
(3496,'52','126','tred-mill','walking','fruits and vegetables'),
(3497,'52','127','tred-mill','walking','fruits and vegetables'),
(3498,'52','128','tred-mill','walking','fruits and vegetables'),
(3499,'52','129','tred-mill','walking','fruits and vegetables'),
(3500,'52','130','tred-mill','walking','fruits and vegetables'),
(3501,'52','131','tred-mill','walking','fruits and vegetables'),
(3502,'52','132','tred-mill','walking','fruits and vegetables'),
(3503,'52','133','tred-mill','walking','fruits and vegetables'),
(3504,'52','134','tred-mill','walking','fruits and vegetables'),
(3505,'52','135','tred-mill','walking','fruits and vegetables'),
(3506,'52','136','tred-mill','walking','fruits and vegetables'),
(3507,'52','137','tred-mill','walking','fruits and vegetables'),
(3508,'52','138','tred-mill','walking','fruits and vegetables'),
(3509,'52','139','tred-mill','walking','fruits and vegetables'),
(3510,'52','140','tred-mill','walking','fruits and vegetables'),
(3511,'52','141','tred-mill','walking','fruits and vegetables'),
(3512,'52','142','tred-mill','walking','fruits and vegetables'),
(3513,'52','143','tred-mill','walking','fruits and vegetables'),
(3514,'52','144','tred-mill','walking','fruits and vegetables'),
(3515,'52','145','tred-mill','walking','fruits and vegetables'),
(3516,'52','146','tred-mill','walking','fruits and vegetables'),
(3517,'52','147','tred-mill','walking','fruits and vegetables'),
(3518,'52','148','tred-mill','walking','fruits and vegetables'),
(3519,'52','149','tred-mill','walking','fruits and vegetables'),
(3520,'52','150','tred-mill','walking','fruits and vegetables'),
(3521,'53','41','dip','walking','oats and fruits'),
(3522,'53','42','dip','walking','oats and fruits'),
(3523,'53','43','dip','walking','oats and fruits'),
(3524,'53','44','dip','walking','oats and fruits'),
(3525,'53','45','dip','walking','oats and fruits'),
(3526,'53','46','dip','walking','oats and fruits'),
(3527,'53','47','dip','walking','oats and fruits'),
(3528,'53','48','dip','walking','oats and fruits'),
(3529,'53','49','dip','walking','oats and fruits'),
(3530,'53','50','dip','walking','oats and fruits'),
(3531,'53','51',' jogging','walking','eggs and almonds'),
(3532,'53','52',' jogging','walking','eggs and almonds'),
(3533,'53','53',' jogging','walking','eggs and almonds'),
(3534,'53','54',' jogging','walking','eggs and almonds'),
(3535,'53','55',' jogging','walking','eggs and almonds'),
(3536,'53','56',' jogging','walking','eggs and almonds'),
(3537,'53','57',' jogging','walking','eggs and almonds'),
(3538,'53','58',' jogging','walking','eggs and almonds'),
(3539,'53','59',' jogging','walking','eggs and almonds'),
(3540,'53','60',' jogging','walking','eggs and almonds'),
(3541,'53','61',' jogging','walking','eggs and almonds'),
(3542,'53','62',' jogging','walking','eggs and almonds'),
(3543,'53','63',' jogging','walking','eggs and almonds'),
(3544,'53','64',' jogging','walking','eggs and almonds'),
(3545,'53','65',' jogging','walking','eggs and almonds'),
(3546,'53','66',' jogging','walking','eggs and almonds'),
(3547,'53','67',' jogging','walking','eggs and almonds'),
(3548,'53','68',' jogging','walking','eggs and almonds'),
(3549,'53','69',' jogging','walking','eggs and almonds'),
(3550,'53','70',' jogging','walking','eggs and almonds'),
(3551,'53','71','cycling','legpress','vegetables and salads'),
(3552,'53','72','cycling','legpress','vegetables and salads'),
(3553,'53','73','cycling','legpress','vegetables and salads'),
(3554,'53','74','cycling','legpress','vegetables and salads'),
(3555,'53','75','cycling','legpress','vegetables and salads'),
(3556,'53','76','cycling','legpress','vegetables and salads'),
(3557,'53','77','cycling','legpress','vegetables and salads'),
(3558,'53','78','cycling','legpress','vegetables and salads'),
(3559,'53','79','cycling','legpress','vegetables and salads'),
(3560,'53','80','cycling','legpress','vegetables and salads'),
(3561,'53','81','cycling','legpress','vegetables and salads'),
(3562,'53','82','cycling','legpress','vegetables and salads'),
(3563,'53','83','cycling','legpress','vegetables and salads'),
(3564,'53','84','cycling','legpress','vegetables and salads'),
(3565,'53','85','cycling','legpress','vegetables and salads'),
(3566,'53','86','cycling','legpress','vegetables and salads'),
(3567,'53','87','cycling','legpress','vegetables and salads'),
(3568,'53','88','cycling','legpress','vegetables and salads'),
(3569,'53','89','cycling','legpress','vegetables and salads'),
(3570,'53','90','cycling','legpress','vegetables and salads'),
(3571,'53','91','cycling','legpress','vegetables and salads'),
(3572,'53','92','cycling','legpress','vegetables and salads'),
(3573,'53','93','cycling','legpress','vegetables and salads'),
(3574,'53','94','cycling','legpress','vegetables and salads'),
(3575,'53','95','cycling','legpress','vegetables and salads'),
(3576,'53','96','cycling','legpress','vegetables and salads'),
(3577,'53','97','cycling','legpress','vegetables and salads'),
(3578,'53','98','cycling','legpress','vegetables and salads'),
(3579,'53','99','cycling','legpress','vegetables and salads'),
(3580,'53','100','cycling','legpress','vegetables and salads'),
(3581,'53','101','tred-mill','walking','fruits and vegetables'),
(3582,'53','102','tred-mill','walking','fruits and vegetables'),
(3583,'53','103','tred-mill','walking','fruits and vegetables'),
(3584,'53','104','tred-mill','walking','fruits and vegetables'),
(3585,'53','105','tred-mill','walking','fruits and vegetables'),
(3586,'53','106','tred-mill','walking','fruits and vegetables'),
(3587,'53','107','tred-mill','walking','fruits and vegetables'),
(3588,'53','108','tred-mill','walking','fruits and vegetables'),
(3589,'53','109','tred-mill','walking','fruits and vegetables'),
(3590,'53','110','tred-mill','walking','fruits and vegetables'),
(3591,'53','111','tred-mill','walking','fruits and vegetables'),
(3592,'53','112','tred-mill','walking','fruits and vegetables'),
(3593,'53','113','tred-mill','walking','fruits and vegetables'),
(3594,'53','114','tred-mill','walking','fruits and vegetables'),
(3595,'53','115','tred-mill','walking','fruits and vegetables'),
(3596,'53','116','tred-mill','walking','fruits and vegetables'),
(3597,'53','117','tred-mill','walking','fruits and vegetables'),
(3598,'53','118','tred-mill','walking','fruits and vegetables'),
(3599,'53','119','tred-mill','walking','fruits and vegetables'),
(3600,'53','120','tred-mill','walking','fruits and vegetables'),
(3601,'53','121','tred-mill','walking','fruits and vegetables'),
(3602,'53','122','tred-mill','walking','fruits and vegetables'),
(3603,'53','123','tred-mill','walking','fruits and vegetables'),
(3604,'53','124','tred-mill','walking','fruits and vegetables'),
(3605,'53','125','tred-mill','walking','fruits and vegetables'),
(3606,'53','126','tred-mill','walking','fruits and vegetables'),
(3607,'53','127','tred-mill','walking','fruits and vegetables'),
(3608,'53','128','tred-mill','walking','fruits and vegetables'),
(3609,'53','129','tred-mill','walking','fruits and vegetables'),
(3610,'53','130','tred-mill','walking','fruits and vegetables'),
(3611,'53','131','tred-mill','walking','fruits and vegetables'),
(3612,'53','132','tred-mill','walking','fruits and vegetables'),
(3613,'53','133','tred-mill','walking','fruits and vegetables'),
(3614,'53','134','tred-mill','walking','fruits and vegetables'),
(3615,'53','135','tred-mill','walking','fruits and vegetables'),
(3616,'53','136','tred-mill','walking','fruits and vegetables'),
(3617,'53','137','tred-mill','walking','fruits and vegetables'),
(3618,'53','138','tred-mill','walking','fruits and vegetables'),
(3619,'53','139','tred-mill','walking','fruits and vegetables'),
(3620,'53','140','tred-mill','walking','fruits and vegetables'),
(3621,'53','141','tred-mill','walking','fruits and vegetables'),
(3622,'53','142','tred-mill','walking','fruits and vegetables'),
(3623,'53','143','tred-mill','walking','fruits and vegetables'),
(3624,'53','144','tred-mill','walking','fruits and vegetables'),
(3625,'53','145','tred-mill','walking','fruits and vegetables'),
(3626,'53','146','tred-mill','walking','fruits and vegetables'),
(3627,'53','147','tred-mill','walking','fruits and vegetables'),
(3628,'53','148','tred-mill','walking','fruits and vegetables'),
(3629,'53','149','tred-mill','walking','fruits and vegetables'),
(3630,'53','150','tred-mill','walking','fruits and vegetables'),
(3631,'54','41','dip','walking','oats and fruits'),
(3632,'54','42','dip','walking','oats and fruits'),
(3633,'54','43','dip','walking','oats and fruits'),
(3634,'54','44','dip','walking','oats and fruits'),
(3635,'54','45','dip','walking','oats and fruits'),
(3636,'54','46','dip','walking','oats and fruits'),
(3637,'54','47','dip','walking','oats and fruits'),
(3638,'54','48','dip','walking','oats and fruits'),
(3639,'54','49','dip','walking','oats and fruits'),
(3640,'54','50','dip','walking','oats and fruits'),
(3641,'54','51',' jogging','walking','eggs and almonds'),
(3642,'54','52',' jogging','walking','eggs and almonds'),
(3643,'54','53',' jogging','walking','eggs and almonds'),
(3644,'54','54',' jogging','walking','eggs and almonds'),
(3645,'54','55',' jogging','walking','eggs and almonds'),
(3646,'54','56',' jogging','walking','eggs and almonds'),
(3647,'54','57',' jogging','walking','eggs and almonds'),
(3648,'54','58',' jogging','walking','eggs and almonds'),
(3649,'54','59',' jogging','walking','eggs and almonds'),
(3650,'54','60',' jogging','walking','eggs and almonds'),
(3651,'54','61',' jogging','walking','eggs and almonds'),
(3652,'54','62',' jogging','walking','eggs and almonds'),
(3653,'54','63',' jogging','walking','eggs and almonds'),
(3654,'54','64',' jogging','walking','eggs and almonds'),
(3655,'54','65',' jogging','walking','eggs and almonds'),
(3656,'54','66',' jogging','walking','eggs and almonds'),
(3657,'54','67',' jogging','walking','eggs and almonds'),
(3658,'54','68',' jogging','walking','eggs and almonds'),
(3659,'54','69',' jogging','walking','eggs and almonds'),
(3660,'54','70',' jogging','walking','eggs and almonds'),
(3661,'54','71','cycling','legpress','vegetables and salads'),
(3662,'54','72','cycling','legpress','vegetables and salads'),
(3663,'54','73','cycling','legpress','vegetables and salads'),
(3664,'54','74','cycling','legpress','vegetables and salads'),
(3665,'54','75','cycling','legpress','vegetables and salads'),
(3666,'54','76','cycling','legpress','vegetables and salads'),
(3667,'54','77','cycling','legpress','vegetables and salads'),
(3668,'54','78','cycling','legpress','vegetables and salads'),
(3669,'54','79','cycling','legpress','vegetables and salads'),
(3670,'54','80','cycling','legpress','vegetables and salads'),
(3671,'54','81','cycling','legpress','vegetables and salads'),
(3672,'54','82','cycling','legpress','vegetables and salads'),
(3673,'54','83','cycling','legpress','vegetables and salads'),
(3674,'54','84','cycling','legpress','vegetables and salads'),
(3675,'54','85','cycling','legpress','vegetables and salads'),
(3676,'54','86','cycling','legpress','vegetables and salads'),
(3677,'54','87','cycling','legpress','vegetables and salads'),
(3678,'54','88','cycling','legpress','vegetables and salads'),
(3679,'54','89','cycling','legpress','vegetables and salads'),
(3680,'54','90','cycling','legpress','vegetables and salads'),
(3681,'54','91','cycling','legpress','vegetables and salads'),
(3682,'54','92','cycling','legpress','vegetables and salads'),
(3683,'54','93','cycling','legpress','vegetables and salads'),
(3684,'54','94','cycling','legpress','vegetables and salads'),
(3685,'54','95','cycling','legpress','vegetables and salads'),
(3686,'54','96','cycling','legpress','vegetables and salads'),
(3687,'54','97','cycling','legpress','vegetables and salads'),
(3688,'54','98','cycling','legpress','vegetables and salads'),
(3689,'54','99','cycling','legpress','vegetables and salads'),
(3690,'54','100','cycling','legpress','vegetables and salads'),
(3691,'54','101','tred-mill','walking','fruits and vegetables'),
(3692,'54','102','tred-mill','walking','fruits and vegetables'),
(3693,'54','103','tred-mill','walking','fruits and vegetables'),
(3694,'54','104','tred-mill','walking','fruits and vegetables'),
(3695,'54','105','tred-mill','walking','fruits and vegetables'),
(3696,'54','106','tred-mill','walking','fruits and vegetables'),
(3697,'54','107','tred-mill','walking','fruits and vegetables'),
(3698,'54','108','tred-mill','walking','fruits and vegetables'),
(3699,'54','109','tred-mill','walking','fruits and vegetables'),
(3700,'54','110','tred-mill','walking','fruits and vegetables'),
(3701,'54','111','tred-mill','walking','fruits and vegetables'),
(3702,'54','112','tred-mill','walking','fruits and vegetables'),
(3703,'54','113','tred-mill','walking','fruits and vegetables'),
(3704,'54','114','tred-mill','walking','fruits and vegetables'),
(3705,'54','115','tred-mill','walking','fruits and vegetables'),
(3706,'54','116','tred-mill','walking','fruits and vegetables'),
(3707,'54','117','tred-mill','walking','fruits and vegetables'),
(3708,'54','118','tred-mill','walking','fruits and vegetables'),
(3709,'54','119','tred-mill','walking','fruits and vegetables'),
(3710,'54','120','tred-mill','walking','fruits and vegetables'),
(3711,'54','121','tred-mill','walking','fruits and vegetables'),
(3712,'54','122','tred-mill','walking','fruits and vegetables'),
(3713,'54','123','tred-mill','walking','fruits and vegetables'),
(3714,'54','124','tred-mill','walking','fruits and vegetables'),
(3715,'54','125','tred-mill','walking','fruits and vegetables'),
(3716,'54','126','tred-mill','walking','fruits and vegetables'),
(3717,'54','127','tred-mill','walking','fruits and vegetables'),
(3718,'54','128','tred-mill','walking','fruits and vegetables'),
(3719,'54','129','tred-mill','walking','fruits and vegetables'),
(3720,'54','130','tred-mill','walking','fruits and vegetables'),
(3721,'54','131','tred-mill','walking','fruits and vegetables'),
(3722,'54','132','tred-mill','walking','fruits and vegetables'),
(3723,'54','133','tred-mill','walking','fruits and vegetables'),
(3724,'54','134','tred-mill','walking','fruits and vegetables'),
(3725,'54','135','tred-mill','walking','fruits and vegetables'),
(3726,'54','136','tred-mill','walking','fruits and vegetables'),
(3727,'54','137','tred-mill','walking','fruits and vegetables'),
(3728,'54','138','tred-mill','walking','fruits and vegetables'),
(3729,'54','139','tred-mill','walking','fruits and vegetables'),
(3730,'54','140','tred-mill','walking','fruits and vegetables'),
(3731,'54','141','tred-mill','walking','fruits and vegetables'),
(3732,'54','142','tred-mill','walking','fruits and vegetables'),
(3733,'54','143','tred-mill','walking','fruits and vegetables'),
(3734,'54','144','tred-mill','walking','fruits and vegetables'),
(3735,'54','145','tred-mill','walking','fruits and vegetables'),
(3736,'54','146','tred-mill','walking','fruits and vegetables'),
(3737,'54','147','tred-mill','walking','fruits and vegetables'),
(3738,'54','148','tred-mill','walking','fruits and vegetables'),
(3739,'54','149','tred-mill','walking','fruits and vegetables'),
(3740,'54','150','tred-mill','walking','fruits and vegetables'),
(3741,'55','41','dip','walking','oats and fruits'),
(3742,'55','42','dip','walking','oats and fruits'),
(3743,'55','43','dip','walking','oats and fruits'),
(3744,'55','44','dip','walking','oats and fruits'),
(3745,'55','45','dip','walking','oats and fruits'),
(3746,'55','46','dip','walking','oats and fruits'),
(3747,'55','47','dip','walking','oats and fruits'),
(3748,'55','48','dip','walking','oats and fruits'),
(3749,'55','49','dip','walking','oats and fruits'),
(3750,'55','50','dip','walking','oats and fruits'),
(3751,'55','51',' jogging','walking','eggs and almonds'),
(3752,'55','52',' jogging','walking','eggs and almonds'),
(3753,'55','53',' jogging','walking','eggs and almonds'),
(3754,'55','54',' jogging','walking','eggs and almonds'),
(3755,'55','55',' jogging','walking','eggs and almonds'),
(3756,'55','56',' jogging','walking','eggs and almonds'),
(3757,'55','57',' jogging','walking','eggs and almonds'),
(3758,'55','58',' jogging','walking','eggs and almonds'),
(3759,'55','59',' jogging','walking','eggs and almonds'),
(3760,'55','60',' jogging','walking','eggs and almonds'),
(3761,'55','61',' jogging','walking','eggs and almonds'),
(3762,'55','62',' jogging','walking','eggs and almonds'),
(3763,'55','63',' jogging','walking','eggs and almonds'),
(3764,'55','64',' jogging','walking','eggs and almonds'),
(3765,'55','65',' jogging','walking','eggs and almonds'),
(3766,'55','66',' jogging','walking','eggs and almonds'),
(3767,'55','67',' jogging','walking','eggs and almonds'),
(3768,'55','68',' jogging','walking','eggs and almonds'),
(3769,'55','69',' jogging','walking','eggs and almonds'),
(3770,'55','70',' jogging','walking','eggs and almonds'),
(3771,'55','71','cycling','legpress','vegetables and salads'),
(3772,'55','72','cycling','legpress','vegetables and salads'),
(3773,'55','73','cycling','legpress','vegetables and salads'),
(3774,'55','74','cycling','legpress','vegetables and salads'),
(3775,'55','75','cycling','legpress','vegetables and salads'),
(3776,'55','76','cycling','legpress','vegetables and salads'),
(3777,'55','77','cycling','legpress','vegetables and salads'),
(3778,'55','78','cycling','legpress','vegetables and salads'),
(3779,'55','79','cycling','legpress','vegetables and salads'),
(3780,'55','80','cycling','legpress','vegetables and salads'),
(3781,'55','81','cycling','legpress','vegetables and salads'),
(3782,'55','82','cycling','legpress','vegetables and salads'),
(3783,'55','83','cycling','legpress','vegetables and salads'),
(3784,'55','84','cycling','legpress','vegetables and salads'),
(3785,'55','85','cycling','legpress','vegetables and salads'),
(3786,'55','86','cycling','legpress','vegetables and salads'),
(3787,'55','87','cycling','legpress','vegetables and salads'),
(3788,'55','88','cycling','legpress','vegetables and salads'),
(3789,'55','89','cycling','legpress','vegetables and salads'),
(3790,'55','90','cycling','legpress','vegetables and salads'),
(3791,'55','91','cycling','legpress','vegetables and salads'),
(3792,'55','92','cycling','legpress','vegetables and salads'),
(3793,'55','93','cycling','legpress','vegetables and salads'),
(3794,'55','94','cycling','legpress','vegetables and salads'),
(3795,'55','95','cycling','legpress','vegetables and salads'),
(3796,'55','96','cycling','legpress','vegetables and salads'),
(3797,'55','97','cycling','legpress','vegetables and salads'),
(3798,'55','98','cycling','legpress','vegetables and salads'),
(3799,'55','99','cycling','legpress','vegetables and salads'),
(3800,'55','100','cycling','legpress','vegetables and salads'),
(3801,'55','101','tred-mill','walking','fruits and vegetables'),
(3802,'55','102','tred-mill','walking','fruits and vegetables'),
(3803,'55','103','tred-mill','walking','fruits and vegetables'),
(3804,'55','104','tred-mill','walking','fruits and vegetables'),
(3805,'55','105','tred-mill','walking','fruits and vegetables'),
(3806,'55','106','tred-mill','walking','fruits and vegetables'),
(3807,'55','107','tred-mill','walking','fruits and vegetables'),
(3808,'55','108','tred-mill','walking','fruits and vegetables'),
(3809,'55','109','tred-mill','walking','fruits and vegetables'),
(3810,'55','110','tred-mill','walking','fruits and vegetables'),
(3811,'55','111','tred-mill','walking','fruits and vegetables'),
(3812,'55','112','tred-mill','walking','fruits and vegetables'),
(3813,'55','113','tred-mill','walking','fruits and vegetables'),
(3814,'55','114','tred-mill','walking','fruits and vegetables'),
(3815,'55','115','tred-mill','walking','fruits and vegetables'),
(3816,'55','116','tred-mill','walking','fruits and vegetables'),
(3817,'55','117','tred-mill','walking','fruits and vegetables'),
(3818,'55','118','tred-mill','walking','fruits and vegetables'),
(3819,'55','119','tred-mill','walking','fruits and vegetables'),
(3820,'55','120','tred-mill','walking','fruits and vegetables'),
(3821,'55','121','tred-mill','walking','fruits and vegetables'),
(3822,'55','122','tred-mill','walking','fruits and vegetables'),
(3823,'55','123','tred-mill','walking','fruits and vegetables'),
(3824,'55','124','tred-mill','walking','fruits and vegetables'),
(3825,'55','125','tred-mill','walking','fruits and vegetables'),
(3826,'55','126','tred-mill','walking','fruits and vegetables'),
(3827,'55','127','tred-mill','walking','fruits and vegetables'),
(3828,'55','128','tred-mill','walking','fruits and vegetables'),
(3829,'55','129','tred-mill','walking','fruits and vegetables'),
(3830,'55','130','tred-mill','walking','fruits and vegetables'),
(3831,'55','131','tred-mill','walking','fruits and vegetables'),
(3832,'55','132','tred-mill','walking','fruits and vegetables'),
(3833,'55','133','tred-mill','walking','fruits and vegetables'),
(3834,'55','134','tred-mill','walking','fruits and vegetables'),
(3835,'55','135','tred-mill','walking','fruits and vegetables'),
(3836,'55','136','tred-mill','walking','fruits and vegetables'),
(3837,'55','137','tred-mill','walking','fruits and vegetables'),
(3838,'55','138','tred-mill','walking','fruits and vegetables'),
(3839,'55','139','tred-mill','walking','fruits and vegetables'),
(3840,'55','140','tred-mill','walking','fruits and vegetables'),
(3841,'55','141','tred-mill','walking','fruits and vegetables'),
(3842,'55','142','tred-mill','walking','fruits and vegetables'),
(3843,'55','143','tred-mill','walking','fruits and vegetables'),
(3844,'55','144','tred-mill','walking','fruits and vegetables'),
(3845,'55','145','tred-mill','walking','fruits and vegetables'),
(3846,'55','146','tred-mill','walking','fruits and vegetables'),
(3847,'55','147','tred-mill','walking','fruits and vegetables'),
(3848,'55','148','tred-mill','walking','fruits and vegetables'),
(3849,'55','149','tred-mill','walking','fruits and vegetables'),
(3850,'55','150','tred-mill','walking','fruits and vegetables'),
(3851,'56','41','dip','walking','oats and fruits'),
(3852,'56','42','dip','walking','oats and fruits'),
(3853,'56','43','dip','walking','oats and fruits'),
(3854,'56','44','dip','walking','oats and fruits'),
(3855,'56','45','dip','walking','oats and fruits'),
(3856,'56','46','dip','walking','oats and fruits'),
(3857,'56','47','dip','walking','oats and fruits'),
(3858,'56','48','dip','walking','oats and fruits'),
(3859,'56','49','dip','walking','oats and fruits'),
(3860,'56','50','dip','walking','oats and fruits'),
(3861,'56','51',' jogging','walking','eggs and almonds'),
(3862,'56','52',' jogging','walking','eggs and almonds'),
(3863,'56','53',' jogging','walking','eggs and almonds'),
(3864,'56','54',' jogging','walking','eggs and almonds'),
(3865,'56','55',' jogging','walking','eggs and almonds'),
(3866,'56','56',' jogging','walking','eggs and almonds'),
(3867,'56','57',' jogging','walking','eggs and almonds'),
(3868,'56','58',' jogging','walking','eggs and almonds'),
(3869,'56','59',' jogging','walking','eggs and almonds'),
(3870,'56','60',' jogging','walking','eggs and almonds'),
(3871,'56','61',' jogging','walking','eggs and almonds'),
(3872,'56','62',' jogging','walking','eggs and almonds'),
(3873,'56','63',' jogging','walking','eggs and almonds'),
(3874,'56','64',' jogging','walking','eggs and almonds'),
(3875,'56','65',' jogging','walking','eggs and almonds'),
(3876,'56','66',' jogging','walking','eggs and almonds'),
(3877,'56','67',' jogging','walking','eggs and almonds'),
(3878,'56','68',' jogging','walking','eggs and almonds'),
(3879,'56','69',' jogging','walking','eggs and almonds'),
(3880,'56','70',' jogging','walking','eggs and almonds'),
(3881,'56','71','cycling','legpress','vegetables and salads'),
(3882,'56','72','cycling','legpress','vegetables and salads'),
(3883,'56','73','cycling','legpress','vegetables and salads'),
(3884,'56','74','cycling','legpress','vegetables and salads'),
(3885,'56','75','cycling','legpress','vegetables and salads'),
(3886,'56','76','cycling','legpress','vegetables and salads'),
(3887,'56','77','cycling','legpress','vegetables and salads'),
(3888,'56','78','cycling','legpress','vegetables and salads'),
(3889,'56','79','cycling','legpress','vegetables and salads'),
(3890,'56','80','cycling','legpress','vegetables and salads'),
(3891,'56','81','cycling','legpress','vegetables and salads'),
(3892,'56','82','cycling','legpress','vegetables and salads'),
(3893,'56','83','cycling','legpress','vegetables and salads'),
(3894,'56','84','cycling','legpress','vegetables and salads'),
(3895,'56','85','cycling','legpress','vegetables and salads'),
(3896,'56','86','cycling','legpress','vegetables and salads'),
(3897,'56','87','cycling','legpress','vegetables and salads'),
(3898,'56','88','cycling','legpress','vegetables and salads'),
(3899,'56','89','cycling','legpress','vegetables and salads'),
(3900,'56','90','cycling','legpress','vegetables and salads'),
(3901,'56','91','cycling','legpress','vegetables and salads'),
(3902,'56','92','cycling','legpress','vegetables and salads'),
(3903,'56','93','cycling','legpress','vegetables and salads'),
(3904,'56','94','cycling','legpress','vegetables and salads'),
(3905,'56','95','cycling','legpress','vegetables and salads'),
(3906,'56','96','cycling','legpress','vegetables and salads'),
(3907,'56','97','cycling','legpress','vegetables and salads'),
(3908,'56','98','cycling','legpress','vegetables and salads'),
(3909,'56','99','cycling','legpress','vegetables and salads'),
(3910,'56','100','cycling','legpress','vegetables and salads'),
(3911,'56','101','tred-mill','walking','fruits and vegetables'),
(3912,'56','102','tred-mill','walking','fruits and vegetables'),
(3913,'56','103','tred-mill','walking','fruits and vegetables'),
(3914,'56','104','tred-mill','walking','fruits and vegetables'),
(3915,'56','105','tred-mill','walking','fruits and vegetables'),
(3916,'56','106','tred-mill','walking','fruits and vegetables'),
(3917,'56','107','tred-mill','walking','fruits and vegetables'),
(3918,'56','108','tred-mill','walking','fruits and vegetables'),
(3919,'56','109','tred-mill','walking','fruits and vegetables'),
(3920,'56','110','tred-mill','walking','fruits and vegetables'),
(3921,'56','111','tred-mill','walking','fruits and vegetables'),
(3922,'56','112','tred-mill','walking','fruits and vegetables'),
(3923,'56','113','tred-mill','walking','fruits and vegetables'),
(3924,'56','114','tred-mill','walking','fruits and vegetables'),
(3925,'56','115','tred-mill','walking','fruits and vegetables'),
(3926,'56','116','tred-mill','walking','fruits and vegetables'),
(3927,'56','117','tred-mill','walking','fruits and vegetables'),
(3928,'56','118','tred-mill','walking','fruits and vegetables'),
(3929,'56','119','tred-mill','walking','fruits and vegetables'),
(3930,'56','120','tred-mill','walking','fruits and vegetables'),
(3931,'56','121','tred-mill','walking','fruits and vegetables'),
(3932,'56','122','tred-mill','walking','fruits and vegetables'),
(3933,'56','123','tred-mill','walking','fruits and vegetables'),
(3934,'56','124','tred-mill','walking','fruits and vegetables'),
(3935,'56','125','tred-mill','walking','fruits and vegetables'),
(3936,'56','126','tred-mill','walking','fruits and vegetables'),
(3937,'56','127','tred-mill','walking','fruits and vegetables'),
(3938,'56','128','tred-mill','walking','fruits and vegetables'),
(3939,'56','129','tred-mill','walking','fruits and vegetables'),
(3940,'56','130','tred-mill','walking','fruits and vegetables'),
(3941,'56','131','tred-mill','walking','fruits and vegetables'),
(3942,'56','132','tred-mill','walking','fruits and vegetables'),
(3943,'56','133','tred-mill','walking','fruits and vegetables'),
(3944,'56','134','tred-mill','walking','fruits and vegetables'),
(3945,'56','135','tred-mill','walking','fruits and vegetables'),
(3946,'56','136','tred-mill','walking','fruits and vegetables'),
(3947,'56','137','tred-mill','walking','fruits and vegetables'),
(3948,'56','138','tred-mill','walking','fruits and vegetables'),
(3949,'56','139','tred-mill','walking','fruits and vegetables'),
(3950,'56','140','tred-mill','walking','fruits and vegetables'),
(3951,'56','141','tred-mill','walking','fruits and vegetables'),
(3952,'56','142','tred-mill','walking','fruits and vegetables'),
(3953,'56','143','tred-mill','walking','fruits and vegetables'),
(3954,'56','144','tred-mill','walking','fruits and vegetables'),
(3955,'56','145','tred-mill','walking','fruits and vegetables'),
(3956,'56','146','tred-mill','walking','fruits and vegetables'),
(3957,'56','147','tred-mill','walking','fruits and vegetables'),
(3958,'56','148','tred-mill','walking','fruits and vegetables'),
(3959,'56','149','tred-mill','walking','fruits and vegetables'),
(3960,'56','150','tred-mill','walking','fruits and vegetables'),
(3961,'57','41','dip','walking','oats and fruits'),
(3962,'57','42','dip','walking','oats and fruits'),
(3963,'57','43','dip','walking','oats and fruits'),
(3964,'57','44','dip','walking','oats and fruits'),
(3965,'57','45','dip','walking','oats and fruits'),
(3966,'57','46','dip','walking','oats and fruits'),
(3967,'57','47','dip','walking','oats and fruits'),
(3968,'57','48','dip','walking','oats and fruits'),
(3969,'57','49','dip','walking','oats and fruits'),
(3970,'57','50','dip','walking','oats and fruits'),
(3971,'57','51',' jogging','walking','eggs and almonds'),
(3972,'57','52',' jogging','walking','eggs and almonds'),
(3973,'57','53',' jogging','walking','eggs and almonds'),
(3974,'57','54',' jogging','walking','eggs and almonds'),
(3975,'57','55',' jogging','walking','eggs and almonds'),
(3976,'57','56',' jogging','walking','eggs and almonds'),
(3977,'57','57',' jogging','walking','eggs and almonds'),
(3978,'57','58',' jogging','walking','eggs and almonds'),
(3979,'57','59',' jogging','walking','eggs and almonds'),
(3980,'57','60',' jogging','walking','eggs and almonds'),
(3981,'57','61',' jogging','walking','eggs and almonds'),
(3982,'57','62',' jogging','walking','eggs and almonds'),
(3983,'57','63',' jogging','walking','eggs and almonds'),
(3984,'57','64',' jogging','walking','eggs and almonds'),
(3985,'57','65',' jogging','walking','eggs and almonds'),
(3986,'57','66',' jogging','walking','eggs and almonds'),
(3987,'57','67',' jogging','walking','eggs and almonds'),
(3988,'57','68',' jogging','walking','eggs and almonds'),
(3989,'57','69',' jogging','walking','eggs and almonds'),
(3990,'57','70',' jogging','walking','eggs and almonds'),
(3991,'57','71','cycling','legpress','vegetables and salads'),
(3992,'57','72','cycling','legpress','vegetables and salads'),
(3993,'57','73','cycling','legpress','vegetables and salads'),
(3994,'57','74','cycling','legpress','vegetables and salads'),
(3995,'57','75','cycling','legpress','vegetables and salads'),
(3996,'57','76','cycling','legpress','vegetables and salads'),
(3997,'57','77','cycling','legpress','vegetables and salads'),
(3998,'57','78','cycling','legpress','vegetables and salads'),
(3999,'57','79','cycling','legpress','vegetables and salads'),
(4000,'57','80','cycling','legpress','vegetables and salads'),
(4001,'57','81','cycling','legpress','vegetables and salads'),
(4002,'57','82','cycling','legpress','vegetables and salads'),
(4003,'57','83','cycling','legpress','vegetables and salads'),
(4004,'57','84','cycling','legpress','vegetables and salads'),
(4005,'57','85','cycling','legpress','vegetables and salads'),
(4006,'57','86','cycling','legpress','vegetables and salads'),
(4007,'57','87','cycling','legpress','vegetables and salads'),
(4008,'57','88','cycling','legpress','vegetables and salads'),
(4009,'57','89','cycling','legpress','vegetables and salads'),
(4010,'57','90','cycling','legpress','vegetables and salads'),
(4011,'57','91','cycling','legpress','vegetables and salads'),
(4012,'57','92','cycling','legpress','vegetables and salads'),
(4013,'57','93','cycling','legpress','vegetables and salads'),
(4014,'57','94','cycling','legpress','vegetables and salads'),
(4015,'57','95','cycling','legpress','vegetables and salads'),
(4016,'57','96','cycling','legpress','vegetables and salads'),
(4017,'57','97','cycling','legpress','vegetables and salads'),
(4018,'57','98','cycling','legpress','vegetables and salads'),
(4019,'57','99','cycling','legpress','vegetables and salads'),
(4020,'57','100','cycling','legpress','vegetables and salads'),
(4021,'57','101','tred-mill','walking','fruits and vegetables'),
(4022,'57','102','tred-mill','walking','fruits and vegetables'),
(4023,'57','103','tred-mill','walking','fruits and vegetables'),
(4024,'57','104','tred-mill','walking','fruits and vegetables'),
(4025,'57','105','tred-mill','walking','fruits and vegetables'),
(4026,'57','106','tred-mill','walking','fruits and vegetables'),
(4027,'57','107','tred-mill','walking','fruits and vegetables'),
(4028,'57','108','tred-mill','walking','fruits and vegetables'),
(4029,'57','109','tred-mill','walking','fruits and vegetables'),
(4030,'57','110','tred-mill','walking','fruits and vegetables'),
(4031,'57','111','tred-mill','walking','fruits and vegetables'),
(4032,'57','112','tred-mill','walking','fruits and vegetables'),
(4033,'57','113','tred-mill','walking','fruits and vegetables'),
(4034,'57','114','tred-mill','walking','fruits and vegetables'),
(4035,'57','115','tred-mill','walking','fruits and vegetables'),
(4036,'57','116','tred-mill','walking','fruits and vegetables'),
(4037,'57','117','tred-mill','walking','fruits and vegetables'),
(4038,'57','118','tred-mill','walking','fruits and vegetables'),
(4039,'57','119','tred-mill','walking','fruits and vegetables'),
(4040,'57','120','tred-mill','walking','fruits and vegetables'),
(4041,'57','121','tred-mill','walking','fruits and vegetables'),
(4042,'57','122','tred-mill','walking','fruits and vegetables'),
(4043,'57','123','tred-mill','walking','fruits and vegetables'),
(4044,'57','124','tred-mill','walking','fruits and vegetables'),
(4045,'57','125','tred-mill','walking','fruits and vegetables'),
(4046,'57','126','tred-mill','walking','fruits and vegetables'),
(4047,'57','127','tred-mill','walking','fruits and vegetables'),
(4048,'57','128','tred-mill','walking','fruits and vegetables'),
(4049,'57','129','tred-mill','walking','fruits and vegetables'),
(4050,'57','130','tred-mill','walking','fruits and vegetables'),
(4051,'57','131','tred-mill','walking','fruits and vegetables'),
(4052,'57','132','tred-mill','walking','fruits and vegetables'),
(4053,'57','133','tred-mill','walking','fruits and vegetables'),
(4054,'57','134','tred-mill','walking','fruits and vegetables'),
(4055,'57','135','tred-mill','walking','fruits and vegetables'),
(4056,'57','136','tred-mill','walking','fruits and vegetables'),
(4057,'57','137','tred-mill','walking','fruits and vegetables'),
(4058,'57','138','tred-mill','walking','fruits and vegetables'),
(4059,'57','139','tred-mill','walking','fruits and vegetables'),
(4060,'57','140','tred-mill','walking','fruits and vegetables'),
(4061,'57','141','tred-mill','walking','fruits and vegetables'),
(4062,'57','142','tred-mill','walking','fruits and vegetables'),
(4063,'57','143','tred-mill','walking','fruits and vegetables'),
(4064,'57','144','tred-mill','walking','fruits and vegetables'),
(4065,'57','145','tred-mill','walking','fruits and vegetables'),
(4066,'57','146','tred-mill','walking','fruits and vegetables'),
(4067,'57','147','tred-mill','walking','fruits and vegetables'),
(4068,'57','148','tred-mill','walking','fruits and vegetables'),
(4069,'57','149','tred-mill','walking','fruits and vegetables'),
(4070,'57','150','tred-mill','walking','fruits and vegetables'),
(4071,'58','41','dip','walking','oats and fruits'),
(4072,'58','42','dip','walking','oats and fruits'),
(4073,'58','43','dip','walking','oats and fruits'),
(4074,'58','44','dip','walking','oats and fruits'),
(4075,'58','45','dip','walking','oats and fruits'),
(4076,'58','46','dip','walking','oats and fruits'),
(4077,'58','47','dip','walking','oats and fruits'),
(4078,'58','48','dip','walking','oats and fruits'),
(4079,'58','49','dip','walking','oats and fruits'),
(4080,'58','50','dip','walking','oats and fruits'),
(4081,'58','51',' jogging','walking','eggs and almonds'),
(4082,'58','52',' jogging','walking','eggs and almonds'),
(4083,'58','53',' jogging','walking','eggs and almonds'),
(4084,'58','54',' jogging','walking','eggs and almonds'),
(4085,'58','55',' jogging','walking','eggs and almonds'),
(4086,'58','56',' jogging','walking','eggs and almonds'),
(4087,'58','57',' jogging','walking','eggs and almonds'),
(4088,'58','58',' jogging','walking','eggs and almonds'),
(4089,'58','59',' jogging','walking','eggs and almonds'),
(4090,'58','60',' jogging','walking','eggs and almonds'),
(4091,'58','61',' jogging','walking','eggs and almonds'),
(4092,'58','62',' jogging','walking','eggs and almonds'),
(4093,'58','63',' jogging','walking','eggs and almonds'),
(4094,'58','64',' jogging','walking','eggs and almonds'),
(4095,'58','65',' jogging','walking','eggs and almonds'),
(4096,'58','66',' jogging','walking','eggs and almonds'),
(4097,'58','67',' jogging','walking','eggs and almonds'),
(4098,'58','68',' jogging','walking','eggs and almonds'),
(4099,'58','69',' jogging','walking','eggs and almonds'),
(4100,'58','70',' jogging','walking','eggs and almonds'),
(4101,'58','71','cycling','legpress','vegetables and salads'),
(4102,'58','72','cycling','legpress','vegetables and salads'),
(4103,'58','73','cycling','legpress','vegetables and salads'),
(4104,'58','74','cycling','legpress','vegetables and salads'),
(4105,'58','75','cycling','legpress','vegetables and salads'),
(4106,'58','76','cycling','legpress','vegetables and salads'),
(4107,'58','77','cycling','legpress','vegetables and salads'),
(4108,'58','78','cycling','legpress','vegetables and salads'),
(4109,'58','79','cycling','legpress','vegetables and salads'),
(4110,'58','80','cycling','legpress','vegetables and salads'),
(4111,'58','81','cycling','legpress','vegetables and salads'),
(4112,'58','82','cycling','legpress','vegetables and salads'),
(4113,'58','83','cycling','legpress','vegetables and salads'),
(4114,'58','84','cycling','legpress','vegetables and salads'),
(4115,'58','85','cycling','legpress','vegetables and salads'),
(4116,'58','86','cycling','legpress','vegetables and salads'),
(4117,'58','87','cycling','legpress','vegetables and salads'),
(4118,'58','88','cycling','legpress','vegetables and salads'),
(4119,'58','89','cycling','legpress','vegetables and salads'),
(4120,'58','90','cycling','legpress','vegetables and salads'),
(4121,'58','91','cycling','legpress','vegetables and salads'),
(4122,'58','92','cycling','legpress','vegetables and salads'),
(4123,'58','93','cycling','legpress','vegetables and salads'),
(4124,'58','94','cycling','legpress','vegetables and salads'),
(4125,'58','95','cycling','legpress','vegetables and salads'),
(4126,'58','96','cycling','legpress','vegetables and salads'),
(4127,'58','97','cycling','legpress','vegetables and salads'),
(4128,'58','98','cycling','legpress','vegetables and salads'),
(4129,'58','99','cycling','legpress','vegetables and salads'),
(4130,'58','100','cycling','legpress','vegetables and salads'),
(4131,'58','101','tred-mill','walking','fruits and vegetables'),
(4132,'58','102','tred-mill','walking','fruits and vegetables'),
(4133,'58','103','tred-mill','walking','fruits and vegetables'),
(4134,'58','104','tred-mill','walking','fruits and vegetables'),
(4135,'58','105','tred-mill','walking','fruits and vegetables'),
(4136,'58','106','tred-mill','walking','fruits and vegetables'),
(4137,'58','107','tred-mill','walking','fruits and vegetables'),
(4138,'58','108','tred-mill','walking','fruits and vegetables'),
(4139,'58','109','tred-mill','walking','fruits and vegetables'),
(4140,'58','110','tred-mill','walking','fruits and vegetables'),
(4141,'58','111','tred-mill','walking','fruits and vegetables'),
(4142,'58','112','tred-mill','walking','fruits and vegetables'),
(4143,'58','113','tred-mill','walking','fruits and vegetables'),
(4144,'58','114','tred-mill','walking','fruits and vegetables'),
(4145,'58','115','tred-mill','walking','fruits and vegetables'),
(4146,'58','116','tred-mill','walking','fruits and vegetables'),
(4147,'58','117','tred-mill','walking','fruits and vegetables'),
(4148,'58','118','tred-mill','walking','fruits and vegetables'),
(4149,'58','119','tred-mill','walking','fruits and vegetables'),
(4150,'58','120','tred-mill','walking','fruits and vegetables'),
(4151,'58','121','tred-mill','walking','fruits and vegetables'),
(4152,'58','122','tred-mill','walking','fruits and vegetables'),
(4153,'58','123','tred-mill','walking','fruits and vegetables'),
(4154,'58','124','tred-mill','walking','fruits and vegetables'),
(4155,'58','125','tred-mill','walking','fruits and vegetables'),
(4156,'58','126','tred-mill','walking','fruits and vegetables'),
(4157,'58','127','tred-mill','walking','fruits and vegetables'),
(4158,'58','128','tred-mill','walking','fruits and vegetables'),
(4159,'58','129','tred-mill','walking','fruits and vegetables'),
(4160,'58','130','tred-mill','walking','fruits and vegetables'),
(4161,'58','131','tred-mill','walking','fruits and vegetables'),
(4162,'58','132','tred-mill','walking','fruits and vegetables'),
(4163,'58','133','tred-mill','walking','fruits and vegetables'),
(4164,'58','134','tred-mill','walking','fruits and vegetables'),
(4165,'58','135','tred-mill','walking','fruits and vegetables'),
(4166,'58','136','tred-mill','walking','fruits and vegetables'),
(4167,'58','137','tred-mill','walking','fruits and vegetables'),
(4168,'58','138','tred-mill','walking','fruits and vegetables'),
(4169,'58','139','tred-mill','walking','fruits and vegetables'),
(4170,'58','140','tred-mill','walking','fruits and vegetables'),
(4171,'58','141','tred-mill','walking','fruits and vegetables'),
(4172,'58','142','tred-mill','walking','fruits and vegetables'),
(4173,'58','143','tred-mill','walking','fruits and vegetables'),
(4174,'58','144','tred-mill','walking','fruits and vegetables'),
(4175,'58','145','tred-mill','walking','fruits and vegetables'),
(4176,'58','146','tred-mill','walking','fruits and vegetables'),
(4177,'58','147','tred-mill','walking','fruits and vegetables'),
(4178,'58','148','tred-mill','walking','fruits and vegetables'),
(4179,'58','149','tred-mill','walking','fruits and vegetables'),
(4180,'58','150','tred-mill','walking','fruits and vegetables'),
(4181,'59','41','dip','walking','oats and fruits'),
(4182,'59','42','dip','walking','oats and fruits'),
(4183,'59','43','dip','walking','oats and fruits'),
(4184,'59','44','dip','walking','oats and fruits'),
(4185,'59','45','dip','walking','oats and fruits'),
(4186,'59','46','dip','walking','oats and fruits'),
(4187,'59','47','dip','walking','oats and fruits'),
(4188,'59','48','dip','walking','oats and fruits'),
(4189,'59','49','dip','walking','oats and fruits'),
(4190,'59','50','dip','walking','oats and fruits'),
(4191,'59','51',' jogging','walking','eggs and almonds'),
(4192,'59','52',' jogging','walking','eggs and almonds'),
(4193,'59','53',' jogging','walking','eggs and almonds'),
(4194,'59','54',' jogging','walking','eggs and almonds'),
(4195,'59','55',' jogging','walking','eggs and almonds'),
(4196,'59','56',' jogging','walking','eggs and almonds'),
(4197,'59','57',' jogging','walking','eggs and almonds'),
(4198,'59','58',' jogging','walking','eggs and almonds'),
(4199,'59','59',' jogging','walking','eggs and almonds'),
(4200,'59','60',' jogging','walking','eggs and almonds'),
(4201,'59','61',' jogging','walking','eggs and almonds'),
(4202,'59','62',' jogging','walking','eggs and almonds'),
(4203,'59','63',' jogging','walking','eggs and almonds'),
(4204,'59','64',' jogging','walking','eggs and almonds'),
(4205,'59','65',' jogging','walking','eggs and almonds'),
(4206,'59','66',' jogging','walking','eggs and almonds'),
(4207,'59','67',' jogging','walking','eggs and almonds'),
(4208,'59','68',' jogging','walking','eggs and almonds'),
(4209,'59','69',' jogging','walking','eggs and almonds'),
(4210,'59','70',' jogging','walking','eggs and almonds'),
(4211,'59','71','cycling','legpress','vegetables and salads'),
(4212,'59','72','cycling','legpress','vegetables and salads'),
(4213,'59','73','cycling','legpress','vegetables and salads'),
(4214,'59','74','cycling','legpress','vegetables and salads'),
(4215,'59','75','cycling','legpress','vegetables and salads'),
(4216,'59','76','cycling','legpress','vegetables and salads'),
(4217,'59','77','cycling','legpress','vegetables and salads'),
(4218,'59','78','cycling','legpress','vegetables and salads'),
(4219,'59','79','cycling','legpress','vegetables and salads'),
(4220,'59','80','cycling','legpress','vegetables and salads'),
(4221,'59','81','cycling','legpress','vegetables and salads'),
(4222,'59','82','cycling','legpress','vegetables and salads'),
(4223,'59','83','cycling','legpress','vegetables and salads'),
(4224,'59','84','cycling','legpress','vegetables and salads'),
(4225,'59','85','cycling','legpress','vegetables and salads'),
(4226,'59','86','cycling','legpress','vegetables and salads'),
(4227,'59','87','cycling','legpress','vegetables and salads'),
(4228,'59','88','cycling','legpress','vegetables and salads'),
(4229,'59','89','cycling','legpress','vegetables and salads'),
(4230,'59','90','cycling','legpress','vegetables and salads'),
(4231,'59','91','cycling','legpress','vegetables and salads'),
(4232,'59','92','cycling','legpress','vegetables and salads'),
(4233,'59','93','cycling','legpress','vegetables and salads'),
(4234,'59','94','cycling','legpress','vegetables and salads'),
(4235,'59','95','cycling','legpress','vegetables and salads'),
(4236,'59','96','cycling','legpress','vegetables and salads'),
(4237,'59','97','cycling','legpress','vegetables and salads'),
(4238,'59','98','cycling','legpress','vegetables and salads'),
(4239,'59','99','cycling','legpress','vegetables and salads'),
(4240,'59','100','cycling','legpress','vegetables and salads'),
(4241,'59','101','tred-mill','walking','fruits and vegetables'),
(4242,'59','102','tred-mill','walking','fruits and vegetables'),
(4243,'59','103','tred-mill','walking','fruits and vegetables'),
(4244,'59','104','tred-mill','walking','fruits and vegetables'),
(4245,'59','105','tred-mill','walking','fruits and vegetables'),
(4246,'59','106','tred-mill','walking','fruits and vegetables'),
(4247,'59','107','tred-mill','walking','fruits and vegetables'),
(4248,'59','108','tred-mill','walking','fruits and vegetables'),
(4249,'59','109','tred-mill','walking','fruits and vegetables'),
(4250,'59','110','tred-mill','walking','fruits and vegetables'),
(4251,'59','111','tred-mill','walking','fruits and vegetables'),
(4252,'59','112','tred-mill','walking','fruits and vegetables'),
(4253,'59','113','tred-mill','walking','fruits and vegetables'),
(4254,'59','114','tred-mill','walking','fruits and vegetables'),
(4255,'59','115','tred-mill','walking','fruits and vegetables'),
(4256,'59','116','tred-mill','walking','fruits and vegetables'),
(4257,'59','117','tred-mill','walking','fruits and vegetables'),
(4258,'59','118','tred-mill','walking','fruits and vegetables'),
(4259,'59','119','tred-mill','walking','fruits and vegetables'),
(4260,'59','120','tred-mill','walking','fruits and vegetables'),
(4261,'59','121','tred-mill','walking','fruits and vegetables'),
(4262,'59','122','tred-mill','walking','fruits and vegetables'),
(4263,'59','123','tred-mill','walking','fruits and vegetables'),
(4264,'59','124','tred-mill','walking','fruits and vegetables'),
(4265,'59','125','tred-mill','walking','fruits and vegetables'),
(4266,'59','126','tred-mill','walking','fruits and vegetables'),
(4267,'59','127','tred-mill','walking','fruits and vegetables'),
(4268,'59','128','tred-mill','walking','fruits and vegetables'),
(4269,'59','129','tred-mill','walking','fruits and vegetables'),
(4270,'59','130','tred-mill','walking','fruits and vegetables'),
(4271,'59','131','tred-mill','walking','fruits and vegetables'),
(4272,'59','132','tred-mill','walking','fruits and vegetables'),
(4273,'59','133','tred-mill','walking','fruits and vegetables'),
(4274,'59','134','tred-mill','walking','fruits and vegetables'),
(4275,'59','135','tred-mill','walking','fruits and vegetables'),
(4276,'59','136','tred-mill','walking','fruits and vegetables'),
(4277,'59','137','tred-mill','walking','fruits and vegetables'),
(4278,'59','138','tred-mill','walking','fruits and vegetables'),
(4279,'59','139','tred-mill','walking','fruits and vegetables'),
(4280,'59','140','tred-mill','walking','fruits and vegetables'),
(4281,'59','141','tred-mill','walking','fruits and vegetables'),
(4282,'59','142','tred-mill','walking','fruits and vegetables'),
(4283,'59','143','tred-mill','walking','fruits and vegetables'),
(4284,'59','144','tred-mill','walking','fruits and vegetables'),
(4285,'59','145','tred-mill','walking','fruits and vegetables'),
(4286,'59','146','tred-mill','walking','fruits and vegetables'),
(4287,'59','147','tred-mill','walking','fruits and vegetables'),
(4288,'59','148','tred-mill','walking','fruits and vegetables'),
(4289,'59','149','tred-mill','walking','fruits and vegetables'),
(4290,'59','150','tred-mill','walking','fruits and vegetables'),
(4291,'60','41','dip','walking','oats and fruits'),
(4292,'60','42','dip','walking','oats and fruits'),
(4293,'60','43','dip','walking','oats and fruits'),
(4294,'60','44','dip','walking','oats and fruits'),
(4295,'60','45','dip','walking','oats and fruits'),
(4296,'60','46','dip','walking','oats and fruits'),
(4297,'60','47','dip','walking','oats and fruits'),
(4298,'60','48','dip','walking','oats and fruits'),
(4299,'60','49','dip','walking','oats and fruits'),
(4300,'60','50','dip','walking','oats and fruits'),
(4301,'60','51',' jogging','walking','eggs and almonds'),
(4302,'60','52',' jogging','walking','eggs and almonds'),
(4303,'60','53',' jogging','walking','eggs and almonds'),
(4304,'60','54',' jogging','walking','eggs and almonds'),
(4305,'60','55',' jogging','walking','eggs and almonds'),
(4306,'60','56',' jogging','walking','eggs and almonds'),
(4307,'60','57',' jogging','walking','eggs and almonds'),
(4308,'60','58',' jogging','walking','eggs and almonds'),
(4309,'60','59',' jogging','walking','eggs and almonds'),
(4310,'60','60',' jogging','walking','eggs and almonds'),
(4311,'60','61',' jogging','walking','eggs and almonds'),
(4312,'60','62',' jogging','walking','eggs and almonds'),
(4313,'60','63',' jogging','walking','eggs and almonds'),
(4314,'60','64',' jogging','walking','eggs and almonds'),
(4315,'60','65',' jogging','walking','eggs and almonds'),
(4316,'60','66',' jogging','walking','eggs and almonds'),
(4317,'60','67',' jogging','walking','eggs and almonds'),
(4318,'60','68',' jogging','walking','eggs and almonds'),
(4319,'60','69',' jogging','walking','eggs and almonds'),
(4320,'60','70',' jogging','walking','eggs and almonds'),
(4321,'60','71','cycling','legpress','vegetables and salads'),
(4322,'60','72','cycling','legpress','vegetables and salads'),
(4323,'60','73','cycling','legpress','vegetables and salads'),
(4324,'60','74','cycling','legpress','vegetables and salads'),
(4325,'60','75','cycling','legpress','vegetables and salads'),
(4326,'60','76','cycling','legpress','vegetables and salads'),
(4327,'60','77','cycling','legpress','vegetables and salads'),
(4328,'60','78','cycling','legpress','vegetables and salads'),
(4329,'60','79','cycling','legpress','vegetables and salads'),
(4330,'60','80','cycling','legpress','vegetables and salads'),
(4331,'60','81','cycling','legpress','vegetables and salads'),
(4332,'60','82','cycling','legpress','vegetables and salads'),
(4333,'60','83','cycling','legpress','vegetables and salads'),
(4334,'60','84','cycling','legpress','vegetables and salads'),
(4335,'60','85','cycling','legpress','vegetables and salads'),
(4336,'60','86','cycling','legpress','vegetables and salads'),
(4337,'60','87','cycling','legpress','vegetables and salads'),
(4338,'60','88','cycling','legpress','vegetables and salads'),
(4339,'60','89','cycling','legpress','vegetables and salads'),
(4340,'60','90','cycling','legpress','vegetables and salads'),
(4341,'60','91','cycling','legpress','vegetables and salads'),
(4342,'60','92','cycling','legpress','vegetables and salads'),
(4343,'60','93','cycling','legpress','vegetables and salads'),
(4344,'60','94','cycling','legpress','vegetables and salads'),
(4345,'60','95','cycling','legpress','vegetables and salads'),
(4346,'60','96','cycling','legpress','vegetables and salads'),
(4347,'60','97','cycling','legpress','vegetables and salads'),
(4348,'60','98','cycling','legpress','vegetables and salads'),
(4349,'60','99','cycling','legpress','vegetables and salads'),
(4350,'60','100','cycling','legpress','vegetables and salads'),
(4351,'60','101','tred-mill','walking','fruits and vegetables'),
(4352,'60','102','tred-mill','walking','fruits and vegetables'),
(4353,'60','103','tred-mill','walking','fruits and vegetables'),
(4354,'60','104','tred-mill','walking','fruits and vegetables'),
(4355,'60','105','tred-mill','walking','fruits and vegetables'),
(4356,'60','106','tred-mill','walking','fruits and vegetables'),
(4357,'60','107','tred-mill','walking','fruits and vegetables'),
(4358,'60','108','tred-mill','walking','fruits and vegetables'),
(4359,'60','109','tred-mill','walking','fruits and vegetables'),
(4360,'60','110','tred-mill','walking','fruits and vegetables'),
(4361,'60','111','tred-mill','walking','fruits and vegetables'),
(4362,'60','112','tred-mill','walking','fruits and vegetables'),
(4363,'60','113','tred-mill','walking','fruits and vegetables'),
(4364,'60','114','tred-mill','walking','fruits and vegetables'),
(4365,'60','115','tred-mill','walking','fruits and vegetables'),
(4366,'60','116','tred-mill','walking','fruits and vegetables'),
(4367,'60','117','tred-mill','walking','fruits and vegetables'),
(4368,'60','118','tred-mill','walking','fruits and vegetables'),
(4369,'60','119','tred-mill','walking','fruits and vegetables'),
(4370,'60','120','tred-mill','walking','fruits and vegetables'),
(4371,'60','121','tred-mill','walking','fruits and vegetables'),
(4372,'60','122','tred-mill','walking','fruits and vegetables'),
(4373,'60','123','tred-mill','walking','fruits and vegetables'),
(4374,'60','124','tred-mill','walking','fruits and vegetables'),
(4375,'60','125','tred-mill','walking','fruits and vegetables'),
(4376,'60','126','tred-mill','walking','fruits and vegetables'),
(4377,'60','127','tred-mill','walking','fruits and vegetables'),
(4378,'60','128','tred-mill','walking','fruits and vegetables'),
(4379,'60','129','tred-mill','walking','fruits and vegetables'),
(4380,'60','130','tred-mill','walking','fruits and vegetables'),
(4381,'60','131','tred-mill','walking','fruits and vegetables'),
(4382,'60','132','tred-mill','walking','fruits and vegetables'),
(4383,'60','133','tred-mill','walking','fruits and vegetables'),
(4384,'60','134','tred-mill','walking','fruits and vegetables'),
(4385,'60','135','tred-mill','walking','fruits and vegetables'),
(4386,'60','136','tred-mill','walking','fruits and vegetables'),
(4387,'60','137','tred-mill','walking','fruits and vegetables'),
(4388,'60','138','tred-mill','walking','fruits and vegetables'),
(4389,'60','139','tred-mill','walking','fruits and vegetables'),
(4390,'60','140','tred-mill','walking','fruits and vegetables'),
(4391,'60','141','tred-mill','walking','fruits and vegetables'),
(4392,'60','142','tred-mill','walking','fruits and vegetables'),
(4393,'60','143','tred-mill','walking','fruits and vegetables'),
(4394,'60','144','tred-mill','walking','fruits and vegetables'),
(4395,'60','145','tred-mill','walking','fruits and vegetables'),
(4396,'60','146','tred-mill','walking','fruits and vegetables'),
(4397,'60','147','tred-mill','walking','fruits and vegetables'),
(4398,'60','148','tred-mill','walking','fruits and vegetables'),
(4399,'60','149','tred-mill','walking','fruits and vegetables'),
(4400,'60','150','tred-mill','walking','fruits and vegetables');

/*Table structure for table `simple_upload` */

DROP TABLE IF EXISTS `simple_upload`;

CREATE TABLE `simple_upload` (
  `id` int(11) NOT NULL auto_increment,
  `filename` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `simple_upload` */

/*Table structure for table `simple_userregistrationmodel` */

DROP TABLE IF EXISTS `simple_userregistrationmodel`;

CREATE TABLE `simple_userregistrationmodel` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `loginid` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `age` varchar(100) NOT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `authkey` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `simple_userregistrationmodel` */

insert into `simple_userregistrationmodel` values 

(1,'alex','alex','alex','male','34','167','66','lx160cm@gmail.com','9849099492','81572830','activated');
