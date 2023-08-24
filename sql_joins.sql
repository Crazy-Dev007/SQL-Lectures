
-- Create the table in the specified schema
CREATE TABLE customers
(
    customerId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    -- primary key column
    firstName [NVARCHAR](50) NOT NULL,
    lastName [NVARCHAR](50) NOT NULL,
    email [NVARCHAR](50) NOT NULL
    -- specify more columns here
);
GO

CREATE TABLE orders
(
    orderId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    -- primary key column
    customerId INT NOT NULL,
    orderDate DATE,
    totalAmount DECIMAL(5,2) NOT null
    -- specify more columns here
);
GO



SELECT *
FROM customers;

--insert statement
INSERT INTO customers
    (

    firstName,
    lastName,
    email
    )
VALUES(
        'Pinak',
        'Warankar',
        'example@gmail.com'
)


SELECT c.customerId,c.firstName,c.lastName,o.orderId,o.orderDate,o.totalAmount FROM customers as c INNER JOIN orders as o on c.customerId = o.customerId;