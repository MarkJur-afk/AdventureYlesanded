USE AdventureWorksDW2019;

SELECT * FROM DimProduct;

-- Kogusumma arvutamiseks toote kohta kasutame GROUP BY klauslit
SELECT EnglishProductName, SUM(SafetyStockLevel) AS TotalSales 
FROM DimProduct
GROUP BY EnglishProductName;