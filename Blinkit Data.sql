SELECT * FROM Blinkit_Data

SELECT COUNT(*) FROM Blinkit_Data

UPDATE Blinkit_Data
SET Item_Fat_Content = 
CASE 
WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
WHEN Item_Fat_Content = 'reg' THEN 'Regular'
ELSE Item_Fat_Content
END

SELECT DISTINCT(Item_Fat_Content) FROM Blinkit_Data

SELECT CAST(SUM(Sales)/ 1000000 AS DECIMAL(10,2)) AS Total_Sales_Millions
FROM Blinkit_Data

SELECT CAST(SUM(Sales)/ 1000000 AS DECIMAL(10,2)) AS Total_Sales_Millions
FROM Blinkit_Data
WHERE Item_Fat_Content = 'Low Fat' 

SELECT CAST(AVG(Sales) AS DECIMAL(10,2))  AS Avg_Sales
FROM Blinkit_Data

SELECT COUNT(*) AS No_of_Item
FROM Blinkit_Data
WHERE Outlet_Establishment_Year = '2012'

SELECT CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM Blinkit_Data

SELECT Item_Fat_Content, CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM Blinkit_Data
GROUP BY Item_Fat_Content

SELECT Item_Fat_Content, 
CAST(SUM(Sales)/ 1000 AS DECIMAL(10,2)) AS Total_Sales_Thousand,
CAST(AVG(Sales) AS DECIMAL(10,2))  AS Avg_Sales,
COUNT(*) AS No_of_Item,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM Blinkit_Data
WHERE Outlet_Establishment_Year = '2012'
GROUP BY Item_Fat_Content
ORDER BY Total_Sales_Thousand DESC

SELECT Top 5 Item_Type,
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(AVG(Sales) AS DECIMAL(10,2))  AS Avg_Sales,
COUNT(*) AS No_of_Item,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM Blinkit_Data
GROUP BY Item_Type
ORDER BY Total_Sales DESC

SELECT Top 5 Item_Type,
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(AVG(Sales) AS DECIMAL(10,2))  AS Avg_Sales,
COUNT(*) AS No_of_Item,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM Blinkit_Data
GROUP BY Item_Type
ORDER BY Total_Sales ASC

SELECT  Outlet_Establishment_Year, Item_Fat_Content, 
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(AVG(Sales) AS DECIMAL(10,2))  AS Avg_Sales,
COUNT(*) AS No_of_Item,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM Blinkit_Data
GROUP BY Outlet_Establishment_Year, Item_Fat_Content
ORDER BY Total_Sales DESC

SELECT Outlet_Location_Type,
     ISNULL([Low Fat], 0 ) AS Low_Fat,
	 ISNULL([Regular], 0 ) As Regular
	 FROM
	 (
	 SELECT  Outlet_Location_Type, Item_Fat_Content, 
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM Blinkit_Data
GROUP BY Outlet_Location_Type, Item_Fat_Content
) 
AS SourceTable
PIVOT
     (
	 SUM(Total_Sales)
	 FOR Item_Fat_Content IN ([Low Fat], [Regular])
	 ) 
	 AS PivotTable
	 ORDER BY Outlet_Location_Type;

SELECT  Outlet_Establishment_Year, 
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(AVG(Sales) AS DECIMAL(10,2))  AS Avg_Sales,
COUNT(*) AS No_of_Item,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM Blinkit_Data
GROUP BY Outlet_Establishment_Year
ORDER BY Total_Sales DESC

SELECT Outlet_size,
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST((SUM(Sales) * 100 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM Blinkit_Data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC

SELECT  Outlet_Location_Type, 
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(AVG(Sales) AS DECIMAL(10,2))  AS Avg_Sales,
COUNT(*) AS No_of_Item,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM Blinkit_Data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC

SELECT  Outlet_Type, 
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(AVG(Sales) AS DECIMAL(10,2))  AS Avg_Sales,
COUNT(*) AS No_of_Item,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM Blinkit_Data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC
