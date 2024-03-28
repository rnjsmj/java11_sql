create database kh;
show databases;
use kh;

-- 회원 (member)
create table member(id varchar(12) primary key,
password varchar(12) not null,
name varchar(20) not null,
address varchar(100),
tel varchar(20) not null,
reg_date datetime default current_timestamp);
desc member;

insert into member values('bgh', 'a1234', '배곤희', 
'신사동 912', '010-1111-2222', '2023-09-13');
insert into member values('yjh', 'a3421', '유정환', 
'강일동 128', '02-2222-3333', '2023-09-13');
insert into member values('lmk', 'b1111', '이민규', 
'수유동 1004', '010-3333-4444', '2023-09-14');
insert into member values('lsh', 'c456', '이성하',
'화곡1동 37', '010-4444-5555', '2023-09-15');
insert into member values('lyj', 'z675', '이연정',
'난곡동 67', '02-4444-2222', '2023-09-11');
insert into member values('lyl', 'q789', '이예린',
'능동 13', '010-5555-6666', '2023-09-15');
insert into member values('lws', 'g478', '이원석',
'고척1동 178', '010-6666-7777', '2023-09-13');
insert into member values('ljh', 'd666', '이정희',
'독산1동 75', '010-7777-8888', '2023-09-14');
insert into member values('ljw', 'e964', '이종우',
'상계동 777', '02-5555-2222', '2023-09-05');
insert into member values('jib', 'h369', '장인범',
'쌍문3동 888', '010-8888-9999', '2023-09-16');
select * from member;


-- 도서 (book)
create table book (
bookid int auto_increment primary key, 
bookkind varchar(3) not null,
booktitle varchar(50) not null,
bookprice int not null,
bookcount int not null,
author varchar(40),
pubcom varchar(40),
pubdate datetime);
desc book;

insert into book values(default, 'IT', '이것이 자바다', 30000, 10, '신용권', '한빛미디어', '2021-08-20');
insert into book values(default, 'IT', '자바웹개발워크북', 31500, 19, '구멍가게코딩단', '남가람북스', '2022-08-04');
insert into book values(default, 'NV', '하얼빈', 14400, 15, '김훈', '문학동네', '2022-08-03');
insert into book values(default, 'NV', '불편한편의점', 12600, 10, '김호연', '나무옆의자', '2022-08-10');
insert into book values(default, 'DV', '역행자', 15700, 8, '자청', '웅진출판', '2022-05-30');
insert into book values(default, 'DV', '자소서바이블', 18000, 15, '이형', '엔알디', '2022-08-25');
insert into book values(default, 'HC', '벌겁서은한국사', 17500, 10, 'TVN', '프런트페이지', '2022-08-22');
insert into book values(default, 'HC', '난중일기', 14000, 30, '이순신', '스타북스', '2022-07-27');
insert into book values(default, 'TC', '진짜쓰는실무엑셀', 20000, 10, '전진권', '제이펍', '2022-02-15');
insert into book values(default, 'TC', '빅데이터인공지능', 25000, 15, '박해선', '한빛미디어', '2020-12-21');

select * from book;


-- 판매 (sales)
create table sales (
sno int auto_increment primary key,
bno int not null,
id varchar(12) not null,
amount int not null default 1,
money int,
salesday datetime default current_timestamp);
desc sales;
drop table sales;

insert into sales values(default, 1, 'lhy', 1, null, default);
insert into sales values(default, 2, 'ykh', 1, null, default);
insert into sales values(default, 1, 'jjs', 2, null, default);
insert into sales values(default, 9, 'lhy', 1, null, default);
insert into sales values(default, 2, 'cmj', 5, null, default);
insert into sales values(default, 2, 'jjs', 3, null, default);
insert into sales values(default, 3, 'yjh', 2, null, default);
insert into sales values(default, 5, 'hsy', 4, null, default);
insert into sales values(default, 4, 'nsy', 8, null, default);
insert into sales values(default, 1, 'jbj', 3, null, default);
insert into sales values(default, 2, 'kyj', 4, null, default);
insert into sales values(default, 7, 'lhn', 1, null, default);
insert into sales values(default, 8, 'hth', 2, null, default);
insert into sales values(default, 10, 'cmj', 5, null, default);
insert into sales values(default, 1, 'lhy', 3, null, default);
insert into sales values(default, 2, 'cmj', 2, null, default);
insert into sales values(default, 2, 'lhy', 1, null, default);
insert into sales values(default, 1, 'ykh', 3, null, default);

update sales set money = (select bookprice from book where book.bookid = sales.bno)*amount;
select * from sales;

select * from member;
select * from book;
select * from sales;

SET SQL_SAFE_UPDATES = 0;




