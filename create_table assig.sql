/*
Assignment
Consider the following tables representing a library system:
1.   Book(book_id,title,author_id,genre)
2.   Author(author_id,first_name,last_name)
3.Members(member_id,first_name,last_name,membership_type)
4.Loan(loan_id,book_id,member_id,loan_date,retur
n_date)
Solve the queries for the same.
*/
alter table members add column auther_id int after membership_type;

UPDATE members
SET auther_id = 4
WHERE member_id = 201;
UPDATE members
SET auther_id = 3
WHERE member_id = 202;
UPDATE members
SET auther_id = 2
WHERE member_id = 203;
UPDATE members
SET auther_id = 1
WHERE member_id = 204;
UPDATE members
SET auther_id = 5
WHERE member_id = 205;
UPDATE members
SET auther_id = 6
WHERE member_id = 206;
UPDATE members
SET auther_id = 7
WHERE member_id = 207;
UPDATE members
SET auther_id = 8
WHERE member_id = 208;
UPDATE members
SET auther_id = 9
WHERE member_id = 209;
UPDATE members
SET auther_id = 10
WHERE member_id = 210;
-- Q1:Retrieve a list of all members with the books they have borrowed, showing members who haven't borrowed anybooks.
select * from members;
select * from loan;
select * from book;
select * from auther;

select first_name,last_name
from members m
left join book b
on m.auther_id = b.auther_id

-- Q2:Retrieve a list of all books with their authors and genres, showing all books whether they are borrowed or not.
select title,genre,a.first_name,a.last_name 
from auther a
left join book b 
on a.auther_id = b.auther_id

-- Q3:List members and their books,showing members who have not borrowed any books.
select first_name,last_name,title,genre,book_id
from book b
left join members m
on m.auther_id = b.auther_id 
where book_id is null

-- Q4:Retrieve a list of all books and their members, showing all books even those that are not currently borrowed.
select
b.title , m.first_name ,m.last_name
from book b
join members m
on b.auther_id = m.auther_id 
join loan l
on l.book_id = b.book_id 
where return_date is null

-- Q5:List books by the same author.
select b.title, b.genre, a.first_name,a.last_name
from book b
inner join auther a
on b.auther_id = a.auther_id

-- Q6:Listall books and their members, even if no one has borrowed a book
select
b.title,
m.first_name,
m.last_name
from book b
left join loan l
on b.book_id = l.book_id
left join members m
on l.member_id = m.member_id;