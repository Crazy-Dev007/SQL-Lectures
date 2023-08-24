SELECT firstName FROM customers
UNION
SELECT firstName FROM Suppliers;


SELECT firstName FROM customers
UNION ALL
SELECT firstName FROM Suppliers;
/*
Every SELECT statement within UNION must have the same number of columns
The columns must also have similar data types
The columns in every SELECT statement must also be in the same order

1	Ajay	Bhagwat	ajaybhawat22@gmail.com
1	shreyas	Shriramwar	example@gmail.com
2	akash	Bhagwat	akashbhawat22@gmail.com
2	Shrikant	Yerawar	example@gmail.com
3	ABC	PQR	ABCPQR74@gmail.com
3	Pinak	Warankar	example@gmail.com

combine form of customer and Suppliers table
*/