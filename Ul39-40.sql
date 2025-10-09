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
