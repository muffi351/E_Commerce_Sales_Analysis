with ctte as (
select  
orderid,
customerid ,
 orderdate ,
 row_number()over( partition by   customerid order by  orderdate desc) rankc
from orders
)
 
 
 select * from ctte
 where rankc =2