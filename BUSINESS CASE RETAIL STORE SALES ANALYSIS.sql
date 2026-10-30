# Use UniTech Database
USE UniTech;

# DATA ANALYSIS GROUP CAPSTONE PROJECT COHORT 8
# PROJECT TITLE: Retail Store Analysis 
# DATE CREATED: 25-10-2026
# GROUP NAME: Sunshine Group (MYSQL)
# GROUP MEMBERS: 
# 1. Chidiebere Priest Iloakpuwa (Group Leader)
# 2. Adediran Michael. O
# 3. Adeosun Oluwapelumi Miracle
# 4. Anita Chiamaka Nwosu
# 5. Bukola Omowunmi
# 6. Asonja Funmilayo I.

# Display the First 10 Records
SELECT *
FROM retail
LIMIT 10;

# Check for Duplicate Records
SELECT
Product_ID,
Sale_Date,
Sales_Rep,
Region,
Product_Category,
Customer_type,
Payment_method,
Sales_channel,
Quantity_sold,
Total_cost,
Total_sales,
Total_profit,
COUNT(*) AS Duplicate_Count
FROM retail
GROUP BY Product_ID,
Sale_Date,
Sales_Rep,
Region,
Product_Category,
Customer_type,
Payment_method,
Sales_channel,
Quantity_sold,
Total_cost,
Total_sales,
Total_profit
HAVING COUNT(*) > 1;

# Check for Missing Values
SELECT
SUM(Product_ID IS NULL) AS Missing_Product_ID,
SUM(Sale_Date IS NULL) AS Missing_Sale_Date,
SUM(Sales_Rep IS NULL) AS Missing_Sales_Rep,
SUM(Region IS NULL) AS Missing_Region,
SUM(Product_Category IS NULL) AS Missing_Product_Category,
SUM(Customer_type IS NULL) AS Missing_Customer_Type,
SUM(Payment_method IS NULL) AS Missing_Payment_Method,
SUM(Sales_channel IS NULL) AS Missing_Sales_Channel,
SUM(Quantity_sold IS NULL) AS Missing_Quantity,
SUM(Total_cost IS NULL) AS Missing_Total_Cost,
SUM(Total_sales IS NULL) AS Missing_Total_Sales,
SUM(Total_profit IS NULL) AS Missing_Total_Profit,
SUM(MyUnknownColumn IS NULL) AS Missing_Unknown_Column
FROM retail;

# BUSINESS CASE 2: RETAIL STORE SALES ANALYSIS
# BUSINESS QUESTION: Analyse The Dataset to Uncover Products Performance

# Check the Total Number of Records
SELECT COUNT(*) AS Total_Transactions
FROM retail;

# Check the Number of Products and Product Categories
SELECT
COUNT(DISTINCT Product_ID) AS Total_Products,
COUNT(DISTINCT Product_Category) AS Total_Product_Categories
FROM retail;

# Calculate Overall Business Performance
SELECT
COUNT(*) AS Total_Transactions,
SUM(Quantity_sold) AS Total_Units_Sold,
ROUND(SUM(Total_cost), 2) AS Total_Cost,
ROUND(SUM(Total_sales), 2) AS Total_Revenue,
ROUND(SUM(Total_profit), 2) AS Total_Profit,
ROUND(SUM(Total_profit) / NULLIF(SUM(Total_sales), 0) * 100,2) AS Profit_Margin_Percentage
FROM retail;

# Analyse Sales Performance by Product Category
SELECT Product_Category,
COUNT(*) AS Total_Transactions,
SUM(Quantity_sold) AS Total_Units_Sold,
ROUND(SUM(Total_sales), 2) AS Total_Revenue,
ROUND(SUM(Total_profit), 2) AS Total_Profit,
ROUND(SUM(Total_profit) / NULLIF(SUM(Total_sales), 0) * 100,2) AS Profit_Margin_Percentage
FROM retail
GROUP BY Product_Category
ORDER BY Total_Revenue DESC;

# Identify the Most Profitable Product Category
SELECT Product_Category,
ROUND(SUM(Total_profit), 2) AS Total_Profit,
ROUND(SUM(Total_profit) / NULLIF(SUM(Total_sales), 0) * 100,2) AS Profit_Margin_Percentage
FROM retail
GROUP BY Product_Category
ORDER BY Total_Profit DESC;

# Analyse Monthly Sales Trends
SELECT
YEAR(Sale_Date) AS Sales_Year,
MONTH(Sale_Date) AS Sales_Month,
ROUND(SUM(Total_sales), 2) AS Monthly_Revenue,
ROUND(SUM(Total_profit), 2) AS Monthly_Profit,
SUM(Quantity_sold) AS Total_Units_Sold
FROM retail
GROUP BY YEAR(Sale_Date), MONTH(Sale_Date)
ORDER BY Sales_Year, Sales_Month;

# Compare Sales Performance Across Regions
SELECT Region,
COUNT(*) AS Total_Transactions,
SUM(Quantity_sold) AS Total_Units_Sold,
ROUND(SUM(Total_sales), 2) AS Total_Revenue,
ROUND(SUM(Total_profit), 2) AS Total_Profit
FROM retail
GROUP BY Region
ORDER BY Total_Revenue DESC;

