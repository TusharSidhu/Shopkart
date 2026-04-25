USE Shopkart;
-- BASIC LEVEL --
-- Retrieve all customers who registered after 1st Jan 2023. --
SELECT 
    *
FROM
    Customers
WHERE
    Registration_Date > '2023-01-01';

-- List all products with price greater than 1000 and stock available. --
SELECT 
    *
FROM
    Products
WHERE
    Price > 1000.00 AND Stock != 0;

-- Find all orders placed with status 'Delivered'. --
SELECT 
    *
FROM
    Orders
WHERE
    Order_Status = 'Delivered';

-- Display all customers from Delhi. --
SELECT 
    *
FROM
    Customers
WHERE
    City = 'Delhi';

-- Retrieve product names along with their category names. --
SELECT 
    P.Product_ID, P.Product_Name, C.Category_ID, C.Category_Name
FROM
    Products P
        JOIN
    Category C ON P.Category_ID = C.Category_ID;

-- Count total number of customers in each state. --
SELECT 
    State, COUNT(*) AS Customer_Count
FROM
    Customers
GROUP BY State;

-- Find total number of orders placed by each customer. --
SELECT 
    C.Customer_ID,
    C.Customer_Name,
    COUNT(O.Order_ID) AS Orders_Placed
FROM
    Customers C
        JOIN
    Orders O ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID , C.Customer_Name;

-- List all payments where payment status is 'Failed'. --
SELECT 
    *
FROM
    Payments
WHERE
    Payment_Status = 'Failed';

-- Retrieve all products that have rating above 4.0. --
SELECT 
    *
FROM
    Products
WHERE
    Rating > 4.0;

-- Display all orders along with customer names. --
SELECT 
    O.Order_ID, C.Customer_ID, C.Customer_Name
FROM
    Orders O
        JOIN
    Customers C ON O.Customer_ID = C.Customer_ID
ORDER BY O.Order_ID;


-- INTERMEDIATE LEVEL --
-- Calculate total revenue generated from all Delivered orders. --
SELECT 
    SUM(Order_Total) AS Total_Revenue
FROM
    Orders
WHERE
    Order_Status = 'Delivered';
    
-- Find top 5 customers based on total spending. --
SELECT 
    C.Customer_ID,
    C.Customer_Name,
    C.Email,
    SUM(O.Order_Total) AS Total_Spend_by_Customer
FROM
    Customers C
        JOIN
    Orders O ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID , C.Customer_Name , C.Email
ORDER BY Total_Spend_by_Customer DESC
LIMIT 5;

-- Retrieve total quantity sold for each product. --
SELECT 
    P.Product_ID,
    P.Product_Name,
    SUM(O.Quantity) AS Total_Quantity_Sold
FROM
    Products P
        LEFT JOIN
    Order_Items O ON P.Product_ID = O.Product_ID
GROUP BY P.Product_ID , P.Product_Name
ORDER BY P.Product_ID;

-- Identify categories with more than 100 products. --
SELECT 
    C.Category_ID,
    C.Category_Name,
    COUNT(P.Product_ID) AS Products_Count
FROM
    Category C
        JOIN
    Products P ON C.Category_ID = P.Category_ID
GROUP BY C.Category_ID , C.Category_Name
HAVING COUNT(P.Product_ID) > 100
ORDER BY C.Category_ID;

-- Find customers who have never placed any order. --
SELECT 
    C.Customer_ID, C.Customer_Name, C.Email, O.Order_ID
FROM
    Customers C
        LEFT JOIN
    Orders O ON C.Customer_ID = O.Order_ID
WHERE
    O.Customer_ID IS NULL;

-- Calculate average order value per customer. --
SELECT 
    C.Customer_ID,
    C.Customer_Name,
    ROUND(AVG(O.Order_Total), 2) AS Average_Order_Value
FROM
    Customers C
        JOIN
    Orders O ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID , C.Customer_Name
ORDER BY C.Customer_ID;

-- Retrieve orders where payment status is not 'Completed'. --
SELECT 
    Order_ID, Payment_Status, Payment_Method
FROM
    Payments
WHERE
    Payment_Status != 'Completed';
    
-- Find total revenue generated per category. --
SELECT 
    C.Category_ID,
    C.Category_Name,
    SUM(O.Order_Total) AS Revenue_per_Category
