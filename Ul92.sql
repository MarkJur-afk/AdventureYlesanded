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