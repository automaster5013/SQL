drop table class;
create table class 
(
	class_id 		varchar2(10) ,
	course_id 	varchar2(10),
	year 		int,
	semester 		int,
	division 		char(1),
	prof_id 		varchar2(10),
	classroom 	varchar2(9),
	enroll 		int,
	constraint 	pk_class 		primary key(class_id),
	constraint 	fk_class1		foreign key(course_id) 
			references  	course(course_id),
	constraint 	fk_class2 		foreign key(prof_id) 
			references 	professor(prof_id)
);
insert into class values('C101-01', 'C101', 2012, 1, 'A', '92301', '301호', 40);
insert into class values('C102-01', 'C102', 2012, 1, 'A', '92001', '209호', 30);
insert into class values('C103-01', 'C103', 2012, 1, 'A', '92501', '208호', 30);
insert into class values('C103-02', 'C103', 2012, 1, 'B', '92301', '301호', 30);
insert into class values('C501-01', 'C501', 2012, 1, 'A', '92501', '103호', 45);
insert into class values('C501-02', 'C501', 2012, 1, 'B', '92502', '204호', 25);
insert into class values('C301-01', 'C301', 2012, 2, 'A', '92502', '301호', 30);
insert into class values('C302-01', 'C302', 2012, 2, 'A', '92501', '209호', 45);
insert into class values('C502-01', 'C502', 2012, 2, 'A', '92001', '209호', 30);
insert into class values('C502-02', 'C502', 2012, 2, 'B', '92301', '103호', 26);
