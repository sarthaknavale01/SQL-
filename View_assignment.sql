/*
View Assignment
Create 2 tables:
Employee & Departments withappropriate columns as per the below question and also perform the below task.Q
*/
use company;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

INSERT INTO Departments (department_id, department_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'IT'),
(6, 'Marketing'),
(7, 'Human Resources'),
(8, 'Finance'),
(9, 'IT'),
(10, 'Human Resources');

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Employees VALUES
(101, 'Amit', 'Sharma', 60000, 1),
(102, 'Priya', 'Verma', 120000, 2),
(103, 'Rahul', 'Singh', 95000, 3),
(104, 'Neha', 'Gupta', 110000, 4),
(105, 'Karan', 'Mehta', 70000, 5),
(106, 'Sneha', 'Patel', 130000, 6),
(107, 'pavan', 'Singh', 95000, 7),
(108, 'nilish', 'Gupta', 150000, 8),
(109, 'gaurav', 'Mehta', 700000, 9),
(110, 'suraj', 'Patel', 1300000, 10);

-- 1:Create a view named Employee_Salary_View that displays the employee_id,first_name, last_name,
-- and salary columns from the employees table.

create view employee_salary as 
select employee_id,first_name,last_name, salary
from employees e
join departments d 
on e.department_id = d.department_id


select * from employee_salary;

-- Q2:Create a view named Department_Salary_Avg that shows the average salary per department.
--  The viewshould display the department_id and the average_salary for each department.

create view department_avg_salary as 
select d.department_name ,avg(salary) as avg_salary
from departments d 
join employees e
on d.department_id = e.department_id
group by d.department_name;


select * from department_avg_salary;

-- Q3:Suppose you have a view named Employee_View that combines data from the employees table and the departments table.
--  Write an SQL statement to update the salary of an employee by 500 through the view?Hint: You need to make sure the view is updatable.

create view employee_view as 
select e.employee_id,first_name,last_name,salary,d.department_id,department_name
from employees e
join departments d
on e.department_id = d.department_id

select * from employee_view;

update employee_view set salary = salary + 500 ;


-- Q4:Create a view calledEmployee_Department_View that shows the employee_id, first_name, last_name,
--  anddepartment_name by joining the employees and departments tables.Assume employees.department_id references departments.department_id.

create view employee_department_view as
select employee_id,first_name,last_name,department_name
from employees e
join departments d 
on e.department_id =d.department_id 

select * from employee_department_view;

-- Q5:Create a view called High_Paid_Employees that lists all employees who earn more than $100,000.
--  The view should display the employee_id, first_name, last_name, and salary columns.

create view high_paid_employee as 
select  employee_id ,first_name,last_name,salary 
from employees 
where salary > 1000000;

select * from high_paid_employee

-- Q6:Create a view called Employee_Bonus_View that shows the employee's employee_id, first_name,last_name, salary,
--  and their calculated bonus (20% of salary) as bonus. Use theROUND function to round the bonus to two decimal places.

create view employee_bonus as
select employee_id,first_name,last_name,salary,
round(salary *20 /100 ,2) as bonous_salary
from employees 

select * from employee_bonus