USE MyDB;

IF OBJECT_ID('dbo.vw_SKUPrice', 'V') IS NOT NULL
  DROP VIEW dbo.vw_SKUPrice;
GO

CREATE VIEW dbo.vw_SKUPrice
AS
SELECT 
	ID
	,Code
	,[Name]
	,dbo.udf_GetSKUPrice(ID) AS Price
FROM dbo.SKU
GO


-- select * from dbo.vw_SKUPrice