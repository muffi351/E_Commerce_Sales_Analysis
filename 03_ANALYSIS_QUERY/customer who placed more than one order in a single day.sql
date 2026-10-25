select
	c.customerid,
	cast(o.orderdate as date) as orderday,
	count(o.orderid) as totord
from customers c
inner join  orders o
on c.customerid =o.customerid
group by
	c.customerid,
	cast(o.orderdate as date)
having
	count(o.orderid)  >1
	 