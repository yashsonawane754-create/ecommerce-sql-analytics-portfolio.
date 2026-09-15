USE dummy1;
SELECT*FROM  customers
LIMIT 5; 
SELECT*FROM products;
TRUNCATE products;

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/Yash/Downloads/SQL Project file/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;                                              -- TO AVOID HEADERS FROM CSV

SELECT*FROM products;

SELECT*FROM sales;
TRUNCATE sales;

LOAD DATA LOCAL INFILE 'C:/Users/Yash/Downloads/SQL Project file/sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;  

SELECT*FROM sales;
Describe sales;

-- Fetching all the customers located in Mumbai
SELECT Customer_Name, State
FROM customers
WHERE State = 'Punjab'
GROUP BY Customer_Name
ORDER BY Customer_Name ASC;

SELECT*FROM sales;

-- Identifying high-volume market hubs with multiple customer profiles
SELECT State, COUNT(Customer_ID) AS Total_Customers
FROM customers
GROUP BY State
HAVING COUNT(Customer_ID)>10
ORDER BY COUNT(Customer_ID) DESC;

-- Merging transaction tables directly with customer identifiers
-- Identifying the Customers with Order status as "Cancelled"
SELECT c.Customer_ID, c.Customer_Name, s.Order_Status, s.Total_Amount
from customers c
INNER JOIN sales s
ON c.Customer_ID = s.Customer_ID
WHERE s.Order_Status = 'Cancelled'
ORDER BY s.Total_Amount DESC;

-- Isolating high-value transactions relative to individual accounts
SELECT Customer_ID, Order_ID, Order_Value,
DENSE_RANK() OVER (PARTITION BY Customer_ID ORDER BY Order_Value DESC) as Order_Rank
FROM sales;

SELECT Customer_ID, Order_ID, Order_Value
FROM sales;

SELECT*FROM customers;

-- Evaluating intersection of purchasing power and product categories
SELECT c.Customer_Tier, p.Category,
SUM(CAST(s.Total_Amount AS DECIMAL(10,2))) AS REVENUE
FROM sales s
INNER JOIN customers c ON s.Customer_ID = c.Customer_ID
INNER JOIN products p ON s.Product_ID = p.Product_ID
WHERE s.Order_Status = 'Delivered'
GROUP BY c.Customer_Tier, p.Category
ORDER BY Revenue Desc;

-- Isolating registered user accounts with zero transactional history
SELECT c.Customer_ID, c.Customer_ID, c.Phone, c.State, c.Registration_Date
FROM customers c
LEFT JOIN sales s
ON c.Customer_ID = s.Customer_ID
WHERE s.Order_ID IS NULL
ORDER BY c.Registration_Date;