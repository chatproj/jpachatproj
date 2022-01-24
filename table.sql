// auto increment 초기화

ALTER TABLE chatroom_table auto_increment = 1;
SET @COUNT = 0;
UPDATE chatroom_table SET cnum = @COUNT:=@COUNT+1;

// 권한부여
GRANT ALL PRIVILEGES ON `%`.* TO 'root'@'%' IDENTIFIED BY '1234' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* to 'root'@'%' IDENTIFIED BY '1234';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('1234');

// 스키마 생성
create schema `chatproj` default character set utf8;

CREATE TABLE `user_table` (
  `unum` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) DEFAULT NULL,
  `upw` varchar(50) DEFAULT NULL,
  `uname` varchar(32) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone_num` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`unum`)
);

CREATE TABLE `user_profileimg` (
  `filenum` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(200) DEFAULT NULL,
  `original_filename` varchar(300) DEFAULT NULL,
  `file_url` varchar(500) DEFAULT NULL,
  `unum` int DEFAULT NULL,
  PRIMARY KEY (`filenum`)
);

CREATE TABLE `chatroom_table` (
  `cnum` int NOT NULL,
  `cname` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`cnum`)
);

CREATE TABLE `uc_table` (
  `cnum` int DEFAULT NULL,
  `unum` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cname_idx` (`cname`),
  KEY `uc_unum_idx` (`unum`),
  KEY `uc_cnum_idx` (`cnum`),
  CONSTRAINT `uc_cnum` FOREIGN KEY (`cnum`) REFERENCES `chatroom_table` (`cnum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uc_unum` FOREIGN KEY (`unum`) REFERENCES `user_table` (`unum`) ON DELETE CASCADE
);

CREATE TABLE `fileupload_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cnum` int DEFAULT NULL,
  `unum` int DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `uname` varchar(45) DEFAULT NULL,
  `filename` varchar(500) DEFAULT NULL,
  `original_filename` varchar(300) DEFAULT NULL,
  `file_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `2` (`cnum`),
  CONSTRAINT `2` FOREIGN KEY (`cnum`) REFERENCES `chatroom_table` (`cnum`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `chatlog_table` (
  `unum` int DEFAULT NULL,
  `cnum` int DEFAULT NULL,
  `log` varchar(400) DEFAULT NULL,
  `up_filename` varchar(45) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `division` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cnum_idx` (`cnum`),
  CONSTRAINT `cnum` FOREIGN KEY (`cnum`) REFERENCES `chatroom_table` (`cnum`) ON DELETE CASCADE ON UPDATE CASCADE
);

alter table uc_table add foreign key(cnum) references chatroom_table(cnum);
alter table Chatlog_Table add foreign key(unum) references UC_Table(unum);