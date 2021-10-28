// auto increment 초기화
ALTER TABLE chatroom_table auto_increment = 1;
SET @COUNT = 0;
UPDATE chatroom_table SET cnum = @COUNT:=@COUNT+1;

create table User_Table( 
unum int(11) primary key,
uid varchar(32), 
upw varchar(50), 
uname varchar(32), 
email varchar(40), 
phone_num varchar(32)
 );

create table Chatroom_Table(
cnum int(11) primary key,
cname varchar(32)
);

create table uc_table(
unum int(11),
cnum int(11),
id int(11) PRIMARY KEY,
cname varchar(32)
);


create table Chatlog_Table(
unum int(11),
cnum int(11),
log varchar(400),
time datetime
);

alter table UC_Table add foreign key(cnum) references Chatroom_Table(cnum);
alter table Chatlog_Table add foreign key(unum) references UC_Table(unum);