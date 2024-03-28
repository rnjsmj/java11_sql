USE kh;
show tables;

select * from member;
select * from book;
select * from sales;

-- 1) 회원 테이블에 다음과 같은 내용을 추가하시오.	
-- kkt a1004 김기태 가산동 123 010-1004-1004 2023-09-12		
insert into member values('kkt', 'a1004', '김기태', 
'가산동 123', '010-1004-1004', '2023-09-12');
select * from member;
									
-- 2) 도서 테이블에 다음 데이터를 추가하시오.									
-- 시퀀스번호	IT	스프링프레임워크	38000	8	김기태	정복사	2022-09-10		
insert into book values(default, 'IT', '스프링프레임워크', 
38000, 8, '김기태', '정복사', '2022-09-10');	
select * from book;							
									
-- 3) 판매 테이블에 다음 튜플(레코드)을 추가하시오.									
-- 시퀀스번호	1	kkt	2	조회가격*수량	오늘날짜				
insert into sales values(default, 1, 'kkt', 2, null, default);	
-- current_timestamp == now()				
update sales set money = (select bookprice from book where bookid = sales.bno) * amount;					
select * from sales;

-- 4) 회원 테이블에 기본값이 0인 숫자 데이터를 저장할 포인트(pt) 컬럼을 추가하시오.									
alter table member add pt int default 0;									
select * from member;
							
-- 5) 회원 테이블에 방문횟수(visited) 컬럼을 추가하시오.(컬럼타입 및 제약조건 등은 본인이 판단하여 할 것.)									
alter table member add visited int default 0;								
-- 									
-- 6) 회원 테이블에 이메일(email) 컬럼을 추가하시오(컬럼타입 및 제약조건 등은 본인이 판단하여 할 것.)									
alter table member add email varchar(200);									
-- 									
-- 7) 회원 테이블에 지역코드(areacode) 컬럼을 추가하시오.(컬럼타입 및 제약조건 등은 본인이 판단하여 할 것.)									
alter table member add areacode varchar(6);									
-- 									
-- 8) 회원 테이블에 있는 컬럼 중에서 방문횟수 컬럼을 제거하시오.									
alter table member drop column visited;	
desc member;								
-- 									
-- 9) 회원 테이블에 지역(areacode) 컬럼의 이름을 areadata 로 변경하시오.									
alter table member rename column areacode to areadata; 									
-- 									
-- 10) 판매(sales) 테이블을 복제하여 판매2(sales2) 테이블을 만드시오.									
create table sales2 as (select * from sales);									
select * from sales2;									
-- 11) 도서 테이블을 복제하여 도서2(book2) 테이블을 만드시오.									
create table book2 as (select * from book);
select * from book2;									
-- 									
-- 12) 회원 테이블을 복제하여 회원2(member2) 테이블을 만드시오.									
create table member2 as (select * from member);
select * from member2;								
-- 									
-- 13) 판매2(sales2) 테이블을 제거하시오.									
drop table sales2;
desc sales2;								
-- 									
-- 14) 복제된 회원2(member2) 테이블에서 아이디가 j가 포함된 회원을 삭제하시오.									
delete from member2 where id like '%j%';	
select * from member2;								
-- 									
-- 15) 회원(member) 테이블에서 모든 회원에 대한 포인트를 100 이 지급될 수 있도록 변경하시오.									
update member set pt = pt + 100; 	
select * from member;								
-- 									
-- 16) 회원(member) 테이블에서 회원의 아이디가 lsh인 회원의 주소를 '도화동 27'로 변경하시오.									
update member set address = '도화동 27' where id = 'lsh';								
-- 									
-- 17) 회원2(member2) 테이블에서 연락처가 02인 회원에 대하여 가입일을 오늘날짜로 변경하시오.									
update member2 set reg_date = now() where tel like '02-%';							
-- 									
-- 18) 도서2(book2) 테이블에서 도서 분류가 HC인 레코드에 대하여 도서 수량을 5로 변경하시오.									
update book2 set bookcount = 5 where bookkind = 'HC';
select * from book2;									
-- 									
-- 19) 도서2(book2) 테이블에서 도서 분류가 TC인 튜플을 제거하시오.									
delete from book2 where bookkind = 'TC';								
-- 									
-- 20) 도서2(book2) 테이블에 도서상태(ckdata) 컬럼을 추가하시오.(컬럼타입 및 제약조건 등은 본인이 판단하여 할 것.)									
alter table book2 add ckdata varchar(20); 	
desc book2;								
-- 									
-- 21) 도서2(book2) 테이블에 도서 수량이 7이하인 튜플에 대하여 도서상태를 '재입고요망' 으로 내용을 추가하시오.									
update book2 set ckdata = '재입고요망' where bookcount <= 7;
-- 									
-- 22) 회원2(member2) 테이블에 id를 기본키로 추가하시오.									
alter table member2 add constraint mem2_PK primary key (id);	
desc member2;			
-- 									
-- 23) 도서2(book2) 테이블에 도서코드(bookid)를 기본키로 도서분류(bookkind)를 외래키로 추가하시오.		
desc book2;							
alter table book2 add constraint bk2_PK primary key (bookid);	
alter table book2 add constraint bk2_FK foreign key (bookkind) references bookkind(kindcode);
	
