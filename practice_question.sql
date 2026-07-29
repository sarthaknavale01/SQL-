CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;


CREATE TABLE Worker1 (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME varchar(25),
	LAST_NAME varchar(25),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT varchar(25)
);


INSERT INTO Worker1 VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09:00:00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09:00:00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09:00:00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09:00:00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09:00:00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09:00:00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09:00:00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09:00:00', 'Admin');
        

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker1(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE varchar(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker1(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 
 select * from worker1;
 select * from title;
 select * from bonus;
 
 
 -- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
 
 select first_name as worker_name from worker1
 
-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

select upper(first_name) as uppercase from worker1

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

select distinct department from worker1 

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.

select left(first_name,3) as first_3 from worker1; 

-- Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.

SELECT FIRST_NAME, INSTR(FIRST_NAME, 'a') as location
FROM Worker1
WHERE FIRST_NAME = 'Amitabh';

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

select rtrim(first_name) from worker1;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.

select ltrim(department) from worker1;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

select distinct length(department) as lenght ,department from worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.

select replace(first_name , 'a','A') as rep FROM WORKER1;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.

select concat(first_name,' ',last_name) as full_name from worker1;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

select * from worker1 
order by first_name asc;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

select * from worker1 
order by first_name asc ,department desc;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

select * from worker1 where first_name in ('vipul','satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.

select * from worker1 where first_name not in ('vipul','satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

select * from worker1 where department = 'admin'

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

select * from worker1 where first_name like '%a%';
select * from worker1 where first_name regexp 'a';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

select * from worker1 where first_name like '%a';
select * from worker1 where first_name regexp 'a$';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

select * from worker1 where first_name like '%h' and first_name like '______';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

select * from worker1 where salary between 100000 and 500000 ;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.

select * from worker where month(joining_date)= 2 and year(joining_date) =2014

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’. 

select department,count(worker_id) as total 
from worker 
group by department 
having department = 'admin'

rename table worker1 to worker

-- Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

select first_name ,last_name ,salary
from worker
where salary >= 50000 and salary <= 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.

select department , count(worker_id) as total 
from worker
group by department 
order by department desc

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.

select *
from worker w
inner join title t
on w.worker_id = t.worker_ref_id
where t.worker_title = 'manager';

-- Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

select first_name,last_name,count(*)
from worker 
group by first_name,last_name
having count(*) > 1;


-- Q-26. Write an SQL query to show only odd rows from a table.

select * from worker where worker_id % 2 =1;

-- Q-27. Write an SQL query to show only even rows from a table.

select * from worker where worker_id % 2 =0;

-- Q-28. Write an SQL query to clone a new table from another table.

create table workers as select * from worker;
select * from workers ;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
-- intersect is not available in mysql we intersecting record using inner join 

select * from worker
inner join bonus
on worker.worker_id = bonus.worker_ref_id;

-- Q-30. Write an SQL query to show records from one table that another table does not have.
select * from worker
left join bonus
on worker.worker_id = bonus.worker_ref_id
where worker_ref_id is null;


-- Q-31. Write an SQL query to show the current date and time.

select current_timestamp() from dual;

-- Q-32. Write an SQL query to show the top n (say 10) records of a table.

select * from worker limit 10;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

SELECT DISTINCT salary
FROM worker
ORDER BY salary DESC
LIMIT 1 offset 4;

select * from worker;

-- Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.

select salary from(
select salary,dense_rank() over(order by salary desc) as rnk
from worker)t
where rnk =5;

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.

select * from worker where salary in 
( select salary from worker group by salary 
having count(*) > 1 );

-- Q-36. Write an SQL query to show the second highest salary from a table.

select max(salary) as second_higest from worker where 
salary < (select max(salary) from worker);

select salary from(
select salary , dense_rank() over (order by salary desc) as second_higest
from worker
)t
where second_higest = 2;


-- Q-37. Write an SQL query to show one row twice in results from a table.
select * from worker
union all 
select * from worker;

-- Q-38. Write an SQL query to fetch intersecting records of two tables.

select * from worker
inner join bonus 
on worker.worker_id = bonus.worker_ref_id;

-- Q-39. Write an SQL query to fetch the first 50% records from a table.

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY worker_id) AS rn,
           COUNT(*) OVER () AS total
    FROM worker
) t
WHERE rn <= total/2;

-- Q-40. Write an SQL query to fetch the departments that have less than five people in it.

select *  from worker where department in(
select department from worker group by department 
having count(*) < 5)

-- Q-41. Write an SQL query to show all departments along with the number of people in there.

select count(worker_id) as total_employee,department 
from worker 
group by department ;

-- Q-42. Write an SQL query to show the last record from a table.

select * from worker
 order by worker_id desc 
limit 1;

-- Q-43. Write an SQL query to fetch the first row of a table.

select * from worker
 order by worker_id asc
limit 1;

-- Q-44. Write an SQL query to fetch the last five records from a table.

select * from worker
 order by worker_id desc
limit 5;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

select max(salary) as higest_salary,department
from worker
group by department

-- Q-46. Write an SQL query to fetch three max salaries from a table.

select distinct salary from worker
order by salary desc
limit 3;

-- Q-47. Write an SQL query to fetch three min salaries from a table.

select distinct salary from worker
order by salary asc
limit 3;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.

select distinct salary from worker
order by salary desc
limit 4,1;

select distinct salary from worker order by salary desc;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them. 

select department,sum(salary)
from worker 
group by department

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.

select first_name,last_name,salary
from worker 
where salary = (select max(salary) from worker)