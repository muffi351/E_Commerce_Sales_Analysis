 --customers whose latestorder was cancelled

with ctte as
(
select
	c.customerid,
	concat(c.firstname,' ',c.lastname) as customername,
	o.orderid,
	o.orderdate,
	o.orderstatus,
	row_number()over(partition by c.customerid order by orderdate desc ) as latestorder
from customers c
inner join orders o
on o.customerid=c.customerid
)
select
*
from ctte
where
	latestorder=1 and
		orderstatus='cancelled'