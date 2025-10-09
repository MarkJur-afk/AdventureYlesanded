-- 39. SQL Serveri vaated

-- Toome välja kõik kirjed tabelist DimEmployee (põhitabel, mille põhjal tehakse päringuid)
SELECT * FROM DimEmployee


-- Loome vaate, mis näitab töötajate peamisi andmeid koos osakonna nimega
-- Mugavam andmepäringute tegemiseks neile, kes pole tehnilise taustaga
CREATE VIEW vWEmployeesByDepartment
AS
SELECT EmployeeKey, FirstName, Salary, Gender, DepartmentName
FROM DimEmployee


-- Kuvame info läbi eelnevalt loodud vaate
SELECT * FROM vWEmployeesByDepartment


-- Loome vaate, mis kuvab ainult need töötajad, kes kuuluvad IT osakonda
-- Illustreerib ridade kaupa ligipääsupiiranguid (row-level access control)
CREATE VIEW vWITDepartment_Employees
AS
SELECT EmployeeKey, FirstName, Salary, Gender, DepartmentName
FROM DimEmployee
WHERE DimEmployee.DepartmentName = 'IT'


-- Loome vaate, kus palgaandmed ei ole kaasatud
-- Näide, kuidas piirata tundlike veergude nähtavust (column-level access control)
CREATE VIEW vWEmployeesNonConfidentialData
AS
SELECT EmployeeKey, FirstName, Gender, DepartmentName
FROM DimEmployee


-- Loome vaate, mis kuvab statistika — mitu töötajat igas osakonnas töötab
-- Demonstreerib vaate kasutamist kokkuvõtvate andmete esitamiseks
CREATE VIEW vWEmployeesCountByDepartment
AS
SELECT DepartmentName, COUNT(EmployeeKey) AS TotalEmployees
FROM DimEmployee
GROUP BY DepartmentName


-- 40. View uuendused (vaadete kaudu andmete muutmine)

-- Loome vaate, kus puudub palgainfo (Salary veerg)
-- Seda saame kasutada juhtudel, kus on vaja näidata ainult üldandmeid
CREATE VIEW vWEmployeesDataExceptSalary
AS
SELECT EmployeeKey, FirstName, Gender, DepartmentName
FROM DimEmployee


-- Kuvame andmed loodud vaatest
SELECT * FROM vWEmployeesDataExceptSalary


-- Muudame andmeid vaate kaudu
-- Näites asendame töötaja (EmployeeKey = 2) eesnime väärtusega 'Mikey'
UPDATE vWEmployeesDataExceptSalary
SET FirstName = 'Mikey'
WHERE EmployeeKey = 2


-- Loome teise vaate, mis sisaldab ka palgainfot (Salary)
-- Selle vaate abil saab muuta töötaja osakonnakuuluvust
CREATE VIEW vwEmployeeDetalisByDepartment
AS
SELECT EmployeeKey, FirstName, Salary, Gender, DepartmentName
FROM DimEmployee


-- Uuendame kirjeid läbi teise vaate
-- Näites muudame töötaja 'John' osakonna nimeks 'IT'
UPDATE vwEmployeeDetalisByDepartment
SET DepartmentName = 'IT'
WHERE FirstName = 'John'
