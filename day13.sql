Microsoft Windows [Version 10.0.26200.9168]
(c) Microsoft Corporation. All rights reserved.

C:\Users\balae>mysql -u root -p
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.44 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> DROP DATABASE IF EXISTS Day13DB;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql> CREATE DATABASE Day13DB;
Query OK, 1 row affected (0.01 sec)

mysql> USE Day13DB;
Database changed
mysql>
mysql> CREATE TABLE Department (
    ->     DepartmentID INT PRIMARY KEY,
    ->     DepartmentName VARCHAR(50) NOT NULL UNIQUE
    -> );
Query OK, 0 rows affected (0.08 sec)

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
    ->     EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    ->     EmployeeName VARCHAR(50) NOT NULL,
    ->     Email VARCHAR(100) UNIQUE,
    ->     Salary DECIMAL(10,2) NOT NULL,
    ->     DepartmentID INT,
    ->     JoiningDate DATE,
    ->     FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql>
mysql> INSERT INTO Employee
    -> (EmployeeName,Email,Salary,DepartmentID,JoiningDate)
    -> VALUES
    -> ('Arun','arun@gmail.com',60000,1,'2022-01-15'),
    -> ('Bala','bala@gmail.com',45000,1,'2023-03-20'),
    -> ('Divya','divya@gmail.com',50000,1,'2021-07-10'),
    -> ('Anu','anu@gmail.com',65000,1,'2020-11-05'),
    -> ('Kavi','kavi@gmail.com',35000,2,'2024-01-12'),
    -> ('Meena','meena@gmail.com',40000,2,'2023-08-18'),
    -> ('Rahul','rahul@gmail.com',70000,3,'2021-06-25'),
    -> ('Siva','siva@gmail.com',55000,3,'2022-09-14'),
    -> ('Vijay','vijay@gmail.com',48000,3,'2024-02-11'),
    -> ('Priya','priya@gmail.com',30000,4,'2024-04-17'),
    -> ('Ravi','ravi@gmail.com',48000,4,'2023-12-09'),
    -> ('Kiran','kiran@gmail.com',42000,5,'2022-05-22'),
    -> ('Manoj','manoj@gmail.com',52000,5,'2021-10-30'),
    -> ('Sara','sara@gmail.com',75000,6,'2020-03-15'),
    -> ('Naveen','naveen@gmail.com',38000,7,'2024-06-10'),
    -> ('Karthik','karthik@gmail.com',45000,7,'2023-09-21');
