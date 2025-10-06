use AdventureWorksDW2019;

select * from DimEmployee;

CREATE FUNCTION fn_ILTVF_GetEmployees()
RETURNS TABLE
AS
RETURN
(
    SELECT 
        FirstName, 
        LastName, 
        CAST(BirthDate AS DATE) AS DOB
    FROM DimEmployee
);

select * from fn_ILTVF_GetEmployees();

CREATE FUNCTION GetEmployees()
RETURNS TABLE
AS
RETURN
(
    SELECT 
        EmployeeKey,
        FirstName,
        CAST(BirthDate AS DATE) AS BirthDate,
        Gender
    FROM DimEmployee
);

select * from GetEmployees();