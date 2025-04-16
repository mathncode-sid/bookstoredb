-- Step 1: Create the Database
CREATE DATABASE IF NOT EXISTS bookstoredb;
USE bookstoredb;

-- Step 2: Create Tables

-- book_language
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL
);

-- publisher
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL
);

-- author
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- book
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publisher_id INT,
    language_id INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

-- book_author
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- country
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

-- address
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- address_status
CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50)
);

-- customer
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- customer_address
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- shipping_method
CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100),
    cost DECIMAL(10, 2)
);

-- order_status
CREATE TABLE order_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50)
);

-- cust_order
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    shipping_method_id INT,
    status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

-- order_line
CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- order_history
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    status_id INT,
    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

-- Step 3: Insert Sample Data

-- Language
INSERT INTO book_language (language_name) VALUES
('English'), ('Swahili');

-- Publisher
INSERT INTO publisher (publisher_name) VALUES
('Storymoja'), ('Longhorn Publishers'), ('Jomo Kenyatta Foundation');

-- Authors
INSERT INTO author (first_name, last_name) VALUES
('Ngugi', 'wa Thiong'o'),
('Yvonne', 'Adhiambo'),
('Meja', 'Mwangi'),
('Margaret', 'Ogola');

-- Books
INSERT INTO book (title, publisher_id, language_id, price) VALUES
('The River Between', 1, 1, 750.00),
('Dust', 2, 1, 950.00),
('Going Down River Road', 3, 1, 820.00),
('The River and the Source', 2, 1, 870.00),
('Weep Not, Child', 1, 1, 790.00),
('Petals of Blood', 1, 1, 880.00),
('Kigogo', 1, 1, 880.00),
('A Grain of Wheat', 1, 1, 850.00),
('Unbowed', 2, 1, 990.00),
('How to Write About Africa', 2, 1, 930.00),
('Beneath the Lion's Gaze', 3, 1, 870.00);

-- Book Author Links
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 1), (6, 1), (7, 1), (8, 4), (9, 2), (10, 2);

-- Country
INSERT INTO country (country_name) VALUES ('Kenya');

-- Addresses
INSERT INTO address (street, city, postal_code, country_id) VALUES
('Moi Avenue', 'Nairobi', '00100', 1),
('Kenyatta Avenue', 'Nairobi', '00100', 1),
('Langata Road', 'Nairobi', '00509', 1),
('Nakuru-Eldoret Rd', 'Nakuru', '20100', 1),
('Nyali Rd', 'Mombasa', '80100', 1),
('Kisumu Road', 'Kisumu', '40100', 1),
('Kimathi Street', 'Nyeri', '10100', 1),
('Uhuru Street', 'Eldoret', '30100', 1),
('Moi Street', 'Meru', '60200', 1),
('Tom Mboya Street', 'Kisii', '40200', 1),
('Kasarani Road', 'Nairobi', '00608', 1);

-- Address Status
INSERT INTO address_status (status_name) VALUES ('current'), ('old');

-- Customers
INSERT INTO customer (first_name, last_name, email, phone) VALUES
('Brian', 'Otieno', 'brian.o@gmail.com', '0712345678'),
('Amina', 'Ali', 'amina.ali@yahoo.com', '0723456789'),
('Peter', 'Mwangi', 'pmwangi@outlook.com', '0798765432'),
('Faith', 'Koech', 'faith.koech@gmail.com', '0700123456'),
('John', 'Kamau', 'john.kamau@gmail.com', '0711122233'),
('Grace', 'Wanjiru', 'grace.w@live.com', '0722233344'),
('Kevin', 'Mutiso', 'kevin.mutiso@gmail.com', '0733344455'),
('Sarah', 'Njeri', 'sarah.njeri@gmail.com', '0744455566'),
('Daniel', 'Ouma', 'daniel.ouma@gmail.com', '0755566677'),
('Esther', 'Chebet', 'esther.chebet@gmail.com', '0766677788');

-- Customer Addresses
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 1), (2, 2, 1), (3, 3, 1), (4, 4, 1), (5, 5, 1), (6, 6, 1),
(7, 7, 1), (8, 8, 1), (9, 9, 1), (10, 10, 1);

-- Shipping Methods
INSERT INTO shipping_method (method_name, cost) VALUES
('Pickup from store', 0.00),
('Nairobi Courier', 150.00),
('Nationwide Delivery', 300.00);

-- Order Status
INSERT INTO order_status (status_name) VALUES
('Pending'), ('Shipped'), ('Delivered');

-- Orders
INSERT INTO cust_order (customer_id, order_date, shipping_method_id, status_id) VALUES
(1, NOW(), 2, 1), (2, NOW(), 3, 2), (3, NOW(), 1, 3), (4, NOW(), 2, 2),
(5, NOW(), 3, 1), (6, NOW(), 1, 1), (7, NOW(), 2, 3), (8, NOW(), 3, 2),
(9, NOW(), 2, 3), (10, NOW(), 1, 1);

-- Order Lines
INSERT INTO order_line (order_id, book_id, quantity, price) VALUES
(1, 1, 2, 750.00), (2, 2, 1, 950.00), (2, 4, 1, 870.00), (3, 3, 3, 820.00),
(4, 5, 2, 790.00), (5, 6, 1, 880.00), (6, 7, 2, 850.00), (7, 8, 1, 990.00),
(8, 9, 1, 930.00), (9, 10, 1, 870.00), (10, 4, 1, 870.00), (10, 1, 1, 750.00);

-- Order History
INSERT INTO order_history (order_id, status_id, changed_at) VALUES
(1, 1, NOW()), (2, 1, NOW() - INTERVAL 2 DAY), (2, 2, NOW() - INTERVAL 1 DAY),
(3, 1, NOW() - INTERVAL 3 DAY), (3, 3, NOW()), (4, 1, NOW() - INTERVAL 2 DAY),
(4, 2, NOW() - INTERVAL 1 DAY), (5, 1, NOW()), (6, 1, NOW()), (7, 1, NOW() - INTERVAL 4 DAY),
(7, 3, NOW()), (8, 1, NOW() - INTERVAL 1 DAY), (8, 2, NOW()), (9, 3, NOW()), (10, 1, NOW());

-- Step 4: User Management (Granting Access from specific IPs)

CREATE USER 'admin1'@'%' IDENTIFIED BY 'password1';
CREATE USER 'admin2'@'%' IDENTIFIED BY 'password2';

GRANT SELECT, INSERT, UPDATE ON bookstoredb.* TO 'admin1'@'%';
GRANT SELECT, INSERT, UPDATE ON bookstoredb.* TO 'admin2'@'%';

FLUSH PRIVILEGES;

