show databases;
create database sept_final_project_retail;
use sept_final_project_retail;
show tables;
select* from cust_details;
CREATE TABLE cust_details (
    sl_no INT AUTO_INCREMENT PRIMARY KEY,
    cust_id VARCHAR(50) NOT NULL,
    cust_full_name VARCHAR(100) NOT NULL,
    cust_address VARCHAR(255) NOT NULL,
    cust_phone_number VARCHAR(10) NOT NULL
) AUTO_INCREMENT =1;
INSERT INTO cust_details (cust_id, cust_full_name, cust_address, cust_phone_number)
VALUES ('CUST001', 'John Doe', '123 Main Street, Springfield', '123456789');
truncate cust_details;
select * from cust_details
where cust_phone_number = '123456789';
delete from cust_details 
where sl_no = 5;
CREATE TABLE inventory (
    product_id VARCHAR(50)  PRIMARY KEY not null,
    product_name VARCHAR(100) NOT NULL,
    product_price DECIMAL(10, 2) NOT NULL
) ;
select * from inventory;
INSERT INTO Inventory (product_id, product_name, product_price)
VALUES ('PROD001', 'Toothpaste', 75.50);
INSERT INTO Inventory (product_id, product_name, product_price) 
VALUES ('PROD002', 'Shampoo', 219.00);
INSERT INTO Inventory (product_id, product_name, product_price) 
VALUES ('PROD003', 'Soap ', 29.00);
INSERT INTO Inventory (product_id, product_name, product_price) 
VALUES ('PROD004', 'Detergent Powder ', 149.00);
INSERT INTO Inventory (product_id, product_name, product_price) 
VALUES ('PROD005', 'Toilet Cleaner ', 90.00);
INSERT INTO Inventory (product_id, product_name, product_price) 
VALUES ('PROD006', 'Dishwashimg Liquid', 65.00);
INSERT INTO Inventory (product_id, product_name, product_price) 
VALUES ('PROD007', 'Pack of Tissue Paper ', 50.00);
INSERT INTO Inventory (product_id, product_name, product_price) 
VALUES ('PROD008', 'Hair oil ', 140.00);
INSERT INTO Inventory (product_id, product_name, product_price) 
VALUES ('PROD009', 'Fase Wash', 199.00);
INSERT INTO Inventory (product_id, product_name, product_price) 
VALUES ('PROD010', 'Hand Sanitizer', 85.00);
INSERT INTO Inventory (product_id, product_name, product_price) 
VALUES ('PROD011', 'Body Lotion', 220.00);
INSERT INTO Inventory (product_id, product_name, product_price) 
VALUES ('PROD012', 'Mosquito Repellent ', 130.00);
INSERT INTO Inventory (product_id, product_name, product_price) 
VALUES ('PROD013', 'Pack of Razors', 175.00);
INSERT INTO Inventory (product_id, product_name, product_price) 
VALUES ('PROD014', 'laundry Bleach', 95.00);
INSERT INTO Inventory (product_id, product_name, product_price) 
VALUES ('PROD015', 'Kitchen Cleaner', 110.00);
INSERT INTO Inventory (product_id, product_name, product_price) 
VALUES ('PROD016', 'Noise-Cancelling Headphones', 6999.00);
select * from audit_table;  
CREATE TABLE audit_table (
    sl_no INT AUTO_INCREMENT PRIMARY KEY,
    cust_id varchar (50) NOT NULL,
    cust_name VARCHAR(100) NOT NULL,
    cust_phone_number VARCHAR(10) NOT NULL,
    total_bill_amount DECIMAL(10, 2) NOT NULL,
    current_time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) AUTO_INCREMENT = 1;
INSERT INTO audit_table (cust_id, cust_name, cust_phone_number, total_bill_amount)
VALUES ('CUST101', 'Alice Johnson', '9876543210', 1500.75);



