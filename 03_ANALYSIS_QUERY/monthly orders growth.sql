 
with sale_cte as 
(select 
datepart( year,orderdate) as years,
datepart(month,orderdate) as months,
count(*) as orderss from orders
group by  
datepart(year,orderdate),
datepart(month,orderdate)
)

select years,
months,
orderss,
lag(orderss)over(order by years,months) as prevmon
from sale_cte
order by 
	years,
	months