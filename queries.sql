-- Monthly revenue broken down by customer loyalty tier
SELECT
    strftime('%Y-%m', o.order_date) AS month,
    c.loyalty_tier,
    ROUND(SUM(o.quantity * o.price), 2) AS total_revenue
FROM Subscriptions s
JOIN Orders o ON s.subscription_id = o.subscription_id
JOIN Customers c ON s.customer_id = c.customer_id
GROUP BY month, c.loyalty_tier
ORDER BY month ASC, total_revenue DESC;

-- Total revenue per product category
SELECT
    p.category,
    ROUND(SUM(o.quantity * o.price), 2) AS total_revenue
FROM Subscriptions s
JOIN Orders o ON s.subscription_id = o.subscription_id
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Promo code usage and total revenue per promo
SELECT
    promo_code, 
    COUNT(*) AS times_used,
    ROUND(SUM(quantity * price), 2) AS total_revenue
FROM Orders
WHERE promo_code IS NOT NULL
GROUP BY promo_code
ORDER BY total_revenue DESC;

-- Customer lifetime revenue segmentation by value tier
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

-- Customer order frequency segmentation (one-time vs repeat vs loyal)
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS order_count,
    CASE
        WHEN COUNT(o.order_id) = 1 THEN 'One-Time'
        WHEN COUNT(o.order_id) BETWEEN 2 AND 4 THEN 'Repeat'
        ELSE 'Loyal'
    END AS customer_type
FROM Subscriptions s
JOIN Orders o ON s.subscription_id = o.subscription_id
JOIN Customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY order_count DESC;
