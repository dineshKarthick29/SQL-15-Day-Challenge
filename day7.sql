Microsoft Windows [Version 10.0.26200.9168]
(c) Microsoft Corporation. All rights reserved.

C:\Users\balae>mysql -u root  -p
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.0.44 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.


mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| balajii            |
| dbms               |
| dropout_risk_db    |
| good               |
| information_schema |
| mysql              |
| performance_schema |
| saledb             |
| salesdb            |
| student            |
| students           |
| world              |
+--------------------+
12 rows in set (0.00 sec)

mysql> use saledb;
Database changed
mysql> select *from customer;
+------------+-----------+----------+-------------------------+-------------+--------------+
| CustomerID | FirstName | LastName | Email                   | PhoneNumber | Address      |
+------------+-----------+----------+-------------------------+-------------+--------------+
|          1 | John      | Doe      | john.doe@example.com    | 1234567890  | 123 Elm St   |
|          2 | Jane      | Smith    | jane.smith@example.com  | 987654321   | 456 Oak St   |
|          3 | Alice     | Brown    | alice.brown@example.com | 1122334455  | 789 Maple St |
+------------+-----------+----------+-------------------------+-------------+--------------+
3 rows in set (0.00 sec)

mysql> select productname,price from product;
+--------------+---------+
| productname  | price   |
+--------------+---------+
| Laptop       | 1000.00 |
| T-Shirt      |   20.00 |
| Novel        |   15.00 |
| Dining Table |  300.00 |
| Milk         |    2.50 |
| Headphones   |   50.00 |
+--------------+---------+
6 rows in set (0.00 sec)

mysql> select * products where price>100;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'products where price>100' at line 1
mysql>  select *from  products where price>100;
ERROR 1146 (42S02): Table 'saledb.products' doesn't exist
mysql> show tables;
+------------------+
| Tables_in_saledb |
+------------------+
| category         |
| customer         |
| orderdetails     |
| orders           |
| product          |
+------------------+
5 rows in set (0.00 sec)

mysql> select *from  product where price>100;
+-----------+--------------+---------+-------+------------+
| ProductID | ProductName  | Price   | Stock | CategoryID |
+-----------+--------------+---------+-------+------------+
|         1 | Laptop       | 1000.00 |    50 |          1 |
|         4 | Dining Table |  300.00 |    20 |          4 |
+-----------+--------------+---------+-------+------------+
2 rows in set (0.01 sec)

mysql> select * from product where price=>20 and price <=500;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '=>20 and price <=500' at line 1
mysql> select *from product where price between 20 and 500;
+-----------+--------------+--------+-------+------------+
| ProductID | ProductName  | Price  | Stock | CategoryID |
+-----------+--------------+--------+-------+------------+
|         2 | T-Shirt      |  20.00 |   200 |          2 |
|         4 | Dining Table | 300.00 |    20 |          4 |
|         6 | Headphones   |  50.00 |    80 |          1 |
+-----------+--------------+--------+-------+------------+
3 rows in set (0.00 sec)

mysql> select * from product;
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

mysql> select *from product
    -> order by price desc
    -> limit 3;
+-----------+--------------+---------+-------+------------+
| ProductID | ProductName  | Price   | Stock | CategoryID |
+-----------+--------------+---------+-------+------------+
|         1 | Laptop       | 1000.00 |    50 |          1 |
|         4 | Dining Table |  300.00 |    20 |          4 |
|         6 | Headphones   |   50.00 |    80 |          1 |
+-----------+--------------+---------+-------+------------+
3 rows in set (0.00 sec)

mysql> select *
    -> ^C
mysql> select distinct
    -> categoryID
    -> from product;
+------------+
| categoryID |
+------------+
|          1 |
|          2 |
|          3 |
|          4 |
|          5 |
+------------+
5 rows in set (0.00 sec)

mysql> select distinct
    -> categoryid
    -> from product;
+------------+
| categoryid |
+------------+
|          1 |
|          2 |
|          3 |
|          4 |
|          5 |
+------------+
5 rows in set (0.00 sec)

