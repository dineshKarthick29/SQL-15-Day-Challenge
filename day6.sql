Microsoft Windows [Version 10.0.26200.9168]
(c) Microsoft Corporation. All rights reserved.

C:\Users\balae>mysql -u root -p
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
Server version: 8.0.44 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database saledb;
Query OK, 1 row affected (0.01 sec)

mysql> use saledb;
Database changed
mysql> create table category
    -> (categoryid int primary key,
    -> categoryname varchar(50));
Query OK, 0 rows affected (0.07 sec)

mysql> CREATE TABLE Customer (
    ->     CustomerID INT PRIMARY KEY,
    ->     FirstName VARCHAR(50),
    ->     LastName VARCHAR(50),
    ->     Email VARCHAR(100),
    ->     PhoneNumber VARCHAR(20),
    ->     Address VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql>
mysql> CREATE TABLE Product (
    ->     ProductID INT PRIMARY KEY,
    ->     ProductName VARCHAR(50),
    ->     Price DECIMAL(10,2),
    ->     Stock INT,
    ->     CategoryID INT,
    ->     FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> CREATE TABLE Orders (
    ->     OrderID INT PRIMARY KEY,
    ->     CustomerID INT,
    ->     OrderDate DATE,
    ->     TotalAmount DECIMAL(10,2),
    ->     FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> CREATE TABLE OrderDetails (
    ->     OrderDetailID INT PRIMARY KEY,
    ->     OrderID INT,
    ->     ProductID INT,
    ->     Quantity INT,
    ->     FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    ->     FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> INSERT INTO Category VALUES
    -> (1, 'Electronics'),
    -> (2, 'Clothing'),
    -> (3, 'Books'),
    -> (4, 'Furniture'),
    -> (5, 'Groceries');
Query OK, 5 rows affected (0.04 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Customer VALUES
    -> (1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St'),
    -> (2, 'Jane', 'Smith', 'jane.smith@example.com', '987654321', '456 Oak St'),
    -> (3, 'Alice', 'Brown', 'alice.brown@example.com', '1122334455', '789 Maple St');
Query OK, 3 rows affected (0.05 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Product VALUES
    -> (1, 'Laptop', 1000, 50, 1),
    -> (2, 'T-Shirt', 20, 200, 2),
    -> (3, 'Novel', 15, 150, 3),
    -> (4, 'Dining Table', 300, 20, 4),
    -> (5, 'Milk', 2.5, 100, 5),
    -> (6, 'Headphones', 50, 80, 1);
Query OK, 6 rows affected (0.04 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Orders VALUES
    -> (1, 1, '2024-12-01', 1050),
    -> (2, 2, '2024-12-02', 35),
    -> (3, 3, '2024-12-03', 300);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO OrderDetails VALUES
    -> (1, 1, 1, 1),
    -> (2, 1, 6, 1),
    -> (3, 2, 2, 1),
    -> (4, 2, 3, 1),
    -> (5, 3, 4, 1);
Query OK, 5 rows affected (0.04 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Customer;
+------------+-----------+----------+-------------------------+-------------+--------------+
| CustomerID | FirstName | LastName | Email                   | PhoneNumber | Address      |
+------------+-----------+----------+-------------------------+-------------+--------------+
|          1 | John      | Doe      | john.doe@example.com    | 1234567890  | 123 Elm St   |
|          2 | Jane      | Smith    | jane.smith@example.com  | 987654321   | 456 Oak St   |
|          3 | Alice     | Brown    | alice.brown@example.com | 1122334455  | 789 Maple St |
+------------+-----------+----------+-------------------------+-------------+--------------+
3 rows in set (0.00 sec)

mysql>
mysql> SELECT * FROM Category;
+------------+--------------+
| categoryid | categoryname |
+------------+--------------+
|          1 | Electronics  |
|          2 | Clothing     |
|          3 | Books        |
|          4 | Furniture    |
|          5 | Groceries    |
+------------+--------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT * FROM Product;
+-----------+--------------+---------+-------+------------+
| ProductID | ProductName  | Price   | Stock | CategoryID |
+-----------+--------------+---------+-------+------------+
|         1 | Laptop       | 1000.00 |    50 |          1 |
|         2 | T-Shirt      |   20.00 |   200 |          2 |
|         3 | Novel        |   15.00 |   150 |          3 |
|         4 | Dining Table |  300.00 |    20 |          4 |
|         5 | Milk         |    2.50 |   100 |          5 |
|         6 | Headphones   |   50.00 |    80 |          1 |
+-----------+--------------+---------+-------+------------+
6 rows in set (0.00 sec)

mysql>
mysql> SELECT * FROM Orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2024-12-01 |     1050.00 |
|       2 |          2 | 2024-12-02 |       35.00 |
|       3 |          3 | 2024-12-03 |      300.00 |
+---------+------------+------------+-------------+
3 rows in set (0.00 sec)

mysql>
mysql> SELECT * FROM OrderDetails;
+---------------+---------+-----------+----------+
| OrderDetailID | OrderID | ProductID | Quantity |
+---------------+---------+-----------+----------+
|             1 |       1 |         1 |        1 |
|             2 |       1 |         6 |        1 |
|             3 |       2 |         2 |        1 |
|             4 |       2 |         3 |        1 |
|             5 |       3 |         4 |        1 |
+---------------+---------+-----------+----------+
5 rows in set (0.00 sec)

mysql> SELECT
    ->     c.CustomerID,
    ->     CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    ->     o.OrderID,
    ->     DATE_FORMAT(o.OrderDate, '%d-%m-%Y') AS OrderDate,
    ->     o.TotalAmount
    -> FROM Customer c
    -> INNER JOIN Orders o
    -> ON o.CustomerID = c.CustomerID;
+------------+--------------+---------+------------+-------------+
| CustomerID | CustomerName | OrderID | OrderDate  | TotalAmount |
+------------+--------------+---------+------------+-------------+
|          1 | John Doe     |       1 | 01-12-2024 |     1050.00 |
|          2 | Jane Smith   |       2 | 02-12-2024 |       35.00 |
|          3 | Alice Brown  |       3 | 03-12-2024 |      300.00 |
+------------+--------------+---------+------------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT
    ->     p.ProductID,
    ->     p.ProductName,
    ->     SUM(od.Quantity * p.Price) AS TotalSales
    -> FROM Product p
    -> INNER JOIN OrderDetails od
    -> ON od.ProductID = p.ProductID
    -> GROUP BY p.ProductID, p.ProductName;
+-----------+--------------+------------+
| ProductID | ProductName  | TotalSales |
+-----------+--------------+------------+
|         1 | Laptop       |    1000.00 |
|         6 | Headphones   |      50.00 |
|         2 | T-Shirt      |      20.00 |
|         3 | Novel        |      15.00 |
|         4 | Dining Table |     300.00 |
+-----------+--------------+------------+
5 rows in set (0.00 sec)

mysql> select
    -> ca.categoryName,
    -> count(p.ProductID) as No_of_products
    -> from category ca
    -> inner join product p on p.categoryID=ca.categoryID
    -> group by ca.categoryId;
+--------------+----------------+
| categoryName | No_of_products |
+--------------+----------------+
| Electronics  |              2 |
| Clothing     |              1 |
| Books        |              1 |
| Furniture    |              1 |
| Groceries    |              1 |
+--------------+----------------+
5 rows in set (0.03 sec)

