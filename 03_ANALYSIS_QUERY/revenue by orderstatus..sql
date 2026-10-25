 --total revenue by orderstatus

select
	orderstatus,
	sum(ordertotal) as totalrevenue,
	count(orderid) as totalorders,
	avg(ordertotal) as [avg.ordervalue]
from orders
group by
	orderstatus
order by
	totalrevenue desc