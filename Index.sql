use AdventureWorksDW2019

ALTER TABLE dbo.DimEmployee ADD Salary INT;

SELECT EmployeeKey, FirstName, LastName, Salary FROM dbo.DimEmployee;

SELECT * FROM dbo.DimEmployee
WHERE Salary > 5000 AND Salary < 7000;
