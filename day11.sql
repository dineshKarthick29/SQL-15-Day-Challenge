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

mysql> DROP DATABASE IF EXISTS Day11DB;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql> CREATE DATABASE Day11DB;
Query OK, 1 row affected (0.01 sec)

mysql> USE Day11DB;
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
    -> (5,'Operations'),
    -> (6,'Research'),
    -> (7,'Sales');
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE Employee (
    ->     EmployeeID INT PRIMARY KEY,
    ->     EmployeeName VARCHAR(50) NOT NULL,
    ->     Email VARCHAR(100) UNIQUE,
    ->     Salary DECIMAL(10,2) NOT NULL,
    ->     DepartmentID INT,
    ->     JoiningDate DATE,
    ->     FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> INSERT INTO Employee VALUES
    -> (1,'Arun','arun@gmail.com',60000,1,'2023-01-15'),
    -> (2,'Bala','bala@gmail.com',45000,1,'2023-03-20'),
    -> (3,'Divya','divya@gmail.com',50000,1,'2022-07-10'),
    -> (4,'Anu','anu@gmail.com',65000,1,'2021-11-05'),
    -> (5,'Kavi','kavi@gmail.com',35000,2,'2024-01-12'),
    -> (6,'Meena','meena@gmail.com',40000,2,'2023-08-18'),
    -> (7,'Rahul','rahul@gmail.com',70000,3,'2021-06-25'),
    -> (8,'Siva','siva@gmail.com',55000,3,'2022-09-14'),
    -> (9,'Vijay','vijay@gmail.com',48000,3,'2024-02-11'),
    -> (10,'Priya','priya@gmail.com',30000,4,'2024-04-17'),
    -> (11,'Ravi','ravi@gmail.com',48000,4,'2023-12-09'),
    -> (12,'Kiran','kiran@gmail.com',42000,5,'2022-05-22'),
    -> (13,'Manoj','manoj@gmail.com',52000,5,'2021-10-30'),
    -> (14,'Sara','sara@gmail.com',75000,6,'2020-03-15'),
    -> (15,'Naveen','naveen@gmail.com',38000,7,'2024-06-10'),
    -> (16,'Karthik','karthik@gmail.com',45000,7,'2023-09-21');
Query OK, 16 rows affected (0.01 sec)
Records: 16  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE Project (
    ->     ProjectID INT PRIMARY KEY,
    ->     ProjectName VARCHAR(100) NOT NULL,
    ->     Budget DECIMAL(12,2),
    ->     DepartmentID INT,
    ->     StartDate DATE,
    ->     EndDate DATE,
    ->     FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO Project VALUES
    -> (101,'Website Development',150000,1,'2025-01-01','2025-06-30'),
    -> (102,'Mobile Application',250000,1,'2025-02-01','2025-08-30'),
    -> (103,'Recruitment System',80000,2,'2025-01-15','2025-05-30'),
    -> (104,'Financial Analysis',120000,3,'2025-03-01','2025-09-30'),
    -> (105,'Marketing Campaign',100000,4,'2025-02-15','2025-07-31'),
    -> (106,'Inventory System',180000,5,'2025-01-10','2025-10-30'),
    -> (107,'AI Research',300000,6,'2025-04-01','2026-03-31'),
    -> (108,'Sales Dashboard',90000,7,'2025-05-01','2025-11-30');
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE EmployeeProject (
    ->     EmployeeID INT,
    ->     ProjectID INT,
    ->     HoursWorked INT,
    ->     PRIMARY KEY(EmployeeID,ProjectID),
    ->     FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID),
    ->     FOREIGN KEY(ProjectID) REFERENCES Project(ProjectID)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO EmployeeProject VALUES
    -> (1,101,40),
    -> (1,102,30),
    -> (2,101,50),
    -> (2,102,20),
    -> (3,102,45),
    -> (4,101,35),
    -> (5,103,30),
    -> (6,103,40),
    -> (7,104,50),
    -> (8,104,35),
    -> (9,104,25),
    -> (10,105,40),
    -> (11,105,55),
    -> (12,106,30),
    -> (13,106,45),
    -> (14,107,60),
    -> (15,108,35),
    -> (16,108,45);
Query OK, 18 rows affected (0.00 sec)
Records: 18  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE VIEW EmployeeDetails AS
    -> SELECT
    ->     e.EmployeeID,
    ->     e.EmployeeName,
    ->     e.Email,
    ->     e.Salary,
    ->     d.DepartmentName,
    ->     e.JoiningDate
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID = d.DepartmentID;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> CREATE VIEW EmployeeSalaryView AS
    -> SELECT
    ->     EmployeeID,
    ->     EmployeeName,
    ->     Salary
    -> FROM Employee;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> CREATE VIEW DepartmentSalaryView AS
    -> SELECT
    ->     d.DepartmentName,
    ->     SUM(e.Salary) AS TotalSalary,
    ->     AVG(e.Salary) AS AverageSalary
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID = d.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> CREATE VIEW EmployeeProjectView AS
    -> SELECT
    ->     e.EmployeeName,
    ->     p.ProjectName,
    ->     ep.HoursWorked
    -> FROM Employee e
    -> INNER JOIN EmployeeProject ep
    -> ON e.EmployeeID = ep.EmployeeID
    -> INNER JOIN Project p
    -> ON ep.ProjectID = p.ProjectID;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> CREATE VIEW ProjectBudgetView AS
    -> SELECT
    ->     p.ProjectName,
    ->     p.Budget,
    ->     d.DepartmentName
    -> FROM Project p
    -> INNER JOIN Department d
    -> ON p.DepartmentID = d.DepartmentID;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> CREATE VIEW HighSalaryEmployees AS
    -> SELECT
    ->     EmployeeID,
    ->     EmployeeName,
    ->     Salary,
    ->     DepartmentID
    -> FROM Employee
    -> WHERE Salary > 50000;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> CREATE VIEW DepartmentEmployeeCount AS
    -> SELECT
    ->     d.DepartmentName,
    ->     COUNT(e.EmployeeID) AS EmployeeCount
    -> FROM Department d
    -> LEFT JOIN Employee e
    -> ON d.DepartmentID = e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> CREATE VIEW ProjectWorkload AS
    -> SELECT
    ->     p.ProjectName,
    ->     SUM(ep.HoursWorked) AS TotalHours
    -> FROM Project p
    -> INNER JOIN EmployeeProject ep
    -> ON p.ProjectID = ep.ProjectID
    -> GROUP BY p.ProjectID,p.ProjectName;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> CREATE INDEX idx_employee_name
    -> ON Employee(EmployeeName);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE INDEX idx_employee_salary
    -> ON Employee(Salary);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE INDEX idx_employee_department
    -> ON Employee(DepartmentID);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE INDEX idx_employee_joining
    -> ON Employee(JoiningDate);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE INDEX idx_project_department
    -> ON Project(DepartmentID);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE INDEX idx_project_budget
    -> ON Project(Budget);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE INDEX idx_project_name
    -> ON Project(ProjectName);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE INDEX idx_employeeproject_employee
    -> ON EmployeeProject(EmployeeID);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE INDEX idx_employeeproject_project
    -> ON EmployeeProject(ProjectID);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE INDEX idx_employeeproject_hours
    -> ON EmployeeProject(HoursWorked);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT * FROM EmployeeDetails
    -> WHERE DepartmentName = 'IT';
+------------+--------------+-----------------+----------+----------------+-------------+
| EmployeeID | EmployeeName | Email           | Salary   | DepartmentName | JoiningDate |
+------------+--------------+-----------------+----------+----------------+-------------+
|          1 | Arun         | arun@gmail.com  | 60000.00 | IT             | 2023-01-15  |
|          2 | Bala         | bala@gmail.com  | 45000.00 | IT             | 2023-03-20  |
|          3 | Divya        | divya@gmail.com | 50000.00 | IT             | 2022-07-10  |
|          4 | Anu          | anu@gmail.com   | 65000.00 | IT             | 2021-11-05  |
+------------+--------------+-----------------+----------+----------------+-------------+
4 rows in set (0.00 sec)

mysql>
mysql> SELECT * FROM EmployeeSalaryView
    -> WHERE Salary > 50000;
+------------+--------------+----------+
| EmployeeID | EmployeeName | Salary   |
+------------+--------------+----------+
|         13 | Manoj        | 52000.00 |
|          8 | Siva         | 55000.00 |
|          1 | Arun         | 60000.00 |
|          4 | Anu          | 65000.00 |
|          7 | Rahul        | 70000.00 |
|         14 | Sara         | 75000.00 |
+------------+--------------+----------+
6 rows in set (0.00 sec)

mysql>
mysql> SELECT * FROM DepartmentSalaryView
    -> ORDER BY TotalSalary DESC;
+----------------+-------------+---------------+
| DepartmentName | TotalSalary | AverageSalary |
+----------------+-------------+---------------+
| IT             |   220000.00 |  55000.000000 |
| Finance        |   173000.00 |  57666.666667 |
| Operations     |    94000.00 |  47000.000000 |
| Sales          |    83000.00 |  41500.000000 |
| Marketing      |    78000.00 |  39000.000000 |
| HR             |    75000.00 |  37500.000000 |
| Research       |    75000.00 |  75000.000000 |
+----------------+-------------+---------------+
7 rows in set (0.00 sec)

mysql>
mysql> SELECT * FROM EmployeeProjectView
    -> WHERE HoursWorked > 40;
+--------------+---------------------+-------------+
| EmployeeName | ProjectName         | HoursWorked |
+--------------+---------------------+-------------+
| Divya        | Mobile Application  |          45 |
| Manoj        | Inventory System    |          45 |
| Karthik      | Sales Dashboard     |          45 |
| Bala         | Website Development |          50 |
| Rahul        | Financial Analysis  |          50 |
| Ravi         | Marketing Campaign  |          55 |
| Sara         | AI Research         |          60 |
+--------------+---------------------+-------------+
7 rows in set (0.00 sec)

mysql>
mysql> SELECT * FROM ProjectBudgetView
    -> ORDER BY Budget DESC;
+---------------------+-----------+----------------+
| ProjectName         | Budget    | DepartmentName |
+---------------------+-----------+----------------+
| AI Research         | 300000.00 | Research       |
| Mobile Application  | 250000.00 | IT             |
| Inventory System    | 180000.00 | Operations     |
| Website Development | 150000.00 | IT             |
| Financial Analysis  | 120000.00 | Finance        |
| Marketing Campaign  | 100000.00 | Marketing      |
| Sales Dashboard     |  90000.00 | Sales          |
| Recruitment System  |  80000.00 | HR             |
+---------------------+-----------+----------------+
8 rows in set (0.00 sec)

mysql>
mysql> SELECT * FROM HighSalaryEmployees
    -> ORDER BY Salary DESC;
+------------+--------------+----------+--------------+
| EmployeeID | EmployeeName | Salary   | DepartmentID |
+------------+--------------+----------+--------------+
|         14 | Sara         | 75000.00 |            6 |
|          7 | Rahul        | 70000.00 |            3 |
|          4 | Anu          | 65000.00 |            1 |
|          1 | Arun         | 60000.00 |            1 |
|          8 | Siva         | 55000.00 |            3 |
|         13 | Manoj        | 52000.00 |            5 |
+------------+--------------+----------+--------------+
6 rows in set (0.01 sec)

mysql>
mysql> SELECT * FROM DepartmentEmployeeCount
    -> ORDER BY EmployeeCount DESC;
+----------------+---------------+
| DepartmentName | EmployeeCount |
+----------------+---------------+
| IT             |             4 |
| Finance        |             3 |
| HR             |             2 |
| Marketing      |             2 |
| Operations     |             2 |
| Sales          |             2 |
| Research       |             1 |
+----------------+---------------+
7 rows in set (0.00 sec)

mysql>
mysql> SELECT * FROM ProjectWorkload
    -> ORDER BY TotalHours DESC;
+---------------------+------------+
| ProjectName         | TotalHours |
+---------------------+------------+
| Website Development |        125 |
| Financial Analysis  |        110 |
| Marketing Campaign  |         95 |
| Mobile Application  |         95 |
| Sales Dashboard     |         80 |
| Inventory System    |         75 |
| Recruitment System  |         70 |
| AI Research         |         60 |
+---------------------+------------+
8 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE Salary > 60000;
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Anu          | 65000.00 |
| Rahul        | 70000.00 |
| Sara         | 75000.00 |
+--------------+----------+
3 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> ORDER
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 3
mysql>