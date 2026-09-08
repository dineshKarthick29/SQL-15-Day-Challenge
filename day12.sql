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

mysql> DROP DATABASE IF EXISTS Day12DB;
Query OK, 0 rows affected, 1 warning (0.15 sec)

mysql> CREATE DATABASE Day12DB;
Query OK, 1 row affected (0.04 sec)

mysql> USE Day12DB;
Database changed
mysql>
mysql> CREATE TABLE Department (
    ->     DepartmentID INT PRIMARY KEY,
    ->     DepartmentName VARCHAR(50) NOT NULL UNIQUE
    -> );
Query OK, 0 rows affected (0.18 sec)

mysql>
mysql> INSERT INTO Department VALUES
    -> (1,'IT'),
    -> (2,'HR'),
    -> (3,'Finance'),
    -> (4,'Marketing'),
    -> (5,'Operations'),
    -> (6,'Research'),
    -> (7,'Sales');
Query OK, 7 rows affected (0.04 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE Employee (
    ->     EmployeeID INT PRIMARY KEY,
    ->     EmployeeName VARCHAR(50) NOT NULL,
    ->     Salary DECIMAL(10,2) NOT NULL,
    ->     DepartmentID INT,
    ->     JoiningDate DATE,
    ->     Experience INT,
    ->     FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO Employee VALUES
    -> (1,'Arun',60000,1,'2022-01-15',4),
    -> (2,'Bala',45000,1,'2023-03-20',3),
    -> (3,'Divya',50000,1,'2021-07-10',5),
    -> (4,'Anu',65000,1,'2020-11-05',6),
    -> (5,'Kavi',35000,2,'2024-01-12',2),
    -> (6,'Meena',40000,2,'2023-08-18',3),
    -> (7,'Rahul',70000,3,'2021-06-25',5),
    -> (8,'Siva',55000,3,'2022-09-14',4),
    -> (9,'Vijay',48000,3,'2024-02-11',2),
    -> (10,'Priya',30000,4,'2024-04-17',2),
    -> (11,'Ravi',48000,4,'2023-12-09',3),
    -> (12,'Kiran',42000,5,'2022-05-22',4),
    -> (13,'Manoj',52000,5,'2021-10-30',5),
    -> (14,'Sara',75000,6,'2020-03-15',6),
    -> (15,'Naveen',38000,7,'2024-06-10',2),
    -> (16,'Karthik',45000,7,'2023-09-21',3),
    -> (17,'Deepa',58000,1,'2022-12-05',4),
    -> (18,'Mohan',62000,3,'2021-04-18',5),
    -> (19,'Keerthi',47000,5,'2023-06-25',3),
    -> (20,'Surya',55000,7,'2022-08-12',4);
Query OK, 20 rows affected (0.01 sec)
Records: 20  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE Project (
    ->     ProjectID INT PRIMARY KEY,
    ->     ProjectName VARCHAR(100),
    ->     Budget DECIMAL(12,2),
    ->     DepartmentID INT,
    ->     Status VARCHAR(30),
    ->     FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql>
mysql> INSERT INTO Project VALUES
    -> (101,'Website Development',150000,1,'Completed'),
    -> (102,'Mobile Application',250000,1,'Ongoing'),
    -> (103,'Recruitment System',80000,2,'Completed'),
    -> (104,'Financial Analysis',120000,3,'Ongoing'),
    -> (105,'Marketing Campaign',100000,4,'Completed'),
    -> (106,'Inventory System',180000,5,'Ongoing'),
    -> (107,'AI Research',300000,6,'Ongoing'),
    -> (108,'Sales Dashboard',90000,7,'Completed'),
    -> (109,'Cloud Migration',220000,1,'Ongoing'),
    -> (110,'Payroll System',110000,2,'Completed');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE EmployeeProject (
    ->     EmployeeID INT,
    ->     ProjectID INT,
    ->     HoursWorked INT,
    ->     PerformanceScore INT,
    ->     PRIMARY KEY(EmployeeID,ProjectID),
    ->     FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID),
    ->     FOREIGN KEY(ProjectID) REFERENCES Project(ProjectID)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql>
mysql> INSERT INTO EmployeeProject VALUES
    -> (1,101,40,85),
    -> (1,102,30,90),
    -> (2,101,50,80),
    -> (2,102,20,75),
    -> (3,102,45,88),
    -> (4,101,35,92),
    -> (4,109,30,95),
    -> (5,103,30,78),
    -> (6,103,40,85),
    -> (7,104,50,91),
    -> (8,104,35,87),
    -> (9,104,25,82),
    -> (10,105,40,80),
    -> (11,105,55,89),
    -> (12,106,30,76),
    -> (13,106,45,90),
    -> (14,107,60,96),
    -> (15,108,35,81),
    -> (16,108,45,86),
    -> (17,102,40,93),
    -> (17,109,35,91),
    -> (18,104,40,94),
    -> (19,106,30,84),
    -> (20,108,50,92);
Query OK, 24 rows affected (0.01 sec)
Records: 24  Duplicates: 0  Warnings: 0

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
| Arun         | 60000.00 |
| Anu          | 65000.00 |
| Rahul        | 70000.00 |
| Siva         | 55000.00 |
| Manoj        | 52000.00 |
| Sara         | 75000.00 |
| Deepa        | 58000.00 |
| Mohan        | 62000.00 |
| Surya        | 55000.00 |
+--------------+----------+
9 rows in set (0.04 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE Salary <
    -> (
    ->     SELECT AVG(Salary)
    ->     FROM Employee
    -> );
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Bala         | 45000.00 |
| Divya        | 50000.00 |
| Kavi         | 35000.00 |
| Meena        | 40000.00 |
| Vijay        | 48000.00 |
| Priya        | 30000.00 |
| Ravi         | 48000.00 |
| Kiran        | 42000.00 |
| Naveen       | 38000.00 |
| Karthik      | 45000.00 |
| Keerthi      | 47000.00 |
+--------------+----------+
11 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE Salary =
    -> (
    ->     SELECT MAX(Salary)
    ->     FROM Employee
    -> );
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Sara         | 75000.00 |
+--------------+----------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE Salary =
    -> (
    ->     SELECT MIN(Salary)
    ->     FROM Employee
    -> );
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Priya        | 30000.00 |
+--------------+----------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE Salary >
    -> (
    ->     SELECT AVG(Salary)
    ->     FROM Employee
    -> )
    -> ORDER BY Salary DESC;
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Sara         | 75000.00 |
| Rahul        | 70000.00 |
| Anu          | 65000.00 |
| Mohan        | 62000.00 |
| Arun         | 60000.00 |
| Deepa        | 58000.00 |
| Siva         | 55000.00 |
| Surya        | 55000.00 |
| Manoj        | 52000.00 |
+--------------+----------+
9 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE DepartmentID IN
    -> (
    ->     SELECT DepartmentID
    ->     FROM Employee
    ->     GROUP BY DepartmentID
    ->     HAVING AVG(Salary) > 50000
    -> );
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Arun         | 60000.00 |
| Bala         | 45000.00 |
| Divya        | 50000.00 |
| Anu          | 65000.00 |
| Rahul        | 70000.00 |
| Siva         | 55000.00 |
| Vijay        | 48000.00 |
| Sara         | 75000.00 |
| Deepa        | 58000.00 |
| Mohan        | 62000.00 |
+--------------+----------+
10 rows in set (0.02 sec)

mysql>
mysql> SELECT DepartmentName
    -> FROM Department
    -> WHERE DepartmentID IN
    -> (
    ->     SELECT DepartmentID
    ->     FROM Employee
    ->     GROUP BY DepartmentID
    ->     HAVING COUNT(EmployeeID) >= 3
    -> );
+----------------+
| DepartmentName |
+----------------+
| Finance        |
| IT             |
| Operations     |
| Sales          |
+----------------+
4 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE Salary >
    -> (
    ->     SELECT AVG(Salary)
    ->     FROM Employee
    ->     WHERE DepartmentID = 1
    -> );
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Arun         | 60000.00 |
| Anu          | 65000.00 |
| Rahul        | 70000.00 |
| Sara         | 75000.00 |
| Deepa        | 58000.00 |
| Mohan        | 62000.00 |
+--------------+----------+
6 rows in set (0.01 sec)

mysql>
mysql> SELECT ProjectName,Budget
    -> FROM Project
    -> WHERE Budget >
    -> (
    ->     SELECT AVG(Budget)
    ->     FROM Project
    -> );
+--------------------+-----------+
| ProjectName        | Budget    |
+--------------------+-----------+
| Mobile Application | 250000.00 |
| Inventory System   | 180000.00 |
| AI Research        | 300000.00 |
| Cloud Migration    | 220000.00 |
+--------------------+-----------+
4 rows in set (0.00 sec)

mysql>
mysql> SELECT ProjectName,Budget
    -> FROM Project
    -> WHERE Budget =
    -> (
    ->     SELECT MAX(Budget)
    ->     FROM Project
    -> );
+-------------+-----------+
| ProjectName | Budget    |
+-------------+-----------+
| AI Research | 300000.00 |
+-------------+-----------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT ProjectName,Budget
    -> FROM Project
    -> WHERE Budget =
    -> (
    ->     SELECT MIN(Budget)
    ->     FROM Project
    -> );
+--------------------+----------+
| ProjectName        | Budget   |
+--------------------+----------+
| Recruitment System | 80000.00 |
+--------------------+----------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,DepartmentID,Salary
    -> FROM Employee e
    -> WHERE Salary >
    -> (
    ->     SELECT AVG(Salary)
    ->     FROM Employee e2
    ->     WHERE e2.DepartmentID = e.DepartmentID
    -> );
+--------------+--------------+----------+
| EmployeeName | DepartmentID | Salary   |
+--------------+--------------+----------+
| Arun         |            1 | 60000.00 |
| Anu          |            1 | 65000.00 |
| Meena        |            2 | 40000.00 |
| Rahul        |            3 | 70000.00 |
| Ravi         |            4 | 48000.00 |
| Manoj        |            5 | 52000.00 |
| Deepa        |            1 | 58000.00 |
| Mohan        |            3 | 62000.00 |
| Surya        |            7 | 55000.00 |
+--------------+--------------+----------+
9 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        d.DepartmentName,
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
+--------------+----------------+----------+
| EmployeeName | DepartmentName | Salary   |
+--------------+----------------+----------+
| Rahul        | Finance        | 70000.00 |
| Meena        | HR             | 40000.00 |
| Anu          | IT             | 65000.00 |
| Ravi         | Marketing      | 48000.00 |
| Manoj        | Operations     | 52000.00 |
| Sara         | Research       | 75000.00 |
| Surya        | Sales          | 55000.00 |
+--------------+----------------+----------+
7 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        d.DepartmentName,
    ->        e.Salary
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID = d.DepartmentID
    -> WHERE e.Salary =
    -> (
    ->     SELECT MIN(e2.Salary)
    ->     FROM Employee e2
    ->     WHERE e2.DepartmentID = e.DepartmentID
    -> );
+--------------+----------------+----------+
| EmployeeName | DepartmentName | Salary   |
+--------------+----------------+----------+
| Vijay        | Finance        | 48000.00 |
| Kavi         | HR             | 35000.00 |
| Bala         | IT             | 45000.00 |
| Priya        | Marketing      | 30000.00 |
| Kiran        | Operations     | 42000.00 |
| Sara         | Research       | 75000.00 |
| Naveen       | Sales          | 38000.00 |
+--------------+----------------+----------+
7 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        e.Salary,
    ->        d.DepartmentName
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID = d.DepartmentID
    -> WHERE e.Salary >
    -> (
    ->     SELECT AVG(e2.Salary)
    ->     FROM Employee e2
    ->     WHERE e2.DepartmentID = e.DepartmentID
    -> );
+--------------+----------+----------------+
| EmployeeName | Salary   | DepartmentName |
+--------------+----------+----------------+
| Rahul        | 70000.00 | Finance        |
| Mohan        | 62000.00 | Finance        |
| Meena        | 40000.00 | HR             |
| Arun         | 60000.00 | IT             |
| Anu          | 65000.00 | IT             |
| Deepa        | 58000.00 | IT             |
| Ravi         | 48000.00 | Marketing      |
| Manoj        | 52000.00 | Operations     |
| Surya        | 55000.00 | Sales          |
+--------------+----------+----------------+
9 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName
    -> FROM Department d
    -> WHERE EXISTS
    -> (
    ->     SELECT 1
    ->     FROM Employee e
    ->     WHERE e.DepartmentID = d.DepartmentID
    -> );
+----------------+
| DepartmentName |
+----------------+
| Finance        |
| HR             |
| IT             |
| Marketing      |
| Operations     |
| Research       |
| Sales          |
+----------------+
7 rows in set (0.01 sec)

mysql>
mysql> SELECT d.DepartmentName
    -> FROM Department d
    -> WHERE NOT EXISTS
    -> (
    ->     SELECT 1
    ->     FROM Employee e
    ->     WHERE e.DepartmentID = d.DepartmentID
    -> );
Empty set (0.00 sec)

mysql>
mysql> SELECT p.ProjectName
    -> FROM Project p
    -> WHERE EXISTS
    -> (
    ->     SELECT 1
    ->     FROM EmployeeProject ep
    ->     WHERE ep.ProjectID = p.ProjectID
    -> );
+---------------------+
| ProjectName         |
+---------------------+
| Website Development |
| Mobile Application  |
| Recruitment System  |
| Financial Analysis  |
| Marketing Campaign  |
| Inventory System    |
| AI Research         |
| Sales Dashboard     |
| Cloud Migration     |
+---------------------+
9 rows in set (0.00 sec)

mysql>
mysql> SELECT p.ProjectName
    -> FROM Project p
    -> WHERE NOT EXISTS
    -> (
    ->     SELECT 1
    ->     FROM EmployeeProject ep
    ->     WHERE ep.ProjectID = p.ProjectID
    -> );
+----------------+
| ProjectName    |
+----------------+
| Payroll System |
+----------------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,
    ->        Salary,
    ->        CASE
    ->            WHEN Salary >= 70000 THEN 'High'
    ->            WHEN Salary >= 50000 THEN 'Medium'
    ->            ELSE 'Low'
    ->        END AS SalaryLevel
    -> FROM Employee;
+--------------+----------+-------------+
| EmployeeName | Salary   | SalaryLevel |
+--------------+----------+-------------+
| Arun         | 60000.00 | Medium      |
| Bala         | 45000.00 | Low         |
| Divya        | 50000.00 | Medium      |
| Anu          | 65000.00 | Medium      |
| Kavi         | 35000.00 | Low         |
| Meena        | 40000.00 | Low         |
| Rahul        | 70000.00 | High        |
| Siva         | 55000.00 | Medium      |
| Vijay        | 48000.00 | Low         |
| Priya        | 30000.00 | Low         |
| Ravi         | 48000.00 | Low         |
| Kiran        | 42000.00 | Low         |
| Manoj        | 52000.00 | Medium      |
| Sara         | 75000.00 | High        |
| Naveen       | 38000.00 | Low         |
| Karthik      | 45000.00 | Low         |
| Deepa        | 58000.00 | Medium      |
| Mohan        | 62000.00 | Medium      |
| Keerthi      | 47000.00 | Low         |
| Surya        | 55000.00 | Medium      |
+--------------+----------+-------------+
20 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,
    ->        Experience,
    ->        CASE
    ->            WHEN Experience >= 5 THEN 'Senior'
    ->            WHEN Experience >= 3 THEN 'Mid Level'
    ->            ELSE 'Junior'
    ->        END AS ExperienceLevel
    -> FROM Employee;
+--------------+------------+-----------------+
| EmployeeName | Experience | ExperienceLevel |
+--------------+------------+-----------------+
| Arun         |          4 | Mid Level       |
| Bala         |          3 | Mid Level       |
| Divya        |          5 | Senior          |
| Anu          |          6 | Senior          |
| Kavi         |          2 | Junior          |
| Meena        |          3 | Mid Level       |
| Rahul        |          5 | Senior          |
| Siva         |          4 | Mid Level       |
| Vijay        |          2 | Junior          |
| Priya        |          2 | Junior          |
| Ravi         |          3 | Mid Level       |
| Kiran        |          4 | Mid Level       |
| Manoj        |          5 | Senior          |
| Sara         |          6 | Senior          |
| Naveen       |          2 | Junior          |
| Karthik      |          3 | Mid Level       |
| Deepa        |          4 | Mid Level       |
| Mohan        |          5 | Senior          |
| Keerthi      |          3 | Mid Level       |
| Surya        |          4 | Mid Level       |
+--------------+------------+-----------------+
20 rows in set (0.00 sec)

mysql>
mysql> SELECT ProjectName,
    ->        Budget,
    ->        CASE
    ->            WHEN Budget >= 250000 THEN 'High Budget'
    ->            WHEN Budget >= 150000 THEN 'Medium Budget'
    ->            ELSE 'Low Budget'
    ->        END AS BudgetCategory
    -> FROM Project;
+---------------------+-----------+----------------+
| ProjectName         | Budget    | BudgetCategory |
+---------------------+-----------+----------------+
| Website Development | 150000.00 | Medium Budget  |
| Mobile Application  | 250000.00 | High Budget    |
| Recruitment System  |  80000.00 | Low Budget     |
| Financial Analysis  | 120000.00 | Low Budget     |
| Marketing Campaign  | 100000.00 | Low Budget     |
| Inventory System    | 180000.00 | Medium Budget  |
| AI Research         | 300000.00 | High Budget    |
| Sales Dashboard     |  90000.00 | Low Budget     |
| Cloud Migration     | 220000.00 | Medium Budget  |
| Payroll System      | 110000.00 | Low Budget     |
+---------------------+-----------+----------------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT ProjectName,
    ->        Status,
    ->        CASE
    ->            WHEN Status = 'Completed' THEN 'Finished'
    ->            WHEN Status = 'Ongoing' THEN 'In Progress'
    ->            ELSE 'Unknown'
    ->        END AS ProjectStatus
    -> FROM Project;
+---------------------+-----------+---------------+
| ProjectName         | Status    | ProjectStatus |
+---------------------+-----------+---------------+
| Website Development | Completed | Finished      |
| Mobile Application  | Ongoing   | In Progress   |
| Recruitment System  | Completed | Finished      |
| Financial Analysis  | Ongoing   | In Progress   |
| Marketing Campaign  | Completed | Finished      |
| Inventory System    | Ongoing   | In Progress   |
| AI Research         | Ongoing   | In Progress   |
| Sales Dashboard     | Completed | Finished      |
| Cloud Migration     | Ongoing   | In Progress   |
| Payroll System      | Completed | Finished      |
+---------------------+-----------+---------------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,
    ->        Salary,
    ->        CASE
    ->            WHEN Salary >= 60000 THEN Salary * 0.10
    ->            WHEN Salary >= 45000 THEN Salary * 0.07
    ->            ELSE Salary * 0.05
    ->        END AS Bonus
    -> FROM Employee;
+--------------+----------+-----------+
| EmployeeName | Salary   | Bonus     |
+--------------+----------+-----------+
| Arun         | 60000.00 | 6000.0000 |
| Bala         | 45000.00 | 3150.0000 |
| Divya        | 50000.00 | 3500.0000 |
| Anu          | 65000.00 | 6500.0000 |
| Kavi         | 35000.00 | 1750.0000 |
| Meena        | 40000.00 | 2000.0000 |
| Rahul        | 70000.00 | 7000.0000 |
| Siva         | 55000.00 | 3850.0000 |
| Vijay        | 48000.00 | 3360.0000 |
| Priya        | 30000.00 | 1500.0000 |
| Ravi         | 48000.00 | 3360.0000 |
| Kiran        | 42000.00 | 2100.0000 |
| Manoj        | 52000.00 | 3640.0000 |
| Sara         | 75000.00 | 7500.0000 |
| Naveen       | 38000.00 | 1900.0000 |
| Karthik      | 45000.00 | 3150.0000 |
| Deepa        | 58000.00 | 4060.0000 |
| Mohan        | 62000.00 | 6200.0000 |
| Keerthi      | 47000.00 | 3290.0000 |
| Surya        | 55000.00 | 3850.0000 |
+--------------+----------+-----------+
20 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,
    ->        Salary,
    ->        Salary +
    ->        CASE
    ->            WHEN Salary >= 60000 THEN Salary * 0.10
    ->            WHEN Salary >= 45000 THEN Salary * 0.07
    ->            ELSE Salary * 0.05
    ->        END AS FinalSalary
    -> FROM Employee;
+--------------+----------+-------------+
| EmployeeName | Salary   | FinalSalary |
+--------------+----------+-------------+
| Arun         | 60000.00 |  66000.0000 |
| Bala         | 45000.00 |  48150.0000 |
| Divya        | 50000.00 |  53500.0000 |
| Anu          | 65000.00 |  71500.0000 |
| Kavi         | 35000.00 |  36750.0000 |
| Meena        | 40000.00 |  42000.0000 |
| Rahul        | 70000.00 |  77000.0000 |
| Siva         | 55000.00 |  58850.0000 |
| Vijay        | 48000.00 |  51360.0000 |
| Priya        | 30000.00 |  31500.0000 |
| Ravi         | 48000.00 |  51360.0000 |
| Kiran        | 42000.00 |  44100.0000 |
| Manoj        | 52000.00 |  55640.0000 |
| Sara         | 75000.00 |  82500.0000 |
| Naveen       | 38000.00 |  39900.0000 |
| Karthik      | 45000.00 |  48150.0000 |
| Deepa        | 58000.00 |  62060.0000 |
| Mohan        | 62000.00 |  68200.0000 |
| Keerthi      | 47000.00 |  50290.0000 |
| Surya        | 55000.00 |  58850.0000 |
+--------------+----------+-------------+
20 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        COUNT(e.EmployeeID) AS EmployeeCount,
    ->        CASE
    ->            WHEN COUNT(e.EmployeeID) >= 4 THEN 'Large'
    ->            WHEN COUNT(e.EmployeeID) >= 2 THEN 'Medium'
    ->            ELSE 'Small'
    ->        END AS DepartmentSize
    -> FROM Department d
    -> LEFT JOIN Employee e
    -> ON d.DepartmentID = e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+---------------+----------------+
| DepartmentName | EmployeeCount | DepartmentSize |
+----------------+---------------+----------------+
| Finance        |             4 | Large          |
| HR             |             2 | Medium         |
| IT             |             5 | Large          |
| Marketing      |             2 | Medium         |
| Operations     |             3 | Medium         |
| Research       |             1 | Small          |
| Sales          |             3 | Medium         |
+----------------+---------------+----------------+
7 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        AVG(e.Salary) AS AverageSalary,
    ->        CASE
    ->            WHEN AVG(e.Salary) >= 60000 THEN 'High'
    ->            WHEN AVG(e.Salary) >= 45000 THEN 'Medium'
    ->            ELSE 'Low'
    ->        END AS SalaryCategory
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID = e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+---------------+----------------+
| DepartmentName | AverageSalary | SalaryCategory |
+----------------+---------------+----------------+
| Finance        |  58750.000000 | Medium         |
| HR             |  37500.000000 | Low            |
| IT             |  55600.000000 | Medium         |
| Marketing      |  39000.000000 | Low            |
| Operations     |  47000.000000 | Medium         |
| Research       |  75000.000000 | High           |
| Sales          |  46000.000000 | Medium         |
+----------------+---------------+----------------+
7 rows in set (0.01 sec)

mysql>
mysql> WITH AverageSalary AS
    -> (
    ->     SELECT AVG(Salary) AS AvgSalary
    ->     FROM Employee
    -> )
    -> SELECT e.EmployeeName,
    ->        e.Salary
    -> FROM Employee e
    -> CROSS JOIN AverageSalary a
    -> WHERE e.Salary > a.AvgSalary;
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Arun         | 60000.00 |
| Anu          | 65000.00 |
| Rahul        | 70000.00 |
| Siva         | 55000.00 |
| Manoj        | 52000.00 |
| Sara         | 75000.00 |
| Deepa        | 58000.00 |
| Mohan        | 62000.00 |
| Surya        | 55000.00 |
+--------------+----------+
9 rows in set (0.00 sec)

mysql>
mysql> WITH DepartmentSalary AS
    -> (
    ->     SELECT DepartmentID,
    ->            AVG(Salary) AS AvgSalary
    ->     FROM Employee
    ->     GROUP BY DepartmentID
    -> )
    -> SELECT d.DepartmentName,
    ->        ds.AvgSalary
    -> FROM DepartmentSalary ds
    -> INNER JOIN Department d
    -> ON ds.DepartmentID = d.DepartmentID;
+----------------+--------------+
| DepartmentName | AvgSalary    |
+----------------+--------------+
| Finance        | 58750.000000 |
| HR             | 37500.000000 |
| IT             | 55600.000000 |
| Marketing      | 39000.000000 |
| Operations     | 47000.000000 |
| Research       | 75000.000000 |
| Sales          | 46000.000000 |
+----------------+--------------+
7 rows in set (0.00 sec)

mysql>
mysql> WITH DepartmentSalary AS
    -> (
    ->     SELECT DepartmentID,
    ->            SUM(Salary) AS TotalSalary
    ->     FROM Employee
    ->     GROUP BY DepartmentID
    -> )
    -> SELECT d.DepartmentName,
    ->        ds.TotalSalary
    -> FROM DepartmentSalary ds
    -> INNER JOIN Department d
    -> ON ds.DepartmentID = d.DepartmentID
    -> ORDER BY ds.TotalSalary DESC;
+----------------+-------------+
| DepartmentName | TotalSalary |
+----------------+-------------+
| IT             |   278000.00 |
| Finance        |   235000.00 |
| Operations     |   141000.00 |
| Sales          |   138000.00 |
| Marketing      |    78000.00 |
| HR             |    75000.00 |
| Research       |    75000.00 |
+----------------+-------------+
7 rows in set (0.00 sec)

mysql>
mysql> WITH DepartmentEmployee AS
    -> (
    ->     SELECT DepartmentID,
    ->            COUNT(EmployeeID) AS EmployeeCount
    ->     FROM Employee
    ->     GROUP BY DepartmentID
    -> )
    -> SELECT d.DepartmentName,
    ->        de.EmployeeCount
    -> FROM DepartmentEmployee de
    -> INNER JOIN Department d
    -> ON de.DepartmentID = d.DepartmentID
    -> WHERE de.EmployeeCount > 2;
+----------------+---------------+
| DepartmentName | EmployeeCount |
+----------------+---------------+
| Finance        |             4 |
| IT             |             5 |
| Operations     |             3 |
| Sales          |             3 |
+----------------+---------------+
4 rows in set (0.00 sec)

mysql>
mysql> WITH HighSalary AS
    -> (
    ->     SELECT EmployeeID,
    ->            EmployeeName,
    ->            Salary
    ->     FROM Employee
    ->     WHERE Salary > 50000
    -> )
    -> SELECT *
    -> FROM HighSalary
    -> ORDER BY Salary DESC;
+------------+--------------+----------+
| EmployeeID | EmployeeName | Salary   |
+------------+--------------+----------+
|         14 | Sara         | 75000.00 |
|          7 | Rahul        | 70000.00 |
|          4 | Anu          | 65000.00 |
|         18 | Mohan        | 62000.00 |
|          1 | Arun         | 60000.00 |
|         17 | Deepa        | 58000.00 |
|          8 | Siva         | 55000.00 |
|         20 | Surya        | 55000.00 |
|         13 | Manoj        | 52000.00 |
+------------+--------------+----------+
9 rows in set (0.00 sec)

mysql>
mysql> WITH ProjectAverage AS
    -> (
    ->     SELECT AVG(Budget) AS AvgBudget
    ->     FROM Project
    -> )
    -> SELECT p.ProjectName,
    ->        p.Budget
    -> FROM Project p
    -> CROSS JOIN ProjectAverage pa
    -> WHERE p.Budget > pa.AvgBudget;
+--------------------+-----------+
| ProjectName        | Budget    |
+--------------------+-----------+
| Mobile Application | 250000.00 |
| Inventory System   | 180000.00 |
| AI Research        | 300000.00 |
| Cloud Migration    | 220000.00 |
+--------------------+-----------+
4 rows in set (0.00 sec)

mysql>
mysql> WITH ProjectHours AS
    -> (
    ->     SELECT ProjectID,
    ->            SUM(HoursWorked) AS TotalHours
    ->     FROM EmployeeProject
    ->     GROUP BY ProjectID
    -> )
    -> SELECT p.ProjectName,
    ->        ph.TotalHours
    -> FROM ProjectHours ph
    -> INNER JOIN Project p
    -> ON ph.ProjectID = p.ProjectID
    -> ORDER BY ph.TotalHours DESC;
+---------------------+------------+
| ProjectName         | TotalHours |
+---------------------+------------+
| Financial Analysis  |        150 |
| Mobile Application  |        135 |
| Sales Dashboard     |        130 |
| Website Development |        125 |
| Inventory System    |        105 |
| Marketing Campaign  |         95 |
| Recruitment System  |         70 |
| Cloud Migration     |         65 |
| AI Research         |         60 |
+---------------------+------------+
9 rows in set (0.00 sec)

mysql>
mysql> WITH EmployeeHours AS
    -> (
    ->     SELECT EmployeeID,
    ->            SUM(HoursWorked) AS TotalHours
    ->     FROM EmployeeProject
    ->     GROUP BY EmployeeID
    -> )
    -> SELECT e.EmployeeName,
    ->        eh.TotalHours
    -> FROM EmployeeHours eh
    -> INNER JOIN Employee e
    -> ON eh.EmployeeID = e.EmployeeID
    -> ORDER BY eh.TotalHours DESC;
+--------------+------------+
| EmployeeName | TotalHours |
+--------------+------------+
| Deepa        |         75 |
| Arun         |         70 |
| Bala         |         70 |
| Anu          |         65 |
| Sara         |         60 |
| Ravi         |         55 |
| Rahul        |         50 |
| Surya        |         50 |
| Divya        |         45 |
| Manoj        |         45 |
| Karthik      |         45 |
| Meena        |         40 |
| Priya        |         40 |
| Mohan        |         40 |
| Siva         |         35 |
| Naveen       |         35 |
| Kavi         |         30 |
| Kiran        |         30 |
| Keerthi      |         30 |
| Vijay        |         25 |
+--------------+------------+
20 rows in set (0.00 sec)

mysql>
mysql> WITH DepartmentBudget AS
    -> (
    ->     SELECT DepartmentID,
    ->            SUM(Budget) AS TotalBudget
    ->     FROM Project
    ->     GROUP BY DepartmentID
    -> )
    -> SELECT d.DepartmentName,
    ->        db.TotalBudget
    -> FROM DepartmentBudget db
    -> INNER JOIN Department d
    -> ON db.DepartmentID = d.DepartmentID;
+----------------+-------------+
| DepartmentName | TotalBudget |
+----------------+-------------+
| IT             |   620000.00 |
| HR             |   190000.00 |
| Finance        |   120000.00 |
| Marketing      |   100000.00 |
| Operations     |   180000.00 |
| Research       |   300000.00 |
| Sales          |    90000.00 |
+----------------+-------------+
7 rows in set (0.00 sec)

mysql>
mysql> WITH DepartmentData AS
    -> (
    ->     SELECT DepartmentID,
    ->            COUNT(*) AS EmployeeCount,
    ->            AVG(Salary) AS AverageSalary,
    ->            SUM(Salary) AS TotalSalary
    ->     FROM Employee
    ->     GROUP BY DepartmentID
    -> )
    -> SELECT d.DepartmentName,
    ->        dd.EmployeeCount,
    ->        dd.AverageSalary,
    ->        dd.TotalSalary
    -> FROM DepartmentData dd
    -> INNER JOIN Department d
    -> ON dd.DepartmentID = d.DepartmentID;
+----------------+---------------+---------------+-------------+
| DepartmentName | EmployeeCount | AverageSalary | TotalSalary |
+----------------+---------------+---------------+-------------+
| Finance        |             4 |  58750.000000 |   235000.00 |
| HR             |             2 |  37500.000000 |    75000.00 |
| IT             |             5 |  55600.000000 |   278000.00 |
| Marketing      |             2 |  39000.000000 |    78000.00 |
| Operations     |             3 |  47000.000000 |   141000.00 |
| Research       |             1 |  75000.000000 |    75000.00 |
| Sales          |             3 |  46000.000000 |   138000.00 |
+----------------+---------------+---------------+-------------+
7 rows in set (0.00 sec)

mysql>
mysql> WITH HighBudgetProjects AS
    -> (
    ->     SELECT ProjectID,
    ->            ProjectName,
    ->            Budget,
    ->            DepartmentID
    ->     FROM Project
    ->     WHERE Budget > 150000
    -> )
    -> SELECT h.ProjectName,
    ->        h.Budget,
    ->        d.DepartmentName
    -> FROM HighBudgetProjects h
    -> INNER JOIN Department d
    -> ON h.DepartmentID = d.DepartmentID;
+--------------------+-----------+----------------+
| ProjectName        | Budget    | DepartmentName |
+--------------------+-----------+----------------+
| Mobile Application | 250000.00 | IT             |
| Inventory System   | 180000.00 | Operations     |
| AI Research        | 300000.00 | Research       |
| Cloud Migration    | 220000.00 | IT             |
+--------------------+-----------+----------------+
4 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,
    ->        Salary,
    ->        ROW_NUMBER() OVER(
    ->            ORDER BY Salary DESC
    ->        ) AS RowNumber
    -> FROM Employee;
+--------------+----------+-----------+
| EmployeeName | Salary   | RowNumber |
+--------------+----------+-----------+
| Sara         | 75000.00 |         1 |
| Rahul        | 70000.00 |         2 |
| Anu          | 65000.00 |         3 |
| Mohan        | 62000.00 |         4 |
| Arun         | 60000.00 |         5 |
| Deepa        | 58000.00 |         6 |
| Siva         | 55000.00 |         7 |
| Surya        | 55000.00 |         8 |
| Manoj        | 52000.00 |         9 |
| Divya        | 50000.00 |        10 |
| Vijay        | 48000.00 |        11 |
| Ravi         | 48000.00 |        12 |
| Keerthi      | 47000.00 |        13 |
| Bala         | 45000.00 |        14 |
| Karthik      | 45000.00 |        15 |
| Kiran        | 42000.00 |        16 |
| Meena        | 40000.00 |        17 |
| Naveen       | 38000.00 |        18 |
| Kavi         | 35000.00 |        19 |
| Priya        | 30000.00 |        20 |
+--------------+----------+-----------+
20 rows in set (0.01 sec)

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
| Sara         | 75000.00 |          1 |
| Rahul        | 70000.00 |          2 |
| Anu          | 65000.00 |          3 |
| Mohan        | 62000.00 |          4 |
| Arun         | 60000.00 |          5 |
| Deepa        | 58000.00 |          6 |
| Siva         | 55000.00 |          7 |
| Surya        | 55000.00 |          7 |
| Manoj        | 52000.00 |          9 |
| Divya        | 50000.00 |         10 |
| Vijay        | 48000.00 |         11 |
| Ravi         | 48000.00 |         11 |
| Keerthi      | 47000.00 |         13 |
| Bala         | 45000.00 |         14 |
| Karthik      | 45000.00 |         14 |
| Kiran        | 42000.00 |         16 |
| Meena        | 40000.00 |         17 |
| Naveen       | 38000.00 |         18 |
| Kavi         | 35000.00 |         19 |
| Priya        | 30000.00 |         20 |
+--------------+----------+------------+
20 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,
    ->        Salary,
    ->        DENSE_RANK() OVER(
    ->            ORDER BY Salary DESC
    ->        ) AS DenseSalaryRank
    -> FROM Employee;
+--------------+----------+-----------------+
| EmployeeName | Salary   | DenseSalaryRank |
+--------------+----------+-----------------+
| Sara         | 75000.00 |               1 |
| Rahul        | 70000.00 |               2 |
| Anu          | 65000.00 |               3 |
| Mohan        | 62000.00 |               4 |
| Arun         | 60000.00 |               5 |
| Deepa        | 58000.00 |               6 |
| Siva         | 55000.00 |               7 |
| Surya        | 55000.00 |               7 |
| Manoj        | 52000.00 |               8 |
| Divya        | 50000.00 |               9 |
| Vijay        | 48000.00 |              10 |
| Ravi         | 48000.00 |              10 |
| Keerthi      | 47000.00 |              11 |
| Bala         | 45000.00 |              12 |
| Karthik      | 45000.00 |              12 |
| Kiran        | 42000.00 |              13 |
| Meena        | 40000.00 |              14 |
| Naveen       | 38000.00 |              15 |
| Kavi         | 35000.00 |              16 |
| Priya        | 30000.00 |              17 |
+--------------+----------+-----------------+
20 rows in set (0.00 sec)

