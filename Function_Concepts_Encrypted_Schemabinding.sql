use AdventureWorksDW2019;



CREATE FUNCTION fn_GetEmployeeNameById(@Id INT)
RETURNS NVARCHAR(100)
WITH ENCRYPTION
AS
BEGIN
    DECLARE @Name NVARCHAR(100)
    SELECT @Name = FirstName + ' ' + LastName FROM dbo.DimEmployee WHERE EmployeeKey = @Id
    RETURN @Name
END

EXEC sp_helptext fn_GetEmployeeNameById;

DROP FUNCTION fn_GetEmployeeNameById;


CREATE FUNCTION fn_GetEmployeeNameById(@Id INT)
RETURNS NVARCHAR(100)
WITH SCHEMABINDING
AS
BEGIN
    DECLARE @Name NVARCHAR(100)
    SELECT @Name = FirstName + ' ' + LastName FROM dbo.DimEmployee WHERE EmployeeKey = @Id
    RETURN @Name
END

DROP TABLE dbo.DimEmployee;



