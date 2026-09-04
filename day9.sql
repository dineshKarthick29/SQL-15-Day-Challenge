Microsoft Windows [Version 10.0.26200.9168]
(c) Microsoft Corporation. All rights reserved.

C:\Users\balae>mysql -u root -p
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 28
Server version: 8.0.44 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use day9db;
Database changed
mysql> CREATE TABLE Department (
    ->     DepartmentID INT PRIMARY KEY,
    ->     DepartmentName VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> CREATE TABLE Employee (
    ->     EmployeeID INT PRIMARY KEY,
    ->     EmployeeName VARCHAR(50),
    ->     Salary DECIMAL(10,2),
    ->     DepartmentID INT,
    ->     FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql>
mysql> CREATE TABLE Project (
    ->     ProjectID INT PRIMARY KEY,
    ->     ProjectName VARCHAR(100),
    ->     Budget DECIMAL(12,2),
    ->     DepartmentID INT,
    ->     FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> CREATE TABLE EmployeeProject (
    ->     EmployeeID INT,
    ->     ProjectID INT,
    ->     HoursWorked INT,
    ->     PRIMARY KEY (EmployeeID, ProjectID),
    ->     FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    ->     FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> INSERT INTO Department VALUES
    -> (1, 'IT'),
    -> (2, 'HR'),
    -> (3, 'Finance'),
    -> (4, 'Marketing'),
    -> (5, 'Operations'),
    -> (6, 'Research'),
    -> (7, 'Sales');
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Employee VALUES
    -> (1, 'Arun', 60000, 1),
    -> (2, 'Bala', 45000, 1),
    -> (3, 'Divya', 50000, 1),
    -> (4, 'Anu', 65000, 1),
    ->
    -> (5, 'Kavi', 35000, 2),
    -> (6, 'Meena', 40000, 2),
    ->
    -> (7, 'Rahul', 70000, 3),
    -> (8, 'Siva', 55000, 3),
    -> (9, 'Vijay', 48000, 3),
    ->
    -> (10, 'Priya', 30000, 4),
    -> (11, 'Ravi', 48000, 4),
    ->
    -> (12, 'Kiran', 42000, 5),
    -> (13, 'Manoj', 52000, 5),
    ->
    -> (14, 'Sara', 75000, 6),
    ->
    -> (15, 'Naveen', 38000, 7),
    -> (16, 'Karthik', 45000, 7);
Query OK, 16 rows affected (0.05 sec)
Records: 16  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Project VALUES
    -> (101, 'Website Development', 150000, 1),
    -> (102, 'Mobile Application', 250000, 1),
    -> (103, 'Recruitment System', 80000, 2),
    -> (104, 'Financial Analysis', 120000, 3),
    -> (105, 'Marketing Campaign', 100000, 4),
    -> (106, 'Inventory System', 180000, 5),
    -> (107, 'AI Research', 300000, 6),
    -> (108, 'Sales Dashboard', 90000, 7),
    -> (109, 'Internal Training', 50000, 2);
Query OK, 9 rows affected (0.04 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> INSERT INTO EmployeeProject VALUES
    -> (1, 101, 40),
    -> (1, 102, 30),
    -> (2, 101, 50),
    -> (2, 102, 20),
    -> (3, 102, 45),
    -> (4, 101, 35),
    ->
    -> (5, 103, 30),
    -> (6, 103, 40),
    ->
    -> (7, 104, 50),
    -> (8, 104, 35),
    -> (9, 104, 25),
    ->
    -> (10, 105, 40),
    -> (11, 105, 55),
    ->
    -> (12, 106, 30),
    -> (13, 106, 45),
    ->
    -> (14, 107, 60),
    ->
    -> (15, 108, 35),
    -> (16, 108, 45);
Query OK, 18 rows affected (0.04 sec)
Records: 18  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+------------+--------------+----------+--------------+
| EmployeeID | EmployeeName | Salary   | DepartmentID |
+------------+--------------+----------+--------------+
|          1 | Arun         | 60000.00 |            1 |
|          2 | Bala         | 45000.00 |            1 |
|          3 | Divya        | 50000.00 |            1 |
|          4 | Anu          | 65000.00 |            1 |
|          5 | Kavi         | 35000.00 |            2 |
|          6 | Meena        | 40000.00 |            2 |
|          7 | Rahul        | 70000.00 |            3 |
|          8 | Siva         | 55000.00 |            3 |
|          9 | Vijay        | 48000.00 |            3 |
|         10 | Priya        | 30000.00 |            4 |
|         11 | Ravi         | 48000.00 |            4 |
|         12 | Kiran        | 42000.00 |            5 |
|         13 | Manoj        | 52000.00 |            5 |
|         14 | Sara         | 75000.00 |            6 |
|         15 | Naveen       | 38000.00 |            7 |
|         16 | Karthik      | 45000.00 |            7 |
+------------+--------------+----------+--------------+
16 rows in set (0.00 sec)

mysql> select
    -> employeename,
    -> salary
    -> from employee
    -> where salary> 50000;
+--------------+----------+
| employeename | salary   |
+--------------+----------+
| Arun         | 60000.00 |
| Anu          | 65000.00 |
| Rahul        | 70000.00 |
| Siva         | 55000.00 |
| Manoj        | 52000.00 |
| Sara         | 75000.00 |
+--------------+----------+
6 rows in set (0.00 sec)

mysql> select * from employee
    -> order by desc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'desc' at line 2
mysql> select * from employee
    -> order salary by desc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'salary by desc' at line 2
mysql> select * from employee
    -> order by salary desc;
+------------+--------------+----------+--------------+
| EmployeeID | EmployeeName | Salary   | DepartmentID |
+------------+--------------+----------+--------------+
|         14 | Sara         | 75000.00 |            6 |
|          7 | Rahul        | 70000.00 |            3 |
|          4 | Anu          | 65000.00 |            1 |
|          1 | Arun         | 60000.00 |            1 |
|          8 | Siva         | 55000.00 |            3 |
|         13 | Manoj        | 52000.00 |            5 |
|          3 | Divya        | 50000.00 |            1 |
|          9 | Vijay        | 48000.00 |            3 |
|         11 | Ravi         | 48000.00 |            4 |
|          2 | Bala         | 45000.00 |            1 |
|         16 | Karthik      | 45000.00 |            7 |
|         12 | Kiran        | 42000.00 |            5 |
|          6 | Meena        | 40000.00 |            2 |
|         15 | Naveen       | 38000.00 |            7 |
|          5 | Kavi         | 35000.00 |            2 |
|         10 | Priya        | 30000.00 |            4 |
+------------+--------------+----------+--------------+
16 rows in set (0.00 sec)

mysql> select * from employee
    -> order by salary desc
    -> limit 5;
+------------+--------------+----------+--------------+
| EmployeeID | EmployeeName | Salary   | DepartmentID |
+------------+--------------+----------+--------------+
|         14 | Sara         | 75000.00 |            6 |
|          7 | Rahul        | 70000.00 |            3 |
|          4 | Anu          | 65000.00 |            1 |
|          1 | Arun         | 60000.00 |            1 |
|          8 | Siva         | 55000.00 |            3 |
+------------+--------------+----------+--------------+
5 rows in set (0.00 sec)

mysql> select
    -> employeename,
    -> departmentname
    -> from employee;
ERROR 1054 (42S22): Unknown column 'departmentname' in 'field list'
mysql> select * from department;
+--------------+----------------+
| DepartmentID | DepartmentName |
+--------------+----------------+
|            1 | IT             |
|            2 | HR             |
|            3 | Finance        |
|            4 | Marketing      |
|            5 | Operations     |
|            6 | Research       |
|            7 | Sales          |
+--------------+----------------+
7 rows in set (0.00 sec)

mysql> select
    -> employeename'
    '> ^C
mysql> select
    -> employeename,
    -> ^C
mysql> select
    -> e.employeename,
    -> d.departmentname
    -> from employee e
    -> inner join department d on e.departmentid=d.departmentid;
+--------------+----------------+
| employeename | departmentname |
+--------------+----------------+
| Arun         | IT             |
| Bala         | IT             |
| Divya        | IT             |
| Anu          | IT             |
| Kavi         | HR             |
| Meena        | HR             |
| Rahul        | Finance        |
| Siva         | Finance        |
| Vijay        | Finance        |
| Priya        | Marketing      |
| Ravi         | Marketing      |
| Kiran        | Operations     |
| Manoj        | Operations     |
| Sara         | Research       |
| Naveen       | Sales          |
| Karthik      | Sales          |
+--------------+----------------+
16 rows in set (0.02 sec)

mysql> select distinct departmentid
    -> from employee;
+--------------+
| departmentid |
+--------------+
|            1 |
|            2 |
|            3 |
|            4 |
|            5 |
|            6 |
|            7 |
+--------------+
7 rows in set (0.00 sec)

mysql> select
    -> d.departmentname,
    -> count(e.employeeid) as employee_count
    -> from employee e
    -> inner join department d on e.departmentid =  d.departmentid
    -> group by d.departmentid,d.departmentname;
+----------------+----------------+
| departmentname | employee_count |
+----------------+----------------+
| IT             |              4 |
| HR             |              2 |
| Finance        |              3 |
| Marketing      |              2 |
| Operations     |              2 |
| Research       |              1 |
| Sales          |              2 |
+----------------+----------------+
7 rows in set (0.00 sec)

mysql> select
    -> d.departmentname,
    -> avg(e.salary) as average_salary
    -> from employee
    -> inner join department d on e.departmentid=d.departmentid
    -> group by d.departmentid,d.departmentid;
ERROR 1054 (42S22): Unknown column 'e.salary' in 'field list'
mysql> select
    ->  d.departmentname,
    ->  avg(e.salary) as average_salary
    ->  from employee e
    -> inner join department d on e.departmentid=d.departmentid
    -> group by d.departmentid,d.departmentid;
+----------------+----------------+
| departmentname | average_salary |
+----------------+----------------+
| IT             |   55000.000000 |
| HR             |   37500.000000 |
| Finance        |   57666.666667 |
| Marketing      |   39000.000000 |
| Operations     |   47000.000000 |
| Research       |   75000.000000 |
| Sales          |   41500.000000 |
+----------------+----------------+
7 rows in set (0.00 sec)

mysql> select
    ->  d.departmentname,
    ->  avg(e.salary) as average_salary
    ->   from employee e
    ->  inner join department d on e.departmentid=d.departmentid
    ->  group by d.departmentid,d.departmentid
    -> having average_salary>50000;
+----------------+----------------+
| departmentname | average_salary |
+----------------+----------------+
| IT             |   55000.000000 |
| Finance        |   57666.666667 |
| Research       |   75000.000000 |
+----------------+----------------+
3 rows in set (0.00 sec)

mysql> select
    -> e.employeename,
    -> e.salary
    -> ^C
mysql> select
    -> e.employeename,
    -> e.salary
    -> d.departmentname
    -> from employeee
    -> inner join department d on d.departmentid = e.departmentid
    -> group by d.departmentname,d.departmentid
    -> limit 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '.departmentname
from employeee
inner join department d on d.departmentid = e.de' at line 4
mysql> select
    -> e.employeename,
    -> e.salary
    -> d.departmentname
    -> from employee
    -> inner join department d on d.departmentid = e.departmentid
    ->  group by d.departmentname,d.departmentid
    ->  limit 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '.departmentname
from employee
inner join department d on d.departmentid = e.depa' at line 4
mysql> select
    -> e.employeename,
    -> e.salary,
    -> from employee e
    -> inner join department d on d.departmentid = e.departmentid
    ->  group by d.departmentname,d.departmentid
    -> limit 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from employee e
inner join department d on d.departmentid = e.departmentid
 grou' at line 4
mysql> select
    ->     e.employeename, e.salary, d.departmentname
    -> from employee e
    ->  inner join department d on d.departmentid = e.departmentid
    -> group by d.departmentname,d.departmentid
    ->  limit 1;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'day9db.e.EmployeeName' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> select
    -> e.employeename,
    -> e.salary,
    -> d.departmentname
    -> from employee e
    -> inner join departmment d
    -> on e.departmentid=d.departmentid
    -> where e.salary = {
    -> ^C
mysql> select
    -> e.employeename,
    ->  e.salary,
    ->  d.departmentname
    -> from employee e
    -> inner join departmment d
    -> on e.departmentid=d.departmentid
    ->  where e.salary = (
    ->  select max(e2.salary)
    -> from employee e2
    -> where e2.departmentid=e.departmentid);
ERROR 1146 (42S02): Table 'day9db.departmment' doesn't exist
mysql> show tables;
+------------------+
| Tables_in_day9db |
+------------------+
| department       |
| employee         |
| employeeproject  |
| project          |
+------------------+
4 rows in set (0.00 sec)

mysql> select
    -> e.employeename,
    ->  d.departmentname
    -> from employee e
    ->  inner join department d
    ->  on e.departmentid=d.departmentid
    -> where e.salary = (
    ->  select max(e2.salary)
    ->  from employee e2
    -> where e2.departmentid=e.departmentid);
+--------------+----------------+
| employeename | departmentname |
+--------------+----------------+
| Anu          | IT             |
| Meena        | HR             |
| Rahul        | Finance        |
| Ravi         | Marketing      |
| Manoj        | Operations     |
| Sara         | Research       |
| Karthik      | Sales          |
+--------------+----------------+
7 rows in set (0.00 sec)

mysql> select
    -> d.departmentname,
    -> sum(e.salary) as total_salary
    -> from employee e
    -> inner join department d on e.departmentid=d.departmentid
    -> group by d.departmentid,d.departmentname
    -> having total_salary > 100000;
+----------------+--------------+
| departmentname | total_salary |
+----------------+--------------+
| IT             |    220000.00 |
| Finance        |    173000.00 |
+----------------+--------------+
2 rows in set (0.00 sec)

mysql> select * from employee;
+------------+--------------+----------+--------------+
| EmployeeID | EmployeeName | Salary   | DepartmentID |
+------------+--------------+----------+--------------+
|          1 | Arun         | 60000.00 |            1 |
|          2 | Bala         | 45000.00 |            1 |
|          3 | Divya        | 50000.00 |            1 |
|          4 | Anu          | 65000.00 |            1 |
|          5 | Kavi         | 35000.00 |            2 |
|          6 | Meena        | 40000.00 |            2 |
|          7 | Rahul        | 70000.00 |            3 |
|          8 | Siva         | 55000.00 |            3 |
|          9 | Vijay        | 48000.00 |            3 |
|         10 | Priya        | 30000.00 |            4 |
|         11 | Ravi         | 48000.00 |            4 |
|         12 | Kiran        | 42000.00 |            5 |
|         13 | Manoj        | 52000.00 |            5 |
|         14 | Sara         | 75000.00 |            6 |
|         15 | Naveen       | 38000.00 |            7 |
|         16 | Karthik      | 45000.00 |            7 |
+------------+--------------+----------+--------------+
16 rows in set (0.00 sec)

mysql> select * from employeeproject;
+------------+-----------+-------------+
| EmployeeID | ProjectID | HoursWorked |
+------------+-----------+-------------+
|          1 |       101 |          40 |
|          1 |       102 |          30 |
|          2 |       101 |          50 |
|          2 |       102 |          20 |
|          3 |       102 |          45 |
|          4 |       101 |          35 |
|          5 |       103 |          30 |
|          6 |       103 |          40 |
|          7 |       104 |          50 |
|          8 |       104 |          35 |
|          9 |       104 |          25 |
|         10 |       105 |          40 |
|         11 |       105 |          55 |
|         12 |       106 |          30 |
|         13 |       106 |          45 |
|         14 |       107 |          60 |
|         15 |       108 |          35 |
|         16 |       108 |          45 |
+------------+-----------+-------------+
18 rows in set (0.00 sec)

mysql> select * from department;
+--------------+----------------+
| DepartmentID | DepartmentName |
+--------------+----------------+
|            1 | IT             |
|            2 | HR             |
|            3 | Finance        |
|            4 | Marketing      |
|            5 | Operations     |
|            6 | Research       |
|            7 | Sales          |
+--------------+----------------+
7 rows in set (0.00 sec)

mysql> select * from project;
+-----------+---------------------+-----------+--------------+
| ProjectID | ProjectName         | Budget    | DepartmentID |
+-----------+---------------------+-----------+--------------+
|       101 | Website Development | 150000.00 |            1 |
|       102 | Mobile Application  | 250000.00 |            1 |
|       103 | Recruitment System  |  80000.00 |            2 |
|       104 | Financial Analysis  | 120000.00 |            3 |
|       105 | Marketing Campaign  | 100000.00 |            4 |
|       106 | Inventory System    | 180000.00 |            5 |
|       107 | AI Research         | 300000.00 |            6 |
|       108 | Sales Dashboard     |  90000.00 |            7 |
|       109 | Internal Training   |  50000.00 |            2 |
+-----------+---------------------+-----------+--------------+
9 rows in set (0.00 sec)

mysql> select
    -> e.employeename,
    -> d.departmentname,
    -> p.projectname,
    -> ep.hoursworked
    -> from employee e
    -> inner join department d on d.departmentid=e.departmentid
    -> inner join employeeproject ep on ep.employeeid = e.employeeid
    -> inner join project p on p.projectid=ep.projectid;
+--------------+----------------+---------------------+-------------+
| employeename | departmentname | projectname         | hoursworked |
+--------------+----------------+---------------------+-------------+
| Arun         | IT             | Website Development |          40 |
| Bala         | IT             | Website Development |          50 |
| Anu          | IT             | Website Development |          35 |
| Arun         | IT             | Mobile Application  |          30 |
| Bala         | IT             | Mobile Application  |          20 |
| Divya        | IT             | Mobile Application  |          45 |
| Kavi         | HR             | Recruitment System  |          30 |
| Meena        | HR             | Recruitment System  |          40 |
| Rahul        | Finance        | Financial Analysis  |          50 |
| Siva         | Finance        | Financial Analysis  |          35 |
| Vijay        | Finance        | Financial Analysis  |          25 |
| Priya        | Marketing      | Marketing Campaign  |          40 |
| Ravi         | Marketing      | Marketing Campaign  |          55 |
| Kiran        | Operations     | Inventory System    |          30 |
| Manoj        | Operations     | Inventory System    |          45 |
| Sara         | Research       | AI Research         |          60 |
| Naveen       | Sales          | Sales Dashboard     |          35 |
| Karthik      | Sales          | Sales Dashboard     |          45 |
+--------------+----------------+---------------------+-------------+
18 rows in set (0.00 sec)

mysql> select * from project;
+-----------+---------------------+-----------+--------------+
| ProjectID | ProjectName         | Budget    | DepartmentID |
+-----------+---------------------+-----------+--------------+
|       101 | Website Development | 150000.00 |            1 |
|       102 | Mobile Application  | 250000.00 |            1 |
|       103 | Recruitment System  |  80000.00 |            2 |
|       104 | Financial Analysis  | 120000.00 |            3 |
|       105 | Marketing Campaign  | 100000.00 |            4 |
|       106 | Inventory System    | 180000.00 |            5 |
|       107 | AI Research         | 300000.00 |            6 |
|       108 | Sales Dashboard     |  90000.00 |            7 |
|       109 | Internal Training   |  50000.00 |            2 |
+-----------+---------------------+-----------+--------------+
9 rows in set (0.00 sec)

mysql> select * from employeeproject;
+------------+-----------+-------------+
| EmployeeID | ProjectID | HoursWorked |
+------------+-----------+-------------+
|          1 |       101 |          40 |
|          1 |       102 |          30 |
|          2 |       101 |          50 |
|          2 |       102 |          20 |
|          3 |       102 |          45 |
|          4 |       101 |          35 |
|          5 |       103 |          30 |
|          6 |       103 |          40 |
|          7 |       104 |          50 |
|          8 |       104 |          35 |
|          9 |       104 |          25 |
|         10 |       105 |          40 |
|         11 |       105 |          55 |
|         12 |       106 |          30 |
|         13 |       106 |          45 |
|         14 |       107 |          60 |
|         15 |       108 |          35 |
|         16 |       108 |          45 |
+------------+-----------+-------------+
18 rows in set (0.00 sec)

mysql> select
    -> p.projectname,
    -> sum(hoursworked) as total_hours
    -> ^C
mysql> select
    -> p.projectname,
    -> sum(ep.hoursworked) as total_hours
    -> from employee e
    -> inner join employeeproject ep on e.projectid=ep.projectid
    -> group by p.projectname,p.projectid;
ERROR 1054 (42S22): Unknown column 'p.projectname' in 'field list'
mysql> select
    ->  p.projectname,
    ->  sum(ep.hoursworked) as total_hours
    -> from project p
    -> inner join employeeproject ep on e.projectid=ep.projectid
    -> group by p.projectname,p.projectid;
ERROR 1054 (42S22): Unknown column 'e.projectid' in 'on clause'
mysql> select
    ->  p.projectname,
    ->  sum(ep.hoursworked) as total_hours
    ->  from project p
    ->  inner join employeeproject ep on e.projectid=ep.projectid
    ->  group by p.projectname,p.projectid;
ERROR 1054 (42S22): Unknown column 'e.projectid' in 'on clause'
mysql> select
    ->  p.projectname,
    ->  sum(ep.hoursworked) as total_hours
    ->  from project p
    ->  inner join employeeproject ep on p.projectid=ep.projectid
    -> group by p.projectname,p.projectid;
+---------------------+-------------+
| projectname         | total_hours |
+---------------------+-------------+
| Website Development |         125 |
| Mobile Application  |          95 |
| Recruitment System  |          70 |
| Financial Analysis  |         110 |
| Marketing Campaign  |          95 |
| Inventory System    |          75 |
| AI Research         |          60 |
| Sales Dashboard     |          80 |
+---------------------+-------------+
8 rows in set (0.00 sec)

mysql> select
    -> d.departmentname,
    -> sum(e.salary) as total_salary
    -> from
    -> ^C
mysql> select * from department;
+--------------+----------------+
| DepartmentID | DepartmentName |
+--------------+----------------+
|            1 | IT             |
|            2 | HR             |
|            3 | Finance        |
|            4 | Marketing      |
|            5 | Operations     |
|            6 | Research       |
|            7 | Sales          |
+--------------+----------------+
7 rows in set (0.00 sec)

mysql> select
    -> d.departmentname,
    ->  sum(e.salary) as total_salary
    -> from employee e
    -> inner join department d on e.departmentid=d.departmentid
    -> group by d.departmentname ,d.depatmentid
    -> group by
    -> order by total_salary desc
    -> limit 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'group by
order by total_salary desc
limit 1' at line 7
mysql>  select
    -> d.departmentname,
    ->  sum(e.salary) as total_salary
    -> from employee e
    ->  inner join department d on e.departmentid=d.departmentid
    -> group by d.departmentname ,d.depatmentid
    -> ^C
mysql> select
    -> d.departmentname,
    -> sum(e.salary) as total_salary
    ->  from employee e
    ->  inner join department d on e.departmentid=d.departmentid
    -> group by d.departmentname ,d.departmentid
    -> order by total_salary desc
    -> limit 1;
+----------------+--------------+
| departmentname | total_salary |
+----------------+--------------+
| IT             |    220000.00 |
+----------------+--------------+
1 row in set (0.00 sec)

mysql>