# Compare Online and Retail Sales Channels
SELECT Sales_channel,
COUNT(*) AS Total_Transactions,
SUM(Quantity_sold) AS Total_Units_Sold,
ROUND(SUM(Total_sales), 2) AS Total_Revenue,
ROUND(SUM(Total_profit), 2) AS Total_Profit
FROM retail
GROUP BY Sales_channel
ORDER BY Total_Revenue DESC;

# Compare New and Returning Customers
SELECT Customer_type,
COUNT(*) AS Total_Transactions,
SUM(Quantity_sold) AS Total_Units_Sold,
ROUND(SUM(Total_sales), 2) AS Total_Revenue,
ROUND(SUM(Total_profit), 2) AS Total_Profit
FROM retail
GROUP BY Customer_type
ORDER BY Total_Revenue DESC;

# Evaluate Sales Representatives
SELECT Sales_Rep,
COUNT(*) AS Total_Transactions,
SUM(Quantity_sold) AS Total_Units_Sold,
ROUND(SUM(Total_sales), 2) AS Total_Revenue,
ROUND(SUM(Total_profit), 2) AS Total_Profit
FROM retail
GROUP BY Sales_Rep
ORDER BY Total_Revenue DESC;

# Analyse Payment Methods
SELECT Payment_method,
COUNT(*) AS Total_Transactions,
ROUND(SUM(Total_sales), 2) AS Total_Revenue,
ROUND(SUM(Total_profit), 2) AS Total_Profit
FROM retail
GROUP BY Payment_method
ORDER BY Total_Revenue DESC;

# 1. DATA LIMITATIONS:
# 📈 Limited Product Details: The dataset contains only four distinct product IDs, limiting detailed analysis of individual products within each category.
# 📈 Missing Customer Identifiers: Unique customer IDs are unavailable, preventing accurate measurement of individual purchase frequency and customer retention.
# 📈 Missing Business Context: Information about advertising, discounts, promotions, inventory, and customer satisfaction is unavailable, limiting explanations for sales performance.
# 📈 Incomplete Reporting Year: The dataset covers 2 January 2023 to 27 September 2025, meaning 2025 is incomplete and direct comparisons with full years may be misleading.
# 📈 Unclear Performance Attribution: Each sales representative is associated with only one region, making it difficult to separate individual performance from regional influences. The MyUnknownColumn field also contains no data and should be reviewed for removal.

# 2. KEY FINDINGS:
# 🔑 Overall Performance: The store recorded 1,000 transactions, sold 25,355 units, generated 70,329,940.71 in revenue, and earned 6,487,847.07 in profit, with an overall profit margin of approximately 9.22%.
# 🔑 Product Categories: Clothing generated the highest revenue at 19,286,733.93, while Food recorded the lowest revenue at 15,141,885.65.
# 🔑 Profitability: Furniture generated the highest total profit of 1,779,461.16 and the highest profit margin of approximately 9.71%, despite Clothing generating the most revenue.
# 🔑 Regional Performance: North recorded the highest regional revenue at 18,208,403.85.
# 🔑 Sales Channels: Online sales generated 35,739,707.20 from 488 transactions, exceeding retail sales revenue by 1,149,473.69 despite having fewer transactions.

# 💡 RECOMMENDATIONS:
# Grow Profitable Categories: Explore opportunities to increase Furniture sales while maintaining its strong profit margin.
# Maintain Clothing Performance: Ensure product availability and investigate the factors contributing to Clothing's high revenue and sales volume.
# Improve Lower-Performing Categories: Review the pricing, demand, costs, and marketing of Food to identify opportunities for improvement.
# Strengthen Customer Retention: Introduce loyalty programmes and personalized promotions to encourage repeat purchases.
# Improve Data Collection: Add unique customer IDs, detailed product information, inventory data, and promotional records to support better decisions.

# CONCLUSION: DATA STORYTELLING:
# The Retail Store Analysis reveals a business that generated 70.33 million in revenue and 6.49 million in profit, with an overall profit margin of approximately 9.22% across 1,000 transactions.
# The most important discovery is that sales performance and profitability tell different stories. Clothing generated the highest revenue and sold the most units, while Furniture produced the highest total profit and profit margin. This demonstrates why management should consider both revenue and profitability when making product-related decisions.
# The analysis also revealed that online sales generated more revenue than retail sales despite recording fewer transactions. New customers contributed more revenue than returning customers, North was the strongest region by revenue, and monthly sales varied throughout the reporting period.
# These findings present opportunities to maintain Clothing's strong performance, grow profitable Furniture sales, improve Food category results, strengthen regional performance, and encourage repeat purchases.
# To make better business decisions, management should combine regular sales monitoring with improved data collection. Adding individual product details, unique customer identifiers, and promotional information would help the business understand not only what is happening but also why it is happening.
# Ultimately, the goal is to use data to improve product performance, increase profitability, strengthen customer relationships, and support sustainable business growth.
