-- Valime andmebaasi AdventureWorksDW2019 kasutamiseks
USE AdventureWorksDW2019;

-- Lisame dbo.DimEmployee tabelile uue veeru Salary (int tüüpi)
ALTER TABLE dbo.DimEmployee ADD Salary INT;

-- Kuvame EmployeeKey, FirstName, LastName ja Salary veerud dbo.DimEmployee tabelist
SELECT EmployeeKey, FirstName, LastName, Salary FROM dbo.DimEmployee;

-- Otsime töötajaid, kelle palk on vahemikus 5000 kuni 7000
SELECT * FROM dbo.DimEmployee
WHERE Salary > 5000 AND Salary < 7000;

-- Loome Salary veerule indeksi, et kiirendada päringuid
CREATE INDEX IX_DimEmployee_Salary
ON dbo.DimEmployee (Salary ASC);

-- Käivitame sama päringu uuesti, et näha indeksi mõju
SELECT * FROM dbo.DimEmployee
WHERE Salary > 5000 AND Salary < 7000;

-- Kuvame dbo.DimEmployee tabeli indeksite info
EXEC sp_helpindex 'dbo.DimEmployee';

-- Kustutame loodud indeksi dbo.DimEmployee tabelilt
DROP INDEX dbo.DimEmployee.IX_DimEmployee_Salary;



CREATE TABLE tblEmployee (  
    Id int PRIMARY KEY,  
    Name varchar(50),  
    Salary int,  
    Gender varchar(10),  
    City varchar(50) 
);

INSERT INTO tblEmployee VALUES (3,'John',4500,'Male','New York');
INSERT INTO tblEmployee VALUES (1,'Sam',2500,'Male','London');
INSERT INTO tblEmployee VALUES (4,'Sara',5500,'Female','Tokyo');
INSERT INTO tblEmployee VALUES (5,'Todd',3100,'Male','Toronto');
INSERT INTO tblEmployee VALUES (2,'Pam',6500,'Female','Sydney');

