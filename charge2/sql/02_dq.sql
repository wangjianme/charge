create table students(
	stud_uuid varchar(32),
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

//增加一系列非空约束
alter table students modify stud_name varchar(32) not null;
alter table students modify stud_gender varchar(1) not null;
alter table students modify stud_birth varchar(6) not null;
alter table students modify stud_education varchar(32) not null;
alter table students modify stud_major varchar(32) not null;
alter table students modify stud_graduationdate varchar(6) not null;
alter table students modify stud_class varchar(32) not null;
alter table students modify stud_tuition varchar(5) not null;

//增加stud_uuid的主键约束
alter table students add constraint pk_stud_uuid primary key (stud_id);

//增加stud_id的唯一约束
alter table students add constraint uc_stud_from unique (stud_id);

//增加stud_gender的检查约束
alter table students add constraint chk_stud_gender check (stud_gender=0 or stud_gender=1);

//增加stud_from的唯一约束
alter table students add constraint uc_stud_from unique (stud_from);

//增加stud_from的外键约束,依赖于source表的source_id
alter table students add constraint fk_stud_from foreign key (stud_from) references source(source_id);

//增加stud_class的外键约束,依赖于claz表的claz_id
alter table students add constraint fk_stud_class foreign key (stud_class) references claz(claz_id);

//删除某学生:查询charge表是否有缴费记录,有则不能删除



//测试用:强制删除某条数据(先使外键约束失效,再删除某条数据)
set foreign_key_checks = 0;
delete from students where stud_id=?;
set foreign_key_checks = 1;


//测试用
INSERT INTO students VALUES ('01','01','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('02','02','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('03','03','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('04','04','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('05','05','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('06','06','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('07','07','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('08','08','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('09','09','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('10','10','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('11','11','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('12','12','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('13','13','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('14','14','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('15','15','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('16','16','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('17','17','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('18','18','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('19','19','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('20','20','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('21','21','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('22','22','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('23','23','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('24','24','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('25','25','1','1','1','1','1','1','1','1','1','1','1');

//测试用(供charge表使用)
INSERT INTO students VALUES ('charge01','01_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge02','02_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge03','03_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge04','04_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge05','05_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge06','06_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge07','07_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge08','08_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge09','09_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge10','10_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge11','11_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge12','12_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge13','13_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge14','14_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge15','15_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge16','16_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge17','17_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge18','18_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge19','19_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge20','20_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge21','21_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge22','22_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge23','23_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge24','24_charge','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO students VALUES ('charge25','25_charge','1','1','1','1','1','1','1','1','1','1','1');

//测试用(供class表使用)
INSERT INTO students VALUES ('02class01','01class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class02','02class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class03','03class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class04','04class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class05','05class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class06','06class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class07','07class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class08','08class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class09','09class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class10','10class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class11','11class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class12','12class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class13','13class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class14','14class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class15','15class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class16','16class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class17','17class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class18','18class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class19','19class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class20','20class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class21','21class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class22','22class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class23','23class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class24','24class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');
INSERT INTO students VALUES ('02class25','25class02','1','1','1','1','1','1','1','da90560a97d34ffd983c275d711de5b5','1','1','1');

INSERT INTO students VALUES ('01class01','01class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class02','02class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class03','03class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class04','04class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class05','05class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class06','06class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class07','07class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class08','08class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class09','09class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class10','10class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class11','11class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class12','12class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class13','13class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class14','14class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class15','15class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class16','16class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class17','17class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class18','18class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class19','19class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class20','20class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class21','21class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class22','22class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class23','23class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class24','24class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');
INSERT INTO students VALUES ('01class25','25class01','1','1','1','1','1','1','1','2bd74117e92644a3970125e746a6c78e','1','1','1');