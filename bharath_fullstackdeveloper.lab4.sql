CREATE DATABASE ecommerce;
USE DATABASE ecommerce;
CREATE TABLE supplier (
  SUPP_ID INT PRIMARY KEY,
  SUPP_NAME VARCHAR(50) NOT NULL,
  SUPP_CITY VARCHAR(50) NOT NULL,
  SUPP_PHONE VARCHAR(50) NOT NULL
);

CREATE TABLE customer (
  CUS_ID INT PRIMARY KEY,
  CUS_NAME VARCHAR(20) NOT NULL,
  CUS_PHONE VARCHAR(10) NOT NULL,
  CUS_CITY VARCHAR(30) NOT NULL,
  CUS_GENDER CHAR
);

CREATE TABLE category (
  CAT_ID INT PRIMARY KEY,
  CAT_NAME VARCHAR(20) NOT NULL
);

CREATE TABLE product (
  PRO_ID INT PRIMARY KEY,
  PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
  PRO_DESC VARCHAR(60),
  CAT_ID INT,
  FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
);

CREATE TABLE supplier_pricing (
  PRICING_ID INT PRIMARY KEY,
  PRO_ID INT,
  SUPP_ID INT,
  SUPP_PRICE INT DEFAULT 0,
  FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID),
  FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);

CREATE TABLE order (
  ORD_ID INT PRIMARY KEY,
  ORD_AMOUNT INT NOT NULL,
  ORD_DATE DATE NOT NULL,
  CUS_ID INT,
  PRICING_ID INT,
  FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
  FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

CREATE TABLE rating (
  RAT_ID INT PRIMARY KEY,
  ORD_ID INT,
  RAT_RATSTARS INT NOT NULL,
  FOREIGN KEY (ORD_ID) REFERENCES order(ORD_ID)
);
-- Supplier Table
INSERT INTO supplier (supp_id, supp_name, supp_city, supp_phone)
VALUES (1, 'Rajesh Retails', 'Delhi', '1234567890'),
       (2, 'Appario Ltd.', 'Mumbai', '2589631470'),
       (3, 'Knome products', 'Banglore', '9785462315'),
       (4, 'Bansal Retails', 'Kochi', '8975463285'),
       (5, 'Mittal Ltd.', 'Lucknow', '7898456532');

-- Customer Table
INSERT INTO customer (cus_id, cus_name, cus_phone, cus_city, cus_gender)
VALUES (1, 'AAKASH', '9999999999', 'DELHI', 'M'),
       (2, 'AMAN', '9785463215', 'NOIDA', 'M'),
       (3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
       (4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
       (5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

-- Category Table
INSERT INTO category (cat_id, cat_name)
VALUES (1, 'BOOKS'),
       (2, 'GAMES'),
       (3, 'GROCERIES'),
       (4, 'ELECTRONICS'),
       (5, 'CLOTHES');

-- Product Table
INSERT INTO product (pro_id, pro_name, pro_desc, cat_id)
VALUES (1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
       (2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
       (3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
       (4, 'OATS', 'Highly Nutritious from Nestle', 3),
       (5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
       (6, 'MILK', '1L Toned MIlk', 3),
       (7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
       (8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
       (9, 'Project IGI', 'compatible with windows 7 and above', 2),
       (10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
       (11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
       (12, 'Train Your Brain', 'By Shireen Stephen', 1);

-- Supplier_pricing Table
INSERT INTO supplier_pricing (pricing_id, pro_id, supp_id, supp_price)
VALUES (1, 1, 2, 1500),
       (2, 3, 5, 30000),
       (3, 5, 1, 3000),
       (4, 2, 3, 2500),
       (5, 4, 1, 1000);
INSERT INTO OrderTable (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (101, 1500, '2021-10-06', 2, 1),
       (102, 1000, '2021-10-12', 3, 5),
       (103, 30000, '2021-09-16', 5, 2),
       (104, 1500, '2021-10-05', 1, 1),
       (105, 3000, '2021-08-16', 4, 3),
       (106, 1450, '2021-08-18', 1, 9),
       (107, 789, '2021-09-01', 3, 7),
       (108, 780, '2021-09-07', 5, 6),
       (109, 3000, '2021-00-10', 5, 3),
       (110, 2500, '2021-09-10', 2, 4),
       (111, 1000, '2021-09-15', 4, 5),
       (112, 789, '2021-09-16', 4, 7),
       (113, 31000, '2021-09-16', 1, 8),
       (114, 1000, '2021-09-16', 3, 5),
       (115, 3000, '2021-09-16', 5, 3),
       (116, 99, '2021-09-17', 2, 14);
INSERT INTO RatingTable (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (1, 101, 4),
       (2, 102, 3),
       (3, 103, 1),
       (4, 104, 2),
       (5, 105, 4),
       (6, 106, 3),
       (7, 107, 4),
       (8, 108, 4),
       (9, 109, 3),
       (10, 110, 5),
       (11, 111, 3),
       (12, 112, 4),
       (13, 113, 2),
       (14, 114, 1),
       (15, 115, 1),
       (16, 116, 0);
SELECT cus_gender, COUNT(DISTINCT cus_id) AS total_customers
FROM customer c
JOIN order_table o ON c.cus_id = o.cus_id
WHERE o.ord_amount >= 3000
GROUP BY cus_gender;

SELECT ORDER_TABLE.*, PRODUCT.PRODUCT_NAME
FROM ORDER_TABLE
INNER JOIN PRODUCT
ON ORDER_TABLE.PRODUCT_ID = PRODUCT.PRODUCT_ID
WHERE ORDER_TABLE.CUS_ID = 2;

SELECT s.Supplier_Id, s.Supplier_Name, s.Supplier_Address, s.Supplier_Phone
FROM Supplier s
INNER JOIN Product p ON s.Supplier_Id = p.Supplier_Id
GROUP BY s.Supplier_Id
HAVING COUNT(DISTINCT p.Product_Id) > 1;

SELECT c.CategoryID, c.CategoryName, p.ProductName, p.Price
FROM Categories c
INNER JOIN Products p ON c.CategoryID = p.CategoryID
WHERE p.Price = (
  SELECT MIN(Price)
  FROM Products
  WHERE CategoryID = c.CategoryID
)
ORDER BY c.CategoryID;

SELECT p.PROD_ID, p.PROD_NAME
FROM PRODUCT p
JOIN ORDER_TABLE o
ON p.PROD_ID = o.PRICING_ID
WHERE o.ORD_DATE > '2021-10-05';

SELECT cust_name, cust_gender
FROM customer
WHERE cust_name LIKE 'A%' OR cust_name LIKE '%A';

CREATE PROCEDURE supplier_details_with_service_type()
BEGIN
    SELECT supplier_id, supplier_name, rating, 
           CASE 
                WHEN rating = 5 THEN 'Excellent Service'
                WHEN rating > 4 THEN 'Good Service'
                WHEN rating > 2 THEN 'Average Service'
                ELSE 'Poor Service'
           END AS type_of_service
    FROM suppliers;
    END;


