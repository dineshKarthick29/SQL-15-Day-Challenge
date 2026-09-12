Microsoft Windows [Version 10.0.26200.9168]
(c) Microsoft Corporation. All rights reserved.

C:\Users\balae>mysql -u root -p
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.44 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> DROP DATABASE IF EXISTS Day15DB;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> CREATE DATABASE Day15DB;
Query OK, 1 row affected (0.01 sec)

mysql> USE Day15DB;
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
    ->     Email VARCHAR(100) UNIQUE,
    ->     Salary DECIMAL(10,2) NOT NULL,
    ->     DepartmentID INT,
    ->     JoiningDate DATE,
    ->     FOREIGN KEY (DepartmentID)
    ->     REFERENCES Department(DepartmentID)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO Employee VALUES
    -> (101,'Arun','arun@gmail.com',60000,1,'2022-01-15'),
    -> (102,'Bala','bala@gmail.com',45000,1,'2023-03-20'),
    -> (103,'Divya','divya@gmail.com',50000,1,'2021-07-10'),
    -> (104,'Kavi','kavi@gmail.com',35000,2,'2024-01-12'),
    -> (105,'Meena','meena@gmail.com',40000,2,'2023-08-18'),
    -> (106,'Rahul','rahul@gmail.com',70000,3,'2021-06-25'),
    -> (107,'Siva','siva@gmail.com',55000,3,'2022-09-14'),
    -> (108,'Priya','priya@gmail.com',30000,4,'2024-04-17'),
    -> (109,'Ravi','ravi@gmail.com',48000,4,'2023-12-09'),
    -> (110,'Karthik','karthik@gmail.com',45000,5,'2023-09-21');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE Project (
    ->     ProjectID INT PRIMARY KEY,
    ->     ProjectName VARCHAR(100) NOT NULL,
    ->     Budget DECIMAL(12,2),
    ->     DepartmentID INT,
    ->     Status VARCHAR(30),
    ->     FOREIGN KEY (DepartmentID)
    ->     REFERENCES Department(DepartmentID)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> INSERT INTO Project VALUES
    -> (201,'Website Development',150000,1,'Completed'),
    -> (202,'Mobile Application',250000,1,'Ongoing'),
    -> (203,'Recruitment System',80000,2,'Completed'),
    -> (204,'Finance Analysis',120000,3,'Ongoing'),
    -> (205,'Marketing Campaign',100000,4,'Completed'),
    -> (206,'Sales Dashboard',90000,5,'Ongoing');
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE EmployeeProject (
    ->     EmployeeID INT,
    ->     ProjectID INT,
    ->     HoursWorked INT,
    ->     PerformanceScore INT,
    ->     PRIMARY KEY(EmployeeID,ProjectID),
    ->     FOREIGN KEY(EmployeeID)
    ->     REFERENCES Employee(EmployeeID),
    ->     FOREIGN KEY(ProjectID)
    ->     REFERENCES Project(ProjectID)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> INSERT INTO EmployeeProject VALUES
    -> (101,201,40,90),
    -> (101,202,30,85),
    -> (102,201,50,80),
    -> (102,202,20,78),
    -> (103,202,45,88),
    -> (104,203,30,82),
    -> (105,203,40,90),
    -> (106,204,50,95),
    -> (107,204,35,88),
    -> (108,205,40,80),
    -> (109,205,55,92),
    -> (110,206,45,86);
Query OK, 12 rows affected (0.00 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT e.EmployeeName,
    ->        d.DepartmentName,
    ->        e.Salary
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID = d.DepartmentID;
+--------------+----------------+----------+
| EmployeeName | DepartmentName | Salary   |
+--------------+----------------+----------+
| Rahul        | Finance        | 70000.00 |
| Siva         | Finance        | 55000.00 |
| Kavi         | HR             | 35000.00 |
| Meena        | HR             | 40000.00 |
| Arun         | IT             | 60000.00 |
| Bala         | IT             | 45000.00 |
| Divya        | IT             | 50000.00 |
| Priya        | Marketing      | 30000.00 |
| Ravi         | Marketing      | 48000.00 |
| Karthik      | Sales          | 45000.00 |
+--------------+----------------+----------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        COUNT(e.EmployeeID) AS EmployeeCount,
    ->        AVG(e.Salary) AS AverageSalary
    -> FROM Department d
    -> LEFT JOIN Employee e
    -> ON d.DepartmentID = e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+---------------+---------------+
| DepartmentName | EmployeeCount | AverageSalary |
+----------------+---------------+---------------+
| Finance        |             2 |  62500.000000 |
| HR             |             2 |  37500.000000 |
| IT             |             3 |  51666.666667 |
| Marketing      |             2 |  39000.000000 |
| Sales          |             1 |  45000.000000 |
+----------------+---------------+---------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        SUM(e.Salary) AS TotalSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID = e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName
    -> ORDER BY TotalSalary DESC;
+----------------+-------------+
| DepartmentName | TotalSalary |
+----------------+-------------+
| IT             |   155000.00 |
| Finance        |   125000.00 |
| Marketing      |    78000.00 |
| HR             |    75000.00 |
| Sales          |    45000.00 |
+----------------+-------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        e.Salary
    -> FROM Employee e
    -> WHERE e.Salary >
    -> (
    ->     SELECT AVG(Salary)
    ->     FROM Employee
    -> )
    -> ORDER BY e.Salary DESC;
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Rahul        | 70000.00 |
| Arun         | 60000.00 |
| Siva         | 55000.00 |
| Divya        | 50000.00 |
| Ravi         | 48000.00 |
+--------------+----------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        e.EmployeeName,
    ->        e.Salary
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID = d.DepartmentID
    -> WHERE e.Salary =
    -> (
    ->     SELECT MAX(e2.Salary)
    ->     FROM Employee e2
    ->     WHERE e2.DepartmentID = e.DepartmentID
    -> );
+----------------+--------------+----------+
| DepartmentName | EmployeeName | Salary   |
+----------------+--------------+----------+
| Finance        | Rahul        | 70000.00 |
| HR             | Meena        | 40000.00 |
| IT             | Arun         | 60000.00 |
| Marketing      | Ravi         | 48000.00 |
| Sales          | Karthik      | 45000.00 |
+----------------+--------------+----------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT p.ProjectName,
    ->        d.DepartmentName,
    ->        p.Budget,
    ->        p.Status
    -> FROM Project p
    -> INNER JOIN Department d
    -> ON p.DepartmentID = d.DepartmentID
    -> ORDER BY p.Budget DESC;
+---------------------+----------------+-----------+-----------+
| ProjectName         | DepartmentName | Budget    | Status    |
+---------------------+----------------+-----------+-----------+
| Mobile Application  | IT             | 250000.00 | Ongoing   |
| Website Development | IT             | 150000.00 | Completed |
| Finance Analysis    | Finance        | 120000.00 | Ongoing   |
| Marketing Campaign  | Marketing      | 100000.00 | Completed |
| Sales Dashboard     | Sales          |  90000.00 | Ongoing   |
| Recruitment System  | HR             |  80000.00 | Completed |
+---------------------+----------------+-----------+-----------+
6 rows in set (0.00 sec)

mysql>
mysql> SELECT p.ProjectName,
    ->        SUM(ep.HoursWorked) AS TotalHours
    -> FROM Project p
    -> INNER JOIN EmployeeProject ep
    -> ON p.ProjectID = ep.ProjectID
    -> GROUP BY p.ProjectID,p.ProjectName
    -> ORDER BY TotalHours DESC;
+---------------------+------------+
| ProjectName         | TotalHours |
+---------------------+------------+
| Mobile Application  |         95 |
| Marketing Campaign  |         95 |
| Website Development |         90 |
| Finance Analysis    |         85 |
| Recruitment System  |         70 |
| Sales Dashboard     |         45 |
+---------------------+------------+
6 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        SUM(ep.HoursWorked) AS TotalHours
    -> FROM Employee e
    -> INNER JOIN EmployeeProject ep
    -> ON e.EmployeeID = ep.EmployeeID
    -> GROUP BY e.EmployeeID,e.EmployeeName
    -> ORDER BY TotalHours DESC;
+--------------+------------+
| EmployeeName | TotalHours |
+--------------+------------+
| Arun         |         70 |
| Bala         |         70 |
| Ravi         |         55 |
| Rahul        |         50 |
| Divya        |         45 |
| Karthik      |         45 |
| Meena        |         40 |
| Priya        |         40 |
| Siva         |         35 |
| Kavi         |         30 |
+--------------+------------+
10 rows in set (0.00 sec)

mysql>
mysql> WITH DepartmentStats AS
    -> (
    ->     SELECT DepartmentID,
    ->            COUNT(*) AS EmployeeCount,
    ->            AVG(Salary) AS AverageSalary,
    ->            SUM(Salary) AS TotalSalary
    ->     FROM Employee
    ->     GROUP BY DepartmentID
    -> )
    -> SELECT d.DepartmentName,
    ->        ds.EmployeeCount,
    ->        ds.AverageSalary,
    ->        ds.TotalSalary
    -> FROM DepartmentStats ds
    -> INNER JOIN Department d
    -> ON ds.DepartmentID = d.DepartmentID;
+----------------+---------------+---------------+-------------+
| DepartmentName | EmployeeCount | AverageSalary | TotalSalary |
+----------------+---------------+---------------+-------------+
| Finance        |             2 |  62500.000000 |   125000.00 |
| HR             |             2 |  37500.000000 |    75000.00 |
| IT             |             3 |  51666.666667 |   155000.00 |
| Marketing      |             2 |  39000.000000 |    78000.00 |
| Sales          |             1 |  45000.000000 |    45000.00 |
+----------------+---------------+---------------+-------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,
    ->        Salary,
    ->        RANK() OVER(
    ->            ORDER BY Salary DESC
    ->        ) AS SalaryRank
    -> FROM Employee;
+--------------+----------+------------+
| EmployeeName | Salary   | SalaryRank |
+--------------+----------+------------+
| Rahul        | 70000.00 |          1 |
| Arun         | 60000.00 |          2 |
| Siva         | 55000.00 |          3 |
| Divya        | 50000.00 |          4 |
| Ravi         | 48000.00 |          5 |
| Bala         | 45000.00 |          6 |
| Karthik      | 45000.00 |          6 |
| Meena        | 40000.00 |          8 |
| Kavi         | 35000.00 |          9 |
| Priya        | 30000.00 |         10 |
+--------------+----------+------------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        d.DepartmentName,
    ->        e.Salary,
    ->        RANK() OVER(
    ->            PARTITION BY e.DepartmentID
    ->            ORDER BY e.Salary DESC
    ->        ) AS DepartmentRank
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID = d.DepartmentID;
+--------------+----------------+----------+----------------+
| EmployeeName | DepartmentName | Salary   | DepartmentRank |
+--------------+----------------+----------+----------------+
| Arun         | IT             | 60000.00 |              1 |
| Divya        | IT             | 50000.00 |              2 |
| Bala         | IT             | 45000.00 |              3 |
| Meena        | HR             | 40000.00 |              1 |
| Kavi         | HR             | 35000.00 |              2 |
| Rahul        | Finance        | 70000.00 |              1 |
| Siva         | Finance        | 55000.00 |              2 |
| Ravi         | Marketing      | 48000.00 |              1 |
| Priya        | Marketing      | 30000.00 |              2 |
| Karthik      | Sales          | 45000.00 |              1 |
+--------------+----------------+----------+----------------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        e.Salary,
    ->        CASE
    ->            WHEN e.Salary >= 60000 THEN 'High'
    ->            WHEN e.Salary >= 45000 THEN 'Medium'
    ->            ELSE 'Low'
    ->        END AS SalaryLevel
    -> FROM Employee e;
+--------------+----------+-------------+
| EmployeeName | Salary   | SalaryLevel |
+--------------+----------+-------------+
| Arun         | 60000.00 | High        |
| Bala         | 45000.00 | Medium      |
| Divya        | 50000.00 | Medium      |
| Kavi         | 35000.00 | Low         |
| Meena        | 40000.00 | Low         |
| Rahul        | 70000.00 | High        |
| Siva         | 55000.00 | Medium      |
| Priya        | 30000.00 | Low         |
| Ravi         | 48000.00 | Medium      |
| Karthik      | 45000.00 | Medium      |
+--------------+----------+-------------+
10 rows in set (0.00 sec)

mysql>
mysql> CREATE VIEW EmployeeDetails AS
    -> SELECT e.EmployeeID,
    ->        e.EmployeeName,
    ->        d.DepartmentName,
    ->        e.Salary,
    ->        e.JoiningDate
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID = d.DepartmentID;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> SELECT *
    -> FROM EmployeeDetails;
+------------+--------------+----------------+----------+-------------+
| EmployeeID | EmployeeName | DepartmentName | Salary   | JoiningDate |
+------------+--------------+----------------+----------+-------------+
|        106 | Rahul        | Finance        | 70000.00 | 2021-06-25  |
|        107 | Siva         | Finance        | 55000.00 | 2022-09-14  |
|        104 | Kavi         | HR             | 35000.00 | 2024-01-12  |
|        105 | Meena        | HR             | 40000.00 | 2023-08-18  |
|        101 | Arun         | IT             | 60000.00 | 2022-01-15  |
|        102 | Bala         | IT             | 45000.00 | 2023-03-20  |
|        103 | Divya        | IT             | 50000.00 | 2021-07-10  |
|        108 | Priya        | Marketing      | 30000.00 | 2024-04-17  |
|        109 | Ravi         | Marketing      | 48000.00 | 2023-12-09  |
|        110 | Karthik      | Sales          | 45000.00 | 2023-09-21  |
+------------+--------------+----------------+----------+-------------+
10 rows in set (0.00 sec)

mysql>
mysql> CREATE VIEW HighSalaryEmployees AS
    -> SELECT EmployeeName,
    ->        Salary
    -> FROM Employee
    -> WHERE Salary >= 55000;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> SELECT *
    -> FROM HighSalaryEmployees;
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Arun         | 60000.00 |
| Rahul        | 70000.00 |
| Siva         | 55000.00 |
+--------------+----------+
3 rows in set (0.00 sec)

mysql>
mysql> CREATE VIEW ProjectWorkload AS
    -> SELECT p.ProjectName,
    ->        SUM(ep.HoursWorked) AS TotalHours,
    ->        AVG(ep.PerformanceScore) AS AverageScore
    -> FROM Project p
    -> INNER JOIN EmployeeProject ep
    -> ON p.ProjectID = ep.ProjectID
    -> GROUP BY p.ProjectID,p.ProjectName;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> SELECT *
    -> FROM ProjectWorkload
    -> ORDER BY TotalHours DESC;
+---------------------+------------+--------------+
| ProjectName         | TotalHours | AverageScore |
+---------------------+------------+--------------+
| Mobile Application  |         95 |      83.6667 |
| Marketing Campaign  |         95 |      86.0000 |
| Website Development |         90 |      85.0000 |
| Finance Analysis    |         85 |      91.5000 |
| Recruitment System  |         70 |      86.0000 |
| Sales Dashboard     |         45 |      86.0000 |
+---------------------+------------+--------------+
6 rows in set (0.00 sec)

mysql>
mysql> DELIMITER $$
mysql>
mysql> CREATE PROCEDURE GetDepartmentEmployees(
    ->     IN DeptID INT
    -> )
    -> BEGIN
    ->     SELECT EmployeeName,
    ->            Salary
    ->     FROM Employee
    ->     WHERE DepartmentID = DeptID
    ->     ORDER BY Salary DESC;
    -> END$$
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql>
mysql> CALL GetDepartmentEmployees(1);
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Arun         | 60000.00 |
| Divya        | 50000.00 |
| Bala         | 45000.00 |
+--------------+----------+
3 rows in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER $$
mysql>
mysql> CREATE PROCEDURE GetTopEmployees(
    ->     IN NumberOfEmployees INT
    -> )
    -> BEGIN
    ->     SELECT EmployeeName,
    ->            Salary
    ->     FROM Employee
    ->     ORDER BY Salary DESC
    ->     LIMIT NumberOfEmployees;
    -> END$$
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql>
mysql> CALL GetTopEmployees(3);
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Rahul        | 70000.00 |
| Arun         | 60000.00 |
| Siva         | 55000.00 |
+--------------+----------+
3 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> DELIMITER $$
mysql>
mysql> CREATE FUNCTION AnnualSalary(
    ->     MonthlySalary DECIMAL(10,2)
    -> )
    -> RETURNS DECIMAL(12,2)
    -> DETERMINISTIC
    -> BEGIN
    ->     RETURN MonthlySalary * 12;
    -> END$$
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql>
mysql> SELECT EmployeeName,
    ->        Salary,
    ->        AnnualSalary(Salary) AS YearlySalary
    -> FROM Employee;
+--------------+----------+--------------+
| EmployeeName | Salary   | YearlySalary |
+--------------+----------+--------------+
| Arun         | 60000.00 |    720000.00 |
| Bala         | 45000.00 |    540000.00 |
| Divya        | 50000.00 |    600000.00 |
| Kavi         | 35000.00 |    420000.00 |
| Meena        | 40000.00 |    480000.00 |
| Rahul        | 70000.00 |    840000.00 |
| Siva         | 55000.00 |    660000.00 |
| Priya        | 30000.00 |    360000.00 |
| Ravi         | 48000.00 |    576000.00 |
| Karthik      | 45000.00 |    540000.00 |
+--------------+----------+--------------+
10 rows in set (0.00 sec)

mysql>
mysql> CREATE TABLE SalaryAudit (
    ->     AuditID INT PRIMARY KEY AUTO_INCREMENT,
    ->     EmployeeID INT,
    ->     OldSalary DECIMAL(10,2),
    ->     NewSalary DECIMAL(10,2),
    ->     UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> DELIMITER $$
mysql>
mysql> CREATE TRIGGER SalaryUpdateAudit
    -> AFTER UPDATE ON Employee
    -> FOR EACH ROW
    -> BEGIN
    ->     IF OLD.Salary <> NEW.Salary THEN
    ->         INSERT INTO SalaryAudit
    ->         (EmployeeID,OldSalary,NewSalary)
    ->         VALUES
    ->         (NEW.EmployeeID,OLD.Salary,NEW.Salary);
    ->     END IF;
    -> END$$
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql>
mysql> UPDATE Employee
    -> SET Salary = Salary + 2000
    -> WHERE EmployeeID = 101;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> SELECT *
    -> FROM SalaryAudit;
+---------+------------+-----------+-----------+---------------------+
| AuditID | EmployeeID | OldSalary | NewSalary | UpdatedAt           |
+---------+------------+-----------+-----------+---------------------+
|       1 |        101 |  60000.00 |  62000.00 | 2026-09-12 07:01:33 |
+---------+------------+-----------+-----------+---------------------+
1 row in set (0.00 sec)

mysql>
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> UPDATE Employee
    -> SET Salary = Salary + 5000
    -> WHERE EmployeeID = 102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> ROLLBACK;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> SELECT EmployeeID,
    ->        EmployeeName,
    ->        Salary
    -> FROM Employee
    -> WHERE EmployeeID = 102;
+------------+--------------+----------+
| EmployeeID | EmployeeName | Salary   |
+------------+--------------+----------+
|        102 | Bala         | 45000.00 |
+------------+--------------+----------+
1 row in set (0.00 sec)

mysql>
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> UPDATE Employee
    -> SET Salary = Salary + 3000
    -> WHERE EmployeeID = 103;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> SAVEPOINT SalaryPoint;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> UPDATE Employee
    -> SET Salary = Salary + 5000
    -> WHERE EmployeeID = 104;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> ROLLBACK TO SalaryPoint;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> COMMIT;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> SELECT EmployeeID,
    ->        EmployeeName,
    ->        Salary
    -> FROM Employee
    -> WHERE EmployeeID IN (103,104);
+------------+--------------+----------+
| EmployeeID | EmployeeName | Salary   |
+------------+--------------+----------+
|        103 | Divya        | 53000.00 |
|        104 | Kavi         | 35000.00 |
+------------+--------------+----------+
2 rows in set (0.00 sec)

mysql>
mysql> CREATE INDEX idx_salary
    -> ON Employee(Salary);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE INDEX idx_department
    -> ON Employee(DepartmentID);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE INDEX idx_project_budget
    -> ON Project(Budget);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> EXPLAIN
    -> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE Salary > 50000;
+----+-------------+----------+------------+-------+---------------+------------+---------+------+------+----------+-----------------------+
| id | select_type | table    | partitions | type  | possible_keys | key        | key_len | ref  | rows | filtered | Extra                 |
+----+-------------+----------+------------+-------+---------------+------------+---------+------+------+----------+-----------------------+
|  1 | SIMPLE      | Employee | NULL       | range | idx_salary    | idx_salary | 5       | NULL |    4 |   100.00 | Using index condition |
+----+-------------+----------+------------+-------+---------------+------------+---------+------+------+----------+-----------------------+
1 row in set, 1 warning (0.00 sec)

mysql>
mysql> SHOW INDEX FROM Employee;
+----------+------------+----------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name       | Seq_in_index | Column_name  | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+----------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| employee |          0 | PRIMARY        |            1 | EmployeeID   | A         |          10 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| employee |          0 | Email          |            1 | Email        | A         |          10 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| employee |          1 | idx_salary     |            1 | Salary       | A         |           9 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| employee |          1 | idx_department |            1 | DepartmentID | A         |           5 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+----------+------------+----------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
4 rows in set (0.01 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        d.DepartmentName,
    ->        e.Salary,
    ->        RANK() OVER(
    ->            PARTITION BY e.DepartmentID
    ->            ORDER BY e.Salary DESC
    ->        ) AS DepartmentRank,
    ->        CASE
    ->            WHEN e.Salary >= 60000 THEN 'High'
    ->            WHEN e.Salary >= 45000 THEN 'Medium'
    ->            ELSE 'Low'
    ->        END AS SalaryLevel
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID = d.DepartmentID;
+--------------+----------------+----------+----------------+-------------+
| EmployeeName | DepartmentName | Salary   | DepartmentRank | SalaryLevel |
+--------------+----------------+----------+----------------+-------------+
| Arun         | IT             | 62000.00 |              1 | High        |
| Divya        | IT             | 53000.00 |              2 | Medium      |
| Bala         | IT             | 45000.00 |              3 | Medium      |
| Meena        | HR             | 40000.00 |              1 | Low         |
| Kavi         | HR             | 35000.00 |              2 | Low         |
| Rahul        | Finance        | 70000.00 |              1 | High        |
| Siva         | Finance        | 55000.00 |              2 | Medium      |
| Ravi         | Marketing      | 48000.00 |              1 | Medium      |
| Priya        | Marketing      | 30000.00 |              2 | Low         |
| Karthik      | Sales          | 45000.00 |              1 | Medium      |
+--------------+----------------+----------+----------------+-------------+
10 rows in set (0.00 sec)

mysql>
mysql> WITH EmployeeStats AS
    -> (
    ->     SELECT EmployeeID,
    ->            SUM(HoursWorked) AS TotalHours,
    ->            AVG(PerformanceScore) AS AverageScore
    ->     FROM EmployeeProject
    ->     GROUP BY EmployeeID
    -> )
    -> SELECT e.EmployeeName,
    ->        es.TotalHours,
    ->        es.AverageScore
    -> FROM EmployeeStats es
    -> INNER JOIN Employee e
    -> ON es.EmployeeID = e.EmployeeID
    -> ORDER BY es.AverageScore DESC;
+--------------+------------+--------------+
| EmployeeName | TotalHours | AverageScore |
+--------------+------------+--------------+
| Rahul        |         50 |      95.0000 |
| Ravi         |         55 |      92.0000 |
| Meena        |         40 |      90.0000 |
| Divya        |         45 |      88.0000 |
| Siva         |         35 |      88.0000 |
| Arun         |         70 |      87.5000 |
| Karthik      |         45 |      86.0000 |
| Kavi         |         30 |      82.0000 |
| Priya        |         40 |      80.0000 |
| Bala         |         70 |      79.0000 |
+--------------+------------+--------------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT p.ProjectName,
    ->        p.Budget,
    ->        SUM(ep.HoursWorked) AS TotalHours,
    ->        AVG(ep.PerformanceScore) AS AverageScore
    -> FROM Project p
    -> LEFT JOIN EmployeeProject ep
    -> ON p.ProjectID = ep.ProjectID
    -> GROUP BY p.ProjectID,p.ProjectName,p.Budget
    -> HAVING SUM(ep.HoursWorked) > 40
    -> ORDER BY AverageScore DESC;
+---------------------+-----------+------------+--------------+
| ProjectName         | Budget    | TotalHours | AverageScore |
+---------------------+-----------+------------+--------------+
| Finance Analysis    | 120000.00 |         85 |      91.5000 |
| Recruitment System  |  80000.00 |         70 |      86.0000 |
| Marketing Campaign  | 100000.00 |         95 |      86.0000 |
| Sales Dashboard     |  90000.00 |         45 |      86.0000 |
| Website Development | 150000.00 |         90 |      85.0000 |
| Mobile Application  | 250000.00 |         95 |      83.6667 |
+---------------------+-----------+------------+--------------+
6 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        COUNT(DISTINCT e.EmployeeID) AS Employees,
    ->        COUNT(DISTINCT p.ProjectID) AS Projects,
    ->        SUM(e.Salary) AS TotalSalary
    -> FROM Department d
    -> LEFT JOIN Employee e
    -> ON d.DepartmentID = e.DepartmentID
    -> LEFT JOIN Project p
    -> ON d.DepartmentID = p.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+-----------+----------+-------------+
| DepartmentName | Employees | Projects | TotalSalary |
+----------------+-----------+----------+-------------+
| IT             |         3 |        2 |   320000.00 |
| HR             |         2 |        1 |    75000.00 |
| Finance        |         2 |        1 |   125000.00 |
| Marketing      |         2 |        1 |    78000.00 |
| Sales          |         1 |        1 |    45000.00 |
+----------------+-----------+----------+-------------+
5 rows in set (0.01 sec)

mysql>
mysql> SELECT EmployeeName,
    ->        Salary,
    ->        Salary * 12 AS AnnualSalary,
    ->        Salary * 12 * 0.10 AS AnnualBonus
    -> FROM Employee
    -> WHERE Salary >= 50000;
+--------------+----------+--------------+-------------+
| EmployeeName | Salary   | AnnualSalary | AnnualBonus |
+--------------+----------+--------------+-------------+
| Divya        | 53000.00 |    636000.00 |  63600.0000 |
| Siva         | 55000.00 |    660000.00 |  66000.0000 |
| Arun         | 62000.00 |    744000.00 |  74400.0000 |
| Rahul        | 70000.00 |    840000.00 |  84000.0000 |
+--------------+----------+--------------+-------------+
4 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,
    ->        JoiningDate,
    ->        TIMESTAMPDIFF(
    ->            YEAR,
    ->            JoiningDate,
    ->            CURDATE()
    ->        ) AS ExperienceYears
    -> FROM Employee;
+--------------+-------------+-----------------+
| EmployeeName | JoiningDate | ExperienceYears |
+--------------+-------------+-----------------+
| Arun         | 2022-01-15  |               4 |
| Bala         | 2023-03-20  |               3 |
| Divya        | 2021-07-10  |               5 |
| Kavi         | 2024-01-12  |               2 |
| Meena        | 2023-08-18  |               3 |
| Rahul        | 2021-06-25  |               5 |
| Siva         | 2022-09-14  |               3 |
| Priya        | 2024-04-17  |               2 |
| Ravi         | 2023-12-09  |               2 |
| Karthik      | 2023-09-21  |               2 |
+--------------+-------------+-----------------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,
    ->        Salary
    -> FROM Employee
    -> WHERE DepartmentID IN
    -> (
    ->     SELECT DepartmentID
    ->     FROM Employee
    ->     GROUP BY DepartmentID
    ->     HAVING AVG(Salary) > 45000
    -> );
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Arun         | 62000.00 |
| Bala         | 45000.00 |
| Divya        | 53000.00 |
| Rahul        | 70000.00 |
| Siva         | 55000.00 |
+--------------+----------+
5 rows in set (0.01 sec)

mysql>
mysql> SELECT p.ProjectName,
    ->        p.Budget
    -> FROM Project p
    -> WHERE p.Budget >
    -> (
    ->     SELECT AVG(Budget)
    ->     FROM Project
    -> );
+---------------------+-----------+
| ProjectName         | Budget    |
+---------------------+-----------+
| Website Development | 150000.00 |
| Mobile Application  | 250000.00 |
+---------------------+-----------+
2 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        e.Salary
    -> FROM Employee e
    -> WHERE EXISTS
    -> (
    ->     SELECT 1
    ->     FROM EmployeeProject ep
    ->     WHERE ep.EmployeeID = e.EmployeeID
    -> );
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Arun         | 62000.00 |
| Bala         | 45000.00 |
| Divya        | 53000.00 |
| Kavi         | 35000.00 |
| Meena        | 40000.00 |
| Rahul        | 70000.00 |
| Siva         | 55000.00 |
| Priya        | 30000.00 |
| Ravi         | 48000.00 |
| Karthik      | 45000.00 |
+--------------+----------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName
    -> FROM Department d
    -> WHERE EXISTS
    -> (
    ->     SELECT 1
    ->     FROM Project p
    ->     WHERE p.DepartmentID = d.DepartmentID
    -> );
+----------------+
| DepartmentName |
+----------------+
| Finance        |
| HR             |
| IT             |
| Marketing      |
| Sales          |
+----------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        e.Salary,
    ->        LAG(e.Salary) OVER(
    ->            ORDER BY e.Salary
    ->        ) AS PreviousSalary
    -> FROM Employee e;
+--------------+----------+----------------+
| EmployeeName | Salary   | PreviousSalary |
+--------------+----------+----------------+
| Priya        | 30000.00 |           NULL |
| Kavi         | 35000.00 |       30000.00 |
| Meena        | 40000.00 |       35000.00 |
| Bala         | 45000.00 |       40000.00 |
| Karthik      | 45000.00 |       45000.00 |
| Ravi         | 48000.00 |       45000.00 |
| Divya        | 53000.00 |       48000.00 |
| Siva         | 55000.00 |       53000.00 |
| Arun         | 62000.00 |       55000.00 |
| Rahul        | 70000.00 |       62000.00 |
+--------------+----------+----------------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        e.Salary,
    ->        LEAD(e.Salary) OVER(
    ->            ORDER BY e.Salary
    ->        ) AS NextSalary
    -> FROM Employee e;
+--------------+----------+------------+
| EmployeeName | Salary   | NextSalary |
+--------------+----------+------------+
| Priya        | 30000.00 |   35000.00 |
| Kavi         | 35000.00 |   40000.00 |
| Meena        | 40000.00 |   45000.00 |
| Bala         | 45000.00 |   45000.00 |
| Karthik      | 45000.00 |   48000.00 |
| Ravi         | 48000.00 |   53000.00 |
| Divya        | 53000.00 |   55000.00 |
| Siva         | 55000.00 |   62000.00 |
| Arun         | 62000.00 |   70000.00 |
| Rahul        | 70000.00 |       NULL |
+--------------+----------+------------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        e.DepartmentID,
    ->        e.Salary,
    ->        AVG(e.Salary) OVER(
    ->            PARTITION BY e.DepartmentID
    ->        ) AS DepartmentAverage
    -> FROM Employee e;
+--------------+--------------+----------+-------------------+
| EmployeeName | DepartmentID | Salary   | DepartmentAverage |
+--------------+--------------+----------+-------------------+
| Arun         |            1 | 62000.00 |      53333.333333 |
| Bala         |            1 | 45000.00 |      53333.333333 |
| Divya        |            1 | 53000.00 |      53333.333333 |
| Kavi         |            2 | 35000.00 |      37500.000000 |
| Meena        |            2 | 40000.00 |      37500.000000 |
| Rahul        |            3 | 70000.00 |      62500.000000 |
| Siva         |            3 | 55000.00 |      62500.000000 |
| Priya        |            4 | 30000.00 |      39000.000000 |
| Ravi         |            4 | 48000.00 |      39000.000000 |
| Karthik      |            5 | 45000.00 |      45000.000000 |
+--------------+--------------+----------+-------------------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        e.DepartmentID,
    ->        e.Salary,
    ->        e.Salary -
    ->        AVG(e.Salary) OVER(
    ->            PARTITION BY e.DepartmentID
    ->        ) AS SalaryDifference
    -> FROM Employee e;
+--------------+--------------+----------+------------------+
| EmployeeName | DepartmentID | Salary   | SalaryDifference |
+--------------+--------------+----------+------------------+
| Arun         |            1 | 62000.00 |      8666.666667 |
| Bala         |            1 | 45000.00 |     -8333.333333 |
| Divya        |            1 | 53000.00 |      -333.333333 |
| Kavi         |            2 | 35000.00 |     -2500.000000 |
| Meena        |            2 | 40000.00 |      2500.000000 |
| Rahul        |            3 | 70000.00 |      7500.000000 |
| Siva         |            3 | 55000.00 |     -7500.000000 |
| Priya        |            4 | 30000.00 |     -9000.000000 |
| Ravi         |            4 | 48000.00 |      9000.000000 |
| Karthik      |            5 | 45000.00 |         0.000000 |
+--------------+--------------+----------+------------------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT p.ProjectName,
    ->        p.Budget,
    ->        RANK() OVER(
    ->            ORDER BY p.Budget DESC
    ->        ) AS BudgetRank
    -> FROM Project p;
+---------------------+-----------+------------+
| ProjectName         | Budget    | BudgetRank |
+---------------------+-----------+------------+
| Mobile Application  | 250000.00 |          1 |
| Website Development | 150000.00 |          2 |
| Finance Analysis    | 120000.00 |          3 |
| Marketing Campaign  | 100000.00 |          4 |
| Sales Dashboard     |  90000.00 |          5 |
| Recruitment System  |  80000.00 |          6 |
+---------------------+-----------+------------+
6 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        ep.PerformanceScore,
    ->        CASE
    ->            WHEN ep.PerformanceScore >= 90 THEN 'Excellent'
    ->            WHEN ep.PerformanceScore >= 80 THEN 'Good'
    ->            ELSE 'Average'
    ->        END AS PerformanceLevel
    -> FROM Employee e
    -> INNER JOIN EmployeeProject ep
    -> ON e.EmployeeID = ep.EmployeeID;
+--------------+------------------+------------------+
| EmployeeName | PerformanceScore | PerformanceLevel |
+--------------+------------------+------------------+
| Arun         |               90 | Excellent        |
| Arun         |               85 | Good             |
| Bala         |               80 | Good             |
| Bala         |               78 | Average          |
| Divya        |               88 | Good             |
| Kavi         |               82 | Good             |
| Meena        |               90 | Excellent        |
| Rahul        |               95 | Excellent        |
| Siva         |               88 | Good             |
| Priya        |               80 | Good             |
| Ravi         |               92 | Excellent        |
| Karthik      |               86 | Good             |
+--------------+------------------+------------------+
12 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        AVG(ep.PerformanceScore) AS AveragePerformance
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID = e.DepartmentID
    -> INNER JOIN EmployeeProject ep
    -> ON e.EmployeeID = ep.EmployeeID
    -> GROUP BY d.DepartmentID,d.DepartmentName
    -> ORDER BY AveragePerformance DESC;
+----------------+--------------------+
| DepartmentName | AveragePerformance |
+----------------+--------------------+
| Finance        |            91.5000 |
| HR             |            86.0000 |
| Marketing      |            86.0000 |
| Sales          |            86.0000 |
| IT             |            84.2000 |
+----------------+--------------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT 'DAY 15 - SQL CHALLENGE COMPLETED' AS FinalStatus;
+----------------------------------+
| FinalStatus                      |
+----------------------------------+
| DAY 15 - SQL CHALLENGE COMPLETED |
+----------------------------------+
1 row in set (0.00 sec)

mysql>