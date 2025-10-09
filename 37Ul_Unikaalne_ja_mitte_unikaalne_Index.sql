use AdventureWorksDW2019;

select * from DimEmployee


-- Kuvame olemasolevad indeksid tabelis DimEmployee
EXECUTE sp_helpindex 'DimEmployee';

-- Lisame esimese kirje tabelisse DimEmployee
INSERT INTO DimEmployee(EmployeeKey, FirstName, LastName, Salary, Gender)
VALUES(1, 'Mike', 'Sandoz', 4500, 'M');

-- Lisame kaks kirjet tabelisse tblEmployee, kus Id v‰‰rtus on sama (1)
-- See tekitab vea, kui Id on primaarvıti ja unikaalne
INSERT INTO DimEmployee VALUES(1,'Mike', 'Sandoz',4500,'M');
INSERT INTO DimEmployee VALUES(1,'John', 'Menco',2500,'M');

-- Kuvame kıik read tabelist DimEmployee
SELECT * FROM DimEmployee;

-- Loome unikaalse mitte-klastreeritud indeksi veergudele FirstName ja LastName
-- See keelab sama ees- ja perekonnanimega dubleeritud kirjed
CREATE UNIQUE NONCLUSTERED INDEX UIX_DimEmployee_FirstName_LastName
ON DimEmployee(FirstName, LastName);

-- Lisame tabelile DimEmployee veeru City
ALTER TABLE DimEmployee 
ADD City VARCHAR(50);

-- Lisame veerule City unikaalse piirangu (constraint)
-- Selleks luuakse taga unikaalne mitte-klastreeritud indeks
ALTER TABLE DimEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City);

-- Loome unikaalse indeksi veerule City koos IGNORE_DUP_KEY valikuga
-- See valik lubab sisestada dubleeruvaid v‰‰rtusi, mis j‰etakse ignoreeritud
CREATE UNIQUE INDEX IX_tblEmployee_City
ON DimEmployee(City)
WITH IGNORE_DUP_KEY;
