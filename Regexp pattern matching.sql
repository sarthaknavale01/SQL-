-- regexp pattern matching--
-- to find the detail of order where order name start with b--
select * from orders where oname regexp '^p'

select * from orders

-- to find detaiils from order where name ends with es--
select * from orders where oname regexp 'p$'

-- mathes any of the pattern --
-- to find the ordr details where name contaion i|ok|ioe
select * from orders where oname regexp 'i|ok|ioe'

-- maatches any character not listed between the square brackets--
-- t0 find the order details where order name does not start with sh--
select * from  orders where oname regexp '^[^sh]'

-- to find all detail from order containig 'i'
select * from orders where oname regexp 'i?'


-- matches any character listed between the square brackes[abc]
select * from orders where oname regexp '[m]'