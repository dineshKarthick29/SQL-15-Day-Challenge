
mysql> create database students;
Query OK, 1 row affected (0.05 sec)

mysql> use students;

mysql> \c
mysql> CREATE TABLE stdetails(
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(50),
    -> email VARCHAR(50),
    -> dob DATE ,
    -> fees DECIMAL(10,2),
    -> age INT
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql>  INSERT INTO stdetails (name,email,dob,fees,age)
    -> VALUES
    -> ('sidhu','sidhu@gamil.com','2007-10-11',100000,18),
    -> ('kavi','kavi@gamil.com','2007-10-11',100000,18),
    -> ('moku','moke@gamil.com','2007-10-11',100000,18);
Query OK, 3 rows affected (0.05 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT*
    -> FROM stdetails;
+----+-------+-----------------+------------+-----------+------+
| id | name  | email           | dob        | fees      | age  |
+----+-------+-----------------+------------+-----------+------+
|  1 | sidhu | sidhu@gamil.com | 2007-10-11 | 100000.00 |   18 |
|  2 | kavi  | kavi@gamil.com  | 2007-10-11 | 100000.00 |   18 |
|  3 | moku  | moke@gamil.com  | 2007-10-11 | 100000.00 |   18 |
+----+-------+-----------------+------------+-----------+------+
3 rows in set (0.00 sec)

mysql> SELECT id as `s.no`,name as `full name`,email as `email address` FROM stdetails;
+------+-----------+-----------------+
| s.no | full name | email address   |
+------+-----------+-----------------+
|    1 | sidhu     | sidhu@gamil.com |
|    2 | kavi      | kavi@gamil.com  |
|    3 | moku      | moke@gamil.com  |
+------+-----------+-----------------+
3 rows in set (0.00 sec)

mysql> ALTER TABLE stdetails ADD COLUMN gender VARCHAR(10) NOT NULL AFTER name;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select *from stdetails;
+----+-------+--------+-----------------+------------+-----------+------+
| id | name  | gender | email           | dob        | fees      | age  |
+----+-------+--------+-----------------+------------+-----------+------+
|  1 | sidhu |        | sidhu@gamil.com | 2007-10-11 | 100000.00 |   18 |
|  2 | kavi  |        | kavi@gamil.com  | 2007-10-11 | 100000.00 |   18 |
|  3 | moku  |        | moke@gamil.com  | 2007-10-11 | 100000.00 |   18 |
+----+-------+--------+-----------------+------------+-----------+------+
3 rows in set (0.00 sec)

mysql> UPDATE stdetails set gender='male' ;
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql>  select *from stdetails;
+----+-------+--------+-----------------+------------+-----------+------+
| id | name  | gender | email           | dob        | fees      | age  |
+----+-------+--------+-----------------+------------+-----------+------+
|  1 | sidhu | male   | sidhu@gamil.com | 2007-10-11 | 100000.00 |   18 |
|  2 | kavi  | male   | kavi@gamil.com  | 2007-10-11 | 100000.00 |   18 |
|  3 | moku  | male   | moke@gamil.com  | 2007-10-11 | 100000.00 |   18 |
+----+-------+--------+-----------------+------------+-----------+------+
3 rows in set (0.00 sec)