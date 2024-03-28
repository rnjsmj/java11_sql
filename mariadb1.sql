show databases; -- DB 목록
use temp; -- DB 선택

desc student; -- table 구조

insert into student values(10, "평창수", 98);
select * from student;
delete from student where no=1;

insert into student values(1, '기본1', 60);
insert into student values(2, '기본2', 94);
insert into student values(3, '기본3', 74);
insert into student values(4, '기본4', 15);
insert into student values(5, '기본5', 64);