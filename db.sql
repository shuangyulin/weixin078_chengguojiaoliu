/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - ssmw52wu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssmw52wu` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssmw52wu`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/ssmw52wu/upload/picture1.jpg');
insert  into `config`(`id`,`name`,`value`) values (2,'picture2','http://localhost:8080/ssmw52wu/upload/picture2.jpg');
insert  into `config`(`id`,`name`,`value`) values (3,'picture3','http://localhost:8080/ssmw52wu/upload/picture3.jpg');
insert  into `config`(`id`,`name`,`value`) values (6,'homepage',NULL);

/*Table structure for table `exampaper` */

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619847514578 DEFAULT CHARSET=utf8 COMMENT='试卷表';

/*Data for the table `exampaper` */

insert  into `exampaper`(`id`,`addtime`,`name`,`time`,`status`) values (1619847260385,'2021-05-01 13:34:20','sdsascS',60,1);
insert  into `exampaper`(`id`,`addtime`,`name`,`time`,`status`) values (1619847514577,'2021-05-01 13:38:33','地方撒发送到',30,1);

/*Table structure for table `examquestion` */

DROP TABLE IF EXISTS `examquestion`;

CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619847581593 DEFAULT CHARSET=utf8 COMMENT='试题表';

/*Data for the table `examquestion` */

insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1619847292361,'2021-05-01 13:34:52',1619847260385,'sdsascS','SADADSADSADA','[{\"text\":\"A.ASDAS\",\"code\":\"A\"},{\"text\":\"B.DSAD \",\"code\":\"B\"},{\"text\":\"C.SADAASD\",\"code\":\"C\"}]',10,'A','ASDAD',0,1);
insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1619847312112,'2021-05-01 13:35:11',1619847260385,'sdsascS','SADSADAS','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',5,'A','SADSAAS',2,2);
insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1619847324397,'2021-05-01 13:35:23',1619847260385,'sdsascS','ASDSA','[]',10,'SDADAS','SADAS',3,3);
insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1619847547237,'2021-05-01 13:39:06',1619847514577,'地方撒发送到','ASDA ','[{\"text\":\"A.ASDAS\",\"code\":\"A\"},{\"text\":\"B.ADAD\",\"code\":\"B\"}]',5,'A','SADSADA',1,1);
insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1619847565663,'2021-05-01 13:39:24',1619847514577,'地方撒发送到','DSAAS','[]',10,'ASDSAD','ASDAD',3,2);
insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1619847581592,'2021-05-01 13:39:41',1619847514577,'地方撒发送到','ASDAS','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',10,'A','DSADSAD',2,3);

/*Table structure for table `examrecord` */

DROP TABLE IF EXISTS `examrecord`;

CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619847355568 DEFAULT CHARSET=utf8 COMMENT='考试记录表';

/*Data for the table `examrecord` */

insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1619847346203,'2021-05-01 13:35:45',1619846885772,NULL,1619847260385,'sdsascS',1619847292361,'SADADSADSADA','[{\"text\":\"A.ASDAS\",\"code\":\"A\",\"checked\":true},{\"text\":\"B.DSAD \",\"code\":\"B\",\"checked\":false},{\"text\":\"C.SADAASD\",\"code\":\"C\",\"checked\":false}]',10,'A','ASDAD',10,'A');
insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1619847352310,'2021-05-01 13:35:51',1619846885772,NULL,1619847260385,'sdsascS',1619847312112,'SADSADAS','[{\"text\":\"A.对\",\"code\":\"A\",\"checked\":true},{\"text\":\"B.错\",\"code\":\"B\",\"checked\":false}]',5,'A','SADSAAS',5,'A');
insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1619847355567,'2021-05-01 13:35:55',1619846885772,NULL,1619847260385,'sdsascS',1619847324397,'ASDSA','[]',10,'SDADAS','SADAS',0,'QASADA');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) DEFAULT NULL COMMENT '帖子标题',
  `content` longtext NOT NULL COMMENT '帖子内容',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `isdone` varchar(200) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619847190696 DEFAULT CHARSET=utf8 COMMENT='学习交流';

