-- top 5 products with highest average rating.

select top 5
	p.productid,
	p.productname,
	avg(r.rating) as avgrating,
	count(r.reviewid) as revcount
from products p
inner join reviews r
on p.productid=r.productid
group by
	p.productid,
	p.productname
order by
	avgrating desc