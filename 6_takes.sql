drop table takes;
	create table takes 
	(
		stu_id 		varchar2(10) ,
		class_id 		varchar2(10),
		grade 		char(5),
		constraint 	pk_takes 		primary key(stu_id, class_id),
		constraint 	fk_takes1 		foreign key(stu_id) 
				references 	student(stu_id),
		constraint 	fk_takes2 		foreign key(class_id) 
				references 	class(class_id)
	);
insert into takes values('1292001', 'C101-01', 'B+');
insert into takes values('1292001', 'C103-01', 'A+');
insert into takes values('1292001', 'C301-01', 'A');
insert into takes values('1292002', 'C102-01', 'A');
insert into takes values('1292002', 'C103-01', 'B+');
insert into takes values('1292002', 'C502-01', 'C+');
insert into takes values('1292003', 'C103-02', 'B');
insert into takes values('1292003', 'C501-02', 'A+');
insert into takes values('1292301', 'C102-01', 'C+');
insert into takes values('1292303', 'C102-01', 'C');
insert into takes values('1292303', 'C103-02', 'B+');
insert into takes values('1292303', 'C501-01', 'A+');
