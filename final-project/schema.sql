-- Coffee Shop Management Database Schema
-- This file defines the structure of the database, including tables,
-- relationships, constraints, and performance optimizations.

-- Enable foreign key support (required in SQLite)
PRAGMA foreign_keys = ON;

--------------------------------------------------
-- Customers table
-- Stores registered customer information.
-- Walk-in customers are not stored here.
--------------------------------------------------
CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE,
    phone TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

--------------------------------------------------
-- Employees table
-- Stores information about Cofee Shop staff.
--------------------------------------------------
CREATE TABLE employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    role TEXT NOT NULL,
    hire_date DATE NOT NULL
);

--------------------------------------------------
-- Categories table
-- Groups products into logical categories.
--------------------------------------------------
CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

--------------------------------------------------
-- Products table
-- Stores items sold by the Cofee Shop
--------------------------------------------------
CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price NUMERIC NOT NULL CHECK(price >= 0),
    category_id INTEGER NOT NULL,
    is_active INTEGER NOT NULL DEFAULT 1,
    FOREIGN KEY(category_id) REFERENCES categories(id)
);

--------------------------------------------------
-- Inventory table
-- Tracks stock levels for each product
--------------------------------------------------
CREATE TABLE inventory (
    product_id INTEGER PRIMARY KEY,
    quantity INTEGER NOT NULL CHECK(quantity >= 0),
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(product_id) REFERENCES products(id)
);


--------------------------------------------------
-- Orders table
-- Represents customer orders.
-- customer_id is nullable to allow walk-in customers.
--------------------------------------------------
CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    employee_id INTEGER NOT NULL,
    order_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    status TEXT NOT NULL CHECK (status IN ('pending', 'completed', 'cancelled')),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

--------------------------------------------------
-- Order items table
-- Junction table resolving the many-to-many relationship
-- between orders and products.
--------------------------------------------------
CREATE TABLE order_items (
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    price_at_order_time NUMERIC NOT NULL CHECK (price_at_order_time >= 0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

--------------------------------------------------
-- Payments table
-- Stores payment information for orders.
--------------------------------------------------
CREATE TABLE payments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER NOT NULL UNIQUE,
    payment_method TEXT NOT NULL CHECK (payment_method IN ('cash', 'card')),
    amount NUMERIC NOT NULL CHECK (amount >= 0),
    payment_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

--------------------------------------------------
-- Indexes for performance optimization
--------------------------------------------------

-- Speed up lookups on foreign keys
CREATE INDEX idx_products_category_id ON products(category_id);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_employee_id ON orders(employee_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
CREATE INDEX idx_payments_order_id ON payments(order_id);

-- Speed up time-based queries
CREATE INDEX idx_orders_order_time ON orders(order_time);
