Microsoft Windows [Version 10.0.26200.9168]
(c) Microsoft Corporation. All rights reserved.

C:\Users\balae>mysql -u root -p
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 31
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
mysql> select concat ('name','-','city') as from users;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from users' at line 1
mysql> use students;
Database changed
mysql> show tables;
+--------------------+
| Tables_in_students |
+--------------------+
| stdetails          |
| users              |
+--------------------+
2 rows in set (0.00 sec)

mysql> select * from users;
+----+----------+-------------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+-----------+
| id | name     | email             | address                   | city            | state      | country | date_of_birth | salary   | gender | phone_num |
+----+----------+-------------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+-----------+
|  1 | kavi     | kavi@gmail.com    | dharmapuri bus stand      | dharmapuri      | tamil nadu | india   | 2005-01-01    | 20000.00 | male   | NULL      |
|  2 | sidhi    | sidhu@gmail.com   | thiruvannamalai bus stand | thiruvannamalai | tamil nadu | india   | 2005-02-01    | 20000.00 | male   | NULL      |
|  3 | mokkes h | moku@gmail.com    | dharmapuri bus stand      | salem           | tamil nadu | india   | 2005-03-01    | 20000.00 | male   | NULL      |
|  4 | sabari   | sabi@gmail.com    | dharmapuri bus stand      | chennai         | tamil nadu | india   | 2005-04-01    | 20000.00 | male   | NULL      |
|  5 | rithick  | rithick@gmail.com | dharmapuri bus stand      | chennai         | tamil nadu | india   | 2005-05-01    | 20000.00 | male   | NULL      |
|  6 | kaniskar | kanis@gmail.com   | dharmapuri bus stand      | chennai         | tamil nadu | india   | 2005-06-01    | 20000.00 | male   | NULL      |
+----+----------+-------------------+---------------------------+-----------------+------------+---------+---------------+----------+--------+-----------+
6 rows in set (0.00 sec)

mysql> select*from stdetails;
+----+-------+--------+-----------------+------------+-----------+------+
| id | name  | gender | email           | dob        | fees      | age  |
+----+-------+--------+-----------------+------------+-----------+------+
|  1 | sidhu | male   | sidhu@gamil.com | 2007-10-11 | 100000.00 |   18 |
|  2 | kavi  | male   | kavi@gamil.com  | 2007-10-11 | 100000.00 |   18 |
|  3 | moku  | male   | moke@gamil.com  | 2007-10-11 | 100000.00 |   18 |
+----+-------+--------+-----------------+------------+-----------+------+
3 rows in set (0.00 sec)

mysql> select concat ('name','-','city') from users;
+----------------------------+
| concat ('name','-','city') |
+----------------------------+
| name-city                  |
| name-city                  |
| name-city                  |
| name-city                  |
| name-city                  |
| name-city                  |
+----------------------------+
6 rows in set (0.00 sec)

mysql> ^C
mysql> select concat (name,'-',city) from users;
+------------------------+
| concat (name,'-',city) |
+------------------------+
| kavi-dharmapuri        |
| sidhi-thiruvannamalai  |
| mokkes h-salem         |
| sabari-chennai         |
| rithick-chennai        |
| kaniskar-chennai       |
+------------------------+
6 rows in set (0.00 sec)

mysql> select substring ('mysql tutorials ',1,5);
ERROR 1630 (42000): FUNCTION students.substring does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> SELECT SUBSTRING ('my sql tutorial',1,5);
ERROR 1630 (42000): FUNCTION students.SUBSTRING does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql>  SELECT SUBSTRING ('my sql tutorial',1,5) as result;
ERROR 1630 (42000): FUNCTION students.SUBSTRING does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql>  SELECT SUBSTR ('my sql tutorial',1,5);
ERROR 1630 (42000): FUNCTION students.SUBSTR does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> SELECT CONCAT (SUBSTR(Name,1,3),'@gamail.com' as result from users;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from users' at line 1
mysql>  SELECT CONCAT
    ->  (SUBSTR(Name,1,3),'@gamail.com') as
    -> result from users;
+----------------+
| result         |
+----------------+
| kav@gamail.com |
| sid@gamail.com |
| mok@gamail.com |
| sab@gamail.com |
| rit@gamail.com |
| kan@gamail.com |
+----------------+
6 rows in set (0.02 sec)

mysql> SELECT LOWER ('DINESH KARTHICK');
+---------------------------+
| LOWER ('DINESH KARTHICK') |
+---------------------------+
| dinesh karthick           |
+---------------------------+
1 row in set (0.00 sec)

mysql> SELECT UPPER ('dinesh karthick');
+---------------------------+
| UPPER ('dinesh karthick') |
+---------------------------+
| DINESH KARTHICK           |
+---------------------------+
1 row in set (0.00 sec)

mysql> select length ('dinesh karthick'):
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ':' at line 1
mysql>  select length ('dinesh karthick');
+----------------------------+
| length ('dinesh karthick') |
+----------------------------+
|                         15 |
+----------------------------+
1 row in set (0.00 sec)

mysql> select round (3.14159 );
+------------------+
| round (3.14159 ) |
+------------------+
|                3 |
+------------------+
1 row in set (0.03 sec)

mysql> select count(*) as result from users;
+--------+
| result |
+--------+
|      6 |
+--------+
1 row in set (0.05 sec)

mysql> select sum(salary) as total_salary from users;
+--------------+
| total_salary |
+--------------+
|    120000.00 |
+--------------+
1 row in set (0.03 sec)

mysql> select avg(salary) as avg_salary from users;
+--------------+
| avg_salary   |
+--------------+
| 20000.000000 |
+--------------+
1 row in set (0.00 sec)

mysql> select name,salary from users;
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

mysql> update set salary=75000 where id= 4;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'set salary=75000 where id= 4' at line 1
mysql>  update users  set salary=75000 where id= 4;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>  update users  set salary=35000 where id= 2;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select name,salary,if(salary >= 75000,'high','low') from users;
+----------+----------+----------------------------------+
| name     | salary   | if(salary >= 75000,'high','low') |
+----------+----------+----------------------------------+
| kavi     | 20000.00 | low                              |
| sidhi    | 35000.00 | low                              |
| mokkes h | 20000.00 | low                              |
| sabari   | 75000.00 | high                             |
| rithick  | 20000.00 | low                              |
| kaniskar | 20000.00 | low                              |
+----------+----------+----------------------------------+
6 rows in set (0.02 sec)

mysql> select
    -> name,
    -> salary,
    -> case
    ->     when salary>=35000 then 'high'
    ->     else 'low'
    -> end as salary_status
    -> from users;
+----------+----------+---------------+
| name     | salary   | salary_status |
+----------+----------+---------------+
| kavi     | 20000.00 | low           |
| sidhi    | 35000.00 | high          |
| mokkes h | 20000.00 | low           |
| sabari   | 75000.00 | high          |
| rithick  | 20000.00 | low           |
| kaniskar | 20000.00 | low           |
+----------+----------+---------------+
6 rows in set (0.00 sec)

mysql> alter table users
    -> add column profile json;
