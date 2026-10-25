 
with cte as 
(select year(orderdate) as years,
month(orderdate) as months,
sum(ordertotal) as totamt
from orders 
group by 
year(orderdate),
month(orderdate)
)

select years,
months,
totamt,
sum(totamt)over(   order by years,months   ) as runningtotal
from cte