--cte to calculate sum of total orders

with custommers as 
(
select 
	 concat(c.firstname,'  ', 
	 c.lastname) as Names,
	sum(ordertotal) as totals 
from customers c
inner join orders o
on c.customerid=o.customerid
group by 
	c.firstname,
	c.lastname
)
select 
	 Names, 
	totals 
from custommers
where totals >
		(select avg(totals) 
		from custommers)
order by 
totals desc 

