// auto increment 초기화
ALTER TABLE chatroom_table auto_increment = 1;
SET @COUNT = 0;
UPDATE chatroom_table SET cnum = @COUNT:=@COUNT+1;

// 권한부여
 GRANT ALL PRIVILEGES ON *.* to 'root'@'%' IDENTIFIED BY '1234';

create table user_table( 
unum int(11) primary key auto_increment not null,
uid varchar(32), 
upw varchar(50), 
uname varchar(32), 
email varchar(40), 
phone_num varchar(32)
 );

create table chatroom_table(
cnum int(11) primary key not null,
cname varchar(32)
);

create table uc_table(
unum int(11),
cnum int(11),
id int(11) PRIMARY KEY auto_increment not null,
cname varchar(32)
);


create table chatlog_table(
unum int(11),
cnum int(11),
log varchar(400),
time datetime,
id int(11) PRIMARY KEY auto_increment not null,
uname varchar(255)
);

alter table uc_table add foreign key(cnum) references chatroom_table(cnum);
alter table Chatlog_Table add foreign key(unum) references UC_Table(unum);