show tables;

create table saleBoardJ (
	idx int not null auto_increment, 			/* 고유번호 */
	fName varchar(200) not null,							/* 원본 이미지 이름 */
	fSName varchar(200) not null,						/* 파일 이미지 이름 */
	fSize int not null,									/* 파일 사이즈 */
	title varchar(30) not null, 				/* 제목 */
	money int not null,							/* 판매금액 */
	totLike int default 0,						/* 총 찜 수 */
	viewCnt int default 0,						/* 조회수 */
	uploadDate datetime default now(),			/* 등록한 날짜 */
	content text not null,						/* 내용 */
	mid varchar(17) not null,					/* 등록한 사람 아이디 */
	state char(4) not null default '판매중',		/* 판매 상태(판매중,예약중,판매완료) */
	category varchar(20) not null,				/* 카테고리 */
	primary key(idx),
	foreign key (mid) references memberJ (mid)	/* 아이디 외래키 설정 */
);

drop table saleBoardJ;

select *,timestampDiff(hour,uploadDate,now()) as hour_diff, dateDiff(uploadDate,now()) as date_diff from saleBoardJ order by uploadDate limit 0,30