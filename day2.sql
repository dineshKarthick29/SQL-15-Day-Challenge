Microsoft Windows [Version 10.0.26200.9168]
(c) Microsoft Corporation. All rights reserved.

C:\Users\balae>mysql -u root -p
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 22
Server version: 8.0.44 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| balajii            |
| good               |
| information_schema |
| mysql              |
| performance_schema |
| student            |
| students           |
| world              |
+--------------------+
8 rows in set (0.00 sec)

mysql> USE students;
Database changed
mysql> show tables;
+--------------------+
| Tables_in_students |
+--------------------+
| stdetails          |
+--------------------+
1 row in set (0.00 sec)

mysql>  CREATE TABLE employees(
    ->  id INT AUTO_INCREMENT PRIMARY KEY,
    ->  name VARCHAR(100),
    ->  email VARCHAR (100) NOT NULL,
    -> address TEXT,
    -> city VARCHAR(50),
    ->  state VARCHAR(50),
    -> country VARCHAR(50) DEFAULT'INDIA',
    -> date_of_birth DATE,
    ->  salary DECIMAL(10,2),
    -> gender ENUM('male', 'female','others')
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> SHOW TABLES;
+--------------------+
| Tables_in_students |
+--------------------+
| employees          |
| stdetails          |
+--------------------+
2 rows in set (0.00 sec)

mysql> DESCRIBE employee;
ERROR 1146 (42S02): Table 'students.employee' doesn't exist
mysql> describe employees;
+---------------+--------------------------------+------+-----+---------+----------------+
| Field         | Type                           | Null | Key | Default | Extra          |
+---------------+--------------------------------+------+-----+---------+----------------+
| id            | int                            | NO   | PRI | NULL    | auto_increment |
| name          | varchar(100)                   | YES  |     | NULL    |                |
| email         | varchar(100)                   | NO   |     | NULL    |                |
| address       | text                           | YES  |     | NULL    |                |
| city          | varchar(50)                    | YES  |     | NULL    |                |
| state         | varchar(50)                    | YES  |     | NULL    |                |
| country       | varchar(50)                    | YES  |     | INDIA   |                |
| date_of_birth | date                           | YES  |     | NULL    |                |
| salary        | decimal(10,2)                  | YES  |     | NULL    |                |
| gender        | enum('male','female','others') | YES  |     | NULL    |                |
+---------------+--------------------------------+------+-----+---------+----------------+
10 rows in set (0.10 sec)
mysql> SELECT
mysql> SELECT * FROM employees;
+----+----------+-------------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+
| id | name     | email             | address                   | city            | state      | country | date_of_birth | salary   | gender |
+----+----------+-------------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+
|  1 | kavi     | kavi@gmail.com    | dharmapuri bus stand      | dharmapuri      | tamil nadu | india   | 2005-01-01    | 20000.00 | male   |
|  2 | sidhi    | sidhu@gmail.com   | thiruvannamalai bus stand | thiruvannamalai | tamil nadu | india   | 2005-02-01    | 20000.00 | male   |
|  3 | mokkes h | moku@gmail.com    | dharmapuri bus stand      | chennai         | tamil nadu | india   | 2005-03-01    | 20000.00 | male   |
|  4 | sabari   | sabi@gmail.com    | dharmapuri bus stand      | chennai         | tamil nadu | india   | 2005-04-01    | 20000.00 | male   |
|  5 | rithick  | rithick@gmail.com | dharmapuri bus stand      | chennai         | tamil nadu | india   | 2005-05-01    | 20000.00 | male   |
|  6 | kaniskar | kanis@gmail.com   | dharmapuri bus stand      | chennai         | tamil nadu | india   | 2005-06-01    | 20000.00 | male   |
+----+----------+-------------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+
6 rows in set (0.00 sec)

mysql> SELECT name, salary FROM employees ;
+----------+----------+
| name     | salary   |
+----------+----------+
| kavi     | 20000.00 |
| sidhi    | 20000.00 |
| mokkes h | 20000.00 |
| sabari   | 20000.00 |
| rithick  | 20000.00 |
| kaniskar | 20000.00 |
+----------+----------+
6 rows in set (0.00 sec)

mysql> select name,salary from employees order by asc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'asc' at line 1
mysql> SELECT *FROM employees WHERE city='chennai';
+----+----------+-------------------+----------------------+---------+------------+---------+---------------+----------+--------+
| id | name     | email             | address              | city    | state      | country | date_of_birth | salary   | gender |
+----+----------+-------------------+----------------------+---------+------------+---------+---------------+----------+--------+
|  3 | mokkes h | moku@gmail.com    | dharmapuri bus stand | chennai | tamil nadu | india   | 2005-03-01    | 20000.00 | male   |
|  4 | sabari   | sabi@gmail.com    | dharmapuri bus stand | chennai | tamil nadu | india   | 2005-04-01    | 20000.00 | male   |
|  5 | rithick  | rithick@gmail.com | dharmapuri bus stand | chennai | tamil nadu | india   | 2005-05-01    | 20000.00 | male   |
|  6 | kaniskar | kanis@gmail.com   | dharmapuri bus stand | chennai | tamil nadu | india   | 2005-06-01    | 20000.00 | male   |
+----+----------+-------------------+----------------------+---------+------------+---------+---------------+----------+--------+
4 rows in set (0.00 sec)

mysql> select * from employees where gender ='female';
Empty set (0.00 sec)

mysql> SELECT * FROM employees WHERE cityn in ('chennai','dharmapuri');
ERROR 1054 (42S22): Unknown column 'cityn' in 'where clause'
mysql> SELECT * FROM employees WHERE city in ('chennai','dharmapuri');
+----+----------+-------------------+----------------------+------------+------------+---------+---------------+----------+--------+
| id | name     | email             | address              | city       | state      | country | date_of_birth | salary   | gender |
+----+----------+-------------------+----------------------+------------+------------+---------+---------------+----------+--------+
|  1 | kavi     | kavi@gmail.com    | dharmapuri bus stand | dharmapuri | tamil nadu | india   | 2005-01-01    | 20000.00 | male   |
|  3 | mokkes h | moku@gmail.com    | dharmapuri bus stand | chennai    | tamil nadu | india   | 2005-03-01    | 20000.00 | male   |
|  4 | sabari   | sabi@gmail.com    | dharmapuri bus stand | chennai    | tamil nadu | india   | 2005-04-01    | 20000.00 | male   |
|  5 | rithick  | rithick@gmail.com | dharmapuri bus stand | chennai    | tamil nadu | india   | 2005-05-01    | 20000.00 | male   |
|  6 | kaniskar | kanis@gmail.com   | dharmapuri bus stand | chennai    | tamil nadu | india   | 2005-06-01    | 20000.00 | male   |
+----+----------+-------------------+----------------------+------------+------------+---------+---------------+----------+--------+
5 rows in set (0.00 sec)

mysql> UPDATE employees SET city ='salem' where ID=3;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT*FROM employees;
+----+----------+-------------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+
| id | name     | email             | address                   | city            | state      | country | date_of_birth | salary   | gender |
+----+----------+-------------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+
|  1 | kavi     | kavi@gmail.com    | dharmapuri bus stand      | dharmapuri      | tamil nadu | india   | 2005-01-01    | 20000.00 | male   |
|  2 | sidhi    | sidhu@gmail.com   | thiruvannamalai bus stand | thiruvannamalai | tamil nadu | india   | 2005-02-01    | 20000.00 | male   |
|  3 | mokkes h | moku@gmail.com    | dharmapuri bus stand      | salem           | tamil nadu | india   | 2005-03-01    | 20000.00 | male   |
|  4 | sabari   | sabi@gmail.com    | dharmapuri bus stand      | chennai         | tamil nadu | india   | 2005-04-01    | 20000.00 | male   |
|  5 | rithick  | rithick@gmail.com | dharmapuri bus stand      | chennai         | tamil nadu | india   | 2005-05-01    | 20000.00 | male   |
|  6 | kaniskar | kanis@gmail.com   | dharmapuri bus stand      | chennai         | tamil nadu | india   | 2005-06-01    | 20000.00 | male   |
+----+----------+-------------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+
6 rows in set (0.00 sec)

mysql>