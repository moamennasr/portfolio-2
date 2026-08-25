# Create Our Database cald Sales
create database if not exists Sales;

# Mark our Dataset for use
Use Sales;

# Create Tables
-- 1. Create Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email_address VARCHAR(255),
    number_of_complaints INT DEFAULT 0
);

-- 2. Create Companies Table
CREATE TABLE Companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number VARCHAR(50)
);

-- 3. Create Items Table
CREATE TABLE Items (
    item_code VARCHAR(10) PRIMARY KEY,
    item VARCHAR(255) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);

-- 4. Create Sales Table
CREATE TABLE Sales (
    purchase_number INT AUTO_INCREMENT PRIMARY KEY,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (item_code) REFERENCES Items(item_code)
);

-- STEP 1: Insert into parent tables first
INSERT INTO Customers (first_name, last_name, email_address, number_of_complaints) VALUES
('Alex', 'Morgan', 'alex.morgan@email.com', 0),
('Jordan', 'Lee', 'jordan.lee@email.com', 2),
('Taylor', 'Swift', 'taylor.s@email.com', 1),
('Chris', 'Evans', 'chris.e@email.com', 0);

INSERT INTO Companies (company_name, headquarters_phone_number) VALUES
('TechCorp', '+1-555-0199'),
('Global Logistics', '+1-555-0142'),
('Apex Retail', '+1-555-0187');

-- STEP 2: Insert into Items (depends on Companies)
INSERT INTO Items (item_code, item, unit_price, company_id) VALUES
('ITEM001', 'Wireless Mouse', 29.99, 1),
('ITEM002', 'Mechanical Keyboard', 89.50, 1),
('ITEM003', 'Shipping Box Large', 4.99, 2),
('ITEM004', 'Ergonomic Chair', 199.99, 3);

-- STEP 3: Insert into Sales LAST (depends on Customers and Items)
INSERT INTO Sales (date_of_purchase, customer_id, item_code) VALUES
('2026-08-01', 1, 'ITEM001'),
('2026-08-03', 2, 'ITEM002'),
('2026-08-10', 1, 'ITEM004'),
('2026-08-15', 3, 'ITEM003'),
('2026-08-20', 4, 'ITEM001');