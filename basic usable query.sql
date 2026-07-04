-- update--
-- update student set mks=40 where stud_name='pqr'
update student_info set marks =40 where stud_name = 'pqr'
desc student_info
-- alter and rename--
-- ALTER TABLE table_name RENAME COLUMN old_name TO new_name--
alter table student rename column mks to marks;

-- to add new column address---
-- ALTER TABLE table_name ADD new_column_name column_definition [FIRST | AFTER existing_column];
alter table student add address varchar(30) after marks;

-- to remove column---
-- ALTER TABLE table_name DROP COLUMN column_name--
alter table student drop column address;

-- to rename table ---
-- ALTER TABLE table_name RENAME TO new_table_name
alter table student rename to student_info;

-- delete---
delete from student_info where rno=104;

select * from student_info;

-- truncate--
truncate table student_info;

-- drop is used to delete the table permanently from DB--
drop table student_info;