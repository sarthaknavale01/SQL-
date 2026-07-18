-- constraints in sql --
describe customers ;

-- unique : duplicates values are not aalowed--
-- primary key : duplicates and null values are not allowed--
-- not null : null values are not allowed --
-- check :it require the value of database are corrct based on condition--
-- fk: it is foregin key when a table pk goes into another table it act like fk--
-- default : when no values is inserted in column then it take default value as you taken--
-- auto_increment : it genretes num number automaticlly when new records is inserted--

create table professor (pid int primary key ,pname varchar(80) not null);

insert into professor values (101,'abs')

create table student(
sid int primary key  auto_increment ,
sname varchar(87) not null ,
email varchar(80) ,
contact int not null constraint cno check(contact = 10),
address varchar (80) default "pune",
age int constraint chk_age  check (age>=18),
constraint chk_em unique (email) );