FROM
    Category C
        JOIN
    Products P ON C.Category_ID = P.Category_ID
        JOIN
    Order_Items OI ON P.Product_ID = OI.Product_ID
        JOIN
    Orders O ON OI.Order_ID = O.Order_ID
GROUP BY C.Category_ID , C.Category_Name
ORDER BY C.Category_ID;

-- Identify products that have never been ordered. --
SELECT 
    P.Product_ID, P.Product_Name, P.Price, P.Rating, P.Stock
FROM
    Products P
        LEFT JOIN
    Order_Items OI ON P.Product_ID = OI.Product_ID
WHERE
    OI.Product_ID IS NULL;
    
-- Get monthly order count grouped by both year and month. --
SELECT 
    YEAR(Order_Date) AS Years,
    MONTHNAME(Order_Date) AS Months,
    MONTH(Order_Date) AS Month_Num,
    COUNT(Order_ID) AS Order_Count
FROM
    Orders
GROUP BY Years , Months , Month_Num
ORDER BY Years , Month_Num;


-- ADVANCED LEVEL --
-- Find the top 3 highest-selling products based on quantity sold. --
SELECT 
    P.Product_ID,
    P.Product_Name,
    SUM(OI.Quantity) AS Quantity_Sold
FROM
    Products P
        JOIN
    Order_Items OI ON P.Product_ID = OI.Product_ID
GROUP BY P.Product_ID , P.Product_Name
ORDER BY Quantity_Sold DESC
LIMIT 3;

-- Retrieve customers whose total spending is above the average spending of all customers. --
WITH Customer_Spending AS(
SELECT 
    C.Customer_ID,
    C.Customer_Name,
    C.Email,
    SUM(O.Order_Total) AS Total_Spending
FROM
    Customers C
        JOIN
    Orders O ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name, C.Email
)

SELECT 
    *
FROM
    Customer_Spending
WHERE
    Total_Spending > (SELECT 
    AVG(Total_Spending)
FROM
    Customer_Spending);
    
-- Identify the most popular category (based on total quantity sold). --
SELECT 
    C.Category_ID,
    C.Category_Name,
    SUM(OI.Quantity) AS Total_Quantity_Sold
FROM
    Category C
        JOIN
    Products P ON C.Category_ID = P.Category_ID
        JOIN
    Order_Items OI ON P.Product_ID = OI.Product_ID
GROUP BY C.Category_ID , C.Category_Name
ORDER BY Total_Quantity_Sold DESC
LIMIT 1;

-- Calculate running total revenue over time (by order date). --
SELECT 
    Order_Date, SUM(Order_Total) AS Daily_Revenue,
    SUM(SUM(Order_Total)) OVER(ORDER BY Order_Date) AS Running_Total
FROM
    Orders
GROUP BY Order_Date
ORDER BY Order_Date;

-- Find customers who placed orders in consecutive months. --
WITH Monthly_Orders AS(
SELECT 
	Customer_ID,
    DATE_FORMAT(Order_Date, '%Y-%m-01') AS Order_Month
FROM
    Orders
GROUP BY Customer_ID , Order_Month
),
Ordered_Month AS(
SELECT 
    Customer_ID, Order_Month,
    LAG(Order_Month) OVER (PARTITION BY Customer_ID ORDER BY Order_Month) AS Prev_Month
FROM
    Monthly_Orders
)
SELECT DISTINCT
    Customer_ID
FROM
    Ordered_Month
WHERE
    TIMESTAMPDIFF(MONTH,
        Prev_Month,
        Order_Month) = 1;
        
-- Identify orders where total payment amount does not match order total. --
SELECT 
    O.Order_ID,
    O.Order_Total,
    COALESCE(SUM(P.Total_Amount), 0) AS Total_Paid
FROM Orders O
LEFT JOIN Payments P 
    ON O.Order_ID = P.Order_ID
GROUP BY 
    O.Order_ID, O.Order_Total
HAVING 
    COALESCE(SUM(P.Total_Amount), 0) <> O.Order_Total;
    
