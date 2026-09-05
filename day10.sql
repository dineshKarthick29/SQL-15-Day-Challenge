
mysql> CREATE TABLE Department (
    ->     DepartmentID INT PRIMARY KEY,
    ->     DepartmentName VARCHAR(100) NOT NULL UNIQUE
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO Department VALUES
    -> (1,'IT'),
    -> (2,'HR'),
    -> (3,'Finance'),
    -> (4,'Marketing'),
    -> (5,'Operations');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT * FROM Department;
+--------------+----------------+
| DepartmentID | DepartmentName |
+--------------+----------------+
|            3 | Finance        |
|            2 | HR             |
|            1 | IT             |
|            4 | Marketing      |
|            5 | Operations     |
+--------------+----------------+
5 rows in set (0.00 sec)

mysql>
mysql> CREATE TABLE Employee (
    ->     EmployeeID INT PRIMARY KEY,
    ->     EmployeeName VARCHAR(100) NOT NULL,
    ->     Email VARCHAR(150) UNIQUE,
    ->     Salary DECIMAL(10,2) NOT NULL,
    ->     DepartmentID INT,
    ->     FOREIGN KEY (DepartmentID)
    ->     REFERENCES Department(DepartmentID)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO Employee VALUES
    -> (101,'Arun','arun@gmail.com',60000,1),
    -> (102,'Bala','bala@gmail.com',45000,1),
    -> (103,'Divya','divya@gmail.com',50000,2),
    -> (104,'Kavi','kavi@gmail.com',55000,3),
    -> (105,'Rahul','rahul@gmail.com',48000,4),
    -> (106,'Meena','meena@gmail.com',40000);
ERROR 1136 (21S01): Column count doesn't match value count at row 6
mysql> DROP DATABASE IF EXISTS Day10DB;
Query OK, 2 rows affected (0.03 sec)

mysql> CREATE DATABASE Day10DB;
Query OK, 1 row affected (0.01 sec)

mysql> USE Day10DB;
Database changed
mysql>
mysql> CREATE TABLE Department (
    ->     DepartmentID INT PRIMARY KEY,
    ->     DepartmentName VARCHAR(100) NOT NULL UNIQUE
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO Department VALUES
    -> (1,'IT'),
    -> (2,'HR'),
    -> (3,'Finance'),
    -> (4,'Marketing'),
    -> (5,'Operations');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT * FROM Department;
+--------------+----------------+
| DepartmentID | DepartmentName |
+--------------+----------------+
|            3 | Finance        |
|            2 | HR             |
|            1 | IT             |
|            4 | Marketing      |
|            5 | Operations     |
+--------------+----------------+
5 rows in set (0.00 sec)

mysql>
mysql> CREATE TABLE Employee (
    ->     EmployeeID INT PRIMARY KEY,
    ->     EmployeeName VARCHAR(100) NOT NULL,
    ->     Email VARCHAR(150) UNIQUE,
    ->     Salary DECIMAL(10,2) NOT NULL,
    ->     DepartmentID INT,
    ->     FOREIGN KEY (DepartmentID)
    ->     REFERENCES Department(DepartmentID)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO Employee VALUES
    -> (101,'Arun','arun@gmail.com',60000,1),
    -> (102,'Bala','bala@gmail.com',45000,1),
    -> (103,'Divya','divya@gmail.com',50000,2),
    -> (104,'Kavi','kavi@gmail.com',55000,3),
    -> (105,'Rahul','rahul@gmail.com',48000,4),
    -> (106,'Meena','meena@gmail.com',40000,2),
    -> (107,'Siva','siva@gmail.com',70000,3),
    -> (108,'Priya','priya@gmail.com',35000,4),
    -> (109,'Vijay','vijay@gmail.com',52000,5),
    -> (110,'Anu','anu@gmail.com',65000,1);
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT * FROM Employee;
+------------+--------------+-----------------+----------+--------------+
| EmployeeID | EmployeeName | Email           | Salary   | DepartmentID |
+------------+--------------+-----------------+----------+--------------+
|        101 | Arun         | arun@gmail.com  | 60000.00 |            1 |
|        102 | Bala         | bala@gmail.com  | 45000.00 |            1 |
|        103 | Divya        | divya@gmail.com | 50000.00 |            2 |
|        104 | Kavi         | kavi@gmail.com  | 55000.00 |            3 |
|        105 | Rahul        | rahul@gmail.com | 48000.00 |            4 |
|        106 | Meena        | meena@gmail.com | 40000.00 |            2 |
|        107 | Siva         | siva@gmail.com  | 70000.00 |            3 |
|        108 | Priya        | priya@gmail.com | 35000.00 |            4 |
|        109 | Vijay        | vijay@gmail.com | 52000.00 |            5 |
|        110 | Anu          | anu@gmail.com   | 65000.00 |            1 |
+------------+--------------+-----------------+----------+--------------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeID,EmployeeName
    -> FROM Employee;
+------------+--------------+
| EmployeeID | EmployeeName |
+------------+--------------+
|        101 | Arun         |
|        102 | Bala         |
|        103 | Divya        |
|        104 | Kavi         |
|        105 | Rahul        |
|        106 | Meena        |
|        107 | Siva         |
|        108 | Priya        |
|        109 | Vijay        |
|        110 | Anu          |
+------------+--------------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE Salary > 50000;
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Arun         | 60000.00 |
| Kavi         | 55000.00 |
| Siva         | 70000.00 |
| Vijay        | 52000.00 |
| Anu          | 65000.00 |
+--------------+----------+
5 rows in set (0.01 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> ORDER BY Salary DESC;
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Siva         | 70000.00 |
| Anu          | 65000.00 |
| Arun         | 60000.00 |
| Kavi         | 55000.00 |
| Vijay        | 52000.00 |
| Divya        | 50000.00 |
| Rahul        | 48000.00 |
| Bala         | 45000.00 |
| Meena        | 40000.00 |
| Priya        | 35000.00 |
+--------------+----------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT DISTINCT DepartmentID
    -> FROM Employee;
+--------------+
| DepartmentID |
+--------------+
|            1 |
|            2 |
|            3 |
|            4 |
|            5 |
+--------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        d.DepartmentName
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID=d.DepartmentID;
+--------------+----------------+
| EmployeeName | DepartmentName |
+--------------+----------------+
| Kavi         | Finance        |
| Siva         | Finance        |
| Divya        | HR             |
| Meena        | HR             |
| Arun         | IT             |
| Bala         | IT             |
| Anu          | IT             |
| Rahul        | Marketing      |
| Priya        | Marketing      |
| Vijay        | Operations     |
+--------------+----------------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        COUNT(e.EmployeeID) AS EmployeeCount
    -> FROM Department d
    -> LEFT JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+---------------+
| DepartmentName | EmployeeCount |
+----------------+---------------+
| Finance        |             2 |
| HR             |             2 |
| IT             |             3 |
| Marketing      |             2 |
| Operations     |             1 |
+----------------+---------------+
5 rows in set (0.01 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        AVG(e.Salary) AS AverageSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+---------------+
| DepartmentName | AverageSalary |
+----------------+---------------+
| Finance        |  62500.000000 |
| HR             |  45000.000000 |
| IT             |  56666.666667 |
| Marketing      |  41500.000000 |
| Operations     |  52000.000000 |
+----------------+---------------+
5 rows in set (0.01 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        SUM(e.Salary) AS TotalSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+-------------+
| DepartmentName | TotalSalary |
+----------------+-------------+
| Finance        |   125000.00 |
| HR             |    90000.00 |
| IT             |   170000.00 |
| Marketing      |    83000.00 |
| Operations     |    52000.00 |
+----------------+-------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        MAX(e.Salary) AS HighestSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+---------------+
| DepartmentName | HighestSalary |
+----------------+---------------+
| Finance        |      70000.00 |
| HR             |      50000.00 |
| IT             |      65000.00 |
| Marketing      |      48000.00 |
| Operations     |      52000.00 |
+----------------+---------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        MIN(e.Salary) AS LowestSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+--------------+
| DepartmentName | LowestSalary |
+----------------+--------------+
| Finance        |     55000.00 |
| HR             |     40000.00 |
| IT             |     45000.00 |
| Marketing      |     35000.00 |
| Operations     |     52000.00 |
+----------------+--------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        COUNT(e.EmployeeID) AS TotalEmployees,
    ->        AVG(e.Salary) AS AverageSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+----------------+---------------+
| DepartmentName | TotalEmployees | AverageSalary |
+----------------+----------------+---------------+
| Finance        |              2 |  62500.000000 |
| HR             |              2 |  45000.000000 |
| IT             |              3 |  56666.666667 |
| Marketing      |              2 |  41500.000000 |
| Operations     |              1 |  52000.000000 |
+----------------+----------------+---------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        AVG(e.Salary) AS AverageSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName
    -> HAVING AVG(e.Salary)>50000;
+----------------+---------------+
| DepartmentName | AverageSalary |
+----------------+---------------+
| Finance        |  62500.000000 |
| IT             |  56666.666667 |
| Operations     |  52000.000000 |
+----------------+---------------+
3 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        SUM(e.Salary) AS TotalSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName
    -> HAVING SUM(e.Salary)>100000;
+----------------+-------------+
| DepartmentName | TotalSalary |
+----------------+-------------+
| Finance        |   125000.00 |
| IT             |   170000.00 |
+----------------+-------------+
2 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE Salary>(
    ->     SELECT AVG(Salary)
    ->     FROM Employee
    -> );
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Arun         | 60000.00 |
| Kavi         | 55000.00 |
| Siva         | 70000.00 |
| Anu          | 65000.00 |
+--------------+----------+
4 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE Salary=(
    ->     SELECT MAX(Salary)
    ->     FROM Employee
    -> );
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Siva         | 70000.00 |
+--------------+----------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE Salary=(
    ->     SELECT MIN(Salary)
    ->     FROM Employee
    -> );
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Priya        | 35000.00 |
+--------------+----------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE Salary>(
    ->     SELECT MIN(Salary)
    ->     FROM Employee
    -> );
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Arun         | 60000.00 |
| Bala         | 45000.00 |
| Divya        | 50000.00 |
| Kavi         | 55000.00 |
| Rahul        | 48000.00 |
| Meena        | 40000.00 |
| Siva         | 70000.00 |
| Vijay        | 52000.00 |
| Anu          | 65000.00 |
+--------------+----------+
9 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE Salary<(
    ->     SELECT MAX(Salary)
    ->     FROM Employee
    -> );
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Arun         | 60000.00 |
| Bala         | 45000.00 |
| Divya        | 50000.00 |
| Kavi         | 55000.00 |
| Rahul        | 48000.00 |
| Meena        | 40000.00 |
| Priya        | 35000.00 |
| Vijay        | 52000.00 |
| Anu          | 65000.00 |
+--------------+----------+
9 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE DepartmentID IN(
    ->     SELECT DepartmentID
    ->     FROM Department
    ->     WHERE DepartmentName='IT'
    -> );
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Arun         | 60000.00 |
| Bala         | 45000.00 |
| Anu          | 65000.00 |
+--------------+----------+
3 rows in set (0.00 sec)

mysql>
mysql> SELECT EmployeeName,Salary
    -> FROM Employee
    -> WHERE DepartmentID IN(
    ->     SELECT DepartmentID
    ->     FROM Department
    ->     WHERE DepartmentName IN('IT','Finance')
    -> );
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Arun         | 60000.00 |
| Bala         | 45000.00 |
| Kavi         | 55000.00 |
| Siva         | 70000.00 |
| Anu          | 65000.00 |
+--------------+----------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        e.Salary,
    ->        d.DepartmentName
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID=d.DepartmentID
    -> WHERE e.Salary=(
    ->     SELECT MAX(e2.Salary)
    ->     FROM Employee e2
    ->     WHERE e2.DepartmentID=e.DepartmentID
    -> );
+--------------+----------+----------------+
| EmployeeName | Salary   | DepartmentName |
+--------------+----------+----------------+
| Divya        | 50000.00 | HR             |
| Rahul        | 48000.00 | Marketing      |
| Siva         | 70000.00 | Finance        |
| Vijay        | 52000.00 | Operations     |
| Anu          | 65000.00 | IT             |
+--------------+----------+----------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        e.Salary,
    ->        d.DepartmentName
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID=d.DepartmentID
    -> WHERE e.Salary=(
    ->     SELECT MIN(e2.Salary)
    ->     FROM Employee e2
    ->     WHERE e2.DepartmentID=e.DepartmentID
    -> );
+--------------+----------+----------------+
| EmployeeName | Salary   | DepartmentName |
+--------------+----------+----------------+
| Bala         | 45000.00 | IT             |
| Kavi         | 55000.00 | Finance        |
| Meena        | 40000.00 | HR             |
| Priya        | 35000.00 | Marketing      |
| Vijay        | 52000.00 | Operations     |
+--------------+----------+----------------+
5 rows in set (0.00 sec)

mysql>
mysql> CREATE TABLE Project (
    ->     ProjectID INT PRIMARY KEY,
    ->     ProjectName VARCHAR(150) NOT NULL,
    ->     Budget DECIMAL(12,2) NOT NULL,
    ->     DepartmentID INT,
    ->     FOREIGN KEY (DepartmentID)
    ->     REFERENCES Department(DepartmentID)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO Project VALUES
    -> (101,'Website Development',150000,1),
    -> (102,'Mobile Application',250000,1),
    -> (103,'Recruitment System',80000,2),
    -> (104,'Financial Analysis',120000,3),
    -> (105,'Marketing Campaign',100000,4),
    -> (106,'Inventory System',180000,5);
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT * FROM Project;
+-----------+---------------------+-----------+--------------+
| ProjectID | ProjectName         | Budget    | DepartmentID |
+-----------+---------------------+-----------+--------------+
|       101 | Website Development | 150000.00 |            1 |
|       102 | Mobile Application  | 250000.00 |            1 |
|       103 | Recruitment System  |  80000.00 |            2 |
|       104 | Financial Analysis  | 120000.00 |            3 |
|       105 | Marketing Campaign  | 100000.00 |            4 |
|       106 | Inventory System    | 180000.00 |            5 |
+-----------+---------------------+-----------+--------------+
6 rows in set (0.00 sec)

mysql>
mysql> SELECT p.ProjectName,
    ->        p.Budget,
    ->        d.DepartmentName
    -> FROM Project p
    -> INNER JOIN Department d
    -> ON p.DepartmentID=d.DepartmentID;
+---------------------+-----------+----------------+
| ProjectName         | Budget    | DepartmentName |
+---------------------+-----------+----------------+
| Financial Analysis  | 120000.00 | Finance        |
| Recruitment System  |  80000.00 | HR             |
| Website Development | 150000.00 | IT             |
| Mobile Application  | 250000.00 | IT             |
| Marketing Campaign  | 100000.00 | Marketing      |
| Inventory System    | 180000.00 | Operations     |
+---------------------+-----------+----------------+
6 rows in set (0.00 sec)

mysql>
mysql> SELECT p.ProjectName,
    ->        p.Budget
    -> FROM Project p
    -> ORDER BY p.Budget DESC;
+---------------------+-----------+
| ProjectName         | Budget    |
+---------------------+-----------+
| Mobile Application  | 250000.00 |
| Inventory System    | 180000.00 |
| Website Development | 150000.00 |
| Financial Analysis  | 120000.00 |
| Marketing Campaign  | 100000.00 |
| Recruitment System  |  80000.00 |
+---------------------+-----------+
6 rows in set (0.00 sec)

mysql>
mysql> SELECT p.ProjectName,
    ->        p.Budget
    -> FROM Project p
    -> ORDER BY p.Budget DESC
    -> LIMIT 1;
+--------------------+-----------+
| ProjectName        | Budget    |
+--------------------+-----------+
| Mobile Application | 250000.00 |
+--------------------+-----------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT p.ProjectName,
    ->        p.Budget,
    ->        d.DepartmentName
    -> FROM Project p
    -> INNER JOIN Department d
    -> ON p.DepartmentID=d.DepartmentID
    -> ORDER BY p.Budget DESC
    -> LIMIT 1;
+--------------------+-----------+----------------+
| ProjectName        | Budget    | DepartmentName |
+--------------------+-----------+----------------+
| Mobile Application | 250000.00 | IT             |
+--------------------+-----------+----------------+
1 row in set (0.00 sec)

mysql>
mysql> CREATE TABLE EmployeeProject (
    ->     EmployeeID INT,
    ->     ProjectID INT,
    ->     HoursWorked INT NOT NULL,
    ->     PRIMARY KEY(EmployeeID,ProjectID),
    ->     FOREIGN KEY(EmployeeID)
    ->     REFERENCES Employee(EmployeeID),
    ->     FOREIGN KEY(ProjectID)
    ->     REFERENCES Project(ProjectID)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO EmployeeProject VALUES
    -> (101,101,40),
    -> (101,102,30),
    -> (102,101,50),
    -> (102,102,20),
    -> (103,103,30),
    -> (104,104,50),
    -> (105,105,40),
    -> (106,103,40),
    -> (107,104,35),
    -> (108,105,55),
    -> (109,106,45),
    -> (110,101,35);
Query OK, 12 rows affected (0.01 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT * FROM EmployeeProject;
+------------+-----------+-------------+
| EmployeeID | ProjectID | HoursWorked |
+------------+-----------+-------------+
|        101 |       101 |          40 |
|        101 |       102 |          30 |
|        102 |       101 |          50 |
|        102 |       102 |          20 |
|        103 |       103 |          30 |
|        104 |       104 |          50 |
|        105 |       105 |          40 |
|        106 |       103 |          40 |
|        107 |       104 |          35 |
|        108 |       105 |          55 |
|        109 |       106 |          45 |
|        110 |       101 |          35 |
+------------+-----------+-------------+
12 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        p.ProjectName,
    ->        ep.HoursWorked
    -> FROM Employee e
    -> INNER JOIN EmployeeProject ep
    -> ON e.EmployeeID=ep.EmployeeID
    -> INNER JOIN Project p
    -> ON ep.ProjectID=p.ProjectID;
+--------------+---------------------+-------------+
| EmployeeName | ProjectName         | HoursWorked |
+--------------+---------------------+-------------+
| Arun         | Website Development |          40 |
| Bala         | Website Development |          50 |
| Anu          | Website Development |          35 |
| Arun         | Mobile Application  |          30 |
| Bala         | Mobile Application  |          20 |
| Divya        | Recruitment System  |          30 |
| Meena        | Recruitment System  |          40 |
| Kavi         | Financial Analysis  |          50 |
| Siva         | Financial Analysis  |          35 |
| Rahul        | Marketing Campaign  |          40 |
| Priya        | Marketing Campaign  |          55 |
| Vijay        | Inventory System    |          45 |
+--------------+---------------------+-------------+
12 rows in set (0.01 sec)

mysql>
mysql> SELECT p.ProjectName,
    ->        SUM(ep.HoursWorked) AS TotalHours
    -> FROM Project p
    -> INNER JOIN EmployeeProject ep
    -> ON p.ProjectID=ep.ProjectID
    -> GROUP BY p.ProjectID,p.ProjectName;
+---------------------+------------+
| ProjectName         | TotalHours |
+---------------------+------------+
| Website Development |        125 |
| Mobile Application  |         50 |
| Recruitment System  |         70 |
| Financial Analysis  |         85 |
| Marketing Campaign  |         95 |
| Inventory System    |         45 |
+---------------------+------------+
6 rows in set (0.00 sec)

mysql>
mysql> SELECT p.ProjectName,
    ->        SUM(ep.HoursWorked) AS TotalHours
    -> FROM Project p
    -> INNER JOIN EmployeeProject ep
    -> ON p.ProjectID=ep.ProjectID
    -> GROUP BY p.ProjectID,p.ProjectName
    -> HAVING SUM(ep.HoursWorked)>70;
+---------------------+------------+
| ProjectName         | TotalHours |
+---------------------+------------+
| Website Development |        125 |
| Financial Analysis  |         85 |
| Marketing Campaign  |         95 |
+---------------------+------------+
3 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        SUM(ep.HoursWorked) AS TotalHours
    -> FROM Employee e
    -> INNER JOIN EmployeeProject ep
    -> ON e.EmployeeID=ep.EmployeeID
    -> GROUP BY e.EmployeeID,e.EmployeeName
    -> ORDER BY TotalHours DESC;
+--------------+------------+
| EmployeeName | TotalHours |
+--------------+------------+
| Arun         |         70 |
| Bala         |         70 |
| Priya        |         55 |
| Kavi         |         50 |
| Vijay        |         45 |
| Rahul        |         40 |
| Meena        |         40 |
| Siva         |         35 |
| Anu          |         35 |
| Divya        |         30 |
+--------------+------------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT e.EmployeeName,
    ->        SUM(ep.HoursWorked) AS TotalHours
    -> FROM Employee e
    -> INNER JOIN EmployeeProject ep
    -> ON e.EmployeeID=ep.EmployeeID
    -> GROUP BY e.EmployeeID,e.EmployeeName
    -> ORDER BY TotalHours DESC
    -> LIMIT 1;
+--------------+------------+
| EmployeeName | TotalHours |
+--------------+------------+
| Arun         |         70 |
+--------------+------------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        SUM(ep.HoursWorked) AS TotalHours
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> INNER JOIN EmployeeProject ep
    -> ON e.EmployeeID=ep.EmployeeID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+------------+
| DepartmentName | TotalHours |
+----------------+------------+
| Finance        |         85 |
| HR             |         70 |
| IT             |        175 |
| Marketing      |         95 |
| Operations     |         45 |
+----------------+------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        SUM(ep.HoursWorked) AS TotalHours,
    ->        COUNT(DISTINCT e.EmployeeID) AS TotalEmployees
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> INNER JOIN EmployeeProject ep
    -> ON e.EmployeeID=ep.EmployeeID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+------------+----------------+
| DepartmentName | TotalHours | TotalEmployees |
+----------------+------------+----------------+
| IT             |        175 |              3 |
| HR             |         70 |              2 |
| Finance        |         85 |              2 |
| Marketing      |         95 |              2 |
| Operations     |         45 |              1 |
+----------------+------------+----------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        SUM(ep.HoursWorked) AS TotalHours
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> INNER JOIN EmployeeProject ep
    -> ON e.EmployeeID=ep.EmployeeID
    -> GROUP BY d.DepartmentID,d.DepartmentName
    -> ORDER BY TotalHours DESC
    -> LIMIT 1;
+----------------+------------+
| DepartmentName | TotalHours |
+----------------+------------+
| IT             |        175 |
+----------------+------------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        COUNT(e.EmployeeID) AS TotalEmployees,
    ->        AVG(e.Salary) AS AverageSalary,
    ->        SUM(e.Salary) AS TotalSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+----------------+---------------+-------------+
| DepartmentName | TotalEmployees | AverageSalary | TotalSalary |
+----------------+----------------+---------------+-------------+
| Finance        |              2 |  62500.000000 |   125000.00 |
| HR             |              2 |  45000.000000 |    90000.00 |
| IT             |              3 |  56666.666667 |   170000.00 |
| Marketing      |              2 |  41500.000000 |    83000.00 |
| Operations     |              1 |  52000.000000 |    52000.00 |
+----------------+----------------+---------------+-------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        COUNT(e.EmployeeID) AS TotalEmployees,
    ->        AVG(e.Salary) AS AverageSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName
    -> HAVING COUNT(e.EmployeeID)>1
    -> AND AVG(e.Salary)>45000;
+----------------+----------------+---------------+
| DepartmentName | TotalEmployees | AverageSalary |
+----------------+----------------+---------------+
| Finance        |              2 |  62500.000000 |
| IT             |              3 |  56666.666667 |
+----------------+----------------+---------------+
2 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        SUM(e.Salary) AS TotalSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName
    -> ORDER BY TotalSalary DESC
    -> LIMIT 1;
+----------------+-------------+
| DepartmentName | TotalSalary |
+----------------+-------------+
| IT             |   170000.00 |
+----------------+-------------+
1 row in set (0.00 sec)

mysql>
mysql> CREATE TABLE Customer (
    ->     CustomerID INT PRIMARY KEY,
    ->     CustomerName VARCHAR(100) NOT NULL,
    ->     Email VARCHAR(150) UNIQUE,
    ->     Phone VARCHAR(15) UNIQUE
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO Customer VALUES
    -> (1,'Arun','arun@customer.com','9000000001'),
    -> (2,'Bala','bala@customer.com','9000000002'),
    -> (3,'Divya','divya@customer.com','9000000003'),
    -> (4,'Kavi','kavi@customer.com','9000000004');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT * FROM Customer;
+------------+--------------+--------------------+------------+
| CustomerID | CustomerName | Email              | Phone      |
+------------+--------------+--------------------+------------+
|          1 | Arun         | arun@customer.com  | 9000000001 |
|          2 | Bala         | bala@customer.com  | 9000000002 |
|          3 | Divya        | divya@customer.com | 9000000003 |
|          4 | Kavi         | kavi@customer.com  | 9000000004 |
+------------+--------------+--------------------+------------+
4 rows in set (0.00 sec)

mysql>
mysql> CREATE TABLE Orders (
    ->     OrderID INT PRIMARY KEY,
    ->     CustomerID INT,
    ->     OrderDate DATE NOT NULL,
    ->     TotalAmount DECIMAL(12,2),
    ->     FOREIGN KEY(CustomerID)
    ->     REFERENCES Customer(CustomerID)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql>
mysql> INSERT INTO Orders VALUES
    -> (1001,1,'2026-01-10',50000),
    -> (1002,2,'2026-01-11',25000),
    -> (1003,1,'2026-01-12',75000),
    -> (1004,3,'2026-01-13',30000),
    -> (1005,4,'2026-01-14',45000);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT * FROM Orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|    1001 |          1 | 2026-01-10 |    50000.00 |
|    1002 |          2 | 2026-01-11 |    25000.00 |
|    1003 |          1 | 2026-01-12 |    75000.00 |
|    1004 |          3 | 2026-01-13 |    30000.00 |
|    1005 |          4 | 2026-01-14 |    45000.00 |
+---------+------------+------------+-------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT c.CustomerName,
    ->        o.OrderID,
    ->        o.TotalAmount
    -> FROM Customer c
    -> INNER JOIN Orders o
    -> ON c.CustomerID=o.CustomerID;
+--------------+---------+-------------+
| CustomerName | OrderID | TotalAmount |
+--------------+---------+-------------+
| Arun         |    1001 |    50000.00 |
| Arun         |    1003 |    75000.00 |
| Bala         |    1002 |    25000.00 |
| Divya        |    1004 |    30000.00 |
| Kavi         |    1005 |    45000.00 |
+--------------+---------+-------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT c.CustomerName,
    ->        SUM(o.TotalAmount) AS TotalSpent
    -> FROM Customer c
    -> INNER JOIN Orders o
    -> ON c.CustomerID=o.CustomerID
    -> GROUP BY c.CustomerID,c.CustomerName;
+--------------+------------+
| CustomerName | TotalSpent |
+--------------+------------+
| Arun         |  125000.00 |
| Bala         |   25000.00 |
| Divya        |   30000.00 |
| Kavi         |   45000.00 |
+--------------+------------+
4 rows in set (0.00 sec)

mysql>
mysql> SELECT c.CustomerName,
    ->        SUM(o.TotalAmount) AS TotalSpent
    -> FROM Customer c
    -> INNER JOIN Orders o
    -> ON c.CustomerID=o.CustomerID
    -> GROUP BY c.CustomerID,c.CustomerName
    -> ORDER BY TotalSpent DESC;
+--------------+------------+
| CustomerName | TotalSpent |
+--------------+------------+
| Arun         |  125000.00 |
| Kavi         |   45000.00 |
| Divya        |   30000.00 |
| Bala         |   25000.00 |
+--------------+------------+
4 rows in set (0.00 sec)

mysql>
mysql> SELECT c.CustomerName,
    ->        SUM(o.TotalAmount) AS TotalSpent
    -> FROM Customer c
    -> INNER JOIN Orders o
    -> ON c.CustomerID=o.CustomerID
    -> GROUP BY c.CustomerID,c.CustomerName
    -> ORDER BY TotalSpent DESC
    -> LIMIT 1;
+--------------+------------+
| CustomerName | TotalSpent |
+--------------+------------+
| Arun         |  125000.00 |
+--------------+------------+
1 row in set (0.00 sec)

mysql>
mysql> CREATE TABLE Product (
    ->     ProductID INT PRIMARY KEY,
    ->     ProductName VARCHAR(100) NOT NULL,
    ->     Price DECIMAL(10,2) NOT NULL,
    ->     Stock INT NOT NULL,
    ->     DepartmentID INT,
    ->     FOREIGN KEY(DepartmentID)
    ->     REFERENCES Department(DepartmentID)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> INSERT INTO Product VALUES
    -> (1,'Laptop',60000,10,1),
    -> (2,'Mouse',1000,50,1),
    -> (3,'Keyboard',2000,30,1),
    -> (4,'Chair',5000,20,5),
    -> (5,'Table',10000,15,5),
    -> (6,'Printer',15000,12,1),
    -> (7,'Notebook',100,100,2),
    -> (8,'Monitor',12000,18,1);
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT * FROM Product;
+-----------+-------------+----------+-------+--------------+
| ProductID | ProductName | Price    | Stock | DepartmentID |
+-----------+-------------+----------+-------+--------------+
|         1 | Laptop      | 60000.00 |    10 |            1 |
|         2 | Mouse       |  1000.00 |    50 |            1 |
|         3 | Keyboard    |  2000.00 |    30 |            1 |
|         4 | Chair       |  5000.00 |    20 |            5 |
|         5 | Table       | 10000.00 |    15 |            5 |
|         6 | Printer     | 15000.00 |    12 |            1 |
|         7 | Notebook    |   100.00 |   100 |            2 |
|         8 | Monitor     | 12000.00 |    18 |            1 |
+-----------+-------------+----------+-------+--------------+
8 rows in set (0.00 sec)

mysql>
mysql> ALTER TABLE Product
    -> ADD COLUMN ProductCode VARCHAR(50);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> UPDATE Product
    -> SET ProductCode='P001'
    -> WHERE ProductID=1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE Product
    -> SET ProductCode='P002'
    -> WHERE ProductID=2;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE Product
    -> SET ProductCode='P003'
    -> WHERE ProductID=3;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE Product
    -> SET ProductCode='P004'
    -> WHERE ProductID=4;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE Product
    -> SET ProductCode='P005'
    -> WHERE ProductID=5;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE Product
    -> SET ProductCode='P006'
    -> WHERE ProductID=6;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE Product
    -> SET ProductCode='P007'
    -> WHERE ProductID=7;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE Product
    -> SET ProductCode='P008'
    -> WHERE ProductID=8;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> ALTER TABLE Product
    -> ADD CONSTRAINT uq_product_code
    -> UNIQUE(ProductCode);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT ProductName,Price
    -> FROM Product
    -> WHERE Price>5000;
+-------------+----------+
| ProductName | Price    |
+-------------+----------+
| Laptop      | 60000.00 |
| Table       | 10000.00 |
| Printer     | 15000.00 |
| Monitor     | 12000.00 |
+-------------+----------+
4 rows in set (0.00 sec)

mysql>
mysql> SELECT ProductName,Price
    -> FROM Product
    -> WHERE Price BETWEEN 1000 AND 15000;
+-------------+----------+
| ProductName | Price    |
+-------------+----------+
| Mouse       |  1000.00 |
| Keyboard    |  2000.00 |
| Chair       |  5000.00 |
| Table       | 10000.00 |
| Printer     | 15000.00 |
| Monitor     | 12000.00 |
+-------------+----------+
6 rows in set (0.00 sec)

mysql>
mysql> SELECT ProductName,Price
    -> FROM Product
    -> ORDER BY Price DESC
    -> LIMIT 5;
+-------------+----------+
| ProductName | Price    |
+-------------+----------+
| Laptop      | 60000.00 |
| Printer     | 15000.00 |
| Monitor     | 12000.00 |
| Table       | 10000.00 |
| Chair       |  5000.00 |
+-------------+----------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT DISTINCT DepartmentID
    -> FROM Product;
+--------------+
| DepartmentID |
+--------------+
|            1 |
|            2 |
|            5 |
+--------------+
3 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        COUNT(p.ProductID) AS ProductCount
    -> FROM Department d
    -> LEFT JOIN Product p
    -> ON d.DepartmentID=p.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+--------------+
| DepartmentName | ProductCount |
+----------------+--------------+
| Finance        |            0 |
| HR             |            1 |
| IT             |            5 |
| Marketing      |            0 |
| Operations     |            2 |
+----------------+--------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        AVG(p.Price) AS AveragePrice
    -> FROM Department d
    -> INNER JOIN Product p
    -> ON d.DepartmentID=p.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+--------------+
| DepartmentName | AveragePrice |
+----------------+--------------+
| IT             | 18000.000000 |
| Operations     |  7500.000000 |
| HR             |   100.000000 |
+----------------+--------------+
3 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        MAX(p.Price) AS MaximumPrice
    -> FROM Department d
    -> INNER JOIN Product p
    -> ON d.DepartmentID=p.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+--------------+
| DepartmentName | MaximumPrice |
+----------------+--------------+
| IT             |     60000.00 |
| Operations     |     10000.00 |
| HR             |       100.00 |
+----------------+--------------+
3 rows in set (0.00 sec)

mysql>
mysql> SELECT d.DepartmentName,
    ->        MIN(p.Price) AS MinimumPrice
    -> FROM Department d
    -> INNER JOIN Product p
    -> ON d.DepartmentID=p.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+--------------+
| DepartmentName | MinimumPrice |
+----------------+--------------+
| IT             |      1000.00 |
| Operations     |      5000.00 |
| HR             |       100.00 |
+----------------+--------------+
3 rows in set (0.00 sec)

mysql>
mysql> CREATE TABLE DepartmentCascade (
    ->     DepartmentID INT PRIMARY KEY,
    ->     DepartmentName VARCHAR(100) NOT NULL
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql>
mysql> CREATE TABLE EmployeeCascade (
    ->     EmployeeID INT PRIMARY KEY,
    ->     EmployeeName VARCHAR(100) NOT NULL,
    ->     DepartmentID INT,
    ->     FOREIGN KEY(DepartmentID)
    ->     REFERENCES DepartmentCascade(DepartmentID)
    ->     ON DELETE CASCADE
    ->     ON UPDATE CASCADE
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO DepartmentCascade VALUES
    -> (1,'IT'),
    -> (2,'HR'),
    -> (3,'Finance');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO EmployeeCascade VALUES
    -> (1,'Arun',1),
    -> (2,'Bala',1),
    -> (3,'Divya',2),
    -> (4,'Kavi',3);
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT * FROM DepartmentCascade;
+--------------+----------------+
| DepartmentID | DepartmentName |
+--------------+----------------+
|            1 | IT             |
|            2 | HR             |
|            3 | Finance        |
+--------------+----------------+
3 rows in set (0.00 sec)

mysql>
mysql> SELECT * FROM EmployeeCascade;
+------------+--------------+--------------+
| EmployeeID | EmployeeName | DepartmentID |
+------------+--------------+--------------+
|          1 | Arun         |            1 |
|          2 | Bala         |            1 |
|          3 | Divya        |            2 |
|          4 | Kavi         |            3 |
+------------+--------------+--------------+
4 rows in set (0.00 sec)

mysql>
mysql> UPDATE DepartmentCascade
    -> SET DepartmentID=10
    -> WHERE DepartmentID=1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> SELECT * FROM EmployeeCascade;
+------------+--------------+--------------+
| EmployeeID | EmployeeName | DepartmentID |
+------------+--------------+--------------+
|          1 | Arun         |           10 |
|          2 | Bala         |           10 |
|          3 | Divya        |            2 |
|          4 | Kavi         |            3 |
+------------+--------------+--------------+
4 rows in set (0.00 sec)

mysql>
mysql> DELETE FROM DepartmentCascade
    -> WHERE DepartmentID=10;
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> SELECT * FROM EmployeeCascade;
+------------+--------------+--------------+
| EmployeeID | EmployeeName | DepartmentID |
+------------+--------------+--------------+
|          3 | Divya        |            2 |
|          4 | Kavi         |            3 |
+------------+--------------+--------------+
2 rows in set (0.00 sec)

mysql>
mysql> CREATE TABLE DepartmentSetNull (
    ->     DepartmentID INT PRIMARY KEY,
    ->     DepartmentName VARCHAR(100) NOT NULL
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql>
mysql> CREATE TABLE EmployeeSetNull (
    ->     EmployeeID INT PRIMARY KEY,
    ->     EmployeeName VARCHAR(100) NOT NULL,
    ->     DepartmentID INT NULL,
    ->     FOREIGN KEY(DepartmentID)
    ->     REFERENCES DepartmentSetNull(DepartmentID)
    ->     ON DELETE SET NULL
    ->     ON UPDATE CASCADE
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO DepartmentSetNull VALUES
    -> (1,'IT'),
    -> (2,'HR'),
    -> (3,'Finance');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO EmployeeSetNull VALUES
    -> (1,'Arun',1),
    -> (2,'Bala',1),
    -> (3,'Divya',2),
    -> (4,'Kavi',3);
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT * FROM EmployeeSetNull;
+------------+--------------+--------------+
| EmployeeID | EmployeeName | DepartmentID |
+------------+--------------+--------------+
|          1 | Arun         |            1 |
|          2 | Bala         |            1 |
|          3 | Divya        |            2 |
|          4 | Kavi         |            3 |
+------------+--------------+--------------+
4 rows in set (0.00 sec)

mysql>
mysql> DELETE FROM DepartmentSetNull
    -> WHERE DepartmentID=1;
Query OK, 1 row affected (0.00 sec)

mysql>
mysql> SELECT * FROM EmployeeSetNull;
+------------+--------------+--------------+
| EmployeeID | EmployeeName | DepartmentID |
+------------+--------------+--------------+
|          1 | Arun         |         NULL |
|          2 | Bala         |         NULL |
|          3 | Divya        |            2 |
|          4 | Kavi         |            3 |
+------------+--------------+--------------+
4 rows in set (0.00 sec)

mysql>
mysql> CREATE TABLE DepartmentRestrict (
    ->     DepartmentID INT PRIMARY KEY,
    ->     DepartmentName VARCHAR(100) NOT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> CREATE TABLE EmployeeRestrict (
    ->     EmployeeID INT PRIMARY KEY,
    ->     EmployeeName VARCHAR(100) NOT NULL,
    ->     DepartmentID INT,
    ->     FOREIGN KEY(DepartmentID)
    ->     REFERENCES DepartmentRestrict(DepartmentID)
    ->     ON DELETE RESTRICT
    ->     ON UPDATE RESTRICT
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO DepartmentRestrict VALUES
    -> (1,'IT'),
    -> (2,'HR');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO EmployeeRestrict VALUES
    -> (1,'Arun',1),
    -> (2,'Bala',2);
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT * FROM DepartmentRestrict;
+--------------+----------------+
| DepartmentID | DepartmentName |
+--------------+----------------+
|            1 | IT             |
|            2 | HR             |
+--------------+----------------+
2 rows in set (0.00 sec)

mysql>
mysql> SELECT * FROM EmployeeRestrict;
+------------+--------------+--------------+
| EmployeeID | EmployeeName | DepartmentID |
+------------+--------------+--------------+
|          1 | Arun         |            1 |
|          2 | Bala         |            2 |
+------------+--------------+--------------+
2 rows in set (0.00 sec)

mysql>
mysql> SELECT
    ->     e.EmployeeName,
    ->     d.DepartmentName
    -> FROM EmployeeRestrict e
    -> INNER JOIN DepartmentRestrict d
    -> ON e.DepartmentID=d.DepartmentID;
+--------------+----------------+
| EmployeeName | DepartmentName |
+--------------+----------------+
| Arun         | IT             |
| Bala         | HR             |
+--------------+----------------+
2 rows in set (0.00 sec)

mysql>
mysql> CREATE TABLE DepartmentNoAction (
    ->     DepartmentID INT PRIMARY KEY,
    ->     DepartmentName VARCHAR(100) NOT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> CREATE TABLE EmployeeNoAction (
    ->     EmployeeID INT PRIMARY KEY,
    ->     EmployeeName VARCHAR(100) NOT NULL,
    ->     DepartmentID INT,
    ->     FOREIGN KEY(DepartmentID)
    ->     REFERENCES DepartmentNoAction(DepartmentID)
    ->     ON DELETE NO ACTION
    ->     ON UPDATE NO ACTION
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO DepartmentNoAction VALUES
    -> (1,'IT'),
    -> (2,'HR');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO EmployeeNoAction VALUES
    -> (1,'Arun',1),
    -> (2,'Bala',2);
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT * FROM DepartmentNoAction;
+--------------+----------------+
| DepartmentID | DepartmentName |
+--------------+----------------+
|            1 | IT             |
|            2 | HR             |
+--------------+----------------+
2 rows in set (0.00 sec)

mysql>
mysql> SELECT * FROM EmployeeNoAction;
+------------+--------------+--------------+
| EmployeeID | EmployeeName | DepartmentID |
+------------+--------------+--------------+
|          1 | Arun         |            1 |
|          2 | Bala         |            2 |
+------------+--------------+--------------+
2 rows in set (0.00 sec)

mysql>
mysql> SELECT
    ->     e.EmployeeName,
    ->     d.DepartmentName
    -> FROM EmployeeNoAction e
    -> INNER JOIN DepartmentNoAction d
    -> ON e.DepartmentID=d.DepartmentID;
+--------------+----------------+
| EmployeeName | DepartmentName |
+--------------+----------------+
| Arun         | IT             |
| Bala         | HR             |
+--------------+----------------+
2 rows in set (0.00 sec)

mysql>
mysql> ALTER TABLE Employee
    -> ADD COLUMN Phone VARCHAR(15);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> UPDATE Employee
    -> SET Phone='900000001'
    -> WHERE EmployeeID=101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE Employee
    -> SET Phone='900000002'
    -> WHERE EmployeeID=102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE Employee
    -> SET Phone='900000003'
    -> WHERE EmployeeID=103;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE Employee
    -> SET Phone='900000004'
    -> WHERE EmployeeID=104;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE Employee
    -> SET Phone='900000005'
    -> WHERE EmployeeID=105;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE Employee
    -> SET Phone='900000006'
    -> WHERE EmployeeID=106;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE Employee
    -> SET Phone='900000007'
    -> WHERE EmployeeID=107;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE Employee
    -> SET Phone='900000008'
    -> WHERE EmployeeID=108;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE Employee
    -> SET Phone='900000009'
    -> WHERE EmployeeID=109;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE Employee
    -> SET Phone='900000010'
    -> WHERE EmployeeID=110;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> ALTER TABLE Employee
    -> ADD CONSTRAINT uq_employee_phone
    -> UNIQUE(Phone);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT * FROM Employee;
+------------+--------------+-----------------+----------+--------------+-----------+
| EmployeeID | EmployeeName | Email           | Salary   | DepartmentID | Phone     |
+------------+--------------+-----------------+----------+--------------+-----------+
|        101 | Arun         | arun@gmail.com  | 60000.00 |            1 | 900000001 |
|        102 | Bala         | bala@gmail.com  | 45000.00 |            1 | 900000002 |
|        103 | Divya        | divya@gmail.com | 50000.00 |            2 | 900000003 |
|        104 | Kavi         | kavi@gmail.com  | 55000.00 |            3 | 900000004 |
|        105 | Rahul        | rahul@gmail.com | 48000.00 |            4 | 900000005 |
|        106 | Meena        | meena@gmail.com | 40000.00 |            2 | 900000006 |
|        107 | Siva         | siva@gmail.com  | 70000.00 |            3 | 900000007 |
|        108 | Priya        | priya@gmail.com | 35000.00 |            4 | 900000008 |
|        109 | Vijay        | vijay@gmail.com | 52000.00 |            5 | 900000009 |
|        110 | Anu          | anu@gmail.com   | 65000.00 |            1 | 900000010 |
+------------+--------------+-----------------+----------+--------------+-----------+
10 rows in set (0.00 sec)

mysql>
mysql> SELECT
    ->     e.EmployeeName,
    ->     e.Salary,
    ->     d.DepartmentName,
    ->     p.ProjectName,
    ->     ep.HoursWorked
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID=d.DepartmentID
    -> INNER JOIN EmployeeProject ep
    -> ON e.EmployeeID=ep.EmployeeID
    -> INNER JOIN Project p
    -> ON ep.ProjectID=p.ProjectID;
+--------------+----------+----------------+---------------------+-------------+
| EmployeeName | Salary   | DepartmentName | ProjectName         | HoursWorked |
+--------------+----------+----------------+---------------------+-------------+
| Kavi         | 55000.00 | Finance        | Financial Analysis  |          50 |
| Siva         | 70000.00 | Finance        | Financial Analysis  |          35 |
| Divya        | 50000.00 | HR             | Recruitment System  |          30 |
| Meena        | 40000.00 | HR             | Recruitment System  |          40 |
| Arun         | 60000.00 | IT             | Website Development |          40 |
| Arun         | 60000.00 | IT             | Mobile Application  |          30 |
| Bala         | 45000.00 | IT             | Website Development |          50 |
| Bala         | 45000.00 | IT             | Mobile Application  |          20 |
| Anu          | 65000.00 | IT             | Website Development |          35 |
| Rahul        | 48000.00 | Marketing      | Marketing Campaign  |          40 |
| Priya        | 35000.00 | Marketing      | Marketing Campaign  |          55 |
| Vijay        | 52000.00 | Operations     | Inventory System    |          45 |
+--------------+----------+----------------+---------------------+-------------+
12 rows in set (0.00 sec)

mysql>
mysql> SELECT
    ->     d.DepartmentName,
    ->     SUM(ep.HoursWorked) AS TotalHours,
    ->     COUNT(DISTINCT e.EmployeeID) AS TotalEmployees,
    ->     AVG(e.Salary) AS AverageSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> INNER JOIN EmployeeProject ep
    -> ON e.EmployeeID=ep.EmployeeID
    -> GROUP BY d.DepartmentID,d.DepartmentName
    -> ORDER BY TotalHours DESC
    -> LIMIT 1;
+----------------+------------+----------------+---------------+
| DepartmentName | TotalHours | TotalEmployees | AverageSalary |
+----------------+------------+----------------+---------------+
| IT             |        175 |              3 |  55000.000000 |
+----------------+------------+----------------+---------------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT
    ->     d.DepartmentName,
    ->     SUM(e.Salary) AS TotalSalary,
    ->     COUNT(e.EmployeeID) AS EmployeeCount,
    ->     AVG(e.Salary) AS AverageSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName
    -> ORDER BY TotalSalary DESC;
+----------------+-------------+---------------+---------------+
| DepartmentName | TotalSalary | EmployeeCount | AverageSalary |
+----------------+-------------+---------------+---------------+
| IT             |   170000.00 |             3 |  56666.666667 |
| Finance        |   125000.00 |             2 |  62500.000000 |
| HR             |    90000.00 |             2 |  45000.000000 |
| Marketing      |    83000.00 |             2 |  41500.000000 |
| Operations     |    52000.00 |             1 |  52000.000000 |
+----------------+-------------+---------------+---------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT
    ->     p.ProjectName,
    ->     p.Budget,
    ->     SUM(ep.HoursWorked) AS TotalHours
    -> FROM Project p
    -> INNER JOIN EmployeeProject ep
    -> ON p.ProjectID=ep.ProjectID
    -> GROUP BY p.ProjectID,p.ProjectName,p.Budget
    -> ORDER BY p.Budget DESC;
+---------------------+-----------+------------+
| ProjectName         | Budget    | TotalHours |
+---------------------+-----------+------------+
| Mobile Application  | 250000.00 |         50 |
| Inventory System    | 180000.00 |         45 |
| Website Development | 150000.00 |        125 |
| Financial Analysis  | 120000.00 |         85 |
| Marketing Campaign  | 100000.00 |         95 |
| Recruitment System  |  80000.00 |         70 |
+---------------------+-----------+------------+
6 rows in set (0.00 sec)

mysql>
mysql> SELECT
    ->     p.ProjectName,
    ->     p.Budget,
    ->     SUM(ep.HoursWorked) AS TotalHours
    -> FROM Project p
    -> INNER JOIN EmployeeProject ep
    -> ON p.ProjectID=ep.ProjectID
    -> GROUP BY p.ProjectID,p.ProjectName,p.Budget
    -> HAVING SUM(ep.HoursWorked)>70;
+---------------------+-----------+------------+
| ProjectName         | Budget    | TotalHours |
+---------------------+-----------+------------+
| Website Development | 150000.00 |        125 |
| Financial Analysis  | 120000.00 |         85 |
| Marketing Campaign  | 100000.00 |         95 |
+---------------------+-----------+------------+
3 rows in set (0.00 sec)

mysql>
mysql> SELECT
    ->     e.EmployeeName,
    ->     SUM(ep.HoursWorked) AS TotalHours
    -> FROM Employee e
    -> INNER JOIN EmployeeProject ep
    -> ON e.EmployeeID=ep.EmployeeID
    -> GROUP BY e.EmployeeID,e.EmployeeName
    -> HAVING SUM(ep.HoursWorked)>50
    -> ORDER BY TotalHours DESC;
+--------------+------------+
| EmployeeName | TotalHours |
+--------------+------------+
| Arun         |         70 |
| Bala         |         70 |
| Priya        |         55 |
+--------------+------------+
3 rows in set (0.00 sec)

mysql>
mysql> SELECT
    ->     d.DepartmentName,
    ->     AVG(e.Salary) AS AverageSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName
    -> ORDER BY AverageSalary DESC
    -> LIMIT 1;
+----------------+---------------+
| DepartmentName | AverageSalary |
+----------------+---------------+
| Finance        |  62500.000000 |
+----------------+---------------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT
    ->     e.EmployeeName,
    ->     e.Salary,
    ->     d.DepartmentName
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID=d.DepartmentID
    -> WHERE e.Salary>(
    ->     SELECT AVG(e2.Salary)
    ->     FROM Employee e2
    ->     WHERE e2.DepartmentID=e.DepartmentID
    -> );
+--------------+----------+----------------+
| EmployeeName | Salary   | DepartmentName |
+--------------+----------+----------------+
| Siva         | 70000.00 | Finance        |
| Divya        | 50000.00 | HR             |
| Arun         | 60000.00 | IT             |
| Anu          | 65000.00 | IT             |
| Rahul        | 48000.00 | Marketing      |
+--------------+----------+----------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT
    ->     d.DepartmentName,
    ->     COUNT(e.EmployeeID) AS EmployeeCount,
    ->     AVG(e.Salary) AS AverageSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName
    -> HAVING COUNT(e.EmployeeID)>2
    -> AND AVG(e.Salary)>50000;
+----------------+---------------+---------------+
| DepartmentName | EmployeeCount | AverageSalary |
+----------------+---------------+---------------+
| IT             |             3 |  56666.666667 |
+----------------+---------------+---------------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT
    ->     e.EmployeeName,
    ->     e.Salary
    -> FROM Employee e
    -> WHERE e.Salary=(
    ->     SELECT MAX(e2.Salary)
    ->     FROM Employee e2
    -> );
+--------------+----------+
| EmployeeName | Salary   |
+--------------+----------+
| Siva         | 70000.00 |
+--------------+----------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT
    ->     p.ProjectName,
    ->     p.Budget,
    ->     d.DepartmentName
    -> FROM Project p
    -> INNER JOIN Department d
    -> ON p.DepartmentID=d.DepartmentID
    -> WHERE p.Budget=(
    ->     SELECT MAX(Budget)
    ->     FROM Project
    -> );
+--------------------+-----------+----------------+
| ProjectName        | Budget    | DepartmentName |
+--------------------+-----------+----------------+
| Mobile Application | 250000.00 | IT             |
+--------------------+-----------+----------------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT
    ->     d.DepartmentName,
    ->     SUM(e.Salary) AS TotalSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName
    -> HAVING SUM(e.Salary)=(
    ->     SELECT MAX(TotalSalary)
    ->     FROM (
    ->         SELECT SUM(Salary) AS TotalSalary
    ->         FROM Employee
    ->         GROUP BY DepartmentID
    ->     ) AS SalaryData
    -> );
+----------------+-------------+
| DepartmentName | TotalSalary |
+----------------+-------------+
| IT             |   170000.00 |
+----------------+-------------+
1 row in set (0.03 sec)

mysql>
mysql> SELECT
    ->     d.DepartmentName,
    ->     SUM(ep.HoursWorked) AS TotalHours
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> INNER JOIN EmployeeProject ep
    -> ON e.EmployeeID=ep.EmployeeID
    -> GROUP BY d.DepartmentID,d.DepartmentName
    -> ORDER BY TotalHours DESC
    -> LIMIT 1;
+----------------+------------+
| DepartmentName | TotalHours |
+----------------+------------+
| IT             |        175 |
+----------------+------------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT
    ->     e.EmployeeName,
    ->     d.DepartmentName,
    ->     e.Salary
    -> FROM Employee e
    -> INNER JOIN Department d
    -> ON e.DepartmentID=d.DepartmentID
    -> WHERE e.Salary=(
    ->     SELECT MAX(e2.Salary)
    ->     FROM Employee e2
    ->     WHERE e2.DepartmentID=e.DepartmentID
    -> );
+--------------+----------------+----------+
| EmployeeName | DepartmentName | Salary   |
+--------------+----------------+----------+
| Siva         | Finance        | 70000.00 |
| Divya        | HR             | 50000.00 |
| Anu          | IT             | 65000.00 |
| Rahul        | Marketing      | 48000.00 |
| Vijay        | Operations     | 52000.00 |
+--------------+----------------+----------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT
    ->     d.DepartmentName,
    ->     COUNT(e.EmployeeID) AS EmployeeCount,
    ->     AVG(e.Salary) AS AverageSalary,
    ->     SUM(e.Salary) AS TotalSalary
    -> FROM Department d
    -> LEFT JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> GROUP BY d.DepartmentID,d.DepartmentName;
+----------------+---------------+---------------+-------------+
| DepartmentName | EmployeeCount | AverageSalary | TotalSalary |
+----------------+---------------+---------------+-------------+
| Finance        |             2 |  62500.000000 |   125000.00 |
| HR             |             2 |  45000.000000 |    90000.00 |
| IT             |             3 |  56666.666667 |   170000.00 |
| Marketing      |             2 |  41500.000000 |    83000.00 |
| Operations     |             1 |  52000.000000 |    52000.00 |
+----------------+---------------+---------------+-------------+
5 rows in set (0.00 sec)

mysql>
mysql> SELECT
    ->     d.DepartmentName,
    ->     SUM(ep.HoursWorked) AS TotalHours,
    ->     COUNT(DISTINCT e.EmployeeID) AS TotalEmployees,
    ->     AVG(e.Salary) AS AverageSalary
    -> FROM Department d
    -> INNER JOIN Employee e
    -> ON d.DepartmentID=e.DepartmentID
    -> INNER JOIN EmployeeProject ep
    -> ON e.EmployeeID=ep.EmployeeID
    -> GROUP BY d.DepartmentID,d.DepartmentName
    -> ORDER BY TotalHours DESC
    -> LIMIT 1;
+----------------+------------+----------------+---------------+
| DepartmentName | TotalHours | TotalEmployees | AverageSalary |
+----------------+------------+----------------+---------------+
| IT             |        175 |              3 |  55000.000000 |
+----------------+------------+----------------+---------------+
1 row in set (0.00 sec)
