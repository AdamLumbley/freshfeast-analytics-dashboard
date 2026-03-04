-- Total revenue by product category
SELECT
    p.category,
    ROUND(SUM(o.quantity * o.price), 2) AS total_revenue
FROM Subscriptions s
JOIN Orders o ON s.subscription_id = o.subscription_id
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Total revenue by product
SELECT
    p.name,
    ROUND(SUM(o.quantity * o.price), 2) AS total_revenue
FROM Subscriptions s
JOIN Orders o ON s.subscription_id = o.subscription_id
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.name
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