/*Data for the table `forum` */

insert  into `forum`(`id`,`addtime`,`title`,`content`,`parentid`,`userid`,`username`,`isdone`) values (91,'2021-05-01 13:25:48','帖子标题1','帖子内容1',1,1,'用户名1','开放');
insert  into `forum`(`id`,`addtime`,`title`,`content`,`parentid`,`userid`,`username`,`isdone`) values (92,'2021-05-01 13:25:48','帖子标题2','帖子内容2',2,2,'用户名2','开放');
insert  into `forum`(`id`,`addtime`,`title`,`content`,`parentid`,`userid`,`username`,`isdone`) values (93,'2021-05-01 13:25:48','帖子标题3','帖子内容3',3,3,'用户名3','开放');
insert  into `forum`(`id`,`addtime`,`title`,`content`,`parentid`,`userid`,`username`,`isdone`) values (94,'2021-05-01 13:25:48','帖子标题4','帖子内容4',4,4,'用户名4','开放');
insert  into `forum`(`id`,`addtime`,`title`,`content`,`parentid`,`userid`,`username`,`isdone`) values (95,'2021-05-01 13:25:48','帖子标题5','帖子内容5',5,5,'用户名5','开放');
insert  into `forum`(`id`,`addtime`,`title`,`content`,`parentid`,`userid`,`username`,`isdone`) values (96,'2021-05-01 13:25:48','帖子标题6','帖子内容6',6,6,'用户名6','开放');
insert  into `forum`(`id`,`addtime`,`title`,`content`,`parentid`,`userid`,`username`,`isdone`) values (1619847103895,'2021-05-01 13:31:43','DGAFS','SSA',0,1619846891187,'2','开放');
insert  into `forum`(`id`,`addtime`,`title`,`content`,`parentid`,`userid`,`username`,`isdone`) values (1619847111761,'2021-05-01 13:31:51',NULL,'都是',1619847103895,1619846891187,'2',NULL);
insert  into `forum`(`id`,`addtime`,`title`,`content`,`parentid`,`userid`,`username`,`isdone`) values (1619847153942,'2021-05-01 13:32:33',NULL,'啊',1619847103895,1619846885772,'1',NULL);
insert  into `forum`(`id`,`addtime`,`title`,`content`,`parentid`,`userid`,`username`,`isdone`) values (1619847190695,'2021-05-01 13:33:10','ASDa','DSADNA',0,1619846885772,'1','开放');

/*Table structure for table `jiaoshi` */

DROP TABLE IF EXISTS `jiaoshi`;

CREATE TABLE `jiaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gonghao` varchar(200) NOT NULL COMMENT '工号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jiaoshixingming` varchar(200) NOT NULL COMMENT '教师姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `zhicheng` varchar(200) DEFAULT NULL COMMENT '职称',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gonghao` (`gonghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1619846891188 DEFAULT CHARSET=utf8 COMMENT='教师';

/*Data for the table `jiaoshi` */