create table bookkind (kindcode varchar(6) primary key, kindname varchar(50)); 
insert into bookkind values('IT', 'IT관련서적');
insert into bookkind values('NV', '소설');
insert into bookkind values('DV', '자기계발');
insert into bookkind values('HC', '역사');
insert into bookkind values('TC', '일반상식');
desc bookkind;
select * from book2;
							
-- 24) 도서2(book2) 테이블에서 출판일(pubdate)가 2022년 8월 인 데이터의 수량을 5씩 더 증가시키시오.									
update book2 set bookcount = bookcount+5 where pubdate between '2022-08-01' and '2022-08-31';							
select * from book2;		
						
-- 25) 회원(member) 테이블에서 모든 회원의 모든 정보를 조회하시오.									
select * from member;								
-- 									
-- 26) 판매(sales) 테이블에서 구매한 적이 있는 회원의 아이디를 중복을 제거하여 조회하시오.									
select id from member where id in (select distinct id from sales); 								
-- 									
-- 27) 도서(book) 테이블에서 도서종류(bookkind)가 IT인 튜플을 검색하시오.									
select * from book where bookkind = 'IT';							
-- 									
-- 28) 회원(member) 테이블에서 아이디가 k가 포함된 회원의 이름(name),  연락처(tel) 컬럼을 검색하시오.									
select name, tel from member where id like '%k%';				
-- 									
-- 29) 판매(sales) 테이블에서 수량(amount)이 2이상인 레코드를 검색하시오.									
select * from sales where amount >= 2;							
-- 									
-- 30) 도서(book) 테이블에서 단가(bookprice)가 19000이상 30000이하인 데이터의 도서명(booktitle), 도서가격(bookprice), 저자(author) 를 조회하시오.									
select booktitle, bookprice, author from book where bookprice between 19000 and 30000;								
-- 									
-- 31) 도서(book) 테이블에서 출판사(pubcom)이 한빛미디어 이거나 남가람북스인 튜플의 도서명(booktitle), 저자(author), 수량(bookcount)를
--  조회하시오.									
select booktitle, author, bookcount from book where pubcom in ('한빛미디어', '남가람북스');						
-- 									
-- 32) 도서(book) 테이블에서 출판일(pubdate)이 2022년인 튜플을 검색하시오.									
select * from book where pubdate between '2022-01-01' and '2022-12-31';								
-- 									
-- 33) 회원(member) 테이블에서 비밀번호(password)가 5글자 이상인 회원의 아이디(id), 이름(name), 주소(tel)을 검색하시오.									
select id, name, tel from member where length(password) >= 5;									
-- 									
-- 34) 도서(book) 테이블에서 출판일(pubdate)을 기준으로 오름차순하여 검색하되 출판일(pubdate)이 같은 경우
--  도서코드(bookid)의 내림차순으로 하시오.									
select * from book order by pubdate, bookid desc;								
-- 									
-- 35) 도서(book) 테이블에서 도서의 수량(bookcount)가 10권 미만인 튜플에 대하여 도서분류(bookkind), 도서명(booktitle), 출판사(pubcom) 을 검색하되 그 결과가 저자(author)의 오름차순으로 정렬하여 표시되도록 하시오.									
select bookkind, booktitle, pubcom from book 
where bookcount < 10 			
order by author;					
-- 									
-- 36) 도서(book) 테이블에서 도서분류(bookkind)가 IT, NV, TC가 아닌 레코드의 도서코드(bookid), 도서명(booktitle), 저자(author) 를 검색하되
--  그 결과가 출판일을 기준으로 내림차순되어 표시되도록 하시오.									
select bookid, booktitle, author from book where bookkind not in ('IT', 'NV', 'TC')
order by pubdate desc;							
-- 									
-- 36) 판매(sales) 테이블의 전체 구매 건수를 출력하되 표시되는 컬럼명은 구매건수로 출력될 수 있도록 조회하시오.									
select count(*) as "구매건수" from sales;						
-- 									
-- 37) 판매(sales) 테이블의 회원별 구매 건수를 출력하되 회원아이디(id)와 구매건수를 표시하되 컬럼명은 구매건수로 하며,
--  회원아이디(id)의 오름차순 정렬되어 표시되도록 하시오.+ 구매건수가 2 이상인 회원만 출력								
select id, count(*) as cnt from sales 
group by id having cnt >=2 order by id;			
-- group by 에 의한 조건은 having 문으로 작성
-- + having

