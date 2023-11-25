show tables;

create table memberJ(
	idx int not null auto_increment, 	/* 고유번호 */
	mid varchar(17) not null, 			/* 아이디 */
	pwd varchar(17) not null, 			/* 비밀번호 */
	name varchar(11) not null, 			/* 이름 */
	nickName varchar(13) not null, 		/* 닉네임 */
	address varchar(100) not null, 		/* 주소 */
	tel varchar(15), 					/* 전화번호 */
	email varchar(60) not null, 		/* 이메일 */
	gender char(2) not null, 			/* 성별 (여자/남자) */
	profile varchar(20) not null, 		/* 기본 프로필 */
	userDel char(1) default 'N', 		/* 회원 탈퇴 유무 (탈퇴:Y / 탈퇴x: N) */
	adminYN char(1) default 'N', 		/* 관리자 확인 (일반회월:N / 관리자:Y) */
	startDate datetime default now(), 	/* 계정 생성일 */
	lastDate datetime default now(), 	/* 마지막 접속일 */
	primary key(idx),
	unique key(mid)
);

desc memberJ;

/* 관리자부여 */
insert into memberJ values(default,'admin','1234','관리자','관리자','','','admin@naver.com','여자','4.png','N','Y',default,default);

select * from memberJ;