SELECT * FROM Employees;
SELECT * FROM orders;

SELECT firstName FROM customers c 
WHERE EXISTS ( 
	SELECT customerId FROM orders o 
	WHERE c.customerId = o.customerId 
	And totalAmount > 4000 
	)