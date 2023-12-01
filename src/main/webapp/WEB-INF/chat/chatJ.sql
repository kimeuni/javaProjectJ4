show tables;

create table chatGroupJ(
	idx int not null auto_increment primary key,
	saleBoardIdx int,
	saleMid varchar(17),
	myMid varchar(17),
	totAlarm int default 0,	/* chatJ에서 있는 알림 총 개수 */
	
	foreign key(saleBoardIdx) references saleBoardJ (idx) 	/* 외래키 설정 */
	on update cascade	  									/* 관련된 정보가 바뀌면 내것도 바꿔줘 라는 의미의 명령어 */
	on delete set null,
	foreign key(saleMid) references saleBoardJ (mid) 		/* 외래키 설정 */
	on update cascade	  									/* 관련된 정보가 바뀌면 내것도 바꿔줘 라는 의미의 명령어 */
	on delete set null 	
);

drop table chatGroupJ

create table chatJ(
	idx int not null auto_increment primary key,
	chatIdx int,
	saleBoardIdx int,
	saleMid varchar(17),
	myMid varchar(17),
	chat varchar(101) not null,
	alarm char(1) default 'Y',	/* 알림(Y:알림o / N:알림x) */
	chatDate datetime default now(),
	whoChatMid varchar(17), /* 누가 채팅을 보냈는지 확인을 위함 */
	foreign key(chatIdx) references chatGroupJ (idx) 	/* 외래키 설정 */
	on update cascade	  								/* 관련된 정보가 바뀌면 내것도 바꿔줘 라는 의미의 명령어 */
	on delete set null
);

drop table chatJ

update chatGroupJ set totAlarm=(select count(alarm) from chatJ where alarm='Y' and chatIdx=2) where idx=2
select * from chatJ order by chatDate where chatIdx=2
select * from chatJ order by chatDate