create table depts(
	dept_id varchar(32) primary key,
	dept_name varchar(30) not null,
	dept_parent varchar(30) not null,
	dept_desc varchar(200)
	);
	
create table claz(
	claz_id varchar(32) primary key,
	claz_name varchar(30) not null,
	claz_desc varchar(200)
	);

create table users(
	user_id varchar(32) primary key,
	user_name varchar(20) not null,
	user_pwd varchar(32) not null,
	user_sex char(1) check(user_sex in ('0','1')),
	user_rtime varchar(19) not null,
	user_tel varchar(50),
	user_email varchar(50),
	user_ques varchar(100) not null,
	user_answer varchar(32) not null
	);

create table roles(
	role_id varchar(32) primary key,
	role_name varchar(30) not null,
	role_candel char(1) default '1',
	role_desc varchar(200)
	);
	
create table menus(
	menu_id varchar(32) primary key,
	menu_text varchar(40) not null,
	menu_leaf char(1),
	menu_url varchar(100) not null
	);


create table assi(
	as_userid varchar(32) ,
	as_roleid varchar(32) ,
	primary key (as_userid,as_roleid) ,
	foreign key (as_userid) references users(user_id),
	foreign key (as_roleid) references roles(role_id)
	);

create table auth(
	au_userid varchar(32) unique,
	au_deptid varchar(32) ,
	foreign key (au_userid) references users(user_id),
	foreign key (au_deptid) references depts(dept_id)
);

create table func(
	func_roleid varchar(32) ,
	func_menuid varchar(32) ,
	foreign key (func_roleid) references roles(role_id),
	foreign key (func_menuid) references menus(menu_id)
	);


create table log(
	log_id varchar(32) primary key,
	log_userid varchar(32),
	log_time varchar(19) not null,
	log_oper varchar(50),
	foreign key (log_userid) references users(user_id)
	);
	
	