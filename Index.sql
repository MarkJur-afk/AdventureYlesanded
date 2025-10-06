-- Valime andmebaasi AdventureWorksDW2019 kasutamiseks
USE AdventureWorksDW2019;

-- Lisame dbo.DimEmployee tabelile uue veeru Salary (int t��pi)
ALTER TABLE dbo.DimEmployee ADD Salary INT;

-- Kuvame EmployeeKey, FirstName, LastName ja Salary veerud dbo.DimEmployee tabelist
SELECT EmployeeKey, FirstName, LastName, Salary FROM dbo.DimEmployee;

-- Otsime t��tajaid, kelle palk on vahemikus 5000 kuni 7000
SELECT * FROM dbo.DimEmployee
WHERE Salary > 5000 AND Salary < 7000;

-- Loome Salary veerule indeksi, et kiirendada p�ringuid
CREATE INDEX IX_DimEmployee_Salary
ON dbo.DimEmployee (Salary ASC);

-- K�ivitame sama p�ringu uuesti, et n�ha indeksi m�ju
SELECT * FROM dbo.DimEmployee
WHERE Salary > 5000 AND Salary < 7000;

-- Kuvame dbo.DimEmployee tabeli indeksite info
EXEC sp_helpindex 'dbo.DimEmployee';

-- Kustutame loodud indeksi dbo.DimEmployee tabelilt
DROP INDEX dbo.DimEmployee.IX_DimEmployee_Salary;
