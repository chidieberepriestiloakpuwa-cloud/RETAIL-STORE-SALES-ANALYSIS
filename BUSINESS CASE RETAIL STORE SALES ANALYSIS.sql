# Use UniTech Database
USE UniTech;

# DATA ANALYSIS GROUP CAPSTONE PROJECT COHORT 8
# PROJECT TITLE: Retail Store Analysis 
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
# 📈 The dataset contains 1,000 transaction records but only four distinct product IDs: 1054, 1055, 1062, and 1064. Each ID corresponds to a different product category: Clothing, Electronics, Food, or Furniture.
# 📈 Consequently, the analysis compares four product categories rather than a wide range of individual products. Additional product names and details would help the business identify its best-selling individual products.
# 📈 The dataset classifies customers as New or Returning but does not contain unique customer IDs. Therefore, it is not possible to determine how often individual customers purchase products or calculate customer retention rates accurately.
# 📈 The dataset does not contain detailed information about advertising campaigns, discounts, inventory levels, customer satisfaction, or promotional activities. This limits the ability to explain why particular products or categories perform better than others.
# 📈 The dataset covers transactions from 2 January 2023 to 27 September 2025. Since 2025 is incomplete, comparing its total sales with those of complete years could produce misleading conclusions.
# 📈 The column MyUnknownColumn, contains no data. It contributes nothing to the analysis and should be removed after confirming that it is unnecessary.
# 📈 Each sales representative is associated with only one region in this dataset. Therefore, differences in their sales results cannot be attributed solely to individual performance because regional differences may also influence the results

# 2. KEY FINDINGS:
# 🔑 The analysis revealed that the retail store recorded 1,000 transactions, sold 25,355 units, and generated total revenue of 70,329,940.71.
# 🔑 The total cost recorded was 63,842,093.64, while the store generated 6,487,847.07 in total profit. This represents an overall profit margin of approximately 9.22%.
# 🔑 Business insight: The store is generating revenue and profit, but management should investigate opportunities to improve profitability by reviewing costs, pricing, and the performance of individual product categories.
# 🔑 Clothing emerged as the leading category by revenue, generating 19,286,733.93 from 268 transactions and selling 6,922 units
# 🔑 Furniture ranked second in revenue, generating 18,330,280.56, followed by Electronics at 17,571,040.57. Food recorded the lowest revenue, at 15,141,885.65.
# 🔑 Business insight: Clothing is the strongest category in terms of revenue and units sold. The business should maintain its availability and investigate the factors contributing to its strong performance.
# 🔑 Although Clothing generated the highest revenue, Furniture recorded the highest total profit, at 1,779,461.16, and the highest profit margin, at approximately 9.71%.
# 🔑 The category generating the highest revenue is not necessarily the category generating the highest profit. Furniture's performance suggests that management should explore opportunities to increase its sales while maintaining its profitability.
# 🔑 The North region generated the highest revenue, at 18,208,403.85, followed by East at 18,077,401.05 and West at 17,761,568.65
# 🔑 The online sales channel generated 35,739,707.20 from 488 transactions, while the retail channel generated 34,590,233.51 from 512 transactions.
# 🔑 Online sales therefore generated 1,149,473.69 more revenue despite recording fewer transactions.

# 💡 RECOMMENDATIONS:
# Explore opportunities to increase Furniture sales while maintaining its profit margin. Review pricing, costs, and demand before expanding stock or promotional activities.
# For the South region's lower revenue. Consider targeted marketing, customer engagement, and product availability improvements based on additional regional information.
# Introduce customer loyalty programmes, personalised offers, and follow-up promotions to encourage existing customers to return. Collect unique customer IDs to measure retention and repeat-purchase rates accurately.
# Collect more detailed product information, unique customer identifiers, inventory levels, and promotional details to support deeper analysis.
# Maintaining Clothing's strong performance, exploring opportunities to increase Furniture sales, improving the performance of the Food category, and encouraging repeat purchases through customer loyalty programmes

# CONCLUSION: DATA STORYTELLING:
# The Retail Store Analysis reveals a business that generated 70.33 million in revenue and 6.49 million in profit, with an overall profit margin of approximately 9.22% across 1,000 transactions.
# The most important discovery is that sales performance and profitability tell different stories. Clothing generated the highest revenue and sold the most units, while Furniture produced the highest total profit and profit margin. This demonstrates why management should consider both revenue and profitability when making product-related decisions.
# The analysis also revealed that online sales generated more revenue than retail sales despite recording fewer transactions. New customers contributed more revenue than returning customers, North was the strongest region by revenue, and monthly sales varied throughout the reporting period.
# These findings present opportunities to maintain Clothing's strong performance, grow profitable Furniture sales, improve Food category results, strengthen regional performance, and encourage repeat purchases.
# To make better business decisions, management should combine regular sales monitoring with improved data collection. Adding individual product details, unique customer identifiers, and promotional information would help the business understand not only what is happening but also why it is happening.
# Ultimately, the goal is to use data to improve product performance, increase profitability, strengthen customer relationships, and support sustainable business growth.