mysql> select * from product where productname like '%o%';
+-----------+-------------+---------+-------+------------+
| ProductID | ProductName | Price   | Stock | CategoryID |
+-----------+-------------+---------+-------+------------+
|         1 | Laptop      | 1000.00 |    50 |          1 |
|         3 | Novel       |   15.00 |   150 |          3 |
|         6 | Headphones  |   50.00 |    80 |          1 |
+-----------+-------------+---------+-------+------------+
3 rows in set (0.00 sec)

mysql> select *from customer;
+------------+-----------+----------+-------------------------+-------------+--------------+
| CustomerID | FirstName | LastName | Email                   | PhoneNumber | Address      |
+------------+-----------+----------+-------------------------+-------------+--------------+
|          1 | John      | Doe      | john.doe@example.com    | 1234567890  | 123 Elm St   |
|          2 | Jane      | Smith    | jane.smith@example.com  | 987654321   | 456 Oak St   |
|          3 | Alice     | Brown    | alice.brown@example.com | 1122334455  | 789 Maple St |
+------------+-----------+----------+-------------------------+-------------+--------------+
3 rows in set (0.00 sec)

mysql> select *
    -> from
    -> concat('firstname'+''+lastname') as customer name;
    '> ^C
mysql>  select concat('firstname'+''+lastname') as customer name from customer;
    '> ^C
mysql> select concat ('firstname,'','lastname') as customername from customer;
    '> ^C
mysql> select concat (firstname,'',lastname) as customername from customer;
+--------------+
| customername |
+--------------+
| JohnDoe      |
| JaneSmith    |
| AliceBrown   |
+--------------+
3 rows in set (0.00 sec)

mysql> select * from product;
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

mysql> select * from  category;
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

mysql> select
    -> p.productid,
    -> p.productname,
    -> c.categoryname
    -> from product
    -> c^C
mysql> select p.productid,
    -> ^C
mysql>  select
    -> p.productid,
    ->  p.productname,
    ->  from product p
    -> inner join category c on c.categoryid=c.categoryid;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from product p
inner join category c on c.categoryid=c.categoryid' at line 4
mysql>  select
    ->  p.productid,
    ->  p.productname,
    ->  from product p
    -> inner join category c on p.categoryid=c.categoryid;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from product p
inner join category c on p.categoryid=c.categoryid' at line 4
mysql> select
    ->  p.productid,
    ->  p.productname,
    ->  c.categoryname
    -> from product p
    -> inner join category c
    -> on p.categoryid=c.categoryid;
+-----------+--------------+--------------+
| productid | productname  | categoryname |
+-----------+--------------+--------------+
|         1 | Laptop       | Electronics  |
|         6 | Headphones   | Electronics  |
|         2 | T-Shirt      | Clothing     |
|         3 | Novel        | Books        |
|         4 | Dining Table | Furniture    |
|         5 | Milk         | Groceries    |
+-----------+--------------+--------------+
6 rows in set (0.00 sec)

mysql>
mysql>
mysql> select
    -> c.categoryname,
    -> count(p.productid) as totalproducts
    -> from category c
    -> inner join product p
    -> on c.categoryid = p.categoryid
    -> ;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'saledb.c.categoryname'; this is incompatible with sql_mode=only_full_group_by
mysql> select
    -> c.categoryname,
    -> count(p.productid) as totalproducts
    -> from category c
    ->  inner join product p
    -> on c.categoryid = p.categoryid
    -> group by c.categoryid,c.categoryname;
+--------------+---------------+
| categoryname | totalproducts |
+--------------+---------------+
| Electronics  |             2 |
| Clothing     |             1 |
| Books        |             1 |
| Furniture    |             1 |
| Groceries    |             1 |
+--------------+---------------+
5 rows in set (0.00 sec)

mysql> select
    -> concat (c.firstname,'',c.lastname)
    -> as customername,
    -> sum(o.totalamount) as totalamount
    -> from customer c
    -> inner join orders o
    -> on c.customerid = o.customerid
    -> group by c.customerid ,c.firstname,
    -> c.lastname;
+--------------+-------------+
| customername | totalamount |
+--------------+-------------+
| JohnDoe      |     1050.00 |
| JaneSmith    |       35.00 |
| AliceBrown   |      300.00 |
+--------------+-------------+
3 rows in set (0.00 sec)

mysql> select*from customer;
+------------+-----------+----------+-------------------------+-------------+--------------+
| CustomerID | FirstName | LastName | Email                   | PhoneNumber | Address      |
+------------+-----------+----------+-------------------------+-------------+--------------+
|          1 | John      | Doe      | john.doe@example.com    | 1234567890  | 123 Elm St   |
|          2 | Jane      | Smith    | jane.smith@example.com  | 987654321   | 456 Oak St   |
|          3 | Alice     | Brown    | alice.brown@example.com | 1122334455  | 789 Maple St |
+------------+-----------+----------+-------------------------+-------------+--------------+
3 rows in set (0.00 sec)

mysql> select*from orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2024-12-01 |     1050.00 |
|       2 |          2 | 2024-12-02 |       35.00 |
|       3 |          3 | 2024-12-03 |      300.00 |
+---------+------------+------------+-------------+
3 rows in set (0.00 sec)

mysql> select
    ->     c.categoryname,
    ->    avg(p.price) as averageprice
    -> from category c
    -> inner join product p
    -> on c.categoryid=p.categoryid
    -> group by c.categoryid,c.categoryname;
+--------------+--------------+
| categoryname | averageprice |
+--------------+--------------+
| Electronics  |   525.000000 |
| Clothing     |    20.000000 |
| Books        |    15.000000 |
| Furniture    |   300.000000 |
| Groceries    |     2.500000 |
+--------------+--------------+
5 rows in set (0.03 sec)

mysql> SELECT
    ->     CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    ->     o.OrderID,
    ->     o.TotalAmount
    -> FROM Customer c
    -> INNER JOIN Orders o
    -> ON c.CustomerID = o.CustomerID
    -> ORDER BY o.TotalAmount DESC
    -> LIMIT 1;
+--------------+---------+-------------+
| CustomerName | OrderID | TotalAmount |
+--------------+---------+-------------+
| John Doe     |       1 |     1050.00 |
+--------------+---------+-------------+
1 row in set (0.00 sec)

mysql> SELECT
    ->     c.CategoryName,
    ->     SUM(od.Quantity * p.Price) AS TotalSales
    -> FROM Category c
    -> INNER JOIN Product p
    ->     ON c.CategoryID = p.CategoryID
    -> INNER JOIN OrderDetails od
    ->     ON p.ProductID = od.ProductID
    -> GROUP BY c.CategoryID, c.CategoryName
    -> ORDER BY TotalSales DESC
    -> LIMIT 1;
+--------------+------------+
| CategoryName | TotalSales |
+--------------+------------+
| Electronics  |    1050.00 |
+--------------+------------+
1 row in set (0.00 sec)

mysql>  SELECT
    ->     p.ProductID,
    ->     p.ProductName,
    ->     p.Price
    -> FROM Product p
    -> LEFT JOIN OrderDetails od
    -> ON p.ProductID = od.ProductID
    -> WHERE od.ProductID IS NULL;
+-----------+-------------+-------+
| ProductID | ProductName | Price |
+-----------+-------------+-------+
|         5 | Milk        |  2.50 |
+-----------+-------------+-------+
1 row in set (0.00 sec)

mysql> SELECT
    ->     c.CategoryName,
    ->     SUM(od.Quantity * p.Price) AS TotalSales
    -> FROM Category c
    -> INNER JOIN Product p
    ->     ON c.CategoryID = p.CategoryID
    -> INNER JOIN OrderDetails od
    ->     ON p.ProductID = od.ProductID
    -> GROUP BY c.CategoryID, c.CategoryName
    -> ORDER BY TotalSales DESC
    -> LIMIT 1;
+--------------+------------+
| CategoryName | TotalSales |
+--------------+------------+
| Electronics  |    1050.00 |
+--------------+------------+
1 row in set (0.00 sec)

mysql>