use AdventureWorksDW2019;

select * from DimEmployee


-- Kuvame olemasolevad indeksid tabelis DimEmployee
EXECUTE sp_helpindex 'DimEmployee';

-- Lisame esimese kirje tabelisse DimEmployee
INSERT INTO DimEmployee(EmployeeKey, FirstName, LastName, Salary, Gender)
VALUES(1, 'Mike', 'Sandoz', 4500, 'M');

-- Lisame kaks kirjet tabelisse tblEmployee, kus Id v��rtus on sama (1)
-- See tekitab vea, kui Id on primaarv�ti ja unikaalne
INSERT INTO DimEmployee VALUES(1,'Mike', 'Sandoz',4500,'M');
INSERT INTO DimEmployee VALUES(1,'John', 'Menco',2500,'M');

-- Kuvame k�ik read tabelist DimEmployee
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
-- See valik lubab sisestada dubleeruvaid v��rtusi, mis j�etakse ignoreeritud
CREATE UNIQUE INDEX IX_tblEmployee_City
ON DimEmployee(City)
WITH IGNORE_DUP_KEY;


-- 38. Indeksi plussid ja miinused

-- Loome mitte-klastreeritud indeksi Salary veerule kasvavas j�rjekorras
Create NonClustered Index IX_DimEmployee_Salary
on DimEmployee (Salary Asc)

-- SELECT p�ring, mis kasutab Salary indeksit palkade leidmiseks vahemikus 4000 kuni 8000
Select * from DimEmployee where Salary > 4000 and Salary < 8000

-- DELETE p�ring, kustutame read, kus Salary on 2500 (indeks aitab kiiremini rida leida)
Delete from DimEmployee where Salary=2500

-- UPDATE p�ring, uuendame Salary v��rtust (s�ntaks v�ib vajada t�psustamist)
Update DimEmployee Set Salary where Salary=7500

-- SELECT p�ring, mis tagastab k�ik read sorteerituna Salary j�rgi kahanevas j�rjekorras (kasutab indeksit sorteerimiseks)
Select * from DimEmployee order by Salary Desc

-- GROUP BY p�ring, mis r�hmitab t��tajad palkade j�rgi ja loendab iga palga esinemiste arvu
Select Salary, Count(Salary) as Total
from DimEmployee
Group By Salary