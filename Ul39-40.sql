-- 39. SQL Serveri vaated

-- Toome v�lja k�ik kirjed tabelist DimEmployee (p�hitabel, mille p�hjal tehakse p�ringuid)
SELECT * FROM DimEmployee


-- Loome vaate, mis n�itab t��tajate peamisi andmeid koos osakonna nimega
-- Mugavam andmep�ringute tegemiseks neile, kes pole tehnilise taustaga
CREATE VIEW vWEmployeesByDepartment
AS
SELECT EmployeeKey, FirstName, Salary, Gender, DepartmentName
FROM DimEmployee


-- Kuvame info l�bi eelnevalt loodud vaate
SELECT * FROM vWEmployeesByDepartment


-- Loome vaate, mis kuvab ainult need t��tajad, kes kuuluvad IT osakonda
-- Illustreerib ridade kaupa ligip��supiiranguid (row-level access control)
CREATE VIEW vWITDepartment_Employees
AS
SELECT EmployeeKey, FirstName, Salary, Gender, DepartmentName
FROM DimEmployee
WHERE DimEmployee.DepartmentName = 'IT'


-- Loome vaate, kus palgaandmed ei ole kaasatud
-- N�ide, kuidas piirata tundlike veergude n�htavust (column-level access control)
CREATE VIEW vWEmployeesNonConfidentialData
AS
SELECT EmployeeKey, FirstName, Gender, DepartmentName
FROM DimEmployee


-- Loome vaate, mis kuvab statistika � mitu t��tajat igas osakonnas t��tab
-- Demonstreerib vaate kasutamist kokkuv�tvate andmete esitamiseks
CREATE VIEW vWEmployeesCountByDepartment
AS
SELECT DepartmentName, COUNT(EmployeeKey) AS TotalEmployees
FROM DimEmployee
GROUP BY DepartmentName


-- 40. View uuendused (vaadete kaudu andmete muutmine)

-- Loome vaate, kus puudub palgainfo (Salary veerg)
-- Seda saame kasutada juhtudel, kus on vaja n�idata ainult �ldandmeid
CREATE VIEW vWEmployeesDataExceptSalary
AS
SELECT EmployeeKey, FirstName, Gender, DepartmentName
FROM DimEmployee


-- Kuvame andmed loodud vaatest
SELECT * FROM vWEmployeesDataExceptSalary


-- Muudame andmeid vaate kaudu
-- N�ites asendame t��taja (EmployeeKey = 2) eesnime v��rtusega 'Mikey'
UPDATE vWEmployeesDataExceptSalary
SET FirstName = 'Mikey'
WHERE EmployeeKey = 2


-- Loome teise vaate, mis sisaldab ka palgainfot (Salary)
-- Selle vaate abil saab muuta t��taja osakonnakuuluvust
CREATE VIEW vwEmployeeDetalisByDepartment
AS
SELECT EmployeeKey, FirstName, Salary, Gender, DepartmentName
FROM DimEmployee


-- Uuendame kirjeid l�bi teise vaate
-- N�ites muudame t��taja 'John' osakonna nimeks 'IT'
UPDATE vwEmployeeDetalisByDepartment
SET DepartmentName = 'IT'
WHERE FirstName = 'John'
