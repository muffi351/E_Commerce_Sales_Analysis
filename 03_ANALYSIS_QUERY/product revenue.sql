with cte3 as (select p.productname,p.productid,
sum(od.quantity*od.unitprice*(1-od.discount)) as suum
from products p  inner join orderdetails od
on p.productid=od.productid
group by p.productname,p.productid
)

select *, (suum * 100.0) / SUM(suum) OVER () AS RevenuePercentage from cte3
ORDER BY suum DESC