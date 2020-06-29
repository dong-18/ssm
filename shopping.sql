/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 5.7.19 : Database - cosmeticsshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cosmeticsshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cosmeticsshop`;

/*Table structure for table `ec_article` */

DROP TABLE IF EXISTS `ec_article`;

CREATE TABLE `ec_article` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(200) DEFAULT NULL,
  `SUPPLIER` varchar(20) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `DISCOUNT` double DEFAULT NULL,
  `LOCALITY` varchar(300) DEFAULT NULL,
  `PUTAWAY_DATE` datetime DEFAULT NULL,
  `STORAGE` int(11) DEFAULT '100',
  `IMAGE` varchar(200) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `TYPE_CODE` varchar(100) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `DISABLED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK_ARTICLE_TYPE` (`TYPE_CODE`),
  CONSTRAINT `FK_ARTICLE_TYPE` FOREIGN KEY (`TYPE_CODE`) REFERENCES `ec_article_type` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `ec_article` */

insert  into `ec_article`(`ID`,`TITLE`,`SUPPLIER`,`PRICE`,`DISCOUNT`,`LOCALITY`,`PUTAWAY_DATE`,`STORAGE`,`IMAGE`,`DESCRIPTION`,`TYPE_CODE`,`CREATE_DATE`,`DISABLED`) values 
(1,'秦氏 无添加蔗糖食品 黑谷类谷物早餐粉即冲即食400g/袋 无添加蔗糖早餐代餐 19年新货','康迈源食品专营店',21.9,0.8,'北京','2013-03-31 00:00:00',100,'5a0d6cbaN4a90950b.jpg','满1元返零食109减10/茗茶169减30/茗茶399减60优惠券','00010001','2013-03-31 00:00:00',1),
(2,'30条燕麦片早餐冲饮水果坚果麦片即食代餐零食红枣核桃奶 不要燕麦类，其他混合','天耀盛畅园林机械专营店',66.4,0.8,'北京','2013-03-31 00:00:00',100,'98791cdcb153f76b.jpg','红枣椰蓉燕麦片包装换成红枣椰子燕麦片，两种包装随机发出，请知悉','00010003','2013-03-31 00:00:00',1),
(3,'汴都铺子30袋装五谷杂粮粥礼盒组合米面粗粮杂粮饭八宝粥原料 节日送礼养生粥米伴侣3kg 八宝粥原料100g*30袋 ','汴都铺子旗舰店',79,0.8,'北京','2013-03-31 00:00:00',100,'f3bd62e95a6bafe9.jpg','满1元返零食109减10/茗茶169减30/茗茶399减60优惠券','00010002','2013-03-31 00:00:00',1),
(4,'呆呆菇娘 白扁豆500g 生扁豆白扁豆干扁豆新鲜豆类煮粥煲粥材料五谷杂粮豆粗粮豆散装白扁豆米药扁豆 ','呆呆菇娘官方旗舰店',10.9,0.8,'山东济宁市','2013-03-31 00:00:00',100,'a8af9960d37ab086.jpg','满1元返零食109减10/茗茶169减30/茗茶399减60优惠券','00010004','2013-03-31 00:00:00',1),
(5,'鲁花 食用油 5S物理压榨 压榨一级 花生油 6.18L（京东定制）','古蜀味道旗舰店',185.9,0.8,'北京','2013-03-31 00:00:00',100,'4b3201824c121244.jpg','鲁花三香，邀您品尝，部分满199减100，速抢！！！(此商品不参加上述活动)','00010005','2013-03-31 00:00:00',1),
(6,' 古蜀味道 四川特非转基因纯菜籽油 农家自制物理压榨食用油 菜油纯香油5L粮油 员工福利 ','古蜀味道旗舰店',89,0.8,'北京','2013-03-31 00:00:00',100,'5b67b7b4N44a4a4f6.jpg','想品尝地道的四川味道吗？来我们家尝尝吧！','00010006','2013-03-31 00:00:00',1),
(7,' 燕庄 芝麻香油 头道初榨系列 纯芝麻压榨 凉拌调味蘸料 500ml ','京东',42,0.8,'北京','2013-03-31 00:00:00',100,'5ab1b711N5f9ff2d6.jpg','【上京东，搜烘焙节！】厨房烹饪好物，低至满99减50！美味大牌限时特惠，快来PICK吧！猛戳抢购！(此商品不参加上述活动)','00010007','2013-03-31 00:00:00',0),
(8,'四川不知火丑橘2.5kg装大果 新鲜水果丑橘甜橘子不知火丑柑丑八怪丑桔子','生活＆好管家生鲜旗舰店',26.9,0.8,' 四川成都市','2013-03-31 00:00:00',100,'c5c179e563482cb5.jpg','两件带箱9.5-10斤/每两件合并发货/贵妃芒果10斤仅售35.8元','00020001','2013-03-31 00:00:00',1),
(9,'【5.2鲜藕带有秒杀】洪湖农家原味藕带500g*3袋组合装 洪湖藕带湖北特产藕带原味下饭菜新鲜蔬菜 ','洪湖农家官方旗舰店',33.9,0.8,'湖北荆州市','2013-03-31 00:00:00',100,'5ab1cec5N1f83e60f.jpg','【5.2超级品牌日】新鲜藕带3斤装秒杀价上市！！还有超级优惠礼品！！赶快加入购物车吧！','00020002','2013-03-31 00:00:00',0),
(10,'碧鼎 牵牛花种子四季种易活爬藤花卉缠绕草本攀爬花卉喇叭花种子花籽朝颜夏季易种花草种子碗公花盆栽花卉 牵牛花种子 30粒装 ','碧鼎园林官方旗舰店',9.8,1,'北京','2013-03-31 00:00:00',100,'79d05425a792d1b6.jpg','牵牛花，一年或多年生草本缠绕植物。其品种很多，花的颜色有蓝、绯红、桃红、紫等，花瓣边缘的变化较多，是常见的观赏植物。','00030001','2013-03-31 00:00:00',0),
(11,'惟之妙定做木方防腐木头地板原木料加工 实木条木材板材圆柱圆棒 9厘米直径，长度1.87米 ','惟之妙家装建材专营店',80,0.8,' 江西抚州市','2013-03-31 00:00:00',100,'7ccbc9d584653ae9.jpg','店铺满100可开票，参数和价格有歧义的商品，以客服介绍为准，大件商品需邮费请联系客服','00040001','2013-03-31 00:00:00',0),
(12,'樱花树苗 日本樱花树苗进口樱花苗盆景盆栽苗木观赏工程绿化庭院植物绿植花卉 绿云 1公分 ','山色溪苑旗舰店',9,0.8,'北京','2013-03-31 00:00:00',100,'67751eb08b048e04.jpg','庭院，阳台，客厅，办公','00030002','2013-03-31 00:00:00',0),
(13,'【领劵立减！顺丰当日发！】天合倾牧 澳洲黑毛安格斯牛肉眼牛排原切原味无腌制谷饲牛扒生鲜 眼肉牛排8份 1200g ','天合倾牧旗舰店',299,0.8,'广东广州市 ','2013-03-31 00:00:00',100,'53e94925258445a2.jpg','【顺丰冷链航空件，速度！】【原切非腌制！靠谱！】【下单赠送黄油黑椒酱！品质！】【视频教学如何煎好牛排！无忧！】','00050001','2013-03-31 00:00:00',0),
(14,'正大（CP） 鲜鸡蛋 30枚 53~60g/枚 早餐食材 ','京东',32.9,0.8,'北京','2013-03-31 00:00:00',100,'635678b2a1255172.jpg','商品毛重：1.97kg，加工方式：鲜蛋','00050002','2013-03-31 00:00:00',0),
(15,'蒙牛 特仑苏 纯牛奶 250ml*16 礼盒装（新老包装随机发货）','蒙牛京东自营旗舰店',86,0.8,'北京','2013-03-31 00:00:00',100,'ac61ea58e32926b0.jpg','适用人群：儿童，成人，中老年，青少年','00050003','2013-03-31 00:00:00',0),
(16,'太朴有机会天然活水鲫鱼 原生态鲫鱼 现捕活鱼现杀 野鲫鱼土鲫鱼淡水鲫鱼炖补月子鲫鱼宝宝汤食材3斤/份 太朴鲫鱼多条共3斤 ','太朴有机会食品官方旗舰店',165,0.8,' 贵州贵阳市 ','2013-03-31 00:00:00',100,'59dec82c04c2fd70.jpg','烹饪建议：火锅，炖菜，煎炸，蒸菜','00060001','2013-03-31 00:00:00',0),
(17,'川海川 鱼秋刀鱼500g1盒切段一分为二 进口烧烤食材生鲜冷冻鱼  ','川海川生鲜旗舰店',20,0.8,'浙江杭州市','2013-03-31 00:00:00',100,'5a9616f2N7c80e4ad.jpg','商品毛重：500.00g','00060002','2013-03-31 00:00:00',0);

/*Table structure for table `ec_article_type` */

DROP TABLE IF EXISTS `ec_article_type`;

CREATE TABLE `ec_article_type` (
  `CODE` varchar(100) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `REMARK` varchar(200) DEFAULT NULL,
  `delFlag` varchar(1) DEFAULT '0',
  PRIMARY KEY (`CODE`),
  FULLTEXT KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ec_article_type` */

