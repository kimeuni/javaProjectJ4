show tables;

-- 판매 게시판
create table saleBoardJ (
	idx int not null auto_increment, 			/* 고유번호 */
	fName varchar(200) not null,				/* 원본 이미지 이름 */
	fSName varchar(200) not null,				/* 파일 이미지 이름 */
	fSize int not null,							/* 파일 사이즈 */
	title varchar(30) not null, 				/* 제목 */
	money int not null,							/* 판매금액 */
	totLike int default 0,						/* 총 찜 수 */
	viewCnt int default 0,						/* 조회수 */
	uploadDate datetime default now(),			/* 등록한 날짜 */
	content text not null,						/* 내용 */
	mid varchar(17) not null,					/* 등록한 사람 아이디 */
	state char(4) not null default '판매중',		/* 판매 상태(판매중,예약중,판매완료) */
	category varchar(20) not null,				/* 카테고리 */
	userDel char(1) default 'N',				/* 유저 탈퇴 신청했는지 확인 (탈퇴:Y: / 탈퇴x: N) */
	primary key(idx),
	foreign key (mid) references memberJ (mid)	/* 아이디 외래키 설정 */
);

drop table saleBoardJ;

select *,timestampDiff(hour,uploadDate,now()) as hour_diff, dateDiff(uploadDate,now()) as date_diff from saleBoardJ order by uploadDate limit 0,30
select category from saleBoardJ where mid='admin' group by category ;
select *,timestampDiff(hour,uploadDate,now()) as hour_diff, timestampDiff(day,uploadDate,now()) as date_diff from saleBoardJ where category='키덜트' order by uploadDate desc

-- 판매 게시글 찜
create table likeJ (
	idx int not null auto_increment primary key, 			/* 고유번호 */
	saleBoardIdx int,										/* 찜한 게시글의 idx 번호 */
	likeMid varchar(17) not null,							/* 찜을 클릭한 유저 mid */
	likeYN char(1) default 'Y',								/* 찜했는지 확인 (Y:찜 했음 / N:찜 안함) */
	alarm char(1) default 'Y', 								/* 알림(Y:알림o / N:알림x) */
	foreign key(saleBoardIdx) references saleBoardJ (idx) 	/* 외래키 설정 */
);
	--채팅에서 사용할 것
	--on update cascade	  									/* 관련된 정보가 바뀌면 내것도 바꿔줘 라는 의미의 명령어 */
	--on delete set null 										/* 앞에서 데이터가 지워져도 외래키의 값은 null로 들어간다. */
drop table likeJ;

-- 판매 게시글 신고
create table reportJ (
	idx int not null auto_increment primary key, 	/* 고유번호 */
	part varchar(15) not null, 						/* 신고항목(상품게시판:saleBoard, 일반게시판:board 등...) */
	partIdx int not null, 							/* 해당 항목 게시글의 고유번호 */
	cpMid varchar(17) not null, 					/* 신고자 아이디 */
	title varchar(21) not null, 					/* 신고된 게시글 제목 */
	cpContent text not null, 						/* 신고 사유 */
	cpDate datetime default now(), 					/* 신고날짜 */
	fSName varchar(200) not null
);

-- 새로 들어온 좋아요 수.. sql 확인겸..
select (select title from saleBoardJ where idx=11)as title,count(*) as newLike,saleBoardIdx from likeJ where saleBoardIdx = 11 and likeYN='Y' group by saleBoardIdx;
select (select count(*) from likeJ where saleBoardIdx = 11 ) as newLike, sj.title, sj.idx from saleBoardJ sj,likeJ lj where sj.idx = 11 and lj.likeYN='Y' and sj.mid='ccc1234' group by sj.idx;
select * from saleBoardJ sj,likeJ lj where sj.idx = 11 and lj.likeYN='Y' and sj.mid='ccc1234' group by sj.idx;
