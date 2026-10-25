--monthly revenue by payment method

select
	YEAR(orderdate ) as [year],
	MONTH(ORDERDATE) as [month],
	PaymentMethod,
	sum(ordertotal) as totrevenue,
	count(orderid) as  totalorders
from orders
group by
	YEAR(orderdate ),
	MONTH(ORDERDATE),
	PaymentMethod
order by
	[year],
	[month],
	totrevenue desc