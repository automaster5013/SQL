DROP TABLE course;
create table course 
	(
		course_id 	varchar2(10) ,
		title 		varchar2(28) 	not null,
		credit 		int,
		constraint 	pk_course 	primary key(course_id)
	);
insert into course values('C101', '전산개론', 3);
insert into course values('C102', '자료구조', 3);
insert into course values('C103', '데이터베이스', 4);
insert into course values('C301', '운영체제', 3);
insert into course values('C302', '컴퓨터구조', 3);
insert into course values('C303', '이산수학', 4);
insert into course values('C304', '객체지향언어', 4);
insert into course values('C501', '인공지능', 3);
insert into course values('C502', '알고리즘', 2);
