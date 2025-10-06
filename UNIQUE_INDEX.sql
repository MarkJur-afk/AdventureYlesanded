use AdventureWorksDW2019

CREATE TABLE [tblEmployee]
(
    [Id] int Primary Key,
    [FirstName] nvarchar(50),
    [LastName] nvarchar(50),
    [Salary] int,
    [Gender] nvarchar(10),
    [City] nvarchar(50)
)

Execute sp_helpindex tblEmployee


Insert into tblEmployee Values('Mike', 'Sandoz',4500,'Male','New York')
Insert into tblEmployee Values('John', 'Menco',2500,'Male','London')

Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)