insert  into `jiaoshi`(`id`,`addtime`,`gonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhicheng`,`shouji`,`youxiang`,`tupian`) values (21,'2021-05-01 13:25:48','教师1','123456','教师姓名1','男','职称1','13823888881','773890001@qq.com','http://localhost:8080/ssmw52wu/upload/jiaoshi_tupian1.jpg');
insert  into `jiaoshi`(`id`,`addtime`,`gonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhicheng`,`shouji`,`youxiang`,`tupian`) values (22,'2021-05-01 13:25:48','教师2','123456','教师姓名2','男','职称2','13823888882','773890002@qq.com','http://localhost:8080/ssmw52wu/upload/jiaoshi_tupian2.jpg');
insert  into `jiaoshi`(`id`,`addtime`,`gonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhicheng`,`shouji`,`youxiang`,`tupian`) values (23,'2021-05-01 13:25:48','教师3','123456','教师姓名3','男','职称3','13823888883','773890003@qq.com','http://localhost:8080/ssmw52wu/upload/jiaoshi_tupian3.jpg');
insert  into `jiaoshi`(`id`,`addtime`,`gonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhicheng`,`shouji`,`youxiang`,`tupian`) values (24,'2021-05-01 13:25:48','教师4','123456','教师姓名4','男','职称4','13823888884','773890004@qq.com','http://localhost:8080/ssmw52wu/upload/jiaoshi_tupian4.jpg');
insert  into `jiaoshi`(`id`,`addtime`,`gonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhicheng`,`shouji`,`youxiang`,`tupian`) values (25,'2021-05-01 13:25:48','教师5','123456','教师姓名5','男','职称5','13823888885','773890005@qq.com','http://localhost:8080/ssmw52wu/upload/jiaoshi_tupian5.jpg');
insert  into `jiaoshi`(`id`,`addtime`,`gonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhicheng`,`shouji`,`youxiang`,`tupian`) values (26,'2021-05-01 13:25:48','教师6','123456','教师姓名6','男','职称6','13823888886','773890006@qq.com','http://localhost:8080/ssmw52wu/upload/jiaoshi_tupian6.jpg');
insert  into `jiaoshi`(`id`,`addtime`,`gonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhicheng`,`shouji`,`youxiang`,`tupian`) values (1619846891187,'2021-05-01 13:28:11','2','2','2','女',NULL,NULL,NULL,NULL);

/*Table structure for table `kechengjieda` */

DROP TABLE IF EXISTS `kechengjieda`;

CREATE TABLE `kechengjieda` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `kemu` varchar(200) DEFAULT NULL COMMENT '科目',
  `jiedaneirong` longtext COMMENT '解答内容',
  `jiedariqi` date DEFAULT NULL COMMENT '解答日期',
  `kechengtupian` varchar(200) DEFAULT NULL COMMENT '课程图片',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619847211449 DEFAULT CHARSET=utf8 COMMENT='课程解答';

/*Data for the table `kechengjieda` */

