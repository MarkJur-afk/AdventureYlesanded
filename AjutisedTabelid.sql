use AdventureWorksDW2019

-- Loodud protseduur, mis loob lokaalse ajutise tabeli ja lisab sinna andmed
CREATE PROCEDURE spCreateLocalTempTable
AS
BEGIN
    CREATE TABLE #PersonDetails (Id INT, Name NVARCHAR(20))

    INSERT INTO #PersonDetails VALUES (1, 'Mike')
    INSERT INTO #PersonDetails VALUES (2, 'John')
    INSERT INTO #PersonDetails VALUES (3, 'Todd')

    SELECT * FROM #PersonDetails
END


