create table student (
		stu_id 		varchar2(10),
		resident_id 	varchar2(14) not null,
		name 		varchar2(10) not null,
		year 		int,
		address 	varchar2(10),
		dept_id 	varchar2(10),
		constraint pk_student 	primary key(stu_id),
		constraint fk_student 	foreign key(dept_id) references 
					department(dept_id)
	)

create table department (
		dept_id 	varchar2(10),
		dept_name 	varchar2(20) not null,
		office 		varchar2(20),
		constraint pk_department primary key(dept_id)
	)
	
CREATE TABLE professor (
	prof_id		varchar2(10),
	resident_id		varchar2(14)	NOT null,
	name		varchar2(10)		NOT null,
	dept_id		varchar2(10),
	position		varchar2(10),
	year_emp	int,
		constraint 	pk_professor 	primary key(prof_id),
		constraint 	fk_professor 	foreign key(dept_id) 
					references department(dept_id)
	)
	
