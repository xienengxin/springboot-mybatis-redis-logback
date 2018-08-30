/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.25a : Database - sportshoes
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sportshoes` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sportshoes`;

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `state` smallint(6) DEFAULT NULL,
  `ordertime` varchar(20) DEFAULT NULL,
  `arrivetime` varchar(20) DEFAULT NULL,
  `shoes_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`user_id`,`state`,`ordertime`,`arrivetime`,`shoes_id`,`price`,`size`,`num`) values (1,3,0,'2018-17-05 17:17:38',NULL,3,439,'38',1),(2,3,0,'2018-20-05 17:20:50',NULL,2,389,'38',1),(3,3,0,'2018-25-05 17:25:41',NULL,2,389,'38',1),(4,3,0,'2018-29-05 17:29:11',NULL,2,389,'38',1),(5,3,0,'2018-31-05 17:31:06',NULL,2,389,'38',1),(6,3,0,'2018-34-05 17:34:35',NULL,0,0,NULL,0),(7,3,0,'2018-34-05 17:34:35',NULL,3,1756,'38',2),(8,3,0,'2018-34-05 17:34:35',NULL,2,389,'38',1),(9,3,0,'2018-43-05 17:43:28',NULL,2,389,'38',1),(10,3,0,'2018-43-05 17:43:28',NULL,1,203,'38',1),(11,3,0,'2018-44-05 17:44:04',NULL,2,389,'38',1),(12,3,0,'2018-44-05 17:44:04',NULL,3,1756,'38',2),(13,3,0,'2018-45-05 17:45:42',NULL,3,439,'38',1),(14,3,0,'2018-45-05 17:45:42',NULL,2,1556,'38',2),(15,3,0,'2018-08-05 22:01:59',NULL,2,389,'38',1),(16,3,0,'2018-08-05 22:03:50',NULL,2,389,'38',1),(17,3,0,'2018-08-05 22:04:32',NULL,2,389,'38',1),(18,3,0,'2018-08-05 22:05:55',NULL,3,439,'38',1),(19,3,0,'2018-08-05 22:05:55',NULL,1,406,'38',2),(20,3,0,'2018-08-05 22:17:36',NULL,2,389,'38',1),(21,3,0,'2018-08-05 22:17:36',NULL,3,439,'38',1),(22,3,0,'2018-08-05 22:18:55',NULL,2,389,'38',1),(23,3,0,'2018-08-05 22:20:18',NULL,3,439,'38',1),(24,3,0,'2018-08-05 22:21:27',NULL,2,389,'38',1),(25,3,0,'2018-08-05 22:22:32',NULL,3,439,'38',1),(26,3,0,'2018-08-05 22:26:26',NULL,3,439,'38',1),(27,3,0,'2018-08-05 22:27:19',NULL,2,389,'38',1),(28,3,0,'2018-08-05 22:27:19',NULL,3,439,'38',1),(29,3,0,'2018-08-05 22:36:16',NULL,3,439,'38',1),(30,3,0,'2018-08-05 22:37:19',NULL,2,389,'38',1),(31,3,0,'2018-08-05 22:51:55',NULL,3,439,'38',1),(32,3,0,'2018-08-05 22:54:26',NULL,2,389,'38',1),(33,3,0,'2018-08-05 22:55:56',NULL,2,389,'38',1),(34,3,0,'2018-08-05 22:58:25',NULL,3,439,'38',1),(35,3,0,'2018-08-05 22:59:46',NULL,1,203,'38',1),(36,3,0,'2018-08-05 23:00:50',NULL,2,389,'38',1),(37,3,0,'2018-08-05 23:05:24',NULL,2,389,'38',1),(38,3,0,'2018-08-05 23:08:52',NULL,2,389,'38',1),(39,3,0,'2018-08-05 23:59:39',NULL,3,439,'38',1),(40,3,0,'2018-08-06 09:03:38',NULL,3,878,'38',2),(41,3,0,'2018-08-06 09:04:30',NULL,2,389,'38',1),(42,3,0,'2018-08-06 09:05:10',NULL,2,389,'38',1),(43,3,0,'2018-08-06 09:05:22',NULL,2,389,'38',1),(44,3,0,'2018-08-06 09:07:18',NULL,2,389,'38',1),(45,3,0,'2018-08-06 09:07:28',NULL,2,389,'38',1),(46,3,0,'2018-08-06 09:07:31',NULL,2,389,'38',1),(47,3,0,'2018-08-06 09:07:32',NULL,2,389,'38',1),(48,3,0,'2018-08-06 09:07:34',NULL,2,389,'38',1),(49,3,0,'2018-08-06 09:08:29',NULL,2,389,'38',1),(50,3,0,'2018-08-06 09:08:54',NULL,2,389,'38',1),(51,3,0,'2018-08-06 09:13:49',NULL,2,389,'38',1),(52,3,0,'2018-08-06 09:14:04',NULL,2,389,'38',1),(53,3,0,'2018-08-06 09:14:19',NULL,3,439,'38',1),(54,3,0,'2018-08-06 09:24:29',NULL,1,203,'38',1),(55,3,0,'2018-08-06 09:27:20',NULL,2,389,'38',1),(56,3,0,'2018-08-06 09:27:39',NULL,2,389,'38',1),(57,3,0,'2018-08-06 09:27:59',NULL,2,389,'38',1),(58,3,0,'2018-08-06 09:28:03',NULL,2,389,'38',1),(59,3,0,'2018-08-06 09:29:05',NULL,2,389,'38',1),(60,3,0,'2018-08-06 09:29:18',NULL,2,389,'38',1),(61,3,0,'2018-08-06 09:30:45',NULL,2,389,'38',1),(62,3,0,'2018-08-06 09:34:17',NULL,3,439,'38',1),(63,3,0,'2018-08-06 09:36:43',NULL,2,389,'38',1),(64,3,0,'2018-08-06 09:38:22',NULL,2,389,'38',1),(65,3,0,'2018-08-06 09:38:29',NULL,2,389,'38',1),(66,3,0,'2018-08-06 09:39:07',NULL,2,389,'38',1),(67,3,0,'2018-08-06 09:39:42',NULL,2,389,'38',1),(68,3,0,'2018-08-06 09:41:50',NULL,2,389,'38',1),(69,3,0,'2018-08-06 09:41:57',NULL,2,389,'38',1),(70,3,0,'2018-08-06 09:43:21',NULL,2,389,'38',1),(71,3,0,'2018-08-06 09:43:28',NULL,2,389,'38',1),(72,3,0,'2018-08-06 09:45:13',NULL,2,389,'38',1),(73,3,0,'2018-08-06 09:46:09',NULL,2,389,'38',1),(74,3,0,'2018-08-06 09:47:14',NULL,2,389,'38',1),(75,3,0,'2018-08-06 09:47:32',NULL,2,389,'38',1),(76,3,0,'2018-08-06 09:47:41',NULL,2,389,'38',1),(77,3,0,'2018-08-06 09:49:55',NULL,2,389,'38',1);

/*Table structure for table `shoes` */

DROP TABLE IF EXISTS `shoes`;

CREATE TABLE `shoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `shoes` */

