USE AdventureWorksDW2019;


-- DDL-triggerid SQL Serveris
-- N�ide s�ntaksist DDL-triggereid loomiseks
CREATE TRIGGER [Trigger_Name]
ON [Scope(Server/Database)]
FOR [EventType1, EventType2, EventType3]
AS
BEGIN
    -- Triggeri tegevuste kood
END

-- Allj�rgnev trigger aktiveerub CREATE_TABLE DDL s�ndmuse korral: sp_rename
CREATE TRIGGER FirstTrigger
ON Database
FOR CREATE_TABLE
AS
BEGIN
    PRINT 'Uus tabel on loodud'
END

-- Kui k�ivitad selle k�su, aktiveerub trigger ja kuvab s�numi: uus tabel on lisatud
CREATE TABLE test (id INT);

-- Kui soovid, et trigger reageeriks mitmele s�ndmusele, n�iteks tabeli loomisele, muutmisele ja kustutamisele, siis eralda s�ndmused komadega
ALTER TRIGGER FirstTrigger
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    PRINT 'Tabel on loodud, muudetud v�i kustutatud'
END

-- J�rgmiseks n�ide, kuidas piirata kasutajate �igusi tabelite loomisel, muutmisel ja kustutamisel, kasutades triggerit
ALTER TRIGGER FirstTrigger
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    ROLLBACK
    PRINT 'Tabelite loomine, muutmine ja kustutamine ei ole lubatud'
END


-- Triggeri keelamine
DISABLE TRIGGER FirstTrigger ON DATABASE;

-- Triggeri eemaldamine
DROP TRIGGER FirstTrigger ON DATABASE;

-- Trigger, mis k�ivitub, kui kasutatakse sp_rename k�sku s�steemi salvestatud protseduuride �mbernimetamiseks
CREATE TRIGGER RenameTable
ON Database
FOR RENAME
AS
BEGIN
    ROLLBACK
    PRINT 'Sa �ritasid midagi �mber nimetada'
END
