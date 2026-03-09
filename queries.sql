--Cohort Analysis
WITH first_purchase AS (
  SELECT
    s.customer_id,
    MIN(strftime('%Y-%m', o.order_date)) AS cohort_month
  FROM Orders o
  JOIN Subscriptions s ON o.subscription_id = s.subscription_id
  GROUP BY s.customer_id
),
cohort_purchases AS (
  SELECT
    f.cohort_month,
    strftime('%Y-%m', o.order_date) AS order_month,
    COUNT(*) AS purchases,
    SUM(o.price * o.quantity) AS revenue
  FROM Orders o
  JOIN Subscriptions s ON o.subscription_id = s.subscription_id
  JOIN first_purchase f ON s.customer_id = f.customer_id
  GROUP BY f.cohort_month, strftime('%Y-%m', o.order_date)
)
SELECT
  cohort_month,
  order_month,
  revenue,
  purchases
FROM cohort_purchases
ORDER BY cohort_month, order_month;

-- Total Revenue by Category
SELECT
    p.category,
    ROUND(SUM(o.quantity * o.price), 2) AS total_revenue
FROM Subscriptions s
JOIN Orders o ON s.subscription_id = o.subscription_id
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Total Revenue by Product
SELECT
    p.name,
    ROUND(SUM(o.quantity * o.price), 2) AS total_revenue
FROM Subscriptions s
JOIN Orders o ON s.subscription_id = o.subscription_id
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.name
ORDER BY total_revenue DESC;

-- CLV by Segmentation by Value Tier
SELECT
    c.customer_id,
    c.name,
    ROUND(SUM(o.quantity * o.price), 2) AS lifetime_revenue,
    CASE
        WHEN SUM(o.quantity * o.price) >= 500 THEN 'High Value'
        WHEN SUM(o.quantity * o.price) >= 200 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS segment
FROM Subscriptions s
JOIN Orders o ON s.subscription_id = o.subscription_id
JOIN Customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY lifetime_revenue DESC;
