--monthly sales analysis of orders

select
	year(orderdate) as orderyear,
	month(orderdate) as ordermonth,
	sum(ordertotal) as orderrevenue,
	count(*) as totalorders
from orders
group by 
	year(orderdate),
	month(orderdate)
order by 
	orderyear,
	ordermonth;

select top 5 year(orderdate) as orderyear,
month(orderdate) as ordermonth,
sum(ordertotal) as totalrevenue,
count (*) as totalorders
from orders
group by year(orderdate),
month(orderdate)
order by sum(ordertotal) desc
