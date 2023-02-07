create database student_list;
use student_list;
create table student(
id int primary key auto_increment,
name varchar(50),
point double
);
insert into student (id,name,point) values
(1,'nghia',100),
(2,'tai',80),
(3,'dinh',50),
(4,'lan',60);
