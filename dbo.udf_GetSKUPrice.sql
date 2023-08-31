USE MyDB;

IF OBJECT_ID('dbo.udf_GetSKUPrice') IS NOT NULL
  DROP FUNCTION dbo.udf_GetSKUPrice;
GO

CREATE FUNCTION dbo.udf_GetSKUPrice(@ID_SKU AS INT)
RETURNS DECIMAL(18, 2)
AS
  BEGIN
    DECLARE @res DECIMAL(18, 2);
	SET @res = 
	  (
	    SELECT 
			SUM(Value) / SUM(Quantity)
		FROM dbo.Basket 
		WHERE ID_SKU = @ID_SKU
	  )
  RETURN @res;
  END;
GO



-- select * from dbo.Basket;
-- select dbo.udf_GetSKUPrice(2);



	
