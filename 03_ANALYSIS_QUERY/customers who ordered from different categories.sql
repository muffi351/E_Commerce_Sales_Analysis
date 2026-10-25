--customers who ordered from multiple categories 

select
	c.customerid,
	concat(c.firstname,'  ' ,c.lastname) as customername,
	count(distinct p.category) as totalcategory
from customers c
inner join  orders o 
on  o.customerid=c.customerid
inner join orderdetails od 
on o.orderid=od .orderid
inner join products p 
on p.ProductID=od.productid
group by
	c.customerid,
	c.firstname,
	c.lastname   
having
	count(distinct p.category)> 3
order by
	totalcategory desc
 
