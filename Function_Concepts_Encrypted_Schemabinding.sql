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