insert  into `kechengjieda`(`id`,`addtime`,`xuehao`,`xueshengxingming`,`kechengmingcheng`,`kemu`,`jiedaneirong`,`jiedariqi`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (61,'2021-05-01 13:25:48','学号1','学生姓名1','课程名称1','科目1','解答内容1','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengjieda_kechengtupian1.jpg','工号1','教师姓名1',1);
insert  into `kechengjieda`(`id`,`addtime`,`xuehao`,`xueshengxingming`,`kechengmingcheng`,`kemu`,`jiedaneirong`,`jiedariqi`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (62,'2021-05-01 13:25:48','学号2','学生姓名2','课程名称2','科目2','解答内容2','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengjieda_kechengtupian2.jpg','工号2','教师姓名2',2);
insert  into `kechengjieda`(`id`,`addtime`,`xuehao`,`xueshengxingming`,`kechengmingcheng`,`kemu`,`jiedaneirong`,`jiedariqi`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (63,'2021-05-01 13:25:48','学号3','学生姓名3','课程名称3','科目3','解答内容3','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengjieda_kechengtupian3.jpg','工号3','教师姓名3',3);
insert  into `kechengjieda`(`id`,`addtime`,`xuehao`,`xueshengxingming`,`kechengmingcheng`,`kemu`,`jiedaneirong`,`jiedariqi`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (64,'2021-05-01 13:25:48','学号4','学生姓名4','课程名称4','科目4','解答内容4','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengjieda_kechengtupian4.jpg','工号4','教师姓名4',4);
insert  into `kechengjieda`(`id`,`addtime`,`xuehao`,`xueshengxingming`,`kechengmingcheng`,`kemu`,`jiedaneirong`,`jiedariqi`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (65,'2021-05-01 13:25:48','学号5','学生姓名5','课程名称5','科目5','解答内容5','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengjieda_kechengtupian5.jpg','工号5','教师姓名5',5);
insert  into `kechengjieda`(`id`,`addtime`,`xuehao`,`xueshengxingming`,`kechengmingcheng`,`kemu`,`jiedaneirong`,`jiedariqi`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (66,'2021-05-01 13:25:48','学号6','学生姓名6','课程名称6','科目6','解答内容6','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengjieda_kechengtupian6.jpg','工号6','教师姓名6',6);
insert  into `kechengjieda`(`id`,`addtime`,`xuehao`,`xueshengxingming`,`kechengmingcheng`,`kemu`,`jiedaneirong`,`jiedariqi`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (1619847211448,'2021-05-01 13:33:31','1','1','第三方付多少','类型1','地方撒旦','2021-05-01','http://localhost:8080/ssmw52wu/upload/1619847046024.jpg','2','2',1619846891187);

/*Table structure for table `kechengtiwen` */

DROP TABLE IF EXISTS `kechengtiwen`;

CREATE TABLE `kechengtiwen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `kemu` varchar(200) DEFAULT NULL COMMENT '科目',
  `tiwenneirong` longtext COMMENT '提问内容',
  `tiwenriqi` date DEFAULT NULL COMMENT '提问日期',
  `kechengtupian` varchar(200) DEFAULT NULL COMMENT '课程图片',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619847137799 DEFAULT CHARSET=utf8 COMMENT='课程提问';

/*Data for the table `kechengtiwen` */

insert  into `kechengtiwen`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengmingcheng`,`kemu`,`tiwenneirong`,`tiwenriqi`,`kechengtupian`,`xuehao`,`xueshengxingming`,`userid`) values (51,'2021-05-01 13:25:48','工号1','教师姓名1','课程名称1','科目1','提问内容1','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengtiwen_kechengtupian1.jpg','学号1','学生姓名1',1);
insert  into `kechengtiwen`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengmingcheng`,`kemu`,`tiwenneirong`,`tiwenriqi`,`kechengtupian`,`xuehao`,`xueshengxingming`,`userid`) values (52,'2021-05-01 13:25:48','工号2','教师姓名2','课程名称2','科目2','提问内容2','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengtiwen_kechengtupian2.jpg','学号2','学生姓名2',2);
insert  into `kechengtiwen`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengmingcheng`,`kemu`,`tiwenneirong`,`tiwenriqi`,`kechengtupian`,`xuehao`,`xueshengxingming`,`userid`) values (53,'2021-05-01 13:25:48','工号3','教师姓名3','课程名称3','科目3','提问内容3','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengtiwen_kechengtupian3.jpg','学号3','学生姓名3',3);
insert  into `kechengtiwen`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengmingcheng`,`kemu`,`tiwenneirong`,`tiwenriqi`,`kechengtupian`,`xuehao`,`xueshengxingming`,`userid`) values (54,'2021-05-01 13:25:48','工号4','教师姓名4','课程名称4','科目4','提问内容4','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengtiwen_kechengtupian4.jpg','学号4','学生姓名4',4);
insert  into `kechengtiwen`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengmingcheng`,`kemu`,`tiwenneirong`,`tiwenriqi`,`kechengtupian`,`xuehao`,`xueshengxingming`,`userid`) values (55,'2021-05-01 13:25:48','工号5','教师姓名5','课程名称5','科目5','提问内容5','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengtiwen_kechengtupian5.jpg','学号5','学生姓名5',5);
insert  into `kechengtiwen`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengmingcheng`,`kemu`,`tiwenneirong`,`tiwenriqi`,`kechengtupian`,`xuehao`,`xueshengxingming`,`userid`) values (56,'2021-05-01 13:25:48','工号6','教师姓名6','课程名称6','科目6','提问内容6','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengtiwen_kechengtupian6.jpg','学号6','学生姓名6',6);
insert  into `kechengtiwen`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengmingcheng`,`kemu`,`tiwenneirong`,`tiwenriqi`,`kechengtupian`,`xuehao`,`xueshengxingming`,`userid`) values (1619847137798,'2021-05-01 13:32:17','2','2','第三方付多少','类型1','萨达','2021-05-02','http://localhost:8080/ssmw52wu/upload/1619847046024.jpg','1','1',1619846885772);

/*Table structure for table `kechengxinxi` */

DROP TABLE IF EXISTS `kechengxinxi`;

CREATE TABLE `kechengxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `kemu` varchar(200) DEFAULT NULL COMMENT '科目',
  `kechengjianjie` longtext COMMENT '课程简介',
  `kechengneirong` longtext COMMENT '课程内容',
  `kechengshipin` varchar(200) DEFAULT NULL COMMENT '课程视频',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  `kechengtupian` varchar(200) DEFAULT NULL COMMENT '课程图片',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619847052451 DEFAULT CHARSET=utf8 COMMENT='课程信息';

/*Data for the table `kechengxinxi` */

insert  into `kechengxinxi`(`id`,`addtime`,`kechengmingcheng`,`kemu`,`kechengjianjie`,`kechengneirong`,`kechengshipin`,`faburiqi`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (31,'2021-05-01 13:25:48','课程名称1','科目1','课程简介1','课程内容1','','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengxinxi_kechengtupian1.jpg','工号1','教师姓名1',1);
insert  into `kechengxinxi`(`id`,`addtime`,`kechengmingcheng`,`kemu`,`kechengjianjie`,`kechengneirong`,`kechengshipin`,`faburiqi`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (32,'2021-05-01 13:25:48','课程名称2','科目2','课程简介2','课程内容2','','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengxinxi_kechengtupian2.jpg','工号2','教师姓名2',2);
insert  into `kechengxinxi`(`id`,`addtime`,`kechengmingcheng`,`kemu`,`kechengjianjie`,`kechengneirong`,`kechengshipin`,`faburiqi`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (33,'2021-05-01 13:25:48','课程名称3','科目3','课程简介3','课程内容3','','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengxinxi_kechengtupian3.jpg','工号3','教师姓名3',3);
insert  into `kechengxinxi`(`id`,`addtime`,`kechengmingcheng`,`kemu`,`kechengjianjie`,`kechengneirong`,`kechengshipin`,`faburiqi`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (34,'2021-05-01 13:25:48','课程名称4','科目4','课程简介4','课程内容4','','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengxinxi_kechengtupian4.jpg','工号4','教师姓名4',4);
insert  into `kechengxinxi`(`id`,`addtime`,`kechengmingcheng`,`kemu`,`kechengjianjie`,`kechengneirong`,`kechengshipin`,`faburiqi`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (35,'2021-05-01 13:25:48','课程名称5','科目5','课程简介5','课程内容5','','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengxinxi_kechengtupian5.jpg','工号5','教师姓名5',5);
insert  into `kechengxinxi`(`id`,`addtime`,`kechengmingcheng`,`kemu`,`kechengjianjie`,`kechengneirong`,`kechengshipin`,`faburiqi`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (36,'2021-05-01 13:25:48','课程名称6','科目6','课程简介6','课程内容6','','2021-05-01','http://localhost:8080/ssmw52wu/upload/kechengxinxi_kechengtupian6.jpg','工号6','教师姓名6',6);
insert  into `kechengxinxi`(`id`,`addtime`,`kechengmingcheng`,`kemu`,`kechengjianjie`,`kechengneirong`,`kechengshipin`,`faburiqi`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (1619847052450,'2021-05-01 13:30:51','第三方付多少','类型1','发撒A','SADAA','','2021-05-01','http://localhost:8080/ssmw52wu/upload/1619847046024.jpg','2','2',1619846891187);

/*Table structure for table `kemuleixing` */

DROP TABLE IF EXISTS `kemuleixing`;

CREATE TABLE `kemuleixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='科目类型';

/*Data for the table `kemuleixing` */

insert  into `kemuleixing`(`id`,`addtime`,`leixing`) values (71,'2021-05-01 13:25:48','数学');
insert  into `kemuleixing`(`id`,`addtime`,`leixing`) values (72,'2021-05-01 13:25:48','类型2');
insert  into `kemuleixing`(`id`,`addtime`,`leixing`) values (73,'2021-05-01 13:25:48','类型3');
insert  into `kemuleixing`(`id`,`addtime`,`leixing`) values (74,'2021-05-01 13:25:48','类型4');
insert  into `kemuleixing`(`id`,`addtime`,`leixing`) values (75,'2021-05-01 13:25:48','类型5');
insert  into `kemuleixing`(`id`,`addtime`,`leixing`) values (76,'2021-05-01 13:25:48','类型6');

/*Table structure for table `storeup` */

DROP TABLE IF EXISTS `storeup`;

CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619847146227 DEFAULT CHARSET=utf8 COMMENT='收藏表';

/*Data for the table `storeup` */

insert  into `storeup`(`id`,`addtime`,`userid`,`refid`,`tablename`,`name`,`picture`) values (1619847127698,'2021-05-01 13:32:07',1619846885772,1619847052450,'kechengxinxi','第三方付多少','http://localhost:8080/ssmw52wu/upload/1619847046024.jpg');
insert  into `storeup`(`id`,`addtime`,`userid`,`refid`,`tablename`,`name`,`picture`) values (1619847146226,'2021-05-01 13:32:25',1619846885772,1619847073489,'zhongdianjiexi','第三方付多少','http://localhost:8080/ssmw52wu/upload/1619847046024.jpg');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1619846891187,'2','jiaoshi','教师','vqnforqotmyzh5mcgq498o27dx4sr0jo','2021-05-01 13:28:17','2021-05-01 14:33:22');
insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (2,1619846885772,'1','xuesheng','学生','1ml7u3g5xj3miwvfcwu3j2ucw5yx5rs7','2021-05-01 13:32:00','2021-05-01 14:35:38');
insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (3,1,'abo','users','管理员','hwoalavfrtp1rrpuy1esdhe6s3ocuzq3','2021-05-01 13:34:04','2021-05-01 14:37:14');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'abo','abo','管理员','2021-05-01 13:25:49');

/*Table structure for table `xiaoyuanzixun` */

DROP TABLE IF EXISTS `xiaoyuanzixun`;

CREATE TABLE `xiaoyuanzixun` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zixunmingcheng` varchar(200) DEFAULT NULL COMMENT '资讯名称',
  `biaoqian` varchar(200) DEFAULT NULL COMMENT '标签',
  `laiyuan` varchar(200) DEFAULT NULL COMMENT '来源',
  `neirong` longtext COMMENT '内容',
  `zuozhe` varchar(200) DEFAULT NULL COMMENT '作者',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  `fengmiantupian` varchar(200) DEFAULT NULL COMMENT '封面图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619847504018 DEFAULT CHARSET=utf8 COMMENT='校园资讯';

/*Data for the table `xiaoyuanzixun` */

insert  into `xiaoyuanzixun`(`id`,`addtime`,`zixunmingcheng`,`biaoqian`,`laiyuan`,`neirong`,`zuozhe`,`faburiqi`,`fengmiantupian`) values (81,'2021-05-01 13:25:48','资讯名称1','标签1','来源1','内容1','作者1','2021-05-01','http://localhost:8080/ssmw52wu/upload/xiaoyuanzixun_fengmiantupian1.jpg');
insert  into `xiaoyuanzixun`(`id`,`addtime`,`zixunmingcheng`,`biaoqian`,`laiyuan`,`neirong`,`zuozhe`,`faburiqi`,`fengmiantupian`) values (82,'2021-05-01 13:25:48','资讯名称2','标签2','来源2','内容2','作者2','2021-05-01','http://localhost:8080/ssmw52wu/upload/xiaoyuanzixun_fengmiantupian2.jpg');
insert  into `xiaoyuanzixun`(`id`,`addtime`,`zixunmingcheng`,`biaoqian`,`laiyuan`,`neirong`,`zuozhe`,`faburiqi`,`fengmiantupian`) values (83,'2021-05-01 13:25:48','资讯名称3','标签3','来源3','内容3','作者3','2021-05-01','http://localhost:8080/ssmw52wu/upload/xiaoyuanzixun_fengmiantupian3.jpg');
insert  into `xiaoyuanzixun`(`id`,`addtime`,`zixunmingcheng`,`biaoqian`,`laiyuan`,`neirong`,`zuozhe`,`faburiqi`,`fengmiantupian`) values (84,'2021-05-01 13:25:48','资讯名称4','标签4','来源4','内容4','作者4','2021-05-01','http://localhost:8080/ssmw52wu/upload/xiaoyuanzixun_fengmiantupian4.jpg');
insert  into `xiaoyuanzixun`(`id`,`addtime`,`zixunmingcheng`,`biaoqian`,`laiyuan`,`neirong`,`zuozhe`,`faburiqi`,`fengmiantupian`) values (85,'2021-05-01 13:25:48','资讯名称5','标签5','来源5','内容5','作者5','2021-05-01','http://localhost:8080/ssmw52wu/upload/xiaoyuanzixun_fengmiantupian5.jpg');
insert  into `xiaoyuanzixun`(`id`,`addtime`,`zixunmingcheng`,`biaoqian`,`laiyuan`,`neirong`,`zuozhe`,`faburiqi`,`fengmiantupian`) values (86,'2021-05-01 13:25:48','资讯名称6','标签6','来源6','内容6','作者6','2021-05-01','http://localhost:8080/ssmw52wu/upload/xiaoyuanzixun_fengmiantupian6.jpg');
insert  into `xiaoyuanzixun`(`id`,`addtime`,`zixunmingcheng`,`biaoqian`,`laiyuan`,`neirong`,`zuozhe`,`faburiqi`,`fengmiantupian`) values (1619847504017,'2021-05-01 13:38:23','SAdas','dsadasD','asfdfdas','<p>编辑器可以发布图片文字</p>','fdsafdsa','2021-05-01','http://localhost:8080/ssmw52wu/upload/1619847493788.jpg');

/*Table structure for table `xuesheng` */

DROP TABLE IF EXISTS `xuesheng`;

CREATE TABLE `xuesheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) NOT NULL COMMENT '学号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xueshengxingming` varchar(200) NOT NULL COMMENT '学生姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `zhuanye` varchar(200) DEFAULT NULL COMMENT '专业',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=1619846885773 DEFAULT CHARSET=utf8 COMMENT='学生';

