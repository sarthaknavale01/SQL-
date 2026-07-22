-- set operators-- 
-- it will be merge result of two queries and return single output table --
-- both querise must have same column count along with datatype-- 
use sys;

create table first(id int,fname varchar(40));
create table second ( id int,sname varchar(40));

insert into first values
(1,'xya'),
(2,'pqr'),
(3,'kuc'),
(4,'abc'),
(5,'acb'),
(1,'xrp');

delete from first where id = 1;

select * from first;

insert into second values
(101,'ram'),
(102,'sham'),
(103,'rahul'),
(104,'lalit'),
(105,'hdhd');

-- union --
-- in union only unique values will be shown in output --

select fname from first union select sname from second;

-- union all--
-- it is same as union only diffrance is duplicate records are also present in output --

select fname from first union all select sname from second;

-- intersect-- 
-- it will be return common records from both quries--

select fname from first intersect select sname from second;

-- MINUS--
-- it will be returns uncommon records from 1st query 
