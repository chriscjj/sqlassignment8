

select * from persons;
-- Q1
SELECT country_name,count(*) from persons group by country_name;

-- Q2
SELECT country_name,count(*) from persons group by country_name order by count(*) desc;

-- Q3
SELECT country_name,avg(rating) from persons group by country_name having avg(rating) > 3.0;

-- Q4
SELECT country_name from persons where rating = (SELECT avg(rating) from persons where country_name = 'USA');

-- Q5
CREATE DATABASE Product;
USE Product;

CREATE TABLE Customer (
    Customer_Id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);
INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St', 'Los Angeles', 'California', '90001', 'US'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak St', 'New York', 'New York', '10001', 'US'),
('Bob', 'Brown', 'bob.brown@example.com', '5555555555', '789 Pine St', 'Austin', 'Texas', '73301', 'US'),
('Alice', 'Johnson', 'alice.johnson@example.com', '6666666666', '321 Maple St', 'Seattle', 'Washington', '98101', 'US'),
('Eve', 'Davis', 'eve.davis@example.com', '7777777777', '654 Cedar St', 'Sacramento', 'California', '94203', 'US'),
('Charlie', 'Wilson', 'charlie.wilson@example.com', '8888888888', '987 Birch St', 'Miami', 'Florida', '33101', 'US');

select * from customer;
-- Q5 1
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email
FROM Customer;
SELECT * FROM customer_info;

-- Q5 2
CREATE VIEW us_customers AS 
SELECT * 
FROM Customer
WHERE country = 'US';
SELECt * FROM us_customers;

-- Q5 3
CREATE VIEW Customer_details AS
SELECT CONCAT(first_name,' ',last_name),email,phone_no,state
FROM customer;
SELECT * FROM Customer_details ;

-- Q5 4
UPDATE Customer_details
SET Phone_no = 1245789856
WHERE State = 'California';
SET SQL_SAFE_UPDATES = 1;

-- Q5 5
SELECT State, COUNT(*) AS customer_count
FROM Customer
GROUP BY State
HAVING customer_count > 1;

-- Q6
SELECT State, COUNT(*) AS customer_count
FROM Customer_details
GROUP BY State;

-- Q7
SELECT *
FROM Customer_details
ORDER BY State ASC;




