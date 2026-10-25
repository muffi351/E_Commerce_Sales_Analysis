 
select   p.productid ,p.productname from products p
left  join orderdetails od
on p.productid=od.productid
where od.productid is  null