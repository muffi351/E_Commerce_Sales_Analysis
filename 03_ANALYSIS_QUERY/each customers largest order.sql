with cte as
(
select
c.customerid,
concat(c.firstname,' ',c.lastname) as customername ,
o.orderid,
 o.ordertotal
from customers c 
inner join orders o
on c.customerid=o.CustomerID
 ),ctte as(
 select *,row_number()over(partition by customerid order by  ordertotal desc) as rankk
 from cte)
 select * from ctte 
 where rankk=1