insert  into `shoes`(`id`,`title`,`subtitle`,`type`,`subtype`,`price`,`brand`,`details`,`pic`,`stock`) values (1,'李宁休闲鞋',NULL,'男士','休闲鞋',203,'LINING',NULL,'1-1.jpg,1-2.jpg,1-3.jpg,1-4.jpg',100),(2,'耐克跑步鞋','','男士','跑步鞋',389,'NIKE',NULL,'3-1.jpg,3-2.jpg,3-3.jpg,3-4.jpg',100),(3,'斯凯奇休闲鞋',NULL,'男士','休闲鞋',439,'斯凯奇',NULL,'8-1.jpg,8-2.jpg,8-3.jpg,8-4.jpg',100),(6,'NIKE耐克女鞋跑步鞋2017夏季revolution3','网面透气运动鞋819303','女士','跑步鞋',299,'NIKE','123','19-1.jpg,19-2.jpg,19-3.jpg,19-4.jpg',100),(7,'NIKE耐克男鞋2017新款TANJUN透气网面运动鞋','休闲情侣跑步鞋812654','男士','休闲鞋',379,'NIKE','','5-1.jpg,5-2.jpg,5-3.jpg,5-4.jpg',100),(8,'NIKE耐克女鞋2017新款TANJUN透气网面运动鞋','休闲情侣跑步鞋812654','女士\r\n','休闲鞋\r\n',399,'NIKE\r\n',NULL,'6-1.jpg,6-2.jpg,6-3.jpg,6-4.jpg',100),(9,'NIKE耐克2017春夏新款男鞋Jordan','JORDAN系列篮球鞋运动鞋854551-002','男士\r\n','篮球鞋\r\n',699,'NIKE\r\n',NULL,'7-1.jpg,7-2.jpg,7-3.jpg,7-4.jpg\r\n',100),(10,'Nike耐克女鞋板鞋2017新款AIR MAX 90','缓震透气运动休闲鞋325213','女士','网球鞋',529,'NIKE\r\n',NULL,'8-1.jpg,8-2.jpg,8-3.jpg,8-4.jpg',100),(11,'NIKE耐克男鞋足球鞋2018新款TF碎钉传奇7','足球运动鞋AH7243','男士','足球鞋\r\n',429,'NIKE\r\n',NULL,'9-1.jpg,9-2.jpg,9-3.jpg,9-4.jpg\r\n',100),(12,'adidas阿迪达斯NEO男鞋郑恺同款休闲板鞋','2017年新款运动鞋AW3916','女士','休闲鞋',379,'adidas\r\n',NULL,'10-1.jpg,10-2.jpg,10-3.jpg,10-4.jpg\r\n',100),(13,'李宁休闲鞋男鞋新活力系列','Easy City轻便半掌气垫夏季运动鞋GLAL007\r\n','男士','休闲鞋',169,'LINING\r\n',NULL,'11-1.jpg,11-2.jpg,11-3.jpg,11-4.jpg\r\n',100),(14,'adidas阿迪达斯男鞋跑步鞋','新款运动鞋AF6420\r\n','女士','跑步鞋\r\n',329,'adidas\r\n',NULL,'12-1.jpg,12-2.jpg,12-3.jpg,12-4.jpg\r\n',100),(15,'李宁跑步鞋男鞋多彩减震二代减震轻便耐磨防滑','男士晨跑春季运动鞋ARHL009','男士','跑步鞋',169,'LINING\r\n',NULL,'13-1.jpg,13-2.jpg,13-3.jpg,13-4.jpg\r\n',100),(16,'adidas阿迪达斯男子HARDEN B/E','哈登简版篮球鞋2017年运动鞋CG4195\r\n','男士\r\n','篮球鞋\r\n',559,'adidas\r\n',NULL,'14-1.jpg,14-2.jpg,14-3.jpg,14-4.jpg',100),(17,'李宁篮球鞋男鞋','韦德全城4云减震耐磨防滑中帮春秋运动鞋ABPL067','男士','篮球鞋\r\n',239,'LINING\r\n',NULL,'15-1.jpg,15-2.jpg,15-3.jpg,15-4.jpg\r\n',100),(18,'阿迪达斯adidas运动鞋男鞋女鞋','贝壳头板鞋G61070','女士','网球鞋',689,'adidas\r\n',NULL,'16-1.jpg,16-2.jpg,16-3.jpg,16-4.jpg\r\n',100),(19,'李宁生活男鞋','低帮快干耐磨吸湿板鞋运动鞋','男士\r\n','网球鞋',99,'LINING\r\n',NULL,'17-1.jpg,17-2.jpg,17-3.jpg,17-4.jpg\r\n',100),(20,'adidas阿迪达斯2017新款','男低帮TF碎钉ACE 17.4 TF足球鞋BB1774','男士\r\n','足球鞋\r\n',239,'adidas\r\n',NULL,'18-1.jpg,18-2.jpg,18-3.jpg,18-4.jpg\r\n',NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`password`,`phone`,`level`,`address`) values (1,'smith','123456','13152264648',0,NULL),(2,'张三','123456','13977448468',0,NULL),(3,'admin','654321','18924561851',1,NULL),(6,'Test','123456','12447',0,NULL),(10,'李四','123456','1549792356',0,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
