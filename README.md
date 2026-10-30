### RETAIL-STORE-SALES-ANALYSIS
Analyse The Dataset to Uncover Products Performance

#### SUMMARY: This project uses MySQL to analyze 1,000 retail sales transactions, examining sales revenue, costs, profit, and product category performance. The analysis revealed that Clothing generated the highest revenue, while Furniture recorded the highest total profit and profit margin. The findings provide insights into sales trends, regional performance, and sales channels to help identify opportunities for improving profitability and business growth.

#### OBJECTIVES: The objective of this project is to evaluate overall retail performance, identify the best-performing and most profitable product categories, and analyze monthly sales trends. It also aims to compare regional performance, online and retail sales channels, customer types, payment methods, and sales representatives to support informed business decisions and improve sales performance.

#### KEY FINDINGS:
1. Overall Performance: The store recorded 1,000 transactions, sold 25,355 units, generated 70,329,940.71 in revenue, and earned 6,487,847.07 in profit, with an      overall profit margin of approximately 9.22%.
2. Product Categories: Clothing generated the highest revenue at 19,286,733.93, while Food recorded the lowest revenue at 15,141,885.65.
3. Profitability: Furniture generated the highest total profit of 1,779,461.16 and the highest profit margin of approximately 9.71%, despite Clothing generating      the most revenue.
4. Regional Performance: North recorded the highest regional revenue at 18,208,403.85.
5. Sales Channels: Online sales generated 35,739,707.20 from 488 transactions, exceeding retail sales revenue by 1,149,473.69 despite having fewer transactions.


RECOMMENDATIONS: 
1. Grow Profitable Categories: Explore opportunities to increase Furniture sales while maintaining its strong profit margin.
2. Maintain Clothing Performance: Ensure product availability and investigate the factors contributing to Clothing's high revenue and sales volume.
3. Improve Lower-Performing Categories: Review the pricing, demand, costs, and marketing of Food to identify opportunities for improvement.
4. Strengthen Customer Retention: Introduce loyalty programmes and personalized promotions to encourage repeat purchases.
4. Improve Data Collection: Add unique customer IDs, detailed product information, inventory data, and promotional records to support better decisions.

#### APPROACH: The project began by exploring the retail dataset in MySQL, inspecting sample records, and checking for missing values and duplicate records. SQL queries were then used to calculate overall revenue, costs, profit, and profit margins, while comparing product categories, monthly trends, regions, sales channels, customer types, sales representatives, and payment methods. Finally, the results were interpreted to identify business opportunities, highlight data limitations, and develop recommendations for improving sales and profitability.

LIMITATIONS: 
Limited Product Details: The dataset contains only four distinct product IDs, limiting detailed analysis of individual products within each category.
Missing Customer Identifiers: Unique customer IDs are unavailable, preventing accurate measurement of individual purchase frequency and customer retention.
Missing Business Context: Information about advertising, discounts, promotions, inventory, and customer satisfaction is unavailable, limiting explanations for sales performance.
Incomplete Reporting Year: The dataset covers 2 January 2023 to 27 September 2025, meaning 2025 is incomplete and direct comparisons with full years may be misleading.
Unclear Performance Attribution: Each sales representative is associated with only one region, making it difficult to separate individual performance from regional influences. The MyUnknownColumn field also contains no data and should be reviewed for removal.

