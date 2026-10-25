 
with total_customer_spends as 
(
select
	c.customerid,
	concat(c.firstname,' ',c.lastname) as customername,
	year(o.orderdate) as [year],
	month(o.orderdate)as [month],
	sum(o.ordertotal) as totalrevenue
from customers c
inner join orders o
on o.customerid=c.customerid
group by
	c.customerid,
	concat(c.firstname,' ',c.lastname),
	year(o.orderdate),
	month(o.orderdate)
)
,
previous_months_spends as 
(
select
*,
lag(totalrevenue)over(partition by customerid order by [year],[month]) as premonth
from total_customer_spends
)
, 
lastmonth_grtr_currmnth as 
(
select
*,
case
	when
		totalrevenue>premonth then 1 else 0
		end as revinc 
from previous_months_spends
)
,
next_pre_month_grtrcurrmonth as 

(
select
	*,
	lag(revinc)over(partition by customerid order by [year],[month]) as secpremon
from  lastmonth_grtr_currmnth
)
select
*
from next_pre_month_grtrcurrmonth
where
	revinc=1 and
		secpremon=1 