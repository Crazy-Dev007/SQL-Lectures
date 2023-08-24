USE TEST

SELECT firstName , COUNT(o.customerId) as 'Order Times' FROM customers AS c 
INNER JOIN orders AS o 
ON c.customerId = o.customerId group by firstname;

