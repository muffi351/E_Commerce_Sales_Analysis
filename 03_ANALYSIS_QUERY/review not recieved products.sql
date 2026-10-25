--products who never got a review

select
	p.productid,
	p.productname,
	p.category
from products p
left join reviews r
on p.productid=r.productid
where
	reviewtext is null
