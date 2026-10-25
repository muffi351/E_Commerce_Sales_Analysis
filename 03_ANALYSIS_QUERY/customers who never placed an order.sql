select
	c.customerid,
	concat(firstname,' ',lastname) as customername
from customers c
left join orders o 
on c.customerid= o.customerid
where
	o.orderid is null