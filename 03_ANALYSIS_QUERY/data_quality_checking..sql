-- checking for missing customer details in customer table

select
*
from customers
where customerid is null
	 or firstname is null
	 or email is null;


-- checking for invalid/negative prices of products

select
*
from products
where price <=0
	or costprice<=0;

--checking for invalid order totals 

select
*
from orders
where ordertotal<0
	or shippingcost<0;

--checking for invalid product quantities

select
*
from orderdetails
where quantity <=0;