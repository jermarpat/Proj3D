-- createTables.sql
drop sequence if exists users_id_seq cascade;
create sequence users_id_seq;

drop table if exists users cascade;
create table users(
   id integer not null default nextval('users_id_seq'),
   first_name varchar(40),
   last_name varchar (50),
   username text unique,
   password text,
   department varchar(30),
   division varchar (30),
   primary key (id)
);

insert into users (first_name, last_name, username, password, department, division)
   values('Admin','Admin','admin',md5('admin'),'admin','admin');
insert into users (first_name, last_name, username, password, department, division)
   values('Jane','Doe','janedoe',md5('janey'),'div1','div1');
insert into users (first_name, last_name, username, password, department, division)
   values('John','Doe','johndoe',md5('john'),'deptA', 'div1');
insert into users (first_name, last_name, username, password, department, division)
   values('Bill','Gates','billgates',md5('windows'),'deptB','div1');
insert into users (first_name, last_name, username, password, department, division)
   values('Marissa','Hirakawa','marissah',md5('marissa'),'deptA', 'div1');
insert into users (first_name, last_name, username, password, department, division)
   values('Patrick','Tanaka','patt',md5('pat'),'deptB','div1');
