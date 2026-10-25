--first CTE for calculating monthlyrevenue.


with monthlyrevenue_cte1 as
(
select
	year(orderdate) as orderyear,
	month(orderdate) as ordermonth,
	sum(ordertotal) as monthrevenue
from 
	orders
group by
	year(orderdate),month(orderdate)
)


--second CTE for getting previous months revenue
,
previous_month_revenue_cte2 as
(
select*,
	lag(monthrevenue,1)over(order by orderyear,
	ordermonth asc) as prevmonth
from 
	monthlyrevenue_cte1
)


--now,calculating growth_percentage from both the CTE,s


select *,
	((monthrevenue-prevmonth)/prevmonth)*100.0 as growthpercentage
from 
	previous_month_revenue_cte2

