-- scalar function -- 
-- use or maily appy on non numeric column
-- length is used to count number of chars in string --
select * from customers;
select * from orders;

select oname,length(oname) totalen from orders;

-- upper() or UCASE() convert string to uppercase--
select oname,upper(oname) Uppercase from orders;
select oname,UCASE(oname) Uppercase from orders;

-- lower() or LCASE() convert string to lowecase--
select *,lower(cname) Lowercase from customers;
select *,LCASE(cname) Lowercase from customers;

-- concat it is used to append the 2 strings --
-- dual is the dummy table
select concat("Hello All","Welcome to ITROOTS") as concatenatedstr from dual;

-- replace() it replaces old string with new string replace(string,old string,new string)---
select replace("Hello All !!","Hello","Welcome") as replacestr from dual;

-- MID () :It acts like substring & it returns the part of given string mid(string,start pos,length)---
select oname,mid(oname,1,4) as substr from orders;
select * ,MID(oname,-4,2) as substring from orders;

-- reverse() is used to reverse the string--
select * ,reverse(oname) as revstr from orders;

-- to find 1st record in DB--
select * from orders order by oid limit 1;

-- to give last record from orders table--
select * from orders order by oid desc limit 1;

-- to find 1st 3 letters --
select *,left(oname,3) as first3letter from orders;

-- to find last 3 letters --
select *,right(oname,3) as last3letter from orders;

-- trim() is used to remove whitespaces from both left & right--
select trim('     HELLO ALL   ') trimdata from dual;

-- ltrim() is used to remove whitespaces from left--
select ltrim('     HELLO ALL   ') trimdata from dual;

-- rtrim() is used to remove whitespaces from right--
select rtrim('     HELLO ALL   ') trimdata from dual;

-- insert() --
select INSERT('Have a nice day',6,5,'good') as newstr from dual;


-- padding lpad(string,length,char to be padded) --
select lpad('hello all gm',20,'*') as lpaddedstring from dual;

-- padding rpad(string,length,char to be padded) --
select rpad('hello all gm',20,'*') as rpaddedstring from dual;

-- compare 2 strings--
-- A to Z=>65-90 ,a-z=> 97-122,0-9 =>48-57
select strcmp('abc','ABC') as cmpdata from dual;
select strcmp('abcde','ABC') as cmpdata from dual;
select strcmp('abc','ABCDE') as cmpdata from dual;
