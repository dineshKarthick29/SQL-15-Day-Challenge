Microsoft Windows [Version 10.0.26200.9168]
(c) Microsoft Corporation. All rights reserved.

C:\Users\balae>mysql -u root -p
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 25
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
| good               |
| information_schema |
| mysql              |
| performance_schema |
| student            |
| students           |
| world              |
+--------------------+
8 rows in set (0.00 sec)
mysql> use students
Database changed
mysql> showt tables;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'showt tables' at line 1
mysql> show tables;
+--------------------+
| Tables_in_students |
+--------------------+
| employees          |
| stdetails          |
+--------------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM employees;
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

mysql> SELECT * FROM employees LIMIT 5;
+----+----------+-------------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+
| id | name     | email             | address                   | city            | state      | country | date_of_birth | salary   | gender |
+----+----------+-------------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+
|  1 | kavi     | kavi@gmail.com    | dharmapuri bus stand      | dharmapuri      | tamil nadu | india   | 2005-01-01    | 20000.00 | male   |
|  2 | sidhi    | sidhu@gmail.com   | thiruvannamalai bus stand | thiruvannamalai | tamil nadu | india   | 2005-02-01    | 20000.00 | male   |
|  3 | mokkes h | moku@gmail.com    | dharmapuri bus stand      | salem           | tamil nadu | india   | 2005-03-01    | 20000.00 | male   |
|  4 | sabari   | sabi@gmail.com    | dharmapuri bus stand      | chennai         | tamil nadu | india   | 2005-04-01    | 20000.00 | male   |
|  5 | rithick  | rithick@gmail.com | dharmapuri bus stand      | chennai         | tamil nadu | india   | 2005-05-01    | 20000.00 | male   |
+----+----------+-------------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+
5 rows in set (0.00 sec)

mysql> SELECT *FROM employees LIMIT 2;
+----+-------+-----------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+
| id | name  | email           | address                   | city            | state      | country | date_of_birth | salary   | gender |
+----+-------+-----------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+
|  1 | kavi  | kavi@gmail.com  | dharmapuri bus stand      | dharmapuri      | tamil nadu | india   | 2005-01-01    | 20000.00 | male   |
|  2 | sidhi | sidhu@gmail.com | thiruvannamalai bus stand | thiruvannamalai | tamil nadu | india   | 2005-02-01    | 20000.00 | male   |
+----+-------+-----------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+
2 rows in set (0.00 sec)

mysql> SELECT *FROM employees ORDER BY id DESC LIMIT 5;
+----+----------+-------------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+
| id | name     | email             | address                   | city            | state      | country | date_of_birth | salary   | gender |
+----+----------+-------------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+
|  6 | kaniskar | kanis@gmail.com   | dharmapuri bus stand      | chennai         | tamil nadu | india   | 2005-06-01    | 20000.00 | male   |
|  5 | rithick  | rithick@gmail.com | dharmapuri bus stand      | chennai         | tamil nadu | india   | 2005-05-01    | 20000.00 | male   |
|  4 | sabari   | sabi@gmail.com    | dharmapuri bus stand      | chennai         | tamil nadu | india   | 2005-04-01    | 20000.00 | male   |
|  3 | mokkes h | moku@gmail.com    | dharmapuri bus stand      | salem           | tamil nadu | india   | 2005-03-01    | 20000.00 | male   |
|  2 | sidhi    | sidhu@gmail.com   | thiruvannamalai bus stand | thiruvannamalai | tamil nadu | india   | 2005-02-01    | 20000.00 | male   |
+----+----------+-------------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+
5 rows in set (0.00 sec)

mysql> RENAME TABLE employees TO users;
Query OK, 0 rows affected (0.03 sec)

mysql> show tables;
+--------------------+
| Tables_in_students |
+--------------------+
| stdetails          |
| users              |
+--------------------+
2 rows in set (0.00 sec)

mysql> select *from users;
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

mysql> describe users;
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
10 rows in set (0.00 sec)

mysql> -- alter table
mysql> alter table users add column phone_num varchar(15);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table users add column username varchar(45) after gender;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE users
    -> drop username;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>