-- Loodud funktsioon töötaja nime tagastamiseks ID alusel (ilma krüpteerimiseta)
CREATE FUNCTION fn_GetEmployeeNameById(@Id INT)
RETURNS NVARCHAR(100)
WITH ENCRYPTION  -- Funktsioon muudetud krüpteerituks (WITH ENCRYPTION)
AS
BEGIN
    DECLARE @Name NVARCHAR(100)
    SELECT @Name = FirstName + ' ' + LastName FROM dbo.DimEmployee WHERE EmployeeKey = @Id
    RETURN @Name
END

-- Kontrollitud, et funktsiooni sisu on krüpteeritud
EXEC sp_helptext fn_GetEmployeeNameById;

-- Kustutatud krüpteeritud funktsioon
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

-- Testitud tabeli kustutamist — sõltuvuse tõttu keelatud
DROP TABLE dbo.DimEmployee;
