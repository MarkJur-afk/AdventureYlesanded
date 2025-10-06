use AdventureWorksDW2019

ALTER TABLE dbo.DimEmployee ADD Salary INT;

SELECT EmployeeKey, FirstName, LastName, Salary FROM dbo.DimEmployee;

SELECT * FROM dbo.DimEmployee
WHERE Salary > 5000 AND Salary < 7000;

CREATE INDEX IX_DimEmployee_Salary
ON dbo.DimEmployee (Salary ASC);

SELECT * FROM dbo.DimEmployee
WHERE Salary > 5000 AND Salary < 7000;

EXEC sp_helpindex 'dbo.DimEmployee';

DROP INDEX dbo.DimEmployee.IX_DimEmployee_Salary;
