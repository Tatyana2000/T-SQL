USE MyDB;

IF OBJECT_ID('dbo.usp_MakeFamilyPurchase', 'P') IS NOT NULL
DROP PROC dbo.usp_MakeFamilyPurchase;
GO

CREATE PROC dbo.usp_MakeFamilyPurchase
@FamilySurName VARCHAR(255)
AS
IF NOT @FamilySurName IN 
	(
		SELECT
			SurName
		FROM dbo.Family
	)
	PRINT 'Ошибка! Семьи с указанной фамилией нет в БД!';
ELSE
	BEGIN
	DECLARE @id INT;
	SET @id = 
		(
			SELECT
				ID
			FROM dbo.Family
			WHERE SurName = @FamilySurName
		)
	UPDATE dbo.Family
	SET BudgetValue -= 
		(
			SELECT
				SUM(Value)
			FROM dbo.Basket
			WHERE ID_Family = @id
		)
	WHERE ID = @id
	END
GO


-- EXEC dbo.usp_MakeFamilyPurchase
-- @FamilySurName = 'Иванова';

-- EXEC dbo.usp_MakeFamilyPurchase
-- @FamilySurName = 'Зайцев';


