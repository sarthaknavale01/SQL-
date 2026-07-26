use ds_batch;
use sys;
-- Assignment on EquiJoin
create table employees(
empid int,
first_name varchar(80) ,
last_name varchar(70) ,
joining_date date );

alter table employees drop column salary ;

create table department(
empid int,
dept varchar(70),
salary float ); 

-- Insert values into employees table

insert into employees values
(101,'Rahul','Sharma','2022-01-15'),
(102,'Priya','Patil','2021-03-20'),
(103,'Amit','Verma','2020-07-11'),
(104,'Sneha','Joshi','2023-02-18'),
(105,'Rohan','Gupta','2021-11-05'),
(106,'Neha','Kulkarni','2022-06-25'),
(107,'Karan','Mehta','2019-09-10'),
(108,'Pooja','Yadav','2020-12-01'),
(109,'Arjun','Singh','2023-04-14'),
(110,'Kavita','Mishra','2021-08-30');


-- Insert values into department table

insert into department values
(101,'IT',55000),
(102,'Sales',42000),
(103,'HR',48000),
(104,'Marketing',45000),
(105,'Finance',60000),
(106,'IT',52000),
(107,'Sales',41000),
(108,'HR',47000),
(109,'Marketing',46000),
(110,'Finance',62000);

-- Q1:Write an SQL query using Equi Join to retrieve a list of employee names along with their department names.
select * from employees;
select * from department;

select e.first_name,e.last_name,d.dept
from employees e ,department d
where e.empid = d.empid

-- Q2:Write an SQL query to find the names of employees who have been working in IT departments.
select first_name,last_name,dept
from employees e , department d 
where e.empid = d.empid and  dept = 'it' 

-- Q3:Write an SQL query to find the names of employees who work in the Sales department and were hired after January 1, 2023.
select first_name, last_name, dept,joining_date
from employees e , department d 
where e.empid = d.empid and dept = 'it' and joining_date < 01-01-2023

-- Q4:Write an SQL query to count how many employees work in each department. Return the department name and the number of employees 
-- in that department. Use Equi Join and GROUP BY.
select d.dept ,count(e.empid) as total_emp
from employees e ,department d
where e.empid = d.empid 
group by d.dept


-- Q5: Write an SQL query to find the highest-paid employee in each department. Include the employee name, department name,
--  and salary. Use EquiJoin to join the Employees and Departments tables and GROUP BY to find the maximum salary per department.
select e.first_name,
e.last_name,
d.dept,
d.salary
from employees e, department d
where e.empid = d.empid and
 (d.dept ,d.salary ) in
 ( select dept,max(salary) from department
group by dept);
