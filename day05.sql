
mysql> -- join querys
mysql> use students;
Database changed
mysql> show tables
    -> ;
+--------------------+
| Tables_in_students |
+--------------------+
| stdetails          |
| users              |
+--------------------+
2 rows in set (0.20 sec)

mysql> CREATE TABLE categary;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> create table categary(
    -> categary_id INT AUTO_INCREMENT PRIMARY KEY,
    -> categary_name VARCHAR(100) NOT NULL
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql> create table product(
    -> product_id INT AUTO_INCREMENT PRIMARY KEY,
    -> product_name VARCHAR(100) NOT NULL<
    -> \c
mysql>  create table product(
    -> product_id INT AUTO_INCREMENT PRIMARY KEY,
    ->  product_name VARCHAR(100) NOT NULL,
    -> stock INT NOT NULL,
    -> categary_id INT);
Query OK, 0 rows affected (0.08 sec)

mysql> insert into categary(categary_name) values
    -> ('electronics'),
    -> ('clothing'),
    -> ('groceries'),
    -> ('furniture'),
    -> ('books'),
    -> ('toys');
Query OK, 6 rows affected (0.09 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from categary;
+-------------+---------------+
| categary_id | categary_name |
+-------------+---------------+
|           1 | electronics   |
|           2 | clothing      |
|           3 | groceries     |
|           4 | furniture     |
|           5 | books         |
|           6 | toys          |
+-------------+---------------+
6 rows in set (0.00 sec)

mysql> alter table product add column price decimal(10,2) not null after product_name;
Query OK, 0 rows affected (0.15 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>  insert into product(
    -> product_name ,price ,stock,categary_id) values
    -> ('Laptop', 1000.00, 10, 1),
    -> ('Smartphone', 1800.00, 15, 1),
    -> ('Tablet', 1400.00, 20, 1),
    -> ('T-Shirt', 20.00, 50, 2),
    -> ('Pants', 40.00, 30, 2),
    -> ('Jacket', 80.00, 15, 2),
    -> ('Shoes', 60.00, 25, 2),
    -> ('School Bag', 35.00, 20, 3),
    -> ('Notebook', 5.00, 100, 3),
    -> ('Pen', 2.00, 200, 3),
    -> ('Water Bottle', 15.00, 40, 3),
    -> ('Headphones', 50.00, 30, 1),
    -> ('Keyboard', 35.00, 25, 1),
    -> ('Mouse', 20.00, 40, 1),
    -> ('Charger', 25.00, 35, 1),
    -> ('Wrist Watch', 100.00, 10, 4),
    -> ('Sunglasses', 45.00, 20, 4),
    -> ('Wallet', 30.00, 25, 4),
    -> ('Coffee Mug', 12.00, 50, 5),
    -> ('Table Lamp', 40.00, 15, 5);
Query OK, 20 rows affected (0.02 sec)
Records: 20  Duplicates: 0  Warnings: 0

mysql> select
    -> p.product_id,
    -> p.product_name,
    -> p.price as product_price,
    -> p.stock,
    -> c.categary_name
    -> from product p
    -> inner join categary c on p.categary_id = c.categary_id;
+------------+--------------+---------------+-------+---------------+
| product_id | product_name | product_price | stock | categary_name |
+------------+--------------+---------------+-------+---------------+
|          1 | Laptop       |       1000.00 |    10 | electronics   |
|          2 | Smartphone   |       1800.00 |    15 | electronics   |
|          3 | Tablet       |       1400.00 |    20 | electronics   |
|          4 | T-Shirt      |         20.00 |    50 | clothing      |
|          5 | Pants        |         40.00 |    30 | clothing      |
|          6 | Jacket       |         80.00 |    15 | clothing      |
|          7 | Shoes        |         60.00 |    25 | clothing      |
|          8 | School Bag   |         35.00 |    20 | groceries     |
|          9 | Notebook     |          5.00 |   100 | groceries     |
|         10 | Pen          |          2.00 |   200 | groceries     |
|         11 | Water Bottle |         15.00 |    40 | groceries     |
|         12 | Headphones   |         50.00 |    30 | electronics   |
|         13 | Keyboard     |         35.00 |    25 | electronics   |
|         14 | Mouse        |         20.00 |    40 | electronics   |
|         15 | Charger      |         25.00 |    35 | electronics   |
|         16 | Wrist Watch  |        100.00 |    10 | furniture     |
|         17 | Sunglasses   |         45.00 |    20 | furniture     |
|         18 | Wallet       |         30.00 |    25 | furniture     |
|         19 | Coffee Mug   |         12.00 |    50 | books         |
|         20 | Table Lamp   |         40.00 |    15 | books         |
+------------+--------------+---------------+-------+---------------+
20 rows in set (0.00 sec)


mysql>  select
    ->  p.product_id,
    -> p.product_name ,
    ->  p.price,
    -> p.stock,
    ->  c.categary_name
    -> from product p
    ->  inner join categary c on p.categary_id =c.categary_id
    -> where c.categary_name = 'eletronics';
Empty set (0.05 sec)

mysql> select
    -> c.categary_id ,
    -> c.categary_name,
    -> sum(p.stock*p.price) as total stock
    -> from categary c
    -> inner join product p on p.categary_id =c.categary_id
    -> group by c.category_name
    -> order by total stock desc
    -> limit 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'stock
from categary c
inner join product p on p.categary_id =c.categary_id
grou' at line 4
mysql>  select
    ->  c.categary_id ,
    ->  c.categary_name,
    ->  sum(p.stock*p.price) as total_stock
    ->  from categary c
    ->  inner join product p on p.categary_id =c.categary_id
    ->  group by c.category_name
    -> order by total_stock desc
    ->  limit 1;
