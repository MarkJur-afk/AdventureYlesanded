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