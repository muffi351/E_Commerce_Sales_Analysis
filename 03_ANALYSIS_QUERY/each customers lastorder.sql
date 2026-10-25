
with cte2 as
(
select
	customerid,
	orderid,
	orderdate,
	row_number()over( partition by customerid 
	order by orderdate desc) as lastorder
from orders
 )

select  * from cte2 
where lastorder =1
 