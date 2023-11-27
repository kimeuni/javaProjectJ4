show tables;

create table saleBoard(

);

-- 대분류
create table majorCategory(
	idx int not null auto_increment primary key, /* 고유번호 */
	majorCategory varchar(25) not null /* 대분류 */
);

insert into majorCategory values(default,'여성의류');
insert into majorCategory values(default,'남성의류');
insert into majorCategory values(default,'신발');
insert into majorCategory values(default,'가방/지갑');
insert into majorCategory values(default,'시계');

-- 중분류
create table midCategory(
	idx int not null auto_increment primary key, /* 고유번호 */
	majorCategoryIdx int not null, /* 대분류 고유번호 */
	midCategory varchar(25) not null, /* 중분류 */
	foreign key (majorCategoryIdx) references majorCategory (idx)  /* 대분류 고유번호 외래키 설정 */
);

insert into midCategory values(default,2,'아우터');
insert into midCategory values(default,2,'상의');
insert into midCategory values(default,2,'바지');
insert into midCategory values(default,2,'점프수트');
insert into midCategory values(default,2,'셋업/세트');
insert into midCategory values(default,2,'언더웨어/홈웨어');
insert into midCategory values(default,2,'테마/이벤트');


-- 소분류
create table smallCategory(
	idx int not null auto_increment primary key, /* 고유번호 */
	majorCategoryIdx int not null, /* 대분류 고유번호 */
	midCategoryIdx int not null, /* 중분류 고유번호 */
	smallCategory varchar(25) not null, /* 소분류 */
	foreign key (majorCategoryIdx) references majorCategory (idx), /* 대분류 고유번호 외래키 설정 */
	foreign key (midCategoryIdx) references midCategory (idx) /* 중분류 고유번호 외래키 설정 */
);

insert into smallCategory values(default,1,2,'니트/스웨터');
insert into smallCategory values(default,1,2,'후드티/후드집업');
insert into smallCategory values(default,1,2,'맨투맨');
insert into smallCategory values(default,1,2,'블라우스');
insert into smallCategory values(default,1,2,'셔츠');
insert into smallCategory values(default,1,2,'반팔 티셔츠');
insert into smallCategory values(default,1,2,'긴팔 티셔츠');
insert into smallCategory values(default,1,2,'민소매 티셔츠');