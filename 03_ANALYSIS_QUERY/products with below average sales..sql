 
with totalquantity as
(
select p.productid,
p.productname,
sum(od.quantity) as totqua
from products p
inner join orderdetails od
on p.productid= od.productid
group by
p.productid ,p.productname
)
,
averagesales as (
select
*,
avg(totqua)over() as avvg
from totalquantity
)
select
*
from averagesales
where
	avvg>totqua