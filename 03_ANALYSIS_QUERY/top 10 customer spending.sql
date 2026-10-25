 

select top 10 c.customerid,
c.firstname,
sum (o.ordertotal) as totval
from customers c
inner join orders o
on c.customerid=o.customerid 
group by
c.CustomerID,
c.firstname
order by
sum(o.ordertotal) desc