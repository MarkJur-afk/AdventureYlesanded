-- Loodud funktsioon t��taja nime tagastamiseks ID alusel (ilma kr�pteerimiseta)
CREATE FUNCTION fn_GetEmployeeNameById(@Id INT)
RETURNS NVARCHAR(100)
WITH ENCRYPTION  -- Funktsioon muudetud kr�pteerituks (WITH ENCRYPTION)
AS
BEGIN
    DECLARE @Name NVARCHAR(100)
    SELECT @Name = FirstName + ' ' + LastName FROM dbo.DimEmployee WHERE EmployeeKey = @Id
    RETURN @Name
END

-- Kontrollitud, et funktsiooni sisu on kr�pteeritud
EXEC sp_helptext fn_GetEmployeeNameById;

-- Kustutatud kr�pteeritud funktsioon
DROP FUNCTION fn_GetEmployeeNameById;

-- Loodud funktsioon SCHEMABINDING valikuga (seotud tabeliga)
CREATE FUNCTION fn_GetEmployeeNameById(@Id INT)
RETURNS NVARCHAR(100)
WITH SCHEMABINDING
AS
BEGIN
    DECLARE @Name NVARCHAR(100)
    SELECT @Name = FirstName + ' ' + LastName FROM dbo.DimEmployee WHERE EmployeeKey = @Id
    RETURN @Name
END

-- Testitud tabeli kustutamist � s�ltuvuse t�ttu keelatud
DROP TABLE dbo.DimEmployee;
