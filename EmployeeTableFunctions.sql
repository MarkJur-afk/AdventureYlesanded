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

CREATE FUNCTION fn_MSTVF_GetEmployees()
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

select * from fn_MSTVF_GetEmployees();

UPDATE fn_ILTVF_GetEmployees()
SET FirstName = 'Sam2'
WHERE FirstName = 'Rob';

UPDATE fn_MSTVF_GetEmployees()
SET FirstName = 'Sam1'
WHERE FirstName = 'Guy';


--select funktsioonid
select * from fn_ILTVF_GetEmployees();
select * from fn_MSTVF_GetEmployees();

