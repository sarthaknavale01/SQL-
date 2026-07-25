-- Assignment on Inner Join-- 
/*
Consider the following tablesrepresenting a library system:
1.   Book(book_id,title,author_id,genre)
2.   Author(author_id,first_name,last_name)
3.Members(member_id,first_name,last_name,membership_type)
4.Loan(loan_id,book_id,member_id,loan_date,return_date) */


-- Solve all the queries for the same using Inner joins
use sys;
create table book(
book_id int ,
title varchar(90) ,
auther_id int,
genre varchar(90) );

create table auther (
auther_id int,
first_name varchar(90),
last_name varchar(80) );

create table members(
member_id int,
first_name varchar(70),
last_name varchar(60),
membership_type varchar (60) );

create table Loan(
loan_id int,
book_id int,
member_id int,
loan_date date,
return_date date );

-- Insert into auther table
insert into auther values
(1,'Chetan','Bhagat'),
(2,'J.K.','Rowling'),
(3,'George','Orwell'),
(4,'Paulo','Coelho'),
(5,'R.K.','Narayan'),
(6,'Agatha','Christie'),
(7,'Dan','Brown'),
(8,'Premchand','Sharma'),
(9,'Arthur','Doyle'),
(10,'William','Shakespeare');


-- Insert into book table
insert into book values
(101,'The Alchemist',4,'Fiction'),
(102,'Harry Potter',2,'Fantasy'),
(103,'1984',3,'Dystopian'),
(104,'Five Point Someone',1,'Drama'),
(105,'Malgudi Days',5,'Classic'),
(106,'Murder on the Orient Express',6,'Mystery'),
(107,'The Da Vinci Code',7,'Thriller'),
(108,'Godan',8,'Novel'),
(109,'Sherlock Holmes',9,'Detective'),
(110,'Hamlet',10,'Tragedy');



-- Insert into members table
insert into members values
(201,'Rahul','Sharma','Gold'),
(202,'Priya','Patil','Silver'),
(203,'Amit','Verma','Gold'),
(204,'Sneha','Joshi','Bronze'),
(205,'Rohan','Gupta','Silver'),
(206,'Neha','Kulkarni','Gold'),
(207,'Karan','Mehta','Bronze'),
(208,'Pooja','Yadav','Silver'),
(209,'Arjun','Singh','Gold'),
(210,'Kavita','Mishra','Bronze');



-- Insert into Loan table
insert into Loan values
(1,101,201,'2026-01-10','2026-01-20'),
(2,102,202,'2026-01-12','2026-01-22'),
(3,103,203,'2026-01-15','2026-01-25'),
(4,104,204,'2026-01-18','2026-01-28'),
(5,105,205,'2026-01-20','2026-01-30'),
(6,106,206,'2026-02-01','2026-02-11'),
(7,107,207,'2026-02-05','2026-02-15'),
(8,108,208,'2026-02-08','2026-02-18'),
(9,109,209,'2026-02-10','2026-02-20'),
(10,110,210,'2026-02-12','2026-02-22');

-- Q1: Retrieve a list of book titles,authors’ names, and genres for books that have been loanedout
select * from book ;
select * from auther;
select * from loan;
select * from members;

select title,first_name,last_name,genre
from book b
inner join auther a
on b.auther_id = a.auther_id
join loan l
on l.book_id = b.book_id;


-- Q2: Retrieve all books and their authors, but only show books that have been loaned to members.
select b.book_id,b.title,b.genre,a.first_name,a.last_name
from book b
join auther a
on b.auther_id = a.auther_id
join loan l 
on b.book_id = l.book_id 
join members m
on m.member_id = l.member_id 

-- Q3: List members and the books they have borrowed, only including those who have actually borrowed books.
select m.member_id , m.first_name,m.last_name,m.membership_type
from members m
join loan l
on m.member_id = l.member_id
join book b
on b.book_id = l.book_id


-- Q4: List the titles of books and the authors of books that have been returned (have a return_date).
select b.title,a.first_name,a.last_name ,l.return_date
from book b
join auther a
on b.auther_id = a.auther_id
join loan l
on l.book_id = b.book_id
where loan_date is not null 

-- Q5: List the authors and books that are being currently borrowed (books with no return_date).
select a.first_name,a.last_name,b.title 
from auther a
join book b
on a.auther_id = b.auther_id
join loan l 
on l.book_id = b.book_id 
where return_date is null 
