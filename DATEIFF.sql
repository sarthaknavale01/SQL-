-- DATEDIEF--
-- IT IS USE TO FIND DIFFRANCE BETWEEN TWO DATES--

select *,datediff(ship_date,order_date) as diffrance from product

-- DATOFWEEK() FUNCTION RETURNN the weekday index for a given date ( a number of 1 to 7)
select dayofweek(now()) as day_of_week from dual;

-- dayofyear() function return the day of year as given date ( a number of 1 to 366)
select dayofyear(now()) as day_of_year from dual; 

-- dayofmonth() function return the day of month as gien date ( a number of 1 to 31)
select dayofmonth(now()) as day_of_month from dual;

-- weekofyear() function return week of year as given date ( a number 1 to 31)
select weekofyear(now()) as week_of_year from dual;

-- yearweek() function return the year and week number as given date ( a number of 1 to 53)
select yearweek(now()) as year_week from dual;

# Dual is the temperory database that present in mysql / we also says dupicate databse for usepurpose