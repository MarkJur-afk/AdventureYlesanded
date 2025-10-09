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

-- DimEmployee tabeli näide:
-- Valib töötajad, kelle palk jääb vahemikku 50 000 kuni 59 999
Select EmployeeKey, FirstName, Gender, Salary  
From DimEmployee  
Where Salary >= 50000  
Except  
Select EmployeeKey, FirstName, Gender, Salary  
From DimEmployee  
Where Salary >= 60000  
Order By FirstName

-- 88. Erinevus EXCEPT ja NOT IN operaatoril


-- Kuvab kirjed, mis eksisteerivad TableA-s, kuid puuduvad TableB-s
select Id, Name, Gender 
from TableA
except
select Id, Name, Gender 
from TableB

-- Võrdne tulemus kasutades NOT IN operaatorit
select Id, Name, Gender 
from TableA
where id NOT IN (select id from TableB)

-- See päring ebaõnnestub, kuna alam-päring tagastab rohkem kui ühe veeru
select Id, Name, Gender 
from TableA
where id NOT IN (select id, Name from TableB)
