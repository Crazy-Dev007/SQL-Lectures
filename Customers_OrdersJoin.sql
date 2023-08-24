USE [test]
GO

INSERT INTO [dbo].[orders]
           ([customerId]
           ,[orderDate]
           ,[totalAmount])
     VALUES
           (3
           ,GETDATE()
           ,4500)
GO

select * from orders;

alter table orders add constraint fk_orders_customerId foreign key(customerId)
references customers(customerId)

SELECT c.customerId,c.firstName,c.lastName,o.orderId,o.orderDate,o.totalAmount FROM customers as c full JOIN orders as o on c.customerId = o.customerId;