-- Rank products within each category based on sales. --
WITH Product_Sales AS(
SELECT 
    P.Product_ID,
    P.Product_Name,
    C.Category_Name,
    SUM(OI.Quantity) AS Total_Quantity_Sold
FROM
    Products P
        JOIN
    Category C ON P.Category_ID = C.Category_ID
        JOIN
    Order_Items OI ON P.Product_ID = OI.Product_ID
GROUP BY P.Product_ID , P.Product_Name , C.Category_Name
)
SELECT 
    Category_Name, Product_Name, Total_Quantity_Sold,
    DENSE_RANK() OVER(PARTITION BY Category_Name ORDER BY Total_Quantity_Sold DESC) AS Product_Ranked
FROM
    Product_Sales;
    
-- Find the second highest order value. --
WITH Ranked_Order_Totals AS(
SELECT 
    Order_ID, Order_Total,
    DENSE_RANK() OVER(ORDER BY Order_Total DESC) AS Ranked_Order_Values
FROM
    Orders
)
SELECT 
    Order_ID, Order_Total AS Second_Highest_Order_Value
FROM
    Ranked_Order_Totals
WHERE
    Ranked_Order_Values = 2;
    
-- Retrieve customers who only made one purchase. --
SELECT 
    C.Customer_ID,
    C.Customer_Name,
    C.Email,
    COUNT(O.Order_ID) AS Orders_Made
FROM
    Customers C
        JOIN
    Orders O ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID , C.Customer_Name , C.Email
HAVING COUNT(O.Order_ID) = 1;

-- Identify products that are low in stock but have high sales. --
SELECT 
    P.Product_ID,
    P.Product_Name,
    P.Stock,
    SUM(OI.Quantity) AS Total_Quantity_Sold
FROM
    Products P
        JOIN
    Order_Items OI ON P.Product_ID = OI.Product_ID
GROUP BY P.Product_ID , P.Product_Name , P.Stock
ORDER BY P.Stock ASC , Total_Quantity_Sold DESC;

-- EXPERT LEVEL --
-- Identify customer churn: customers who haven’t placed any order in the last 6 months but had activity before. --
WITH Last_Order AS(
SELECT 
    C.Customer_ID,
    C.Customer_Name,
    MAX(O.Order_Date) AS Last_Order_Date
FROM
    Customers C
        JOIN
    Orders O ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID , C.Customer_Name)
-- NOTE : Reference Date here is January 1st, 2026 --
SELECT 
    Customer_ID, Customer_Name, Last_Order_Date
FROM
    Last_Order
WHERE
    Last_Order_Date < DATE_SUB('2026-01-01', INTERVAL 6 MONTH);

-- Segment customers into tiers (High, Medium, Low value) based on total spending. --
WITH Total_Spending AS
(SELECT 
    C.Customer_ID,
    C.Customer_Name,
    SUM(O.Order_Total) AS Total_Spent
FROM
    Customers C
        JOIN
    Orders O ON C.Customer_ID = O.Customer_ID
WHERE
    O.Order_Status = 'Delivered'
GROUP BY C.Customer_ID , C.Customer_Name),

Segment AS(
SELECT 
    Customer_ID, Customer_Name, Total_Spent,
    NTILE(3) OVER (ORDER BY Total_Spent DESC) AS Tier_Rank
FROM
    Total_Spending)

SELECT 
    Customer_ID,
    Customer_Name,
    Total_Spent,
    CASE
        WHEN Tier_Rank = 1 THEN 'High Value'
        WHEN Tier_Rank = 2 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Tier
FROM
    Segment
ORDER BY Customer_ID;

-- Calculate customer lifetime value (CLV). --
SELECT 
    C.Customer_ID,
    C.Customer_Name,
    SUM(P.Total_Amount) AS Customer_Lifetime_Value
FROM
    Customers C
        JOIN
    Orders O ON C.Customer_ID = O.Customer_ID
        JOIN
    Payments P ON O.Order_ID = P.Order_ID
WHERE
    P.Payment_Status = 'Completed'
GROUP BY C.Customer_ID , C.Customer_Name
ORDER BY C.Customer_ID;

-- Find the most frequently bought product combinations (market basket analysis concept).
SELECT 
    OI1.Product_ID AS Product_1,
    OI2.Product_ID AS Product_2,
    COUNT(*) AS Frequency
FROM
    Order_Items OI1
        JOIN
    Order_Items OI2 ON OI1.Order_ID = OI2.Order_ID
        AND OI1.Product_ID < OI2.Product_ID
