--select top 2 * from orderdetails
--select  top 15 * from products

with cte3 as (select p.productname,p.productid,
sum(od.quantity*od.unitprice*(1-od.discount))over()as suma  
from products p  inner join orderdetails od
on p.productid=od.productid
)

select *, (suma * 100.0) / SUM(suma) OVER () AS RevenuePercentage from cte3