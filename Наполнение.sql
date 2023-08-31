USE MyDB;

INSERT INTO dbo.SKU ([Name])
  VALUES ('тест 1'),
         ('тест 2'),
	     ('тест 3');

INSERT INTO dbo.Family(SurName, BudgetValue)
  VALUES ('Иванова', 100),
         ('Петров', 50),
	     ('Сидорова', 30);

INSERT INTO dbo.Basket(ID_SKU, ID_Family, Quantity, [Value], DiscountValue)
  VALUES (1, 1, 1, 10.0, 0),
         (2, 2, 1, 15.0, 0),
		 (3, 3, 2, 20.0, 0),
		 (2, 1, 1, 15.0, 0),
         (2, 1, 1, 15.0, 0);




