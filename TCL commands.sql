-- TCL COMMANDS -- 
-- TO WORK WITH TCL COMMEND--
select @@autocommit; -- they will be back autocommit will be enable or not our autocommit is already set on 1 or disable 0

set autocommit = 0;

-- create tabble book_master--
 create table book_master (
 bkid int primary key,
 bkname varchar(90),
 price float);
 
 -- insert the records in book table--
 start transaction ;
 insert into book_master values (101,'wings of fire',300);
 
 select * from book_master;
 
  start transaction ;
 insert into book_master values (102,'2 states',404.4);
 commit;

-- rollback-- 
delete from book_master where bkid=102;
rollback;

-- TCL command--
select * from employee;

update  employee set salary = salary + 1000 where empid = 4;
savepoint step1;
commit;
update employee set salary = salary +2000 where empid = 2;
 
 
 select * from employee;
 
rollback;