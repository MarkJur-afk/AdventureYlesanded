USE AdventureWorksDW2019;

SELECT * FROM DimProduct;

-- Kogusumma arvutamiseks toote kohta kasutame GROUP BY klauslit
SELECT EnglishProductName, SUM(SafetyStockLevel) AS TotalSales 
FROM DimProduct
GROUP BY EnglishProductName;

-- Tooteid filtreerime HAVING klausliga, et kuvada vaid need, mille müügimaht ületab 800 ühikut
SELECT EnglishProductName, SUM(SafetyStockLevel) AS TotalSales 
FROM DimProduct
GROUP BY EnglishProductName
HAVING SUM(SafetyStockLevel) > 800;

-- Kui proovime WHERE klauslit kasutada HAVING asemel, tekib süntaksiviga
SELECT EnglishProductName, SUM(SafetyStockLevel) AS TotalSales 
FROM DimProduct
GROUP BY EnglishProductName
HAVING SUM(SafetyStockLevel) > 800;

-- Näide, kus valime ainult kindlad tooted ('Chain' ja 'Front Brakes') ning arvutame nende müügikoguse
SELECT EnglishProductName, SUM(SafetyStockLevel) AS TotalSales 
FROM DimProduct
WHERE EnglishProductName IN ('Chain', 'Front Brakes')
GROUP BY EnglishProductName;

-- Sarnane päring, mis kasutab HAVING klauslit valiku piiramiseks kindlatele toodetele
SELECT EnglishProductName, SUM(SafetyStockLevel) AS TotalSales 
FROM DimProduct
GROUP BY EnglishProductName
HAVING EnglishProductName IN ('Chain', 'Front Brakes');