# FreshFeast Analytics

![Total Revenue by Product Category](https://github.com/AdamLumbley/freshfeast-analytics-dashboard/raw/main/FF%20Sales%20By%20Category.png)
![Customer Lifetime Value Segmentation](https://github.com/AdamLumbley/freshfeast-analytics-dashboard/raw/main/FF%20Top%2010%20CLV.png)

## Overview
Performed analysis on subscription and order data for FreshFeast, an e-commerce meal subscription service.  
This project demonstrates the use of SQL (SQLite) to calculate key KPIs such as total revenue by product category, total revenue by product, and customer lifetime value segmentation.

## Tools Used
- **SQL / SQLite** – for schema, data generation, and querying KPIs  
- **Power BI** – to create visuals highlighting top products and high-value customers  

## Database Schema
**Customers Table**
- `customer_id` (Primary Key)  
- `name`  
- `email`  

**Products Table**
- `product_id` (Primary Key)  
- `name`  
- `category`  
- `price`  

**Subscriptions Table**
- `subscription_id` (Primary Key)  
- `customer_id` (Foreign Key → Customers)  
- `product_id` (Foreign Key → Products)  
- `quantity`  
- `order_date`  
- `total_amount`  

## Sample Queries
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