-- 38) 판매(sales) 테이블의 도서별 판매금액의 합계를 구하여 표시하되, 도서코드(bno), 판매금액합계 로 출력되게 하시오.									
select bno, sum(money) as "판매금액합계" 
from sales group by bno;			
-- book table의 booktitle join
select s.bno, b.booktitle, sum(s.money) as "판매금액합계" 
from book b inner join sales s on b.bookid = s.bno
group by s.bno, b.booktitle;
-- 연관쿼리
select s.bno, b.booktitle, sum(s.money) as "판매금액합계" 
from book b, sales s where b.bookid = s.bno
group by s.bno, b.booktitle;
-- 									
-- 39) 판매(sales) 테이블에서 가장 큰 판매금액을 출력하되, 회원아이디(id), 도서코드(bno), 판매금액이 표시되도록 하시오.									
select id, bno, money from sales where money = (select max(money) from sales);
-- *답안 : 회원, 도서별 최대판매금액
select id, bno, max(money) as "최대판매금액" from sales
group by id, bno;
-- 									
-- 40) 회원(member) 테이블에서 가입일별 인원수를 구하여 출력하되, 가입일 오름차순으로 출력되도록 하시오.									
select reg_date, count(*) as "인원수" from member group by reg_date order by reg_date;								
-- 									
-- 41) 도서(book) 테이블에서 도서수량(bookcount)가 남은 수량이 적은 것을 기준으로 5위권까지 모든 도서 정보가 출력되도록 하시오.									
select * from book order by bookcount limit 5;
select * from book;
-- 									
-- 42) 판매(sales) 테이블에서 판매금액(money)가 큰 순으로 3위 까지인 튜플의 판매코드(sno), 도서코드(bno), 
-- 회원아이디(id)가 출력될 수 있도록 하시오.									
select sno, bno, id from sales order by money desc limit 3; 								
-- 									
-- 43) 회원 뷰(mem_view)를 생성하되 회원2(member2) 테이블을 활용하고, 회원 데이터 중에서 
-- 가입일을 기준으로 2022년 09월 이후에 가입한 회원을 대상으로 하시오.									
create view mem_view as (select * from member2 where reg_date >= '2022-09-01');
select * from mem_view;
-- 									
-- 44) 판매 뷰(sales_view)를 생성하되 판매2(sales2) 테이블을 활용하고, 판매코드(sno), 도서코드(bno), 
-- 아이디(id), 판매금액(money) 컬럼만 추출되어 생성되게 하시오.									
create view sales_view as (select sno, bno, id, money from sales2);
select * from sales_view;						
-- 									
-- 45) 도서 뷰(book_view)를 생성하되 도서2(book2) 테이블을 활용하고, 도서 데이터 중에서 
-- 도서분류(bookkind)가 'IT', 'TC', 'HC' 인 데이터를 대상으로 하며, 컬럼은 도서분류(bookkind), 
-- 도서명(booktitle), 도서가격(bookprice), 출판사(pubcom) 만으로 구성되게 하시오.									
create view book_view as 
(select bookkind, booktitle, bookprice, pubcom from	book2
where bookkind in ('IT', 'TC', 'HC'));		
select * from book_view;			
-- 									
-- 46) 도서 뷰(book_view)에서 도서가격(bookprice)가 현재 가격에서 10% 인상이 될 수 있도록 데이터를 갱신하시오.									
update book_view set bookprice = bookprice * 1.1;
select * from book2;								
-- 									
-- 47) 판매 뷰(sales_view)를 편집하되 기존 select 구문에서 수량(amount) 가 2이상인 조건을 추가되게 하시오.									
create or replace view sales_view 
as (select sno, bno, id, money from sales2 where amount>=2);
select * from sales_view;						
-- 									
-- 48) 회원 뷰(mem_view)에서 아이디(id)가 y로 끝나는 회원의 데이터를 삭제하시오.									
delete from mem_view where id like '%y';	
select * from member2;							
-- 			
-- 46, 48번은 뷰에 들어있는 테이블의 데이터를 조작하는 것이고,
-- 47번은 뷰에 넣을 데이터를 편집하는 것이므로 필요한 명령이 다름	
					
