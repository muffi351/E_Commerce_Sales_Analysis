select category,
sum(Quantity) as ordersold,
sum(unitprice) as totalrevenue
from products p
inner join orderdetails od
on p.productid=od.productid
group by category
order by totalrevenue desc





select top 5 * from products
select top 5 * from  orderdetails