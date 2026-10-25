select
	customerid,
	count(distinct year(orderdate)+month(orderdate)) as mon
from orders
group by
	customerid
having
	count(distinct year (orderdate)+  month(orderdate))=3