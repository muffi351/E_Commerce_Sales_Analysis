--cte_1
with totalspend as 
(
	select customerid,
	sum(sales) as totalsales
	from sales.orders
	group by customerid)
--cte_2
,
lastorder as
(
	select customerid,
	max(orderdate) as lastdate
	from sales.orders
	group by customerid
)
--cte_3
,
custrank as
(
	select *,
	rank()over(order by totalsales desc) as cusrank
	from totalspend
)
--cte_4
,
cusseg as
( 
	select  CustomerID,
	case   
		when   totalsales> 100 then 'high'
		when    totalsales < 80 then 'average'
		else 'low'
	end as segment
	from totalspend
)

select c.customerid,c.firstname,t.totalsales,l.lastdate,cr.cusrank,css.segment from sales.customers c
left join totalspend t
on c.customerid= t.customerid
left join lastorder l
on l.customerid=c.customerid
left join custrank cr
on cr.customerid=c.customerid
left join cusseg css
on css.customerid=c.customerid