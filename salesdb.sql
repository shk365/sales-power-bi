-- Sales Database (salesdb)
-- Power BI Project 

DROP DATABASE IF EXISTS salesdb;
CREATE DATABASE salesdb;
USE salesdb;


-- Table: customers

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    join_date DATE
) ENGINE=InnoDB;

INSERT INTO customers (customer_id, customer_name, email, city, state, join_date) VALUES
(101, 'Arjun Rao', 'arjun@example.com', 'Mumbai', 'Maharashtra', '2023-03-10'),
(102, 'Neha Patel', 'neha@example.com', 'Delhi', 'Delhi', '2023-05-02'),
(103, 'Rohit Sharma', 'rohit@example.com', 'Bengaluru', 'Karnataka', '2023-07-15'),
(104, 'Aisha Khan', 'aisha@example.com', 'Hyderabad', 'Telangana', '2023-09-11'),
(105, 'Vikram Singh', 'vikram@example.com', 'Chennai', 'Tamil Nadu', '2023-11-25');


-- Table: products

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
) ENGINE=InnoDB;

INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop X1', 'Electronics', 56000),
(2, 'Mobile M5', 'Electronics', 19000),
(3, 'Headphones H2', 'Accessories', 2500),
(4, 'Office Chair C1', 'Furniture', 7200),
(5, 'Smartwatch S4', 'Electronics', 8900);


-- Table: orders

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
) ENGINE=InnoDB;

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(5001, 101, '2024-01-12', 76000),
(5002, 103, '2024-02-05', 21500),
(5003, 102, '2024-02-18', 8900),
(5004, 104, '2024-03-02', 2500),
(5005, 105, '2024-03-22', 65200);


-- Table: order_items

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
) ENGINE=InnoDB;

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, subtotal) VALUES
(1, 5001, 1, 1, 56000),
(2, 5001, 3, 8, 20000),
(3, 5002, 2, 1, 19000),
(4, 5002, 3, 1, 2500),
(5, 5003, 5, 1, 8900),
(6, 5004, 3, 1, 2500),
(7, 5005, 4, 2, 14400),
(8, 5005, 2, 2, 38000),
(9, 5005, 3, 5, 12500);

