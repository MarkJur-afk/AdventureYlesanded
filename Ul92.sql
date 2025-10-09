USE AdventureWorksDW2019;


-- DDL-triggerid SQL Serveris
-- Näide süntaksist DDL-triggereid loomiseks
CREATE TRIGGER [Trigger_Name]
ON [Scope(Server/Database)]
FOR [EventType1, EventType2, EventType3]
AS
BEGIN
    -- Triggeri tegevuste kood
END

-- Alljärgnev trigger aktiveerub CREATE_TABLE DDL sündmuse korral: sp_rename
CREATE TRIGGER FirstTrigger
ON Database
FOR CREATE_TABLE
AS
BEGIN
    PRINT 'Uus tabel on loodud'
END

-- Kui käivitad selle käsu, aktiveerub trigger ja kuvab sõnumi: uus tabel on lisatud
CREATE TABLE test (id INT);

-- Kui soovid, et trigger reageeriks mitmele sündmusele, näiteks tabeli loomisele, muutmisele ja kustutamisele, siis eralda sündmused komadega
ALTER TRIGGER FirstTrigger
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    PRINT 'Tabel on loodud, muudetud või kustutatud'
END

-- Järgmiseks näide, kuidas piirata kasutajate õigusi tabelite loomisel, muutmisel ja kustutamisel, kasutades triggerit
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

-- Trigger, mis käivitub, kui kasutatakse sp_rename käsku süsteemi salvestatud protseduuride ümbernimetamiseks
CREATE TRIGGER RenameTable
ON Database
FOR RENAME
AS
BEGIN
    ROLLBACK
    PRINT 'Sa üritasid midagi ümber nimetada'
END


-- DDL-triggerid, mis kehtivad ainult antud andmebaasile
-- See trigger takistab tabelite loomist, muutmist või kustutamist selles andmebaasis
CREATE TRIGGER tr_DatabaseScopeTrigger 
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
ROLLBACK
PRINT 'Tabelite loomine, muutmine ja kustutamine selles andmebaasis pole lubatud'
END

-- Serveri ulatuses DDL-triggeri loomine
-- Sarnane andmebaasi tasandi triggerile, aga rakendub kogu SQL Serveri tasandil ning nõuab märksõna ALL SERVER
CREATE TRIGGER tr_ServerScopeTrigger
ON ALL SERVER
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
ROLLBACK
PRINT 'Tabelite loomine, muutmine ja kustutamine SQL Serveri ulatuses on keelatud'
END

-- Kuidas keelata serveri tasandi DDL-trigger
DISABLE TRIGGER tr_ServerScopeTrigger ON ALL SERVER

-- Kuidas aktiveerida serveri tasandi DDL-trigger
ENABLE TRIGGER tr_ServerScopeTrigger ON ALL SERVER

-- Kuidas eemaldada serveri tasandi DDL-trigger
DROP TRIGGER tr_ServerScopeTrigger ON ALL SERVER