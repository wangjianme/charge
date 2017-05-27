create table students(
	stud_uuid varchar(32) primary key,
	stud_id varchar(32),
	stud_name varchar(32),
	stud_gender char(1),
	stud_birth varchar(6),
	stud_education varchar(32),
	stud_major varchar(32),
	stud_graduationdate varchar(6),
	stud_resume varchar(100),
	stud_class varchar(32),
	stud_from varchar(32),
	stud_tuition double,
	stud_picture varchar(100)
);