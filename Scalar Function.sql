--CREATE FUNCTION  GetProduct( @id int )
--RETURNS nvarchar(50)
--AS
--BEGIN
--	declare @result nvarchar(50)
--    select @result =  Product.product_name from Product  Where Product.product_id = @id
--	return @result
--END

select * from Product
select [dbo].[GetProduct](2) as 'Product Name'