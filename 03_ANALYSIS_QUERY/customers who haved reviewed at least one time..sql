  
with ctte as 
(
select  
	c.customerid,
	concat(c.firstname,'  ',c.lastname) as customername,
	o.orderid
from customers c
inner join orders o
on c.customerid=o.customerid
)
,
cttte as 
(
select
	customerid,
	customername,
	count(orderid) totalorder from ctte
group by 
	customerid ,
	customername
)
select 
	*
from cttte 
where    not exists  
			(select 1 from reviews
			where reviews.customerid=cttte.customerid)