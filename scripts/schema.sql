--Creating tables

--Customers
CREATE TABLE customers(
customer_id INT PRIMARY KEY,
c_name VARCHAR(200) NOT NULL,
region VARCHAR(100)
);

--Products
CREATE TABLE products(
  product_id INT PRIMARY KEY,
  p_name VARCHAR(200),
  category VARCHAR(50)
  );

--Transactions
CREATE TABLE transactions(
  transaction_id INT PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),
  product_id INT REFERENCES products(product_id),
  sale_date DATE,
  amount INT
  );

--INSERTING DATA

--CUSTOMERS
INSERT INTO customers VALUES(1001, 'John Doe', 'Kigali');
INSERT INTO customers VALUES(1002, 'Nziza Ines', 'Kigali');
INSERT INTO customers VALUES(1003, 'Serena Gomez', 'Rubavu');
INSERT INTO customers VALUES(1004, 'Keza Rana', 'Huye');
INSERT INTO customers VALUES(1005, 'Shami Gloria', 'Nyagatare');
INSERT INTO customers VALUES(1006, 'Peter', 'Musanze');

--PRODUCTS
INSERT INTO products VALUES(901, 'Milk Powder', 'Dairy');
INSERT INTO products VALUES(902, 'Rice', 'Grains');
INSERT INTO products VALUES(903, 'Cooking Oil', 'Oils');
INSERT INTO products VALUES(904, 'Coffee Beans', 'Beverages');
INSERT INTO products VALUES(905, 'Cheese', 'Dairy');

--TRANSACTIONS
INSERT INTO transactions VALUES(301, 1001, 902, TO_DATE('2025-02-05','YYYY-MM-DD'), 30000);
INSERT INTO transactions VALUES(302, 1002, 901, TO_DATE('2025-02-07','YYYY-MM-DD'), 20000);
INSERT INTO transactions VALUES(303, 1004, 904, TO_DATE('2025-03-04','YYYY-MM-DD'), 25000);
INSERT INTO transactions VALUES(304, 1002, 902, TO_DATE('2025-03-08','YYYY-MM-DD'), 30000);
INSERT INTO transactions VALUES(305, 1005, 903, TO_DATE('2025-03-20','YYYY-MM-DD'), 10000);
INSERT INTO transactions VALUES(306, 1003, 905, TO_DATE('2025-04-02','YYYY-MM-DD'), 35000);
INSERT INTO transactions VALUES(307, 1006, 902, TO_DATE('2025-04-05','YYYY-MM-DD'), 30000);
INSERT INTO transactions VALUES(308, 1006, 901, TO_DATE('2025-02-07','YYYY-MM-DD'), 20000);


  

  
