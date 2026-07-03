-- how to create database 
create database collage
use collage

-- create table Student with column rollno,first_name,last_name,birthdate.
    CREATE TABLE student (
    rollno INT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    birthdate DATE 
    )
    
-- Insert 10 records into student table.

INSERT INTO student (rollno,first_name,last_name,birthdate) values
(51,'sarthak','navale','2004-09-20'),
(52,'sk','patil','2005-02-15'),
(53,'gaueav','dk','2006-02-19'),
(54,'sp','jadhav','1915-05-04'),
(55,'amruta','patil','1945-02-09'),
(56,'pallavi','jadhav','1916-01-05'),
(57,'saurabjh','patil','2008-03-06'),
(58,'sunil','shinde','2004-04-19'),
(59,'dapali','nile','1926-01-08'),
(60,'shri','wagh','2008-05-07');

-- show data from table 
select* from student

-- Add 3 duplicate records into table.

insert into student values
(51,'sarthak','navale','2004-09-20'),
(52,'sk','patil','2005-02-15'),
(53,'gaueav','dk','2006-02-19');

select * from studentinfo

-- Display first_name,last_name from student.

select first_name ,last_name from student

-- Display all record from student.

select * from student