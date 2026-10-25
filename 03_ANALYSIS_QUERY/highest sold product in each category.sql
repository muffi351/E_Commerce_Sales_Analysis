--total products sold for each category

with totalquantity as 
(
select p.productid ,
p.productname,
p.category,
sum(od.quantity) as ordqua
from products p
inner join  orderdetails od
on p.productid=od.productid
group by
p.productid ,
p.productname,
p.category
)
,
--rankiing to get highest sold product in each category
rowss as 
(
select *,
row_number()over(partition by category order by ordqua desc) as ranks
from totalquantity
)

--highest sold products

select * from rowss
where ranks=1