insert  into `ec_article_type`(`CODE`,`NAME`,`REMARK`,`delFlag`) values 
('0001','粮油','粮油','0'),
('00010001','----谷类','谷类','1'),
('00010002','----麦类','麦类','0'),
('00010003','----杂粮类','杂粮类','0'),
('00010004','----豆类','豆类','0'),
('00010005','----花生油','花生油','0'),
('00010006','----菜油','菜油','0'),
('00010007','----香油','香油','0'),
('0002','果蔬','果蔬','0'),
('00020001','----水果','水果','0'),
('00020002','----蔬菜','蔬菜','0'),
('0003','花卉','花卉','0'),
('00030001','----草本花卉','草本花卉','0'),
('00030002','----木本花卉','木本花卉','0'),
('0004','林产品','林产品','0'),
('00040001','----木材及各种木材加工制品','木材及各种木材加工制品','0'),
('00040002','----经济林及森林副产品','经济林及森林副产品','0'),
('0005','畜禽产品','畜禽产品','0'),
('00050001','----肉','肉','0'),
('00050002','----蛋','蛋','0'),
('00050003','----奶','奶','0'),
('0006','水产品','水产品','0'),
('00060001','----活水产品','活水产品','0'),
('00060002','----鲜水产品','鲜水产品','0'),
('00060003','----水产加工品','水产加工品','0'),
('0007','其他农副产品','其他农副产品','0'),
('00160001','aaa','aaa','0');

/*Table structure for table `ec_order` */

DROP TABLE IF EXISTS `ec_order`;

CREATE TABLE `ec_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_CODE` varchar(20) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `SEND_DATE` datetime DEFAULT NULL,
  `STATUS` varchar(6) DEFAULT '0',
  `AMOUNT` double DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `paystatus` varchar(2) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ORDER_CODE` (`ORDER_CODE`),
  KEY `FK_USER_ORDER` (`USER_ID`),
  CONSTRAINT `FK_USER_ORDER` FOREIGN KEY (`USER_ID`) REFERENCES `ec_user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `ec_order` */

insert  into `ec_order`(`ID`,`ORDER_CODE`,`CREATE_DATE`,`SEND_DATE`,`STATUS`,`AMOUNT`,`USER_ID`,`paystatus`) values 
(18,'PO-202004302306251','2020-04-30 00:00:00',NULL,'0',33.6,1,'0');

/*Table structure for table `ec_order_item` */

DROP TABLE IF EXISTS `ec_order_item`;

CREATE TABLE `ec_order_item` (
  `ORDER_ID` int(11) NOT NULL DEFAULT '0',
  `ARTICLE_ID` int(11) NOT NULL DEFAULT '0',
  `ORDER_NUM` int(11) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`,`ARTICLE_ID`),
  KEY `FK_ORDER_ITEM_ARTICLE_ID` (`ARTICLE_ID`),
  CONSTRAINT `FK_ORDER_ITEM_ARTICLE_ID` FOREIGN KEY (`ARTICLE_ID`) REFERENCES `ec_article` (`ID`),
  CONSTRAINT `FK_ORDER_ITEM_ORDER_ID` FOREIGN KEY (`ORDER_ID`) REFERENCES `ec_order` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ec_order_item` */

insert  into `ec_order_item`(`ORDER_ID`,`ARTICLE_ID`,`ORDER_NUM`) values 
(18,7,1);

/*Table structure for table `ec_shopcar` */

DROP TABLE IF EXISTS `ec_shopcar`;

CREATE TABLE `ec_shopcar` (
  `buynum` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`article_id`),
  KEY `FKaj47ay0hg8pf56yaigcbc7evw` (`article_id`),
  CONSTRAINT `FKaj47ay0hg8pf56yaigcbc7evw` FOREIGN KEY (`article_id`) REFERENCES `ec_article` (`ID`),
  CONSTRAINT `FKdb54j9mwt0n6ausgqdnqc1p6j` FOREIGN KEY (`user_id`) REFERENCES `ec_user` (`ID`),
  CONSTRAINT `FKt4ugg002xoej43tnasie0012n` FOREIGN KEY (`user_id`) REFERENCES `ec_user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ec_shopcar` */

insert  into `ec_shopcar`(`buynum`,`user_id`,`article_id`) values 
(1,1,7);

/*Table structure for table `ec_user` */

DROP TABLE IF EXISTS `ec_user`;

CREATE TABLE `ec_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN_NAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `SEX` int(11) DEFAULT '1',
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `ROLE` int(11) DEFAULT '1',
  `CREATE_DATE` datetime DEFAULT NULL,
  `DISABLED` varchar(1) DEFAULT '0',
  `ACTIVE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `LOGIN_NAME` (`LOGIN_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `ec_user` */

insert  into `ec_user`(`ID`,`LOGIN_NAME`,`PASSWORD`,`NAME`,`SEX`,`EMAIL`,`PHONE`,`ADDRESS`,`ROLE`,`CREATE_DATE`,`DISABLED`,`ACTIVE`) values 
(1,'admin','123456','管理员',NULL,'test@163.com','18998665678','珠江新城',3,'2019-04-09 09:47:44','1',NULL),
(2,'test1','123456','张小棠',1,'test1@163.com','13487890989','',2,'2019-04-09 09:47:44','0',NULL),
(3,'a2222','123456','çè',1,'1499486615@qq.com','18272733322','1',3,'2020-03-18 23:41:59','1','093fbc3c-3814-4477-b638-56f6e8544693'),
(4,'11111','123456','王者',1,'1223124124@qq.com','11111111111','1',2,'2020-03-19 00:13:57','0','85ac87b7-2a45-4460-a454-29984a137970'),
(5,'aaaaa','2222222','aa',1,'63423423@qq.com','13455666666','6',2,'2020-03-23 23:39:51','0','99f5744f-5c5c-4f3b-a5e1-c71ccc9ce6d9'),
(8,'123456','123456','王者',1,'213213@qq.com','12443213445','1',2,NULL,'1','e793daa9-e688-4411-a234-a164380d6f8c'),
(9,'1234564','123456','wan',1,'1sada@qq.com','12312341223','1',1,'2020-03-31 02:19:38','1','73114abd-7010-413d-b01c-5b363247a502'),
(10,'asdasdas','123','王者',1,'11111@qq.com','18272733322','1',1,'2020-04-08 21:05:59','0','adc18b37-d485-4c51-9da1-053a193a9f65');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
