select * from orders;
select * from customers;

SELECT COUNT(o.customerId), c.firstName
from orders o left join customers c on o.customerId = c.customerId
group by c.firstName 
having o.totalAmount > 4000