use AdventureWorksDW2019;

create Table TableA
(
Id int primary key,
Name nvarchar(50),
Gender nvarchar(10)
)
Go

Insert into TableA values (1, 'Mark', 'Male')
Insert into TableA values (2, 'Mary', 'Female')
Insert into TableA values (3, 'Steve', 'Male')
Insert into TableA values (4, 'Jhon', 'Male')
Insert into TableA values (5, 'Sara', 'Female')

create Table TableB
(
Id int primary key,
Name nvarchar(50),
Gender nvarchar(10)
)
Go

Insert into TableB values (4, 'Jhon', 'Male')
Insert into TableB values (5, 'Sara', 'Female')
Insert into TableB values (6, 'Pam', 'Female')
Insert into TableB values (7, 'Rebeka', 'Female')
Insert into TableB values (8, 'Jordan', 'Male')
Go


-- Kuvab kirjed, mis esinevad ainult TableA-s, aga mitte TableB-s
Select Id, Name, Gender  
From TableA  
Except  
Select Id, Name, Gender  
From TableB