/*Data for the table `xuesheng` */

insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`zhuanye`,`banji`,`shouji`,`youxiang`,`tupian`) values (11,'2021-05-01 13:25:48','学生1','123456','学生姓名1','女','专业1','班级1','13823888881','773890001@qq.com','http://localhost:8080/ssmw52wu/upload/xuesheng_tupian1.jpg');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`zhuanye`,`banji`,`shouji`,`youxiang`,`tupian`) values (12,'2021-05-01 13:25:48','学生2','123456','学生姓名2','男','专业2','班级2','13823888882','773890002@qq.com','http://localhost:8080/ssmw52wu/upload/xuesheng_tupian2.jpg');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`zhuanye`,`banji`,`shouji`,`youxiang`,`tupian`) values (13,'2021-05-01 13:25:48','学生3','123456','学生姓名3','男','专业3','班级3','13823888883','773890003@qq.com','http://localhost:8080/ssmw52wu/upload/xuesheng_tupian3.jpg');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`zhuanye`,`banji`,`shouji`,`youxiang`,`tupian`) values (14,'2021-05-01 13:25:48','学生4','123456','学生姓名4','男','专业4','班级4','13823888884','773890004@qq.com','http://localhost:8080/ssmw52wu/upload/xuesheng_tupian4.jpg');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`zhuanye`,`banji`,`shouji`,`youxiang`,`tupian`) values (15,'2021-05-01 13:25:48','学生5','123456','学生姓名5','男','专业5','班级5','13823888885','773890005@qq.com','http://localhost:8080/ssmw52wu/upload/xuesheng_tupian5.jpg');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`zhuanye`,`banji`,`shouji`,`youxiang`,`tupian`) values (16,'2021-05-01 13:25:48','学生6','123456','学生姓名6','男','专业6','班级6','13823888886','773890006@qq.com','http://localhost:8080/ssmw52wu/upload/xuesheng_tupian6.jpg');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`zhuanye`,`banji`,`shouji`,`youxiang`,`tupian`) values (1619846885772,'2021-05-01 13:28:05','1','1','1','男',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `zhongdianjiexi` */

DROP TABLE IF EXISTS `zhongdianjiexi`;

CREATE TABLE `zhongdianjiexi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `kemu` varchar(200) DEFAULT NULL COMMENT '科目',
  `zhongdianjieshao` longtext COMMENT '重点介绍',
  `nandianjiexi` longtext COMMENT '难点解析',
  `jietisilu` longtext COMMENT '解题思路',
  `beizhu` longtext COMMENT '备注',
  `kechengtupian` varchar(200) DEFAULT NULL COMMENT '课程图片',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619847073490 DEFAULT CHARSET=utf8 COMMENT='重点解析';

/*Data for the table `zhongdianjiexi` */

insert  into `zhongdianjiexi`(`id`,`addtime`,`kechengmingcheng`,`kemu`,`zhongdianjieshao`,`nandianjiexi`,`jietisilu`,`beizhu`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (41,'2021-05-01 13:25:48','课程名称1','科目1','重点介绍1','难点解析1','解题思路1','备注1','http://localhost:8080/ssmw52wu/upload/zhongdianjiexi_kechengtupian1.jpg','工号1','教师姓名1',1);
insert  into `zhongdianjiexi`(`id`,`addtime`,`kechengmingcheng`,`kemu`,`zhongdianjieshao`,`nandianjiexi`,`jietisilu`,`beizhu`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (42,'2021-05-01 13:25:48','课程名称2','科目2','重点介绍2','难点解析2','解题思路2','备注2','http://localhost:8080/ssmw52wu/upload/zhongdianjiexi_kechengtupian2.jpg','工号2','教师姓名2',2);
insert  into `zhongdianjiexi`(`id`,`addtime`,`kechengmingcheng`,`kemu`,`zhongdianjieshao`,`nandianjiexi`,`jietisilu`,`beizhu`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (43,'2021-05-01 13:25:48','课程名称3','科目3','重点介绍3','难点解析3','解题思路3','备注3','http://localhost:8080/ssmw52wu/upload/zhongdianjiexi_kechengtupian3.jpg','工号3','教师姓名3',3);
insert  into `zhongdianjiexi`(`id`,`addtime`,`kechengmingcheng`,`kemu`,`zhongdianjieshao`,`nandianjiexi`,`jietisilu`,`beizhu`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (44,'2021-05-01 13:25:48','课程名称4','科目4','重点介绍4','难点解析4','解题思路4','备注4','http://localhost:8080/ssmw52wu/upload/zhongdianjiexi_kechengtupian4.jpg','工号4','教师姓名4',4);
insert  into `zhongdianjiexi`(`id`,`addtime`,`kechengmingcheng`,`kemu`,`zhongdianjieshao`,`nandianjiexi`,`jietisilu`,`beizhu`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (45,'2021-05-01 13:25:48','课程名称5','科目5','重点介绍5','难点解析5','解题思路5','备注5','http://localhost:8080/ssmw52wu/upload/zhongdianjiexi_kechengtupian5.jpg','工号5','教师姓名5',5);
insert  into `zhongdianjiexi`(`id`,`addtime`,`kechengmingcheng`,`kemu`,`zhongdianjieshao`,`nandianjiexi`,`jietisilu`,`beizhu`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (46,'2021-05-01 13:25:48','课程名称6','科目6','重点介绍6','难点解析6','解题思路6','备注6','http://localhost:8080/ssmw52wu/upload/zhongdianjiexi_kechengtupian6.jpg','工号6','教师姓名6',6);
insert  into `zhongdianjiexi`(`id`,`addtime`,`kechengmingcheng`,`kemu`,`zhongdianjieshao`,`nandianjiexi`,`jietisilu`,`beizhu`,`kechengtupian`,`gonghao`,`jiaoshixingming`,`userid`) values (1619847073489,'2021-05-01 13:31:13','第三方付多少','类型1','DSFFSF','DSAFDF','FDSAF是否dfsaf','SFFSAFety','http://localhost:8080/ssmw52wu/upload/1619847046024.jpg','2','2',1619846891187);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
