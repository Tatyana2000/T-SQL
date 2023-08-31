USE MyDB;
GO

CREATE TRIGGER dbo.TR_Basket_insert_update
	ON dbo.Basket AFTER INSERT
AS
BEGIN
	IF
		(
			SELECT
				inserted.ID_SKU
			FROM inserted
			GROUP BY
				inserted.ID_SKU
			HAVING COUNT(*) >= 2
		) IS NOT NULL
		
		BEGIN
			UPDATE dbo.Basket
				SET DiscountValue = Value * 0.05
			WHERE ID_SKU IN 
			(
				SELECT
					inserted.ID_SKU
				FROM inserted
				GROUP BY
					inserted.ID_SKU
				HAVING COUNT(*) >= 2
			)

			UPDATE dbo.Basket
				SET DiscountValue = 0
			WHERE ID_SKU IN 
			(
				SELECT
					inserted.ID_SKU
				FROM inserted
				GROUP BY
					inserted.ID_SKU
				HAVING COUNT(*) < 2
			)
		END
	ELSE
		BEGIN
			UPDATE dbo.Basket
				SET DiscountValue = 0
			WHERE ID_SKU IN 
			(
				SELECT
					inserted.ID_SKU
				FROM inserted
			)
		END
END;
GO