-- 49) 판매 뷰(sales_view) 를 제거하시오.									
drop view sales_view;											
-- 									
-- 51) 상반기 판매순번 시퀀스(sd_seq)를 만들되 1부터 1씩 증가하도록 생성하시오.									
-- ㅡmariadB와 mySQL은 시퀀스 개념 사용 x
-- 사용하려면 별도 설치가 필요								
-- 52) 상반기 판매순번 시퀀스(sd_seq)를 시작값이 6부터 될수 있도록 수정하시오.												
-- 53) 상반기 판매순번 시퀀스(sd_seq)의 현재값이 조회될 수 있도록 하시오.												
-- 54) 상반기 판매순번 시퀀스(sd_seq)를 제거하시오.	

-- ****											
-- 55) 서브쿼리를 이용하여 구매한 적이 있는 (판매 테이블에 있는) 회원의 이름(name)을 중복성을 제거하여 조회하시오.									
select name from member where id in (select distinct id from sales);	
					
-- 56) 서브쿼리를 이용하여 판매되지 않은 (판매 테이블에 있는) 도서의 정보를 조회하시오.									
select * from book where bookid not in (select bno from sales);
-- 									
-- 57) 서브쿼리를 활용하여 판매 테이블에서 판매금액의 평균이상인 모든 컬럼을 조회하시오.									
select * from sales where money >= (select avg(money) from sales);									
-- 					
-- 58) 내부조인을 활용하여 구매한 회원의 id, name, tel 을 조회하시오.
select distinct a.id, a.name, a.tel from member a inner join sales b
on a.id = b.id;

-- 59) 내부조인 활용하여 구매한 도서의 bookid, booktitle, amount (총판매수량합계) , money(총판매금액) 조회
-- + bookid 기준 오름차순 정렬
select a.bookid, a.booktitle, sum(b.amount) as "총판매수량합계", sum(b.money) "총판매금액"
from book a inner join sales b 
on a.bookid = b.bno
group by a.bookid, a.booktitle
order by a.bookid; 				
									
-- 60) 외부조인을 활용하여 판매되지 않은 도서의 도서명(booktitle), 도서가격(bookprice), 저자(author) 을 조회하시오.									
-- =======  답안  ======
-- outer join을 통해 book 테이블의 정보와 판매전적이 있는 경우 bno가 매칭되는데,
-- 그 데이터중 bno가 null인 값은 매칭된 bno가 없는 것이므로 판매전적이 없는 것
select distinct a.booktitle, a.bookprice, a.author
from book a left outer join sales b
on a.bookid=b.bno
where b.bno is null;

-- =====참고======
-- 위 문제와 동일한 풀이 (외부조인 사용 x)
select distinct booktitle, bookprice, author from book
where bookid not in (select bno from sales);
-- !!!판매된적 있는!!! 도서 정보( 연관쿼리 사용 => 교집합 )
select distinct a.booktitle, a.bookprice, a.author
from book a, sales b
where a.bookid=b.bno;							
-- 판매된적 없는 도서정보 (연관쿼리 사용) ㅣ 공부해보깅
select distinct a.booktitle, a.bookprice, a.author
from book a where not exists (
	select 1 from sales b where a.bookid = b.bno
);
        
-- 61) 외부조인을 활용하여 구매한 적이 없는 회원의 회원아이디(id), 회원명(name) 을 조회하시오.	
-- ======== 답안 =======
select distinct a.id, a.name from member a
left outer join sales b
on a.id = b.id
where b.id is null;


-- =====참고======
-- 구매한 적 없는 회원 정보 (조인 사용 x) 							
select distinct id, name from member where id not in (select id from sales);	

select distinct a.id, a.name
from member a where not exists (
	select 1 from sales b where a.id = b.id
);
	
-- 									
-- 62) 판매(sales)와 판매2(sales2) 테이블을 합집합하여 종합 판매 뷰(tot_sales_view)를 생성하시오. 									
create view tot_sales_view as (
select * from sales
union
select * from sales2);

select * from tot_sales_view;
-- 									
-- 62) 회원(member)와 회원2(member2) 테이블을 교집합하여 중복회원 뷰(cross_mem_view)를 생성하시오. 									
-- 연관쿼리 or inner join 사용하여 연관쿼리 생성	
create view cross_mem_view as (
	select a.id, a.password, a.name, a.address
    from member a, member2 b
    where a.id = b.id);
    
select * from cross_mem_view;
-- 63) 도서(book)와 도서2(book2) 테이블을 차집합하여 도서(book)에만 있는 도서 뷰(minus_book_view)를 생성하시오. 									
create view minus_book_view as
(select bookid, bookkind, booktitle, bookcount from book
where bookid not in (select distinct bookid from book2));
select * from minus_book_view;

create view minus_book_view2 as
(select a.bookid, a.bookkind, a.booktitle, a.bookcount 
from book a left outer join book2 b
on a.bookid = b.bookid
where b.bookid is null);
select * from minus_book_view2;
