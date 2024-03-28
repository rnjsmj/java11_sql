-- 테이블 생성
-- create table 테이블명(컬럼명1 데이터타입 [제약조건], 컬럼명2 ... , ...);
create table member(no int not null, id varchar(20) primary key, pw varchar(300),
        name varchar(100), birth timestamp, email varchar(300));

-- 시퀀스 생성 (Oracle은 auto increment 없음)
create sequence c##test123.mem_seq increment by 1 start with 1 minvalue 1 maxvalue 9999 nocycle;

-- 레코드 추가
-- insert into 테이블명([필드명1, 필드명2, ...]) values(값1, 값2, ...);
insert into member values(mem_seq.nextval, 'kwon', '1234', '권민지', '2001-08-20', 'kwon@gmail.com');
insert into member values(mem_seq.nextval, 'mong', '4321', '몽이', '03-07-10', 'mong@gmail.com');
insert into member values(mem_seq.nextval, 'pidon', 'pass', '피카츄', '93-11-09', 'pidon@gmail.com');
insert into member values(mem_seq.nextval, 'manbozam', '0000', '잠만보', '99-12-25', 'mabozam@naver.com');
insert into member values(mem_seq.nextval, 'pengsu', '9999', '펭수', '01-02-03', 'pengsu@naver.com');
insert into member values(mem_seq.nextval, 'mangom', '7942', '망곰이', '98-07-15', 'mangom@daum.net');

-- 레코드 검색
-- select 컬럼명1, 컬럼명2, ... from 테이블명 [whrer 조건절];
select * from member;           -- member 테이블의 모든 필드
select id, name, birth from member where birth <= '2000-01-01'; -- 선택필드와 조건
select id, name, birth from member where birth between '1995-01-01' and '1999-12-31';
select id, name from member where id like '%i%' or id like '%g%'; -- % : 모든 문자열
select * from member where id = 'kwon' or id='mong' or id='pengsu';
select * from member where id in ('kwon', 'mong', 'pengsu'); -- in : 해당 조건을 포함하는 경우
select * from member where id not in ('kwon', 'mong', 'pengsu'); -- not in : 해당 조건을 포함하면 제외
select id, name, substr(name, 1, 1) as surname from member; -- substr(필드, 시작위치, 글자수) / as : 컬럼 alias 지정 (컬럼명이 길거나 수식 적용한 경우)

-- 레코드 수정
-- update 테이블명 set 컬럼명1 = 변경값1 | 계산식 [where 조건절];
update member set email = 'pikachu@gmail.com' where id = 'pidon';

-- 레코드 삭제
-- delete from 테이블명 [where 조건절];
-- 조건절이 없으면 테이블 내 모든 데이터 delete 됨
delete from member where id='pidon';


-- 테이블 구조 변경
-- alter table 테이블명 [옵션]; => add, rename, ...
-- 테이블 컬럼 추가 : alter table 테이블명 add 컬럼명 데이터타입 [추가 옵션];
alter table member add regdate timestamp default sysdate;
-- 컬럼 이름 변경 : alter table 테이블명 rename column 컬럼명 to 변경컬럼명;
alter table member rename column regdate to reg;
-- 컬럼 타입 변경 : alter table 테이블명 modify 컬럼명 변경데이터타입 [제약 조건];
alter table member modify pw varchar(200);
-- 컬럼 제거 : alter table 테이블명 drop column 삭제컬럼명;
alter table member add point int default 0;
alter table member drop column point;
-- 테이블 이름 변경 : alter table 테이블명 rename to 변경테이블명;
alter table member rename to temp1;

-- 테이블 구조 확인
-- desc 테이블명;
desc member;
desc temp1;



--
create table temp2 (no int, name varchar(200), point int);
insert into temp2 values(1, '김', 90);
insert into temp2 values(2, '박', 80);
insert into temp2 values(3, '최', 95);
insert into temp2(name, point) values('이', 70);

delete from temp2 where no is null;

-- 제약조건(기본키) 추가 : alter table 테이블명 add constraints 조건명 primary key (컬럼명);
-- 제약조건 설정 시 조건이 만족되지 않으면 실행 불가
alter table temp2 add constraints key1 primary key (no);

select * from temp2;



-- 테이블 참조 (참조무결성 강화 => 외래키 지정)
-- 테이블 생성 시 기본키 지정하는 다른 방법
create table emp(no int, name varchar(100), pcode int, constraints key2 primary key (no));
insert into emp values(1, '김', 1);
insert into emp values(2, '이', 2);
insert into emp values(3, '박', 3);
insert into emp values(4, '최', 4);
insert into emp values(5, '한', 5);
--delete from emp where no = 5;

create table pos(pcode int primary key, pname varchar(100));
insert into pos values(1, '이사');
insert into pos values(2, '부장');
insert into pos values(3, '과장');
insert into pos values(4, '사원');

insert into pos values(5, '인턴');

select * from emp;
select * from pos;

-- 외래키 제약조건 추가 : alter table 테이블명 constraints 조건명 foreign key (컬럼명) 
--                      references 참조테이블명(참조컬럼명);
-- 참조하려고 하는 테이블의 컬럼에 참조값이 모두 존재해야 외래키 설정 가능
-- emp의 pcode는 pos의 pcode를 참조 => 참조되지 않으면 무결성 제약조건 위배로 insert 불가
alter table emp add constraints fkey foreign key (pcode) references pos(pcode);

-- 제약조건 검색 (대문자) : select * from all_constraints [where 조건절]
select * from all_constraints where owner='C##TEST123';
select * from all_constraints where table_name='EMP';

-- 기본키 제약조건 제거
-- alter table 테이블명 drop constraint 제약조건명
alter table emp drop constraint key2;

-- 테이블 제거 : drop table 테이블명 [옵션]
-- 참조테이블을 지우면 기존 테이블의 참조무결성이 없어지므로 제거 불가능
-- => cascade : 연쇄삭제 (제약조건때문에 테이블을 제거할 수 없는 경우 테이블과 함께 제약조건도 연쇄적으로 제거)
drop table pos cascade constraints; 

desc pos;
desc emp;


-- view
-- 뷰 생성 : create view 뷰명 as select * from 테이블명 
create view view_emp as select * from emp;
create view view_emp2 as select * from emp where no >=3;
select * from view_emp;
-- 실행문이 view에 담김 => 실제 테이블이 아니므로 insert, update, delete 불가
-- 뷰 제거
drop view view_emp;
-- 일반적으로 뷰 수정 x (오류 발생)
-- alter view view_emp2 as select * from emp where >=2;


-- sequence (자동순번)
-- 시퀀스 생성 : create sequence 시퀀스명 increment by 증가값 start with 시작값 minvalue 최소값 maxvalue 최대값 [nocycle ...];
create sequence emp_seq increment by 1 start with 6 minvalue 1 maxvalue 9999 nocycle;
-- 시퀀스 수정 : alter sequence 시퀀스명 수정내용; (시작번호 변경 불가)
alter sequence emp_seq increment by 1;
-- 시퀀스 삭제 : drop sequence 시퀀스명;
drop sequence emp_seq;
-- 시퀀스 조회 : select * from all_sequences where sequence_name = 시퀀스명;
select * from all_sequences where sequence_name = 'EMP_SEQ';
-- nextval : 시퀀스의 다음 순번
insert into emp values(emp_seq.nextval, '신', 3);
-- currval : 시퀀스의 현재 순번
select emp_seq.currval from dual;



-- table 복제 => 제약조건은 복제 불가, 테이블 구조만 복제됨
create table emp2 as select * from emp;
desc emp2;
select * from emp2;

commit;


