-- ==========================
-- FreshFeast Boxes Schema
-- ==========================

-- 1. Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    signup_date DATE,
    age INT,
    location VARCHAR(50),
    loyalty_tier VARCHAR(10) -- Bronze, Silver, Gold
);

-- 2. Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    category VARCHAR(20), -- Vegetarian, Keto, Family, Quick-Prep
    price DECIMAL(6,2),
    inventory INT
);

-- 3. Subscriptions
CREATE TABLE Subscriptions (
    subscription_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(10), -- Active, Paused, Cancelled
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 4. Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    subscription_id INT,
    order_date DATE,
    quantity INT,
    price DECIMAL(6,2),
    promo_code VARCHAR(10),
    FOREIGN KEY (subscription_id) REFERENCES Subscriptions(subscription_id)
);

-- 5. Promotions
CREATE TABLE Promotions (
    promo_code VARCHAR(10) PRIMARY KEY,
    description VARCHAR(50),
    discount_percent DECIMAL(5,2),
    start_date DATE,
    end_date DATE
);