GROUP BY OI1.Product_ID , OI2.Product_ID
ORDER BY Frequency DESC
LIMIT 10;

-- Identify seasonal trends in product sales (monthly or quarterly patterns). --
-- QUARTERLY PATTERNS --
SELECT 
    YEAR(O.Order_Date) AS Years,
    QUARTER(O.Order_Date) AS Quarters,
    SUM(OI.Quantity * P.Price) AS Total_Revenue,
    SUM(OI.Quantity) AS Total_Units_Sold
FROM
    Orders O
        JOIN
    Order_Items OI ON O.Order_ID = OI.Order_ID
        JOIN
    Products P ON OI.Product_ID = P.Product_ID
GROUP BY Years , Quarters
ORDER BY Years , Quarters;
-- MONTHLY PATTERNS --
SELECT 
    YEAR(O.Order_Date) AS Years,
    MONTH(O.Order_Date) AS Months,
    MONTHNAME(O.Order_Date) AS Month_Name,
    SUM(OI.Quantity * P.Price) AS Total_Revenue,
    SUM(OI.Quantity) AS Total_Units_Sold
FROM
    Orders O
        JOIN
    Order_Items OI ON O.Order_ID = OI.Order_ID
        JOIN
    Products P ON OI.Product_ID = P.Product_ID
GROUP BY Years , Months , Month_Name
ORDER BY Years , Months;

-- Find the retention rate of customers month-over-month. --
WITH Monthly_Activity AS(
SELECT DISTINCT
    Customer_ID,
    DATE_FORMAT(Order_Date, '%Y-%m-01') AS Activity_Month
FROM
    Orders
),
Retention_Table AS(
SELECT 
    A.Activity_Month AS Month_N,
    COUNT(DISTINCT A.Customer_ID) AS Total_Customers,
    COUNT(DISTINCT B.Customer_ID) AS Retained_Customers
FROM
    Monthly_Activity A
        LEFT JOIN
    Monthly_Activity B ON A.Customer_ID = B.Customer_ID
        AND B.Activity_Month = DATE_ADD(A.Activity_Month,
        INTERVAL 1 MONTH)
GROUP BY A.Activity_Month
)
SELECT 
    Month_N,
    Total_Customers,
    Retained_Customers,
    ROUND((Retained_Customers * 100.0) / Total_Customers,
            2) AS Retention_Rate
FROM
    Retention_Table
ORDER BY Month_N;

-- Analyze conversion funnel: total customers → customers who ordered → customers who paid successfully. --
WITH Total AS(
SELECT 
    COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM
    Customers
),
Ordered AS(
SELECT 
    COUNT(DISTINCT Customer_ID) AS Ordered_Customers
FROM
    Orders
),
Paid AS(
SELECT 
    COUNT(DISTINCT O.Customer_ID) AS Paid_Customers
FROM
    Orders O
        JOIN
    Payments P ON O.Order_ID = P.Order_ID
WHERE
    O.Order_Status = 'Delivered'
)
SELECT 
    T.Total_Customers,
    O.Ordered_Customers,
    P.Paid_Customers,
    ROUND((O.Ordered_Customers * 100) / T.Total_Customers,
            2) AS Order_Conversion_Rate,
    ROUND((P.Paid_Customers * 100) / O.Ordered_Customers,
            2) AS Payment_Conversion_Rate,
    ROUND((P.Paid_Customers * 100) / T.Total_Customers,
            2) AS Overall_Conversion_Rate
FROM
    Total T
        CROSS JOIN
    Ordered O
        CROSS JOIN
    Paid P;

-- Identify dead stock: products with high inventory but zero sales over a long period. --
SELECT 
    P.Product_ID, P.Product_Name, P.Stock
FROM
    Products P
        LEFT JOIN
    Order_Items OI ON P.Product_ID = OI.Product_ID
        LEFT JOIN
    Orders O ON OI.Order_ID = O.Order_ID
        AND O.Order_Date >= DATE_SUB('2026-01-01', INTERVAL 6 MONTH)
WHERE
    Stock > 1000
GROUP BY P.Product_ID , P.Product_Name , P.Stock
HAVING COUNT(O.Order_ID) = 0;