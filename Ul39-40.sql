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
