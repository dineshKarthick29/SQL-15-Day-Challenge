Microsoft Windows [Version 10.0.26200.9168]
(c) Microsoft Corporation. All rights reserved.

C:\Users\balae>mysql  -u root -p
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.44 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> DROP DATABASE IF EXISTS Day14DB;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql> CREATE DATABASE Day14DB;
Query OK, 1 row affected (0.01 sec)

mysql> USE Day14DB;
Database changed
mysql>
mysql> CREATE TABLE Department (
    ->     DepartmentID INT PRIMARY KEY,
    ->     DepartmentName VARCHAR(50) NOT NULL UNIQUE
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> INSERT INTO Department VALUES
    -> (1,'IT'),
    -> (2,'HR'),
    -> (3,'Finance'),
    -> (4,'Marketing'),
    -> (5,'Sales');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE Employee (
    ->     EmployeeID INT PRIMARY KEY,
    ->     EmployeeName VARCHAR(50) NOT NULL,
    ->     Email VARCHAR(100) UNIQUE NOT NULL,
    ->     Salary DECIMAL(10,2) NOT NULL,
    ->     DepartmentID INT,
    ->     FOREIGN KEY (DepartmentID)
    ->     REFERENCES Department(DepartmentID)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql>
mysql> INSERT INTO Employee VALUES
    -> (101,'Arun','arun@gmail.com',60000,1),
    -> (102,'Bala','bala@gmail.com',45000,1),
    -> (103,'Divya','divya@gmail.com',50000,1),
    -> (104,'Kavi','kavi@gmail.com',35000,2),
    -> (105,'Meena','meena@gmail.com',40000,2),
    -> (106,'Rahul','rahul@gmail.com',70000,3),
    -> (107,'Siva','siva@gmail.com',55000,3),
    -> (108,'Priya','priya@gmail.com',30000,4),
    -> (109,'Ravi','ravi@gmail.com',48000,4),
    -> (110,'Karthik','karthik@gmail.com',45000,5);
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE Project (
    ->     ProjectID INT PRIMARY KEY,
    ->     ProjectName VARCHAR(100) NOT NULL,
    ->     Budget DECIMAL(12,2),
    ->     DepartmentID INT,
    ->     FOREIGN KEY (DepartmentID)
    ->     REFERENCES Department(DepartmentID)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> INSERT INTO Project VALUES
    -> (201,'Website',150000,1),
    -> (202,'Mobile App',250000,1),
    -> (203,'Recruitment',80000,2),
    -> (204,'Finance System',120000,3),
    -> (205,'Marketing App',100000,4);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE INDEX idx_employee_salary
    -> ON Employee(Salary);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE INDEX idx_employee_department
    -> ON Employee(DepartmentID);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE INDEX idx_project_budget
    -> ON Project(Budget);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE Salary > 50000;
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Siva         | 55000.00 |
| Arun         | 60000.00 |
| Rahul        | 70000.00 |
+--------------+----------+
3 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        COUNT(e.EmployeeID) AS EmployeeCount
    -> FROM Department d
    -> LEFT JOIN Employee e
    -> ON d.DepartmentID = e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+---------------+
| DepartmentName | EmployeeCount |
+----------------+---------------+
| Finance        |             2 |
| HR             |             2 |
| IT             |             3 |
| Marketing      |             2 |
| Sales          |             1 |
+----------------+---------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        AVG(e.Salary) AS AverageSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID = e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+---------------+
| DepartmentName | AverageSalary |
+----------------+---------------+
| Finance        |  62500.000000 |
| HR             |  37500.000000 |
| IT             |  51666.666667 |
| Marketing      |  39000.000000 |
| Sales          |  45000.000000 |
+----------------+---------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        SUM(e.Salary) AS TotalSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID = e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName
    -> HAVING SUM(e.Salary) > 100000;
+----------------+-------------+
| DepartmentName | TotalSalary |
+----------------+-------------+
| Finance        |   125000.00 |
| IT             |   155000.00 |
+----------------+-------------+
2 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,e.Salary,d.DepartmentName
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID = d.DepartmentID
    -> ORDER BY e.Salary DESC;
+--------------+----------+----------------+
| EmployeeName | Salary   | DepartmentName |
+--------------+----------+----------------+
| Rahul        | 70000.00 | Finance        |
| Arun         | 60000.00 | IT             |
| Siva         | 55000.00 | Finance        |
| Divya        | 50000.00 | IT             |
| Ravi         | 48000.00 | Marketing      |
| Bala         | 45000.00 | IT             |
| Karthik      | 45000.00 | Sales          |
| Meena        | 40000.00 | HR             |
| Kavi         | 35000.00 | HR             |
| Priya        | 30000.00 | Marketing      |
+--------------+----------+----------------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE Salary >
    -> (
    ->     SELECT AVG(Salary)
    ->     FROM Employee
    -> );
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Ravi         | 48000.00 |
| Divya        | 50000.00 |
| Siva         | 55000.00 |
| Arun         | 60000.00 |
| Rahul        | 70000.00 |
+--------------+----------+
5 rows in set (0.00 sec)

mysql>
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> UPDATE Employee
    -> SET Salary = Salary + 5000
    -> WHERE EmployeeID = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> SELECT EmployeeID,EmployeeName,Salary
    -> FROM Employee
    -> WHERE EmployeeID = 101;
+------------+--------------+----------+
| EmployeeID | EmployeeName | Salary   |
+------------+--------------+----------+
|        101 | Arun         | 65000.00 |
+------------+--------------+----------+
1 row in set (0.00 sec)

mysql>
mysql> ROLLBACK;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> SELECT EmployeeID,EmployeeName,Salary
    -> FROM Employee
    -> WHERE EmployeeID = 101;
+------------+--------------+----------+
| EmployeeID | EmployeeName | Salary   |
+------------+--------------+----------+
|        101 | Arun         | 60000.00 |
+------------+--------------+----------+
1 row in set (0.00 sec)

mysql>
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> UPDATE Employee
    -> SET Salary = Salary + 3000
    -> WHERE EmployeeID = 102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> COMMIT;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> SELECT EmployeeID,EmployeeName,Salary
    -> FROM Employee
    -> WHERE EmployeeID = 102;
+------------+--------------+----------+
| EmployeeID | EmployeeName | Salary   |
+------------+--------------+----------+
|        102 | Bala         | 48000.00 |
+------------+--------------+----------+
1 row in set (0.00 sec)

mysql>
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> UPDATE Employee
    -> SET Salary = Salary + 2000
    -> WHERE EmployeeID = 103;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> SAVEPOINT salary_update;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> UPDATE Employee
    -> SET Salary = Salary + 10000
    -> WHERE EmployeeID = 104;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> ROLLBACK TO salary_update;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> COMMIT;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> SELECT EmployeeID,EmployeeName,Salary
    -> FROM Employee
    -> WHERE EmployeeID IN (103,104);
+------------+--------------+----------+
| EmployeeID | EmployeeName | Salary   |
+------------+--------------+----------+
|        103 | Divya        | 52000.00 |
|        104 | Kavi         | 35000.00 |
+------------+--------------+----------+
2 rows in set (0.00 sec)

mysql>
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> DELETE FROM Employee
    -> WHERE EmployeeID = 110;
Query OK, 1 row affected (0.00 sec)

mysql>
mysql> ROLLBACK;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> SELECT EmployeeID,EmployeeName
    -> FROM Employee
    -> WHERE EmployeeID = 110;
+------------+--------------+
| EmployeeID | EmployeeName |
+------------+--------------+
|        110 | Karthik      |
+------------+--------------+
1 row in set (0.00 sec)

mysql>
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> INSERT INTO Employee
    -> VALUES
    -> (111,'Surya','surya@gmail.com',52000,1);
Query OK, 1 row affected (0.00 sec)

mysql>
mysql> SAVEPOINT new_employee;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> UPDATE Employee
    -> SET Salary = 55000
    -> WHERE EmployeeID = 111;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> ROLLBACK TO new_employee;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> COMMIT;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> SELECT EmployeeID,EmployeeName,Salary
    -> FROM Employee
    -> WHERE EmployeeID = 111;
+------------+--------------+----------+
| EmployeeID | EmployeeName | Salary   |
+------------+--------------+----------+
|        111 | Surya        | 52000.00 |
+------------+--------------+----------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,
    ->        Salary,
    ->        CASE
    ->            WHEN Salary >= 60000 THEN 'High'
    ->            WHEN Salary >= 45000 THEN 'Medium'
    ->            ELSE 'Low'
    ->        END AS SalaryLevel
    -> FROM Employee;
+--------------+----------+-------------+
| EmployeeName | Salary   | SalaryLevel |
+--------------+----------+-------------+
| Arun         | 60000.00 | High        |
| Bala         | 48000.00 | Medium      |
| Divya        | 52000.00 | Medium      |
| Kavi         | 35000.00 | Low         |
| Meena        | 40000.00 | Low         |
| Rahul        | 70000.00 | High        |
| Siva         | 55000.00 | Medium      |
| Priya        | 30000.00 | Low         |
| Ravi         | 48000.00 | Medium      |
| Karthik      | 45000.00 | Medium      |
| Surya        | 52000.00 | Medium      |
+--------------+----------+-------------+
11 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        MAX(e.Salary) AS HighestSalary,
    ->        MIN(e.Salary) AS LowestSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID = e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+---------------+--------------+
| DepartmentName | HighestSalary | LowestSalary |
+----------------+---------------+--------------+
| Finance        |      70000.00 |     55000.00 |
| HR             |      40000.00 |     35000.00 |
| IT             |      60000.00 |     48000.00 |
| Marketing      |      48000.00 |     30000.00 |
| Sales          |      45000.00 |     45000.00 |
+----------------+---------------+--------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        SUM(p.Budget) AS TotalBudget
    -> FROM Department d
    -> INNER JOIN Project p
    -> ON d.DepartmentID = p.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+-------------+
| DepartmentName | TotalBudget |
+----------------+-------------+
| IT             |   400000.00 |
| HR             |    80000.00 |
| Finance        |   120000.00 |
| Marketing      |   100000.00 |
+----------------+-------------+
4 rows in set (0.00 sec)

mysql>
mysql> SELECT p.ProjectName,
    ->        p.Budget,
    ->        d.DepartmentName
    -> FROM Project p
    -> INNER JOIN Department d
    -> ON p.DepartmentID = d.DepartmentID
    -> WHERE p.Budget >
    -> (
    ->     SELECT AVG(Budget)
    ->     FROM Project
    -> );
+-------------+-----------+----------------+
| ProjectName | Budget    | DepartmentName |
+-------------+-----------+----------------+
| Website     | 150000.00 | IT             |
| Mobile App  | 250000.00 | IT             |
+-------------+-----------+----------------+
2 rows in set (0.00 sec)

mysql>
mysql> EXPLAIN
    -> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE Salary > 50000;
+----+-------------+----------+------------+-------+---------------------+---------------------+---------+------+------+----------+-----------------------+
| id | select_type | table    | partitions | type  | possible_keys       | key                 | key_len | ref  | rows | filtered | Extra                 |
+----+-------------+----------+------------+-------+---------------------+---------------------+---------+------+------+----------+-----------------------+
|  1 | SIMPLE      | Employee | NULL       | range | idx_employee_salary | idx_employee_salary | 5       | NULL |    5 |   100.00 | Using index condition |
+----+-------------+----------+------------+-------+---------------------+---------------------+---------+------+------+----------+-----------------------+
1 row in set, 1 warning (0.00 sec)

mysql>
mysql> SHOW INDEX FROM Employee;
+----------+------------+-------------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name                | Seq_in_index | Column_name  | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+-------------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| employee |          0 | PRIMARY                 |            1 | EmployeeID   | A         |          10 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| employee |          0 | Email                   |            1 | Email        | A         |          10 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| employee |          1 | idx_employee_salary     |            1 | Salary       | A         |           9 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| employee |          1 | idx_employee_department |            1 | DepartmentID | A         |           5 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+----------+------------+-------------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
4 rows in set (0.01 sec)

mysql>
mysql> SHOW INDEX FROM Project;
+---------+------------+--------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name           | Seq_in_index | Column_name  | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+--------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| project |          0 | PRIMARY            |            1 | ProjectID    | A         |           1 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| project |          1 | DepartmentID       |            1 | DepartmentID | A         |           1 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| project |          1 | idx_project_budget |            1 | Budget       | A         |           5 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+---------+------------+--------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
3 rows in set (0.01 sec)

mysql>
mysql> SELECT TABLE_NAME,
    ->        COLUMN_NAME,
    ->        DATA_TYPE
    -> FROM INFORMATION_SCHEMA.COLUMNS
    -> WHERE TABLE_SCHEMA = 'Day14DB';
+------------+----------------+-----------+
| TABLE_NAME | COLUMN_NAME    | DATA_TYPE |
+------------+----------------+-----------+
| department | DepartmentID   | int       |
| department | DepartmentName | varchar   |
| employee   | EmployeeID     | int       |
| employee   | EmployeeName   | varchar   |
| employee   | Email          | varchar   |
| employee   | Salary         | decimal   |
| employee   | DepartmentID   | int       |
| project    | ProjectID      | int       |
| project    | ProjectName    | varchar   |
| project    | Budget         | decimal   |
| project    | DepartmentID   | int       |
+------------+----------------+-----------+
11 rows in set (0.03 sec)

mysql>
mysql> SELECT TABLE_NAME,
    ->        CONSTRAINT_NAME,
    ->        CONSTRAINT_TYPE
    -> FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    -> WHERE CONSTRAINT_SCHEMA = 'Day14DB';
+------------+-----------------+-----------------+
| TABLE_NAME | CONSTRAINT_NAME | CONSTRAINT_TYPE |
+------------+-----------------+-----------------+
| department | DepartmentName  | UNIQUE          |
| department | PRIMARY         | PRIMARY KEY     |
| employee   | Email           | UNIQUE          |
| employee   | PRIMARY         | PRIMARY KEY     |
| employee   | employee_ibfk_1 | FOREIGN KEY     |
| project    | PRIMARY         | PRIMARY KEY     |
| project    | project_ibfk_1  | FOREIGN KEY     |
+------------+-----------------+-----------------+
7 rows in set (0.01 sec)

mysql>
mysql> SELECT 'Day 14 SQL Practice Completed' AS Status;
+-------------------------------+
| Status                        |
+-------------------------------+
| Day 14 SQL Practice Completed |
+-------------------------------+
1 row in set (0.00 sec)

mysql>