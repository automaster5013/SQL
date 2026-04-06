drop table department;
drop table student;
create table department 
(
	dept_id 		varchar2(10),
	dept_name 	varchar2(20) not null,
	office 		varchar2(20),
	constraint pk_department primary key(dept_id)
);
create table student 
(
	stu_id 			varchar2(10),
	resident_id 	varchar2(15) not null,
	name 			varchar2(10) not null,
	year 			int,
	address 		varchar2(10),
	dept_id 		varchar2(10),
	constraint pk_student 	primary key(stu_id),
	constraint fk_student 	foreign key(dept_id) references 
		department(dept_id)
);
insert into department values('920', '컴퓨터공학과', '201호');
insert into department values('923', '산업공학과', '207호');
insert into department values('925', '전자공학과', '308호');

insert into student values('1292001', '900424*1825409', '김광식', 3, '서울', '920');
insert into student values('1292002', '900305*1730021', '김정현', 3, '서울', '920');
insert into student values('1292003', '891021*2308302', '김현정', 4, '대전', '920');
insert into student values('1292301', '890902*2704012', '김현정', 2, '대구', '923');
insert into student values('1292303', '910715*1524390', '박광수', 3, '광주', '923');
insert into student values('1292305', '921011*1809003', '김우주', 4, '부산', '923');
insert into student values('1292501', '900825*1506390', '박철수', 3, '대전', '925');
insert into student values('1292502', '911011*1809003', '백태성', 3, '서울', '925');