Query OK, 16 rows affected (0.01 sec)
Records: 16  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE SalaryAudit (
    ->     AuditID INT PRIMARY KEY AUTO_INCREMENT,
    ->     EmployeeID INT,
    ->     OldSalary DECIMAL(10,2),
    ->     NewSalary DECIMAL(10,2),
    ->     ActionType VARCHAR(30),
    ->     ActionTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> CREATE TABLE EmployeeBackup (
    ->     BackupID INT PRIMARY KEY AUTO_INCREMENT,
    ->     EmployeeID INT,
    ->     EmployeeName VARCHAR(50),
    ->     Salary DECIMAL(10,2),
    ->     DeletedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> CREATE TABLE EmployeeLog (
    ->     LogID INT PRIMARY KEY AUTO_INCREMENT,
    ->     EmployeeID INT,
    ->     LogMessage VARCHAR(200),
    ->     CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> DELIMITER $$
mysql>
mysql> CREATE TRIGGER before_employee_insert
    -> BEFORE INSERT ON Employee
    -> FOR EACH ROW
    -> BEGIN
    ->     IF NEW.Salary < 0 THEN
    ->         SET NEW.Salary = 0;
    ->     END IF;
    -> END$$
Query OK, 0 rows affected (0.03 sec)

mysql>
mysql> DELIMITER ;
mysql>
mysql> INSERT INTO Employee
    -> (EmployeeName,Email,Salary,DepartmentID,JoiningDate)
    -> VALUES
    -> ('TestUser','testuser@gmail.com',50000,1,'2025-01-01');
Query OK, 1 row affected (0.02 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE EmployeeName = 'TestUser';
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| TestUser     | 50000.00 |
+--------------+----------+
1 row in set (0.02 sec)

mysql>
mysql> DELIMITER $$
mysql>
mysql> CREATE TRIGGER after_employee_insert
    -> AFTER INSERT ON Employee
    -> FOR EACH ROW
    -> BEGIN
    ->     INSERT INTO EmployeeLog(EmployeeID,LogMessage)
    ->     VALUES
    ->     (NEW.EmployeeID,'New employee added');
    -> END$$
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql>
mysql> INSERT INTO Employee
    -> (EmployeeName,Email,Salary,DepartmentID,JoiningDate)
    -> VALUES
    -> ('Kumar','kumar@gmail.com',42000,2,'2025-02-01');
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> SELECT *
    -> FROM EmployeeLog;
+-------+------------+--------------------+---------------------+
| LogID | EmployeeID | LogMessage         | CreatedAt           |
+-------+------------+--------------------+---------------------+
|     1 |         18 | New employee added | 2026-09-11 06:49:40 |
+-------+------------+--------------------+---------------------+
1 row in set (0.00 sec)

mysql>
mysql> DELIMITER $$
mysql>
mysql> CREATE TRIGGER before_salary_update
    -> BEFORE UPDATE ON Employee
    -> FOR EACH ROW
    -> BEGIN
    ->     IF NEW.Salary < 10000 THEN
    ->         SET NEW.Salary = 10000;
    ->     END IF;
    -> END$$
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql>
mysql> UPDATE Employee
    -> SET Salary = 55000
    -> WHERE EmployeeID = 2;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> SELECT EmployeeID,EmployeeName,Salary
    -> FROM Employee
    -> WHERE EmployeeID = 2;
+------------+--------------+----------+
| EmployeeID | EmployeeName | Salary   |
+------------+--------------+----------+
|          2 | Bala         | 55000.00 |
+------------+--------------+----------+
1 row in set (0.00 sec)

mysql>
mysql> DELIMITER $$
mysql>
mysql> CREATE TRIGGER after_salary_update
    -> AFTER UPDATE ON Employee
    -> FOR EACH ROW
    -> BEGIN
    ->     IF OLD.Salary <> NEW.Salary THEN
    ->         INSERT INTO SalaryAudit
    ->         (EmployeeID,OldSalary,NewSalary,ActionType)
    ->         VALUES
    ->         (NEW.EmployeeID,OLD.Salary,NEW.Salary,'SALARY UPDATE');
    ->     END IF;
    -> END$$
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql>
mysql> UPDATE Employee
    -> SET Salary = 58000
    -> WHERE EmployeeID = 3;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> SELECT *
    -> FROM SalaryAudit;
+---------+------------+-----------+-----------+---------------+---------------------+
| AuditID | EmployeeID | OldSalary | NewSalary | ActionType    | ActionTime          |
+---------+------------+-----------+-----------+---------------+---------------------+
|       1 |          3 |  50000.00 |  58000.00 | SALARY UPDATE | 2026-09-11 06:49:40 |
+---------+------------+-----------+-----------+---------------+---------------------+
1 row in set (0.00 sec)

mysql>
mysql> DELIMITER $$
mysql>
mysql> CREATE TRIGGER after_employee_delete
    -> AFTER DELETE ON Employee
    -> FOR EACH ROW
    -> BEGIN
    ->     INSERT INTO EmployeeBackup
    ->     (EmployeeID,EmployeeName,Salary)
    ->     VALUES
    ->     (OLD.EmployeeID,OLD.EmployeeName,OLD.Salary);
    -> END$$
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql>
mysql> INSERT INTO Employee
    -> (EmployeeName,Email,Salary,DepartmentID,JoiningDate)
    -> VALUES
    -> ('DeleteUser','deleteuser@gmail.com',30000,2,'2025-03-01');
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> DELETE FROM Employee
    -> WHERE Email = 'deleteuser@gmail.com';
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> SELECT *
    -> FROM EmployeeBackup;
+----------+------------+--------------+----------+---------------------+
| BackupID | EmployeeID | EmployeeName | Salary   | DeletedAt           |
+----------+------------+--------------+----------+---------------------+
|        1 |         19 | DeleteUser   | 30000.00 | 2026-09-11 06:49:40 |
+----------+------------+--------------+----------+---------------------+
1 row in set (0.00 sec)

mysql>
mysql> SHOW TRIGGERS;
+------------------------+--------+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------------------------------------------------------------------------+----------------+----------------------+----------------------+--------------------+
| Trigger                | Event  | Table    | Statement                                                                                                                                                                                                                     | Timing | Created                | sql_mode                                                                                                              | Definer        | character_set_client | collation_connection | Database Collation |
+------------------------+--------+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------------------------------------------------------------------------+----------------+----------------------+----------------------+--------------------+
| before_employee_insert | INSERT | employee | BEGIN
    IF NEW.Salary < 0 THEN
        SET NEW.Salary = 0;
    END IF;
END                                                                                                                                                  | BEFORE | 2026-09-11 06:49:40.60 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| after_employee_insert  | INSERT | employee | BEGIN
    INSERT INTO EmployeeLog(EmployeeID,LogMessage)
    VALUES
    (NEW.EmployeeID,'New employee added');
END                                                                                                            | AFTER  | 2026-09-11 06:49:40.68 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| before_salary_update   | UPDATE | employee | BEGIN
    IF NEW.Salary < 10000 THEN
        SET NEW.Salary = 10000;
    END IF;
END                                                                                                                                          | BEFORE | 2026-09-11 06:49:40.71 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| after_salary_update    | UPDATE | employee | BEGIN
    IF OLD.Salary <> NEW.Salary THEN
        INSERT INTO SalaryAudit
        (EmployeeID,OldSalary,NewSalary,ActionType)
        VALUES
        (NEW.EmployeeID,OLD.Salary,NEW.Salary,'SALARY UPDATE');
    END IF;
END | AFTER  | 2026-09-11 06:49:40.75 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| after_employee_delete  | DELETE | employee | BEGIN
    INSERT INTO EmployeeBackup
    (EmployeeID,EmployeeName,Salary)
    VALUES
    (OLD.EmployeeID,OLD.EmployeeName,OLD.Salary);
END                                                                                    | AFTER  | 2026-09-11 06:49:40.78 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
+------------------------+--------+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------------------------------------------------------------------------+----------------+----------------------+----------------------+--------------------+
5 rows in set (0.04 sec)

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
mysql> SELECT *
    -> FROM EmployeeDetails;
+------------+--------------+--------------------+----------+----------------+-------------+
| EmployeeID | EmployeeName | Email              | Salary   | DepartmentName | JoiningDate |
+------------+--------------+--------------------+----------+----------------+-------------+
|          7 | Rahul        | rahul@gmail.com    | 70000.00 | Finance        | 2021-06-25  |
|          8 | Siva         | siva@gmail.com     | 55000.00 | Finance        | 2022-09-14  |
|          9 | Vijay        | vijay@gmail.com    | 48000.00 | Finance        | 2024-02-11  |
|          5 | Kavi         | kavi@gmail.com     | 35000.00 | HR             | 2024-01-12  |
|          6 | Meena        | meena@gmail.com    | 40000.00 | HR             | 2023-08-18  |
|         18 | Kumar        | kumar@gmail.com    | 42000.00 | HR             | 2025-02-01  |
|          1 | Arun         | arun@gmail.com     | 60000.00 | IT             | 2022-01-15  |
|          2 | Bala         | bala@gmail.com     | 55000.00 | IT             | 2023-03-20  |
|          3 | Divya        | divya@gmail.com    | 58000.00 | IT             | 2021-07-10  |
|          4 | Anu          | anu@gmail.com      | 65000.00 | IT             | 2020-11-05  |
|         17 | TestUser     | testuser@gmail.com | 50000.00 | IT             | 2025-01-01  |
|         10 | Priya        | priya@gmail.com    | 30000.00 | Marketing      | 2024-04-17  |
|         11 | Ravi         | ravi@gmail.com     | 48000.00 | Marketing      | 2023-12-09  |
|         12 | Kiran        | kiran@gmail.com    | 42000.00 | Operations     | 2022-05-22  |
|         13 | Manoj        | manoj@gmail.com    | 52000.00 | Operations     | 2021-10-30  |
|         14 | Sara         | sara@gmail.com     | 75000.00 | Research       | 2020-03-15  |
|         15 | Naveen       | naveen@gmail.com   | 38000.00 | Sales          | 2024-06-10  |
|         16 | Karthik      | karthik@gmail.com  | 45000.00 | Sales          | 2023-09-21  |
+------------+--------------+--------------------+----------+----------------+-------------+
18 rows in set (0.00 sec)

mysql>
mysql> CREATE VIEW HighSalaryEmployees AS
    -> SELECT
    ->     EmployeeID,
    ->     EmployeeName,
    ->     Salary
    -> FROM Employee
    -> WHERE Salary > 50000;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> SELECT *
    -> FROM HighSalaryEmployees;
+------------+--------------+----------+
| EmployeeID | EmployeeName | Salary   |
+------------+--------------+----------+
|          1 | Arun         | 60000.00 |
|          2 | Bala         | 55000.00 |
|          3 | Divya        | 58000.00 |
|          4 | Anu          | 65000.00 |
|          7 | Rahul        | 70000.00 |
|          8 | Siva         | 55000.00 |
|         13 | Manoj        | 52000.00 |
|         14 | Sara         | 75000.00 |
+------------+--------------+----------+
8 rows in set (0.01 sec)

mysql>
mysql> CREATE VIEW DepartmentSalary AS
    -> SELECT
    ->     d.DepartmentName,
    ->     COUNT(e.EmployeeID) AS EmployeeCount,
    ->     SUM(e.Salary) AS TotalSalary,
    ->     AVG(e.Salary) AS AverageSalary
    -> FROM Department d
    -> LEFT JOIN Employee e
    -> ON d.DepartmentID = e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> SELECT *
    -> FROM DepartmentSalary;
+----------------+---------------+-------------+---------------+
| DepartmentName | EmployeeCount | TotalSalary | AverageSalary |
+----------------+---------------+-------------+---------------+
| Finance        |             3 |   173000.00 |  57666.666667 |
| HR             |             3 |   117000.00 |  39000.000000 |
| IT             |             5 |   288000.00 |  57600.000000 |
| Marketing      |             2 |    78000.00 |  39000.000000 |
| Operations     |             2 |    94000.00 |  47000.000000 |
| Research       |             1 |    75000.00 |  75000.000000 |
| Sales          |             2 |    83000.00 |  41500.000000 |
+----------------+---------------+-------------+---------------+
7 rows in set (0.01 sec)

mysql>
mysql> CREATE VIEW EmployeeSalaryRank AS
    -> SELECT
    ->     EmployeeName,
    ->     Salary,
    ->     RANK() OVER(
    ->         ORDER BY Salary DESC
    ->     ) AS SalaryRank
    -> FROM Employee;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> SELECT *
    -> FROM EmployeeSalaryRank;
+--------------+----------+------------+
| EmployeeName | Salary   | SalaryRank |
+--------------+----------+------------+
| Sara         | 75000.00 |          1 |
| Rahul        | 70000.00 |          2 |
| Anu          | 65000.00 |          3 |
| Arun         | 60000.00 |          4 |
| Divya        | 58000.00 |          5 |
| Bala         | 55000.00 |          6 |
| Siva         | 55000.00 |          6 |
| Manoj        | 52000.00 |          8 |
| TestUser     | 50000.00 |          9 |
| Vijay        | 48000.00 |         10 |
| Ravi         | 48000.00 |         10 |
| Karthik      | 45000.00 |         12 |
| Kiran        | 42000.00 |         13 |
| Kumar        | 42000.00 |         13 |
| Meena        | 40000.00 |         15 |
| Naveen       | 38000.00 |         16 |
| Kavi         | 35000.00 |         17 |
| Priya        | 30000.00 |         18 |
+--------------+----------+------------+
18 rows in set (0.00 sec)

mysql>
mysql> CREATE VIEW DepartmentEmployeeRank AS
    -> SELECT
    ->     e.EmployeeName,
    ->     d.DepartmentName,
    ->     e.Salary,
    ->     RANK() OVER(
    ->         PARTITION BY e.DepartmentID
    ->         ORDER BY e.Salary DESC
    ->     ) AS DepartmentRank
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID = d.DepartmentID;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> SELECT *
    -> FROM DepartmentEmployeeRank;
+--------------+----------------+----------+----------------+
| EmployeeName | DepartmentName | Salary   | DepartmentRank |
+--------------+----------------+----------+----------------+
| Anu          | IT             | 65000.00 |              1 |
| Arun         | IT             | 60000.00 |              2 |
| Divya        | IT             | 58000.00 |              3 |
| Bala         | IT             | 55000.00 |              4 |
| TestUser     | IT             | 50000.00 |              5 |
| Kumar        | HR             | 42000.00 |              1 |
| Meena        | HR             | 40000.00 |              2 |
| Kavi         | HR             | 35000.00 |              3 |
| Rahul        | Finance        | 70000.00 |              1 |
| Siva         | Finance        | 55000.00 |              2 |
| Vijay        | Finance        | 48000.00 |              3 |
| Ravi         | Marketing      | 48000.00 |              1 |
| Priya        | Marketing      | 30000.00 |              2 |
| Manoj        | Operations     | 52000.00 |              1 |
| Kiran        | Operations     | 42000.00 |              2 |
| Sara         | Research       | 75000.00 |              1 |
| Karthik      | Sales          | 45000.00 |              1 |
| Naveen       | Sales          | 38000.00 |              2 |
+--------------+----------------+----------+----------------+
18 rows in set (0.00 sec)

mysql>
mysql> CREATE VIEW SeniorEmployees AS
    -> SELECT
    ->     e.EmployeeName,
    ->     d.DepartmentName,
    ->     e.Salary
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID = d.DepartmentID
    -> WHERE e.Salary >= 55000;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> SELECT *
    -> FROM SeniorEmployees;
+--------------+----------------+----------+
| EmployeeName | DepartmentName | Salary   |
+--------------+----------------+----------+
| Rahul        | Finance        | 70000.00 |
| Siva         | Finance        | 55000.00 |
| Arun         | IT             | 60000.00 |
| Bala         | IT             | 55000.00 |
| Divya        | IT             | 58000.00 |
| Anu          | IT             | 65000.00 |
| Sara         | Research       | 75000.00 |
+--------------+----------------+----------+
7 rows in set (0.00 sec)

mysql>
mysql> CREATE VIEW DepartmentEmployeeCount AS
    -> SELECT
    ->     d.DepartmentName,
    ->     COUNT(e.EmployeeID) AS EmployeeCount
    -> FROM Department d
    -> LEFT JOIN Employee e
    -> ON d.DepartmentID = e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> SELECT *
    -> FROM DepartmentEmployeeCount;
+----------------+---------------+
| DepartmentName | EmployeeCount |
+----------------+---------------+
| Finance        |             3 |
| HR             |             3 |
| IT             |             5 |
| Marketing      |             2 |
| Operations     |             2 |
| Research       |             1 |
| Sales          |             2 |
+----------------+---------------+
7 rows in set (0.00 sec)

mysql>
mysql> CREATE VIEW SalaryCategories AS
    -> SELECT
    ->     EmployeeName,
    ->     Salary,
    ->     CASE
    ->         WHEN Salary >= 60000 THEN 'High'
    ->         WHEN Salary >= 45000 THEN 'Medium'
    ->         ELSE 'Low'
    ->     END AS SalaryCategory
    -> FROM Employee;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> SELECT *
    -> FROM SalaryCategories;
+--------------+----------+----------------+
| EmployeeName | Salary   | SalaryCategory |
+--------------+----------+----------------+
| Arun         | 60000.00 | High           |
| Bala         | 55000.00 | Medium         |
| Divya        | 58000.00 | Medium         |
| Anu          | 65000.00 | High           |
| Kavi         | 35000.00 | Low            |
| Meena        | 40000.00 | Low            |
| Rahul        | 70000.00 | High           |
| Siva         | 55000.00 | Medium         |
| Vijay        | 48000.00 | Medium         |
| Priya        | 30000.00 | Low            |
| Ravi         | 48000.00 | Medium         |
| Kiran        | 42000.00 | Low            |
| Manoj        | 52000.00 | Medium         |
| Sara         | 75000.00 | High           |
| Naveen       | 38000.00 | Low            |
| Karthik      | 45000.00 | Medium         |
| TestUser     | 50000.00 | Medium         |
| Kumar        | 42000.00 | Low            |
+--------------+----------+----------------+
18 rows in set (0.00 sec)

mysql>
mysql> CREATE VIEW EmployeeJoiningDetails AS
    -> SELECT
    ->     EmployeeName,
    ->     JoiningDate,
    ->     YEAR(JoiningDate) AS JoiningYear
    -> FROM Employee;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> SELECT *
    -> FROM EmployeeJoiningDetails;
+--------------+-------------+-------------+
| EmployeeName | JoiningDate | JoiningYear |
+--------------+-------------+-------------+
| Arun         | 2022-01-15  |        2022 |
| Bala         | 2023-03-20  |        2023 |
| Divya        | 2021-07-10  |        2021 |
| Anu          | 2020-11-05  |        2020 |
| Kavi         | 2024-01-12  |        2024 |
| Meena        | 2023-08-18  |        2023 |
| Rahul        | 2021-06-25  |        2021 |
| Siva         | 2022-09-14  |        2022 |
| Vijay        | 2024-02-11  |        2024 |
| Priya        | 2024-04-17  |        2024 |
| Ravi         | 2023-12-09  |        2023 |
| Kiran        | 2022-05-22  |        2022 |
| Manoj        | 2021-10-30  |        2021 |
| Sara         | 2020-03-15  |        2020 |
| Naveen       | 2024-06-10  |        2024 |
| Karthik      | 2023-09-21  |        2023 |
| TestUser     | 2025-01-01  |        2025 |
| Kumar        | 2025-02-01  |        2025 |
+--------------+-------------+-------------+
18 rows in set (0.00 sec)

