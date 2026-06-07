Create Database Superstore;
Use superstore;
Select COUNT(*) from sales;
Select * from sales LIMIT 5;
/*Total Sales*/
Select Region,
	ROUND(SUM(Sales) , 2) as total_sales,
    ROUND(SUM(Profit), 2) as total_profit
from sales
Group by Region 
Order by total_sales DESC;

/*Which category makes more profit*/

Select category,
	Round(Sum(Profit),2) as total_profit,
    ROUND(SUM(Sales) , 2) as total_sales
from sales 
Group By category
Order by total_profit DESC;

/*Which Sub-Category is losing money?*/
SELECT `Sub-Category`,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY `Sub-Category`
ORDER BY Total_Profit ASC;

/*Top 10 most profitable customers*/ 
SELECT `Customer Name`,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY `Customer Name`
ORDER BY Total_Profit DESC
LIMIT 10;

/*Does discount hurt profit?*/
SELECT 
  CASE 
    WHEN Discount = 0 THEN 'No Discount'
    WHEN Discount <= 0.2 THEN 'Low Discount'
    WHEN Discount <= 0.4 THEN 'Medium Discount'
    ELSE 'High Discount'
  END AS Discount_Band,
  ROUND(AVG(Profit), 2) AS Avg_Profit,
  COUNT(*) AS Orders
FROM sales
GROUP BY Discount_Band;

/*Top 10 states by sales*/
SELECT State,
       ROUND(SUM(Sales), 2) AS Total_Sales,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;  

/*Sales by Customer Segment*/
SELECT Segment,
       ROUND(SUM(Sales), 2) AS Total_Sales,
       ROUND(SUM(Profit), 2) AS Total_Profit,
       COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM sales
GROUP BY Segment;

/*Average shipping days by Ship Mode*/
SELECT `Ship Mode`,
       COUNT(*) AS Total_Orders,
       ROUND(AVG(`Shipping Days`), 1) AS Avg_Shipping_Days
FROM sales
GROUP BY `Ship Mode`
ORDER BY Avg_Shipping_Days;