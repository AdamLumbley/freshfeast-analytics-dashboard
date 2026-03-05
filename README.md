# FreshFeast Analytics

![Total Revenue by Product Category](https://github.com/AdamLumbley/freshfeast-analytics-dashboard/raw/main/FF%20Sales%20By%20Category.png)
![Top 10 Customers by Lifetime Revenue](https://raw.githubusercontent.com/AdamLumbley/freshfeast-analytics-dashboard/main/FF%20Top%2010%20CLV.png)

## Overview
Performed analysis on subscription and order data for FreshFeast, an e-commerce meal subscription service.  
This project demonstrates the use of SQL (SQLite) to calculate key KPIs such as total revenue by product category, total revenue by product, and customer lifetime value segmentation.

## Key Insights
- The company’s highest-performing product category is **Vegetarian**, driving the majority of total revenue.  
- **Morgan Davis** is the #1 most valuable customer with the highest lifetime revenue.  
- Top 10 customers account for a significant portion of overall revenue, highlighting the importance of retention.  
- Products in the top revenue categories could be prioritized for promotions and marketing campaigns.

These insights help FreshFeast prioritize top-performing product categories and focus retention efforts on high-value customers.
  
## Database Schema
## Database Schema
**Customers Table**
- `customer_id`  
- `name`  
- `email`  
- `loyalty_tier`  

**Products Table**
- `product_id`  
- `name`  
- `category`  
- `price`  

**Subscriptions Table**
- `subscription_id`  
- `customer_id`  
- `product_id`  
- `start_date`  
- `end_date`  
- `status`  

**Orders Table**
- `order_id`  
- `subscription_id`  
- `order_date`  
- `quantity`  
- `price`  
- `promo_code`

## Tools Used
- **SQL / SQLite** – for schema and querying KPIs  
- **Power BI** – to create visuals highlighting top products and high-value customers

-   ## Sample Query 
### Total Revenue by Product Category
```sql
-- Total revenue by product category
SELECT
    p.category,
    ROUND(SUM(o.quantity * o.price), 2) AS total_revenue
FROM Subscriptions s
JOIN Orders o ON s.subscription_id = o.subscription_id
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;
