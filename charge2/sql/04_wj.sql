create table charge(
  charge_id varchar(32) primary key,
  charge_sid varchar(32) not null,
  charge_money double,
  charge_type varchar(30),
  charge_date varchar(19),
  constraint charge_fk foreign key(charge_sid) references students(stud_id)
); 

