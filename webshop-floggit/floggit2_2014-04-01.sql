# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.15)
# Database: floggit2
# Generation Time: 2014-04-01 16:34:03 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table actors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `actors`;

CREATE TABLE `actors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `firstname_index` (`firstname`),
  KEY `surname_index` (`surname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;

INSERT INTO `actors` (`id`, `firstname`, `surname`, `dob`)
VALUES
	(17,'Kurt','Russel','1964'),
	(18,'John','Hurt','1952');

/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authors`;

CREATE TABLE `authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;

INSERT INTO `authors` (`id`, `firstname`, `surname`, `dob`)
VALUES
	(9,'JRR','Tolkien','1918');

/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table books
# ------------------------------------------------------------

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` int(11) unsigned NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `published` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn_UNIQUE` (`isbn`),
  CONSTRAINT `fk_books_products1` FOREIGN KEY (`id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;

INSERT INTO `books` (`id`, `isbn`, `published`)
VALUES
	(119,'456346','1952');

/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table books_authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `books_authors`;

CREATE TABLE `books_authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `authors_id` int(11) unsigned NOT NULL,
  `books_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authors_id_books_id_unique` (`authors_id`,`books_id`),
  KEY `fk_books_authors_authors1_idx` (`authors_id`),
  KEY `fk_books_authors_books1_idx` (`books_id`),
  CONSTRAINT `fk_books_authors_authors1` FOREIGN KEY (`authors_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_authors_books1` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `books_authors` WRITE;
/*!40000 ALTER TABLE `books_authors` DISABLE KEYS */;

INSERT INTO `books_authors` (`id`, `authors_id`, `books_id`)
VALUES
	(5,9,119);

/*!40000 ALTER TABLE `books_authors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) DEFAULT NULL,
  `staff_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categories_staff1_idx` (`staff_id`),
  CONSTRAINT `fk_categories_staff1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `category_name`, `staff_id`)
VALUES
	(1,'Books',27),
	(2,'Computing',58),
	(3,'Toys',62),
	(4,'Gardening',63),
	(5,'Electronics',58),
	(6,'Clothes',63),
	(7,'Mens',63),
	(8,'Womens',63),
	(9,'Children',63),
	(10,'Sports & outdoors',71),
	(11,'Films',27);

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table clubs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clubs`;

CREATE TABLE `clubs` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `club_name` varchar(255) DEFAULT NULL,
  `telephone` varchar(100) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;

INSERT INTO `clubs` (`id`, `club_name`, `telephone`, `street_address`, `town`, `postcode`)
VALUES
	(1,'Ac Mattis Ornare Industries','070 6178 9069','3519 A Rd.','Urbe','YN1L 4YA'),
	(2,'Cum Sociis Natoque Corp.','076 9160 5957','P.O. Box 451, 4018 Dolor. Ave','Tintigny','V5M 5UW'),
	(3,'Tincidunt PC','(0118) 001 8755','Ap #947-5442 Metus Street','Forge-Philippe','DD49 0GQ'),
	(4,'Mi Aliquam Foundation','0800 987 3261','2296 Elit. Rd.','Colchester','GP2S 8GA'),
	(5,'Orci Consectetuer Euismod LLC','(0114) 603 0525','P.O. Box 605, 2086 Consequat Street','Sennariolo','CL8J 8BB'),
	(6,'Vel Consulting','(016977) 2841','Ap #801-5649 Placerat St.','Saint-Laurent','EH7 8FW'),
	(7,'Convallis Est Inc.','07624 597575','Ap #870-4243 Donec Avenue','Sterrebeek','I0X 3LG'),
	(8,'Vitae Semper Egestas Corporation','0344 294 3998','443-5606 Congue, St.','Moe','P79 8LT'),
	(9,'Pede Et Risus LLC','0800 1111','P.O. Box 818, 1357 Proin Road','Aberystwyth','G9L 7BS'),
	(10,'Nec Mauris Blandit Corp.','(0118) 760 2301','Ap #321-3462 Vitae Rd.','Stokrooie','LU2 8UN'),
	(11,'Nec Luctus Felis Corp.','0500 200919','2171 Enim. Rd.','Honolulu','JG6Z 6EO'),
	(12,'Dapibus Rutrum LLC','(016977) 1781','529-8704 Purus. Road','Montpelier','D9 5LE'),
	(13,'Metus Vitae Velit Ltd','0373 494 6550','4651 Dolor Street','Mildura','B7 5YY'),
	(14,'Sed Leo Cras Company','0500 447578','793-5422 Augue St.','Castelnuovo Magra','M44 2TT'),
	(15,'Nec Imperdiet Nec Institute','07080 703107','731-6047 Iaculis Rd.','Asso','G9B 9QV'),
	(16,'Enim Nisl Elementum Foundation','(01205) 322642','P.O. Box 696, 1366 Eu Street','Meerdonk','LV7 8RA'),
	(17,'Sed Incorporated','0382 898 0651','Ap #980-7174 Ac Road','Cargovil','R1N 1TC'),
	(18,'Ut Inc.','070 0831 3995','849 Cursus, Street','Chastre-Villeroux-Blanmont','EI02 9MP'),
	(19,'Varius Orci In Industries','0348 630 2445','776-2646 Orci Rd.','Laces/Latsch','VA3 8IB'),
	(20,'Orci Sem Eget Company','0800 1111','P.O. Box 968, 8426 Vestibulum Street','Trois-Rivi?res','XG4 1ST'),
	(21,'Vitae Sodales At Industries','07624 668843','7339 Dolor Rd.','Gander','VI42 2VW'),
	(22,'Duis Cursus Diam Corp.','(01971) 976272','620-9250 Nunc. St.','Columbia','H2T 4TR'),
	(23,'Pellentesque Habitant Limited','(01932) 62119','Ap #377-7920 Ligula. St.','Inverbervie','Y0I 1MI'),
	(24,'Mauris Ut LLP','0343 313 2793','Ap #413-640 Nisi. St.','Mainz','O4S 5LC'),
	(25,'Fusce Fermentum Corporation','056 3880 9228','Ap #420-5777 Eu, Road','Stoke-on-Trent','BU37 3YG'),
	(26,'Nibh Institute','(0121) 936 3821','6567 Ac Street','La Matapï¿½dia','J47 5JE'),
	(27,'Nulla Magna Incorporated','056 0955 1339','P.O. Box 997, 4819 Mauris. St.','Pike Creek','L6C 6GG'),
	(28,'Nunc Incorporated','076 2413 0500','107-3919 Magnis Ave','Annone di Brianza','C2V 5RJ'),
	(29,'Lacinia Corporation','(016977) 3780','P.O. Box 114, 2648 Nec Avenue','Aubange','HG9B 9DT'),
	(30,'Risus Industries','(01862) 786459','P.O. Box 577, 1508 Vel, Road','Chambord','O9G 8QN'),
	(31,'Arcu Morbi Sit LLC','0845 46 42','319-6348 Ultricies Road','Bremen','AK8 2VB'),
	(32,'Et Nunc PC','0375 826 5841','218-3885 Amet Ave','Chandler','KT49 6GK'),
	(33,'Lacus LLP','076 0267 0630','Ap #929-2119 Dolor. Av.','Lacombe County','OF4T 1OW'),
	(34,'Nulla Interdum Curabitur Incorporated','(024) 1775 6450','367-1276 Dictum Av.','Birmingham','DU21 2AA'),
	(35,'Eget Varius Ultrices Consulting','(01523) 12688','152-5007 Eu, Road','Arlon','XQ2 2VJ'),
	(36,'Felis Ltd','(021) 6051 7242','247-3888 Donec Rd.','Challand-Saint-Victor','Z8 8KK'),
	(37,'Fermentum Fermentum Arcu Inc.','07456 509402','391-6023 Quis, Street','Des Moines','Z4 2GG'),
	(38,'A Enim Suspendisse Incorporated','0353 305 8055','Ap #932-5794 At, St.','Norfolk County','Y1K 6QJ'),
	(39,'Augue Eu Tempor LLP','0800 549 7841','P.O. Box 551, 5149 Duis Avenue','Kapelle-op-den-Bos','GN54 2OE'),
	(40,'Lacinia At PC','070 8835 0016','Ap #512-8990 Augue Street','Phoenix','NM7 2VR'),
	(41,'Pede LLC','0887 781 7443','Ap #336-1054 Massa. St.','Monacilioni','CQ74 3QG'),
	(42,'Lobortis Mauris Limited','(015552) 89398','6352 In Street','La Salle','E50 5LG'),
	(43,'Venenatis Company','0870 340 4847','2318 Laoreet St.','Geesthacht','SL5 8EM'),
	(44,'Risus Corporation','0800 370243','369-365 Dis St.','Armstrong','B5A 4BI'),
	(45,'Erat Limited','0854 233 7502','992-4620 Turpis. Rd.','Comox','KE8N 9JX'),
	(46,'Sed Inc.','0870 026 9311','Ap #230-397 Erat Rd.','Banff','D8S 7BT'),
	(47,'Tristique Corporation','(016977) 9561','991-7939 Non Avenue','Kaneohe','I68 7ND'),
	(48,'Dui Inc.','056 1369 0666','587-443 Curabitur Street','Groï¿½-Gerau','FN25 7CV'),
	(49,'Non Incorporated','0305 159 3038','507-4344 Risus. Ave','Wolfenbï¿½ttel','TC9 6UA'),
	(50,'Penatibus Et Ltd','(0110) 147 4556','1853 Pharetra Road','Vlezenbeek','P0 4MU'),
	(51,'Nullam Nisl Associates','(01071) 42467','486-2447 Congue, Street','Poitiers','VV9S 1RA'),
	(52,'Elit PC','0800 046200','386-5411 Elementum, Rd.','Cambiago','G7S 4JC'),
	(53,'Non Magna Nam PC','0800 707380','P.O. Box 688, 7260 Ut Av.','Christchurch','UD4L 5CG'),
	(54,'Orci Donec Limited','0394 396 2037','P.O. Box 732, 4973 Vel St.','Sibret','MO2 4UH'),
	(55,'Vitae Semper Egestas Foundation','(0111) 576 0940','P.O. Box 680, 5331 Ipsum Rd.','Grembergen','UZ31 1SP'),
	(56,'Sed Inc.','(0119) 567 3461','3188 Odio Av.','Lieferinge','E50 1NI'),
	(57,'Iaculis Enim Sit Company','(01697) 267719','P.O. Box 873, 3175 Fusce Ave','Southaven','XQ32 5JD'),
	(58,'Molestie Foundation','(016977) 5664','488-8179 Vel Road','Wanfercï¿½e-Baulet','FC43 1JK');

/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table departments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(55) NOT NULL,
  `boss_id` mediumint(8) unsigned DEFAULT NULL,
  `city` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;

INSERT INTO `departments` (`id`, `dept_name`, `boss_id`, `city`)
VALUES
	(1,'Money counters',78,'Stockholm'),
	(2,'Marketing',35,'Stockholm'),
	(3,'Business development',21,'Hallstahammar'),
	(4,'Research',47,'Hallstahammar'),
	(5,'Software development',56,'Hallstahammar'),
	(6,'New department',NULL,'Hallstahammar');

/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table films
# ------------------------------------------------------------

DROP TABLE IF EXISTS `films`;

CREATE TABLE `films` (
  `id` int(11) unsigned NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `agelimit` int(11) DEFAULT NULL,
  `released` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_films_products1` FOREIGN KEY (`id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;

INSERT INTO `films` (`id`, `rating`, `agelimit`, `released`)
VALUES
	(158,4,18,'1961');

/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table films_actors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `films_actors`;

CREATE TABLE `films_actors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `films_id` int(11) unsigned NOT NULL,
  `actors_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `films_id_actors_id_unique` (`films_id`,`actors_id`),
  KEY `fk_films_actors_films1_idx` (`films_id`),
  KEY `fk_films_actors_actors1_idx` (`actors_id`),
  CONSTRAINT `fk_films_actors_actors1` FOREIGN KEY (`actors_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_films_actors_films1` FOREIGN KEY (`films_id`) REFERENCES `films` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table orderlines
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orderlines`;

CREATE TABLE `orderlines` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `orders_id` int(11) unsigned NOT NULL,
  `users_id` int(11) unsigned NOT NULL,
  `products_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_orders_id_users_id_products_id_unique` (`orders_id`,`users_id`,`products_id`),
  KEY `fk_orderlines_users1_idx` (`users_id`),
  KEY `fk_orderlines_products1_idx` (`products_id`),
  KEY `fk_orderlines_orders1_idx` (`orders_id`),
  CONSTRAINT `fk_orderlines_orders1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderlines_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderlines_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orderdate` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `description` text,
  `cost` double DEFAULT NULL,
  `rrp` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_name_UNIQUE` (`product_name`),
  KEY `product_name_index` (`product_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `product_name`, `description`, `cost`, `rrp`)
VALUES
	(113,'Bike','A good bike.',455,2540),
	(114,'Pencil','You can write with it.',5,25),
	(115,'Lead statue','Depicting the king.',51,245),
	(116,'Pipe','Nice arome from this one.',34,154),
	(117,'Paper','Good to write on.',1,5),
	(119,'Lord of The Rings','A very good fantasy book about hobbits.',78,389),
	(158,'The evil the good and the ugly','A spagetti western movie.',22,66);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products_categories`;

CREATE TABLE `products_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `products_id` int(11) unsigned NOT NULL,
  `categories_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_products_id_categories_id_unique` (`products_id`,`categories_id`),
  KEY `fk_products_categories_products1_idx` (`products_id`),
  KEY `fk_products_categories_categories1_idx` (`categories_id`),
  CONSTRAINT `fk_products_categories_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_categories_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `products_categories` WRITE;
/*!40000 ALTER TABLE `products_categories` DISABLE KEYS */;

INSERT INTO `products_categories` (`id`, `products_id`, `categories_id`)
VALUES
	(329,113,3),
	(330,113,5),
	(331,113,7),
	(332,114,3),
	(333,114,5),
	(334,114,7),
	(335,115,3),
	(336,115,5),
	(337,115,7),
	(338,116,3),
	(339,116,5),
	(340,116,7),
	(341,117,3),
	(342,117,9),
	(343,119,1),
	(344,119,7),
	(345,119,8),
	(346,119,9);

/*!40000 ALTER TABLE `products_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shoppingbasket
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shoppingbasket`;

CREATE TABLE `shoppingbasket` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(11) unsigned NOT NULL,
  `products_id` int(11) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kf_users_id_products_id_unique` (`users_id`,`products_id`),
  KEY `fk_shoppingbasket_users1_idx` (`users_id`),
  KEY `fk_shoppingbasket_products1_idx` (`products_id`),
  CONSTRAINT `fk_shoppingbasket_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_shoppingbasket_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `shoppingbasket` WRITE;
/*!40000 ALTER TABLE `shoppingbasket` DISABLE KEYS */;

INSERT INTO `shoppingbasket` (`id`, `users_id`, `products_id`, `quantity`)
VALUES
	(27,1,119,1),
	(28,3,115,5),
	(29,3,116,2),
	(30,3,117,150),
	(31,8,113,1),
	(32,8,115,4),
	(33,8,158,5),
	(34,8,119,2);

/*!40000 ALTER TABLE `shoppingbasket` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table staff
# ------------------------------------------------------------

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `salary` mediumint(9) DEFAULT NULL,
  `department_id` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;

INSERT INTO `staff` (`id`, `firstname`, `surname`, `dob`, `street_address`, `town`, `postcode`, `mobile`, `email`, `salary`, `department_id`)
VALUES
	(1,'Sybill','Le','1973-05-11','P.O. Box 173, 4391 Felis Ave','Redcliffe','QM3 9VI','0800 160 9672','elit.erat.vitae@nonnisi.org',35805,NULL),
	(2,'Kalia','Horn','1982-08-27','708-9236 Ac St.','Piancastagnaio','UR6 4PF','(013856) 08737','Duis@lobortisquam.co.uk',39782,NULL),
	(3,'Tatum','Bailey','1956-07-17','2295 Inceptos Av.','Morrovalle','EN6 6DH','(0151) 475 0217','mollis.lectus.pede@quismassa.com',36747,NULL),
	(4,'India','Franco','1982-02-15','Ap #499-6083 Vitae, Ave','Virginia Beach','L99 2YC','07624 649116','velit.Pellentesque.ultricies@nequeseddictum.org',22734,NULL),
	(5,'Sophia','Nash','1957-12-26','Ap #986-9837 Convallis Street','Maria','VA67 3CS','070 3590 4600','ut@arcu.com',51154,NULL),
	(6,'Hillary','Brennan','1984-12-15','Ap #556-7189 Vestibulum. Ave','Borgone Susa','QP3O 5HT','055 3532 1835','metus@auctorquistristique.com',59563,NULL),
	(7,'Juliet','Crane','1979-05-05','224-3688 Augue St.','Tolve','T1O 8EL','(01223) 29551','nisl.arcu@eliteratvitae.org',30010,NULL),
	(8,'Ian','Melendez','1971-04-03','Ap #621-3246 Cursus Rd.','Weert','MO2L 7JU','0800 629 1936','ut@enim.net',24560,NULL),
	(9,'Fritz','Holder','1967-10-21','558-600 Eu Av.','Gressan','P3 5KQ','070 3402 7173','lacus.varius@Curabiturdictum.co.uk',26688,NULL),
	(10,'Eve','White','1969-06-23','579 Suspendisse Av.','Alphen aan den Rijn','C9V 0ZG','0845 46 41','iaculis.nec@sem.co.uk',57655,NULL),
	(11,'Kaden','Levine','1965-06-19','P.O. Box 787, 7363 Penatibus St.','Huntsville','G97 7TI','0906 455 5808','Donec.nibh@mollis.net',63997,NULL),
	(12,'Lois','Garner','1957-04-16','887-4470 Mauris St.','Roux-Miroir','N8 9UP','0845 46 47','tristique.aliquet@Integer.com',69398,NULL),
	(13,'Hanna','Moses','1954-06-22','615-6451 Donec Road','Gosnells','FH78 9FN','0500 440099','pede@aliquameros.org',61582,NULL),
	(14,'Blair','Newman','1978-06-06','661-2463 Non, Rd.','Palermo','OC3 8YT','076 1806 3920','ante.iaculis.nec@dictumcursusNunc.co.uk',51119,NULL),
	(15,'Chanda','Baker','1975-07-18','576-4704 Consectetuer Street','Pontedera','R1P 2ED','0800 1111','In@quamdignissim.edu',20939,NULL),
	(16,'Angelica','Guy','1980-10-13','Ap #926-1665 Malesuada Street','NÃ®mes','R2 2VJ','0938 537 7371','rhoncus.Proin@lobortisrisus.co.uk',31976,NULL),
	(17,'Yoshi','Watson','1963-11-21','142-5328 Dapibus Street','Rostock','JG9 6SQ','056 0010 4751','libero@ultrices.com',24969,NULL),
	(18,'Baxter','Baxter','1950-10-18','1081 Vitae Road','Chambave','MZ3 4KA','0800 1111','ut.aliquam@inaliquet.ca',25278,NULL),
	(19,'Curran','Huffman','1979-06-18','2380 Urna. Rd.','Mobile','GI7F 6HJ','0800 1111','ipsum.dolor@non.co.uk',17150,NULL),
	(20,'Sacha','Valenzuela','1953-10-26','P.O. Box 494, 8842 Velit Avenue','Hollange','LZ4 3AD','0385 737 7314','convallis.ante.lectus@nondui.org',50962,NULL),
	(21,'Daquan','Flynn','1962-01-08','9823 Suscipit St.','Mesa','Y2 4OD','0977 443 0849','at.augue@ullamcorpermagna.ca',67840,NULL),
	(22,'Eleanor','Payne','1961-10-07','7054 Ut, Rd.','Perwez','LV89 5YL','0800 339 4550','a.enim@liberonec.edu',50769,NULL),
	(23,'Melvin','Chandler','1987-01-10','325-1237 A Ave','Munich','Y0 1FP','07624 277141','penatibus@diamnunc.co.uk',33815,NULL),
	(24,'Charles','Juarez','1953-09-18','Ap #599-8663 Semper Ave','Orta San Giulio','KV7 1ED','(0113) 358 8288','ante.lectus@urnaet.org',56209,NULL),
	(25,'Yasir','Mccoy','1965-08-02','466-3671 Luctus Ave','Pictou','VA0O 9JR','0800 1111','eu@fermentummetusAenean.org',38462,NULL),
	(26,'Leandra','Vincent','1975-11-01','178-1277 Lacus. St.','Campinas','P1B 5WL','0845 46 49','sagittis@non.edu',50310,NULL),
	(27,'Maxwell','Farley','1986-02-22','Ap #141-8796 A, Av.','L?vis','DF75 2MY','0957 386 2943','tellus.eu@ridiculus.org',25287,NULL),
	(28,'Yuri','Skinner','1979-01-24','645-9903 Erat Av.','Gatineau','MI78 9UT','07624 680387','vel.nisl@justo.org',63188,NULL),
	(29,'Odette','Dudley','1956-09-14','P.O. Box 270, 4168 Purus. St.','Lï¿½neburg','N7C 7EK','0500 852486','sit.amet.massa@necurnaet.com',58821,NULL),
	(30,'Alika','Carlson','1991-03-31','858-3129 Vitae Avenue','Rea','T0M 2SZ','0800 071143','a@diamPellentesque.co.uk',17572,NULL),
	(31,'Nora','Faulkner','1952-06-28','Ap #412-5178 Lectus Street','North Las Vegas','A2X 1JU','07624 781140','lacus@Nuncmaurissapien.com',47573,NULL),
	(32,'Deanna','Puckett','1964-03-03','190-718 Eros Rd.','Baie-Comeau','DZ1M 8SR','056 2177 0907','egestas@vitaerisusDuis.net',69889,NULL),
	(33,'Charissa','Orr','1957-10-21','4367 Euismod St.','Venezia','QH8P 3UP','076 5693 7043','scelerisque@imperdieterat.net',24015,NULL),
	(34,'Doris','Mayer','1978-12-04','2969 Pharetra. Rd.','Herentals','RU38 6RJ','07110 888477','elit@faucibuslectusa.edu',42719,NULL),
	(35,'Nina','Lang','1985-09-15','Ap #434-5243 Nibh. Ave','Green Bay','Z43 9PD','(01066) 012850','est.Nunc.ullamcorper@dolorsitamet.com',68601,NULL),
	(36,'Octavius','Pittman','1975-09-21','P.O. Box 461, 7381 Laoreet Av.','Arzano','TX09 1UG','(0112) 875 8887','odio@Vestibulumante.net',40365,NULL),
	(37,'Hunter','Cash','1988-08-15','Ap #812-2380 Elit Av.','Tongerlo','EZ8 3KJ','0845 46 44','arcu.Vestibulum@ante.ca',61024,NULL),
	(38,'Danielle','Reid','1992-09-05','8050 Auctor Street','Stevenage','RC7N 6PJ','0800 1111','dignissim.magna.a@CuraePhasellus.com',58471,NULL),
	(39,'Sigourney','Mays','1989-02-17','P.O. Box 170, 3405 Quis, Street','Haguenau','OJ9 6ZH','076 3746 1117','velit.in@aliquetdiam.edu',39284,NULL),
	(40,'Dacey','Whitfield','1974-08-22','P.O. Box 968, 9210 Gravida. Road','Kaaskerke','G2 1XZ','(0119) 392 4458','hendrerit.Donec@variuseteuismod.net',54441,NULL),
	(41,'Zorita','Watson','1986-09-21','303-2505 Adipiscing Road','Bowling Green','H5I 0RJ','070 1057 0681','neque.Morbi.quis@elit.edu',39259,NULL),
	(42,'Xena','Waller','1990-12-23','6611 Arcu Av.','Villa Latina','U9J 0HA','(0115) 278 3371','nascetur.ridiculus.mus@ullamcorperDuiscursus.net',21114,NULL),
	(43,'Jasmine','Dunlap','1982-05-13','P.O. Box 659, 5728 Erat Ave','Trois-Riviï¿½res','S9 6OL','0340 051 9517','Donec@Morbimetus.edu',44293,NULL),
	(44,'Ian','Melendez','1969-07-12','P.O. Box 194, 1007 Phasellus St.','Hilversum','E1 5TX','0313 682 9619','condimentum.Donec.at@Nunc.org',22749,NULL),
	(45,'Keegan','Palmer','1993-07-31','726-1492 Neque Rd.','Vagli Sotto','AX2 8DO','0800 007 4869','amet.ornare.lectus@nonlacinia.ca',26633,NULL),
	(46,'Quinn','Mcknight','1985-01-28','Ap #597-3598 Cras Avenue','Oppido Mamertina','P0 0HV','(0116) 597 0875','lobortis.Class@Suspendisseeleifend.org',26989,NULL),
	(47,'Joseph','Barron','1978-08-10','197-3295 Dictum. Ave','St. Albert','Z5 3BX','(028) 3719 9277','nunc.nulla.vulputate@Cumsociis.co.uk',67322,NULL),
	(48,'Cassandra','Watson','1993-07-19','104-571 Cursus. Street','New Orleans','K3 2FL','0308 431 5149','Aliquam.fringilla@eget.ca',55293,NULL),
	(49,'Tara','Doyle','1979-01-23','1169 Nec, Rd.','Bristol','O4W 3BL','(0115) 914 7169','sapien@magnatellusfaucibus.co.uk',60231,NULL),
	(50,'Richard','Sykes','1954-09-21','P.O. Box 650, 5364 Lobortis, Avenue','Leffinge','D7B 1RB','0334 416 8217','Suspendisse.tristique.neque@magnis.org',41492,NULL),
	(51,'Selma','Warren','1975-07-08','P.O. Box 859, 4774 A, Rd.','Rio Saliceto','T29 7FD','(016977) 9337','Nunc.pulvinar.arcu@Phasellusinfelis.net',39412,NULL),
	(52,'Xanthus','James','1969-11-18','Ap #585-129 Erat Street','Lustin','RM1Z 7ND','(0110) 285 9144','eu@Fusce.net',47794,NULL),
	(53,'Zia','Atkins','1976-05-02','Ap #139-6279 Pellentesque Av.','Rimbey','GW4 6AC','0500 348170','molestie.Sed.id@litora.co.uk',62783,NULL),
	(54,'Catherine','Santiago','1984-10-24','1672 Purus Ave','Fort St. John','AH8R 9JO','(010256) 10550','congue.a@orciPhasellus.co.uk',22021,NULL),
	(55,'Megan','Lyons','1973-10-30','Ap #664-5556 Imperdiet, Street','Opglabbeek','ZE0I 1AC','056 5211 4556','augue.malesuada@Nam.co.uk',57391,NULL),
	(56,'Dustin','Perez','1980-07-16','Ap #884-4182 Vivamus St.','Pellizzano','NE7 6AU','(013553) 96843','condimentum@Nam.com',67255,NULL),
	(57,'Wylie','Mann','1972-07-22','8991 Quis Street','Wedel','LP93 1VL','0872 547 2259','iaculis.nec@nibhDonecest.edu',48431,NULL),
	(58,'Kameko','Stewart','1989-10-07','P.O. Box 791, 2492 Egestas Av.','Villers-Perwin','GS8 7OW','(012359) 61254','nisl.Maecenas@sagittis.com',18978,NULL),
	(59,'Ian','Young','1982-07-22','P.O. Box 338, 8901 Varius Street','Salt Lake City','VR90 5FN','(01107) 62323','rutrum@velitegetlaoreet.co.uk',55828,NULL),
	(60,'Camille','Norris','1981-08-24','Ap #327-1159 Lorem Avenue','Valfabbrica','M8 4EJ','(021) 7404 1467','Ut@temporaugueac.edu',27716,NULL),
	(61,'Tatyana','Clayton','1968-12-28','P.O. Box 546, 7149 Amet Street','Walsall','BW13 6VK','0800 775 6456','montes@infelisNulla.edu',63508,NULL),
	(62,'Aaron','Hodge','1954-12-10','6287 Duis Av.','Fraser Lake','KV64 8QV','(01461) 139439','Maecenas@blanditcongue.ca',19215,NULL),
	(63,'Rachel','Thompson','1955-03-09','Ap #985-6122 Sed Rd.','Town of Yarmouth','F6 7OS','(012395) 15049','fringilla.purus.mauris@nasceturridiculusmus.co.uk',59490,NULL),
	(64,'Dustin','Kline','1966-04-24','940-3136 Ipsum. Ave','Klagenfurt','T0 5BY','070 3839 3217','elit.pharetra@mauriselit.org',42030,NULL),
	(65,'Hiram','Burch','1970-09-30','Ap #311-3291 Aliquam Road','Carbonear','AJ30 9ZO','0354 869 5705','purus@antedictum.co.uk',35049,NULL),
	(66,'Nathaniel','Franco','1957-05-07','Ap #234-629 A, St.','Sovizzo','GO9Y 0CM','(01516) 607584','sem.vitae@aliquet.com',27589,NULL),
	(67,'Mohammad','Paul','1951-07-01','P.O. Box 697, 728 Sapien, St.','Saint-Dizier','U6 8HG','0500 983512','et.pede.Nunc@utmi.com',65821,NULL),
	(68,'Jael','Gordon','1966-06-19','913-5580 Dis St.','Stafford','M52 1HF','0845 46 40','in@felisullamcorper.edu',65098,NULL),
	(69,'Cherokee','Nolan','1963-10-14','P.O. Box 552, 5766 Nunc Road','Kampenhout','GE26 2YN','(01239) 501116','orci.lobortis.augue@egestaslaciniaSed.com',21896,NULL),
	(70,'Gage','Walton','1956-02-07','5865 A Rd.','Stockport','B51 8TK','0800 295442','dolor.tempus@luctusetultrices.ca',32485,NULL),
	(71,'Claudia','Stuart','1981-08-12','P.O. Box 420, 1092 Dui Street','Gavorrano','Z2 2DG','0800 1111','quis@massa.edu',54705,NULL),
	(72,'Murphy','Marquez','1951-03-26','635-838 Enim. Ave','Ternitz','Q9 8XD','070 0807 9444','nec.ligula@cursusdiamat.org',22370,NULL),
	(73,'Desirae','Farley','1957-06-08','606-2574 Lacinia Av.','Colwood','R3 1LK','(014795) 50344','Quisque@metusVivamus.com',49879,NULL),
	(74,'Madeson','Powers','1964-09-28','P.O. Box 320, 8048 Aliquam Street','Windsor','U67 9UU','(0114) 475 0052','Curabitur.ut@placerataugueSed.ca',67749,NULL),
	(75,'Otto','Glenn','1956-09-22','P.O. Box 151, 1923 Et St.','Jasper','L39 1KE','(0116) 963 1102','auctor.velit.eget@accumsan.com',50948,NULL),
	(76,'Adena','York','1974-04-22','Ap #196-6242 Vitae Avenue','Oliver','V2 2CX','0500 042838','cursus.a.enim@etipsum.com',54838,NULL),
	(77,'Micah','Dyer','1950-12-11','124-7177 Ut Avenue','Scheggino','P4 5CZ','(024) 9279 2827','non.dapibus.rutrum@Aeneangravida.net',30798,NULL),
	(78,'Dane','Gray','1987-06-28','P.O. Box 820, 7493 Consequat Ave','Colloredo di Monte Albano','DJ5 8DJ','(016977) 9627','et.netus@Fusce.org',69777,NULL),
	(79,'Adria','Goodman','1994-12-09','417-8113 Lorem. Road','Saint-Herblain','NH0 5AC','(0117) 929 2105','metus.sit.amet@ultriciesligulaNullam.com',27369,NULL),
	(80,'Chantale','Owens','1966-10-02','425 Sem Ave','Venezia','F57 8VS','(01515) 555549','sem@lacusQuisquepurus.com',48090,NULL),
	(81,'Wing','Clarke','1990-01-05','P.O. Box 338, 266 Quisque Av.','San Diego','P8 3PD','0800 785226','faucibus@lobortisrisusIn.net',46135,NULL),
	(82,'Griffin','Jackson','1950-05-21','7234 Ligula Rd.','Tilff','O5N 1PU','0500 970148','amet.consectetuer.adipiscing@loremloremluctus.net',25557,NULL),
	(83,'Noah','Cotton','1993-08-09','P.O. Box 188, 3537 Dictum Street','Gespeg','ZK9H 3VK','070 9705 5072','Cum.sociis@erosturpisnon.net',35925,NULL),
	(84,'Maggy','Ryan','1966-11-28','P.O. Box 323, 6717 Velit Ave','Nocera Umbra','CO44 6BZ','0800 543 1814','sociis@turpis.co.uk',29898,NULL),
	(85,'Janna','Tyson','1954-01-16','P.O. Box 583, 2289 Ridiculus Rd.','Bellegem','E1 6OO','(01898) 030306','ullamcorper.nisl.arcu@variusultrices.edu',37125,NULL),
	(86,'Murphy','Phillips','1978-04-29','783-3558 Ornare, Ave','Matagami','L71 3FA','(016977) 7981','tellus@etpedeNunc.org',55695,NULL),
	(87,'Cameron','Hyde','1956-01-30','6435 Non, Avenue','Irricana','DD1 8AA','0394 435 2050','velit@Phasellusnulla.edu',47280,NULL),
	(88,'Zia','Stein','1956-06-07','Ap #974-567 Ornare Ave','New Orleans','BS2P 1RN','0800 017 0190','ac@nislarcuiaculis.edu',41256,NULL),
	(89,'Leigh','Campos','1961-04-13','Ap #262-7992 Nec Rd.','Cisterna di Latina','NH4A 3WC','0979 278 8133','erat.vitae.risus@Pellentesque.ca',25581,NULL),
	(90,'Unity','Elliott','1994-08-07','404-4644 Nulla Av.','Zaltbommel','Q2O 8JM','056 4737 8656','erat.Sed@sagittissemperNam.co.uk',45718,NULL),
	(91,'Yuli','Johns','1954-06-03','4478 Inceptos Av.','Lampernisse','BM2D 6TE','07472 599635','vel.turpis.Aliquam@atiaculisquis.com',26915,NULL),
	(92,'Pamela','Lane','1991-07-16','703-8263 Pharetra St.','Rhayader','GB9P 1TK','07624 933513','quis.massa@lobortis.net',20770,NULL),
	(93,'Faith','Washington','1967-11-16','P.O. Box 143, 1082 At, Av.','Adelaide','GR31 1JU','(027) 8268 8227','amet.dapibus.id@mattisornare.co.uk',30255,NULL),
	(94,'Amos','Jordan','1992-06-28','3612 Phasellus St.','Poggiorsini','NS9I 3TM','076 2453 3662','nisi.magna.sed@fermentumconvallis.co.uk',19949,NULL),
	(95,'Nehru','Franks','1953-01-30','P.O. Box 906, 5321 Nec, St.','Geelong','Y89 0SJ','0800 1111','tempus.lorem@Donecfringilla.edu',65417,NULL),
	(96,'Duncan','Bray','1959-01-02','Ap #994-6815 Cursus Street','Oppido Mamertina','P9A 2PD','0994 496 8368','parturient.montes@dictumplacerataugue.net',17919,NULL),
	(97,'Brett','Stanley','1964-06-15','5405 Commodo Rd.','Lakeshore','Z8 6VJ','0845 46 46','non.sollicitudin@milacinia.edu',58945,NULL),
	(98,'Danielle','Allison','1979-03-17','9573 Eu Avenue','Nordhorn','RD8 3FV','(016977) 3568','posuere@ultricesVivamus.edu',52326,NULL),
	(99,'Shana','Rocha','1963-01-01','2542 Convallis Rd.','Malonne','F3 8HY','(019865) 83226','ut@consequatauctor.com',17975,NULL),
	(100,'Isaiah','Olsen','1971-08-23','P.O. Box 428, 2300 Fermentum Rd.','BÃ©ziers','OX0B 4MB','(027) 6561 1418','non.quam.Pellentesque@et.org',43016,NULL);

/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table staff_clubs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `staff_clubs`;

CREATE TABLE `staff_clubs` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `club_id` mediumint(8) unsigned NOT NULL,
  `staff_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `staff_clubs` WRITE;
/*!40000 ALTER TABLE `staff_clubs` DISABLE KEYS */;

INSERT INTO `staff_clubs` (`id`, `club_id`, `staff_id`)
VALUES
	(1,58,100),
	(2,1,6),
	(3,47,66),
	(4,50,43),
	(5,32,8),
	(6,13,28),
	(7,46,44),
	(8,47,64),
	(9,57,95),
	(10,58,32),
	(11,46,14),
	(12,47,14),
	(13,40,64),
	(14,1,93),
	(15,58,57),
	(16,51,73),
	(17,48,11),
	(18,5,13),
	(19,22,27),
	(20,22,78),
	(21,7,27),
	(22,41,26),
	(23,14,21),
	(24,8,90),
	(25,32,6),
	(26,58,83),
	(27,15,71),
	(28,3,44),
	(29,7,76),
	(30,52,71),
	(31,54,73),
	(32,20,78),
	(33,25,20),
	(34,53,12),
	(35,40,15),
	(36,6,90),
	(37,11,84),
	(38,46,100),
	(39,51,59),
	(40,23,31),
	(41,4,59),
	(42,13,8),
	(43,23,91),
	(44,51,35),
	(45,12,43),
	(46,5,58),
	(47,53,27),
	(48,5,58),
	(49,51,37),
	(50,20,7),
	(51,57,66),
	(52,57,30),
	(53,23,14),
	(54,49,100),
	(55,3,63),
	(56,28,48),
	(57,10,21),
	(58,59,12),
	(59,1,62),
	(60,19,6),
	(61,11,89),
	(62,50,19),
	(63,47,15),
	(64,40,5),
	(65,16,27),
	(66,30,57),
	(67,10,37),
	(68,16,38),
	(69,12,15),
	(70,27,30),
	(71,13,9),
	(72,10,42),
	(73,1,46),
	(74,42,75),
	(75,56,66),
	(76,5,49),
	(77,1,36),
	(78,42,86),
	(79,16,86),
	(80,23,46),
	(81,33,10),
	(82,12,41),
	(83,54,54),
	(84,11,62),
	(85,51,27),
	(86,29,64),
	(87,9,33),
	(88,19,70),
	(89,32,16),
	(90,23,64),
	(91,45,27),
	(92,15,81),
	(93,31,9),
	(94,30,33),
	(95,8,21),
	(96,59,74),
	(97,7,72),
	(98,35,88),
	(99,26,78),
	(100,35,38);

/*!40000 ALTER TABLE `staff_clubs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL DEFAULT '',
  `firstname` varchar(20) NOT NULL DEFAULT '',
  `surname` varchar(20) NOT NULL DEFAULT '',
  `street_address` varchar(50) DEFAULT NULL,
  `post_code` varchar(10) DEFAULT NULL,
  `town` varchar(30) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_password_unique` (`email`,`password`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `password`, `firstname`, `surname`, `street_address`, `post_code`, `town`, `telephone`)
VALUES
	(1,'anders.karl@gmail.com','testing','Anders','Karlsson','Testinggatan 6','54645','Stockholm','6346345'),
	(2,'manne.banne@hotmail.com','gneten','Manne','Banne','Fjardegatan 89','34546','Falun','08-323544'),
	(3,'fredade@krogen.se','orvar','Freddie','Kruger','krukgatan 3','12232','Visby','6643274'),
	(8,'batman@batmobile.com','bats','Bruce','Wayne','Batcave 1','66234','Gotham City','555-06543');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table warehouse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `warehouse`;

CREATE TABLE `warehouse` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `stock` int(11) NOT NULL DEFAULT '0',
  `products_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_id_UNIQUE` (`products_id`),
  KEY `fk_warehouse_products1_idx` (`products_id`),
  CONSTRAINT `fk_warehouse_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
