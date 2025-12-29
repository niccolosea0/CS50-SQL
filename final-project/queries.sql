-- Coffee Shop Management Database Queries
-- This file contains common queries that users of the database
-- would typically run to manage and retrieve data.

--------------------------------------------------
-- INSERT QUERIES
--------------------------------------------------

-- Insert product categories
INSERT INTO categories (name) VALUES ('Coffee');
INSERT INTO categories (name) VALUES ('Tea');
INSERT INTO categories (name) VALUES ('Pastry');

-- Insert products
INSERT INTO products (name, price, category_id)
VALUES ('Espresso', 3.00, 1);

INSERT INTO products (name, price, category_id)
VALUES ('Cappuccino', 4.50, 1);

INSERT INTO products (name, price, category_id)
VALUES ('Croissant', 2.75, 3);

-- Insert inventory records
INSERT INTO inventory (product_id, quantity)
VALUES (1, 100);

INSERT INTO inventory (product_id, quantity)
VALUES (2, 80);

INSERT INTO inventory (product_id, quantity)
VALUES (3, 50);

-- Insert employees
INSERT INTO employees (first_name, last_name, role, hire_date)
VALUES ('Anna', 'Smith', 'barista', '2023-05-10');

INSERT INTO employees (first_name, last_name, role, hire_date)
VALUES ('John', 'Doe', 'cashier', '2022-11-01');

-- Insert a registered customer
INSERT INTO customers (first_name, last_name, email, phone)
VALUES ('Michael', 'Brown', 'michael.brown@email.com', '555-1234');

--------------------------------------------------
-- CREATE AN ORDER (REGISTERED CUSTOMER)
--------------------------------------------------

-- Create a new order for a registered customer
INSERT INTO orders (customer_id, employee_id, status)
VALUES (1, 1, 'pending');

-- Add items to the order
INSERT INTO order_items (order_id, product_id, quantity, price_at_order_time)
VALUES (1, 1, 2, 3.00);

INSERT INTO order_items (order_id, product_id, quantity, price_at_order_time)
VALUES (1, 3, 1, 2.75);

-- Record payment for the order
INSERT INTO payments (order_id, payment_method, amount)
VALUES (1, 'card', 8.75);

-- Mark the order as completed
UPDATE orders
SET status = 'completed'
WHERE id = 1;

--------------------------------------------------
-- CREATE AN ORDER (WALK-IN CUSTOMER)
--------------------------------------------------

-- Create an order without a registered customer
INSERT INTO orders (employee_id, status)
VALUES (2, 'pending');

-- Add items to the walk-in order
INSERT INTO order_items (order_id, product_id, quantity, price_at_order_time)
VALUES (2, 2, 1, 4.50);

-- Record cash payment
INSERT INTO payments (order_id, payment_method, amount)
VALUES (2, 'cash', 4.50);

--------------------------------------------------
-- SELECT QUERIES
--------------------------------------------------

-- Retrieve all completed orders with total amounts
SELECT
    o.id AS order_id,
    o.order_time,
    SUM(oi.quantity * oi.price_at_order_time) AS total_amount
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
WHERE o.status = 'completed'
GROUP BY o.id;

-- View detailed information for a specific order
SELECT
    o.id AS order_id,
    p.name AS product_name,
    oi.quantity,
    oi.price_at_order_time
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE o.id = 1;

-- List all products with their categories and inventory levels
SELECT
    p.name AS product,
    c.name AS category,
    p.price,
    i.quantity
FROM products p
JOIN categories c ON p.category_id = c.id
JOIN inventory i ON p.id = i.product_id;

-- Show total sales per product
SELECT
    p.name AS product,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * oi.price_at_order_time) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.id;

--------------------------------------------------
-- UPDATE QUERIES
--------------------------------------------------

-- Update inventory after selling products
UPDATE inventory
SET quantity = quantity - 2
WHERE product_id = 1;

-- Change the price of a product
UPDATE products
SET price = 4.75
WHERE name = 'Cappuccino';

--------------------------------------------------
-- DELETE QUERIES
--------------------------------------------------

-- Remove a discontinued product from active sale
UPDATE products
SET is_active = 0
WHERE name = 'Croissant';

-- Delete an order that was cancelled
DELETE FROM orders
WHERE status = 'cancelled';
