
mysql> use day8db;
Database changed
mysql> CREATE TABLE Department (
    ->     DepartmentID INT PRIMARY KEY,
    ->     DepartmentName VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql>
mysql> CREATE TABLE Employee (
    ->     EmployeeID INT PRIMARY KEY,
    ->     EmployeeName VARCHAR(50),
    ->     Salary DECIMAL(10,2),
    ->     DepartmentID INT,
    ->     ManagerID INT NULL,
    ->     FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql>
mysql> CREATE TABLE Project (
    ->     ProjectID INT PRIMARY KEY,
    ->     ProjectName VARCHAR(50),
    ->     Budget DECIMAL(10,2),
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
Query OK, 0 rows affected (0.06 sec)

mysql> INSERT INTO Department VALUES
    -> (1, 'IT'),
    -> (2, 'HR'),
    -> (3, 'Finance'),
    -> (4, 'Marketing'),
    -> (5, 'Operations'),
    -> (6, 'Research');
Query OK, 6 rows affected (0.06 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql>
mysql>
mysql> INSERT INTO Employee VALUES
    -> (1, 'Arun', 60000, 1, NULL),
    -> (2, 'Bala', 45000, 1, 1),
    -> (3, 'Divya', 50000, 1, 1),
    -> (4, 'Kavi', 35000, 2, NULL),
    -> (5, 'Meena', 40000, 2, 4),
    -> (6, 'Rahul', 70000, 3, NULL),
    -> (7, 'Siva', 55000, 3, 6),
    -> (8, 'Priya', 30000, 4, NULL),
    -> (9, 'Vijay', 48000, 4, 8),
    -> (10, 'Anu', 65000, 1, 1);
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql>
mysql>
mysql> INSERT INTO Project VALUES
    -> (101, 'Website Development', 150000, 1),
    -> (102, 'Mobile App', 200000, 1),
    -> (103, 'Recruitment System', 80000, 2),
    -> (104, 'Financial Analysis', 120000, 3),
    -> (105, 'Marketing Campaign', 100000, 4),
    -> (106, 'AI Research', 250000, 6),
    -> (107, 'Internal Training', 50000, 2);
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql>
mysql>
mysql> INSERT INTO EmployeeProject VALUES
    -> (1, 101, 40),
    -> (1, 102, 30),
    -> (2, 101, 50),
    -> (2, 102, 20),
    -> (3, 102, 45),
    -> (4, 103, 30),
    -> (5, 103, 40),
    -> (6, 104, 50),
    -> (7, 104, 35),
    -> (8, 105, 40),
    -> (9, 105, 55),
    -> (10, 101, 25);
Query OK, 12 rows affected (0.06 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql>
mysql> select * from employee;
+------------+--------------+----------+--------------+-----------+
| EmployeeID | EmployeeName | Salary   | DepartmentID | ManagerID |
+------------+--------------+----------+--------------+-----------+
|          1 | Arun         | 60000.00 |            1 |      NULL |
|          2 | Bala         | 45000.00 |            1 |         1 |
|          3 | Divya        | 50000.00 |            1 |         1 |
|          4 | Kavi         | 35000.00 |            2 |      NULL |
|          5 | Meena        | 40000.00 |            2 |         4 |
|          6 | Rahul        | 70000.00 |            3 |      NULL |
|          7 | Siva         | 55000.00 |            3 |         6 |
|          8 | Priya        | 30000.00 |            4 |      NULL |
|          9 | Vijay        | 48000.00 |            4 |         8 |
|         10 | Anu          | 65000.00 |            1 |         1 |
+------------+--------------+----------+--------------+-----------+
10 rows in set (0.00 sec)

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
+--------------+----------------+
6 rows in set (0.00 sec)

mysql> select * from employeeproject;
+------------+-----------+-------------+
| EmployeeID | ProjectID | HoursWorked |
+------------+-----------+-------------+
|          1 |       101 |          40 |
|          1 |       102 |          30 |
|          2 |       101 |          50 |
|          2 |       102 |          20 |
|          3 |       102 |          45 |
|          4 |       103 |          30 |
|          5 |       103 |          40 |
|          6 |       104 |          50 |
|          7 |       104 |          35 |
|          8 |       105 |          40 |
|          9 |       105 |          55 |
|         10 |       101 |          25 |
+------------+-----------+-------------+
12 rows in set (0.00 sec)

mysql> select * from project;
+-----------+---------------------+-----------+--------------+
| ProjectID | ProjectName         | Budget    | DepartmentID |
+-----------+---------------------+-----------+--------------+
|       101 | Website Development | 150000.00 |            1 |
|       102 | Mobile App          | 200000.00 |            1 |
|       103 | Recruitment System  |  80000.00 |            2 |
|       104 | Financial Analysis  | 120000.00 |            3 |
|       105 | Marketing Campaign  | 100000.00 |            4 |
|       106 | AI Research         | 250000.00 |            6 |
|       107 | Internal Training   |  50000.00 |            2 |
+-----------+---------------------+-----------+--------------+
7 rows in set (0.00 sec)

mysql>Microsoft Windows [Version 10.0.26200.9168]
(c) Microsoft Corporation. All rights reserved.

C:\Users\balae>mysql -u root -p
Enter password: *******
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)

C:\Users\balae>mysql -u root -p
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 24
Server version: 8.0.44 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use day8db;
Database changed
mysql> select
    -> employeename,
    -> departmentname,
    -> salary
    -> from employee
    -> inner join department on employee.departmentid=department.departmentid;
+--------------+----------------+----------+
| employeename | departmentname | salary   |
+--------------+----------------+----------+
| Arun         | IT             | 60000.00 |
| Bala         | IT             | 45000.00 |
| Divya        | IT             | 50000.00 |
| Kavi         | HR             | 35000.00 |
| Meena        | HR             | 40000.00 |
| Rahul        | Finance        | 70000.00 |
| Siva         | Finance        | 55000.00 |
| Priya        | Marketing      | 30000.00 |
| Vijay        | Marketing      | 48000.00 |
| Anu          | IT             | 65000.00 |
+--------------+----------------+----------+
10 rows in set (0.00 sec)

mysql> select
    -> avg(salary)
    -> from employee
    -> inner join department d on employee.departmentid=d.departmentid
    -> group by departmentid;
ERROR 1052 (23000): Column 'departmentid' in group statement is ambiguous
mysql> select
    -> d.departmentname,
    -> avg(e.salary) as averagesalary
    -> from employee e
    -> inner join department d
    -> on e.departmentid = d.departmentid
    -> group by d.departmentid,
    -> d.departmentname;
+----------------+---------------+
| departmentname | averagesalary |
+----------------+---------------+
| IT             |  55000.000000 |
| HR             |  37500.000000 |
| Finance        |  62500.000000 |
| Marketing      |  39000.000000 |
+----------------+---------------+
4 rows in set (0.00 sec)

mysql> select
    -> d.departmentname,
    -> avg(e.salary) as averagesalary
    -> from employee e
    ->  inner join department d
    -> on e.departmentid = d.departmentid
    -> group by d.departmentid,
    ->  d.departmentname
    -> limit 1;
+----------------+---------------+
| departmentname | averagesalary |
+----------------+---------------+
| IT             |  55000.000000 |
+----------------+---------------+
1 row in set (0.00 sec)

mysql> select
    -> d.departmentname,
    -> count(d.departmentid) as employeecount
    -> from department d
    -> inner join employee e on d.departmentid = e.departmentid
    -> group by d.departmentname=e.departmentid;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'day8db.d.DepartmentName' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> select
    -> d.departmentnmae,
    -> count(e.employeeid) as employeecount
    -> from department d
    -> left join employee e
    -> on d.departmentid=e.departmentid
    -> group by d.departmentid,
    -> d.departmentname;
ERROR 1054 (42S22): Unknown column 'd.departmentnmae' in 'field list'
mysql> select
    ->  d.departmentname,
    -> count(e.employeeid) as employeecount
    -> from department d
    -> left join employee e
    -> on d.departmentid=e.departmentid
    -> group by d.departmentid,
    ->  d.departmentname;
+----------------+---------------+
| departmentname | employeecount |
+----------------+---------------+
| IT             |             4 |
| HR             |             2 |
| Finance        |             2 |
| Marketing      |             2 |
| Operations     |             0 |
| Research       |             0 |
+----------------+---------------+
6 rows in set (0.00 sec)

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

mysql> select
    -> d.departmentname
    -> ,sum(salary) as total_salary
    -> from employee e
    -> inner join department d
    -> on d.departmentid=e.departmentid
    -> group by departmentname,departmentid;
ERROR 1046 (3D000): No database selected
mysql> use day8db;
Database changed
mysql> select
    ->  d.departmentname
    ->  ,sum(salary) as total_salary
    ->  from employee e
    -> inner join department d
    -> on d.departmentid=e.departmentid
    ->  group by departmentname,departmentid;
ERROR 1052 (23000): Column 'departmentid' in group statement is ambiguous
mysql> select
    -> d.departmentname,
    -> sum(e.salery) as total_salary
    -> from employee e
    -> inner join department d
    -> on e.departmentid=d.departmentid
    -> group by d.departmentid,
    -> d.departmentname
    -> having sum(e.salary)> 100000;
ERROR 1054 (42S22): Unknown column 'e.salery' in 'field list'
mysql> select
    -> d.departmentname,
    ->  sum(e.salery) as total_salary
    -> ^C
mysql>  selectd.departmentname,^C
mysql> select
    -> d.departmentname,
    -> sum(e.salary) as total_salary
    -> from employee e
    -> inner join department d
    -> on e.departmentid=d.departmentid
    -> group by d.departmentid,
    ->  d.departmentname
    -> having sum(e.salary)> 100000;
+----------------+--------------+
| departmentname | total_salary |
+----------------+--------------+
| IT             |    220000.00 |
| Finance        |    125000.00 |
+----------------+--------------+
2 rows in set (0.00 sec)

mysql> select
    -> d.departmentname,
    -> count(e.employeeid) as employee_count,
    -> avg(e.salary) as avg_salary
    -> from employee e
    -> inner join department d
    -> on d.departmentid=e.departmentid
    -> group by d.departmentid,d.departmentname;
+----------------+----------------+--------------+
| departmentname | employee_count | avg_salary   |
+----------------+----------------+--------------+
| IT             |              4 | 55000.000000 |
| HR             |              2 | 37500.000000 |
| Finance        |              2 | 62500.000000 |
| Marketing      |              2 | 39000.000000 |
+----------------+----------------+--------------+
4 rows in set (0.00 sec)

mysql> select
    -> d.departmentname,
    -> avg(e.salary) as avg_salary
    -> from employee e
    -> inner join department d on e.departmentid =d.departmentid
    -> group by e.departmentid,d.departmentname
    -> limit 1;
+----------------+--------------+
| departmentname | avg_salary   |
+----------------+--------------+
| IT             | 55000.000000 |
+----------------+--------------+
1 row in set (0.00 sec)

mysql> select
    -> d.departmentname,
    ->  avg(e.salary) as avg_salary
    ->  from employee e
    -> inner join department d on e.departmentid =d.departmentid
    -> group by e.departmentid,d.departmentname
    -> desc
    -> limit 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'desc
limit 1' at line 7
mysql> select
    -> d.departmentname,
    -> avg(e.salary) as avg_salary
    ->  from employee e
    -> inner join department d on e.departmentid =d.departmentid
    ->  group by e.departmentid,d.departmentname desc
    -> limit 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'desc
limit 1' at line 6
mysql> select
    ->  d.departmentname,
    ->  avg(e.salary) as
    -> ^C
mysql> select
    -> d.departmentname,
    -> avg(e.salary) as avg_salary
    ->  from employee e
    ->  inner join department d on e.departmentid =d.departmentid
    ->  group by e.departmentid,d.departmentname
    -> order by desc
    ->  limit 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'desc
 limit 1' at line 7
mysql>  select
    ->  d.departmentname,
    ->  avg(e.salary) as avg_salary
    -> from employee e
    ->  inner join department d on e.departmentid =d.departmentid
    ->  group by e.departmentid,d.departmentname
    ->  order by avg_salary desc
    -> limit 1;
+----------------+--------------+
| departmentname | avg_salary   |
+----------------+--------------+
| Finance        | 62500.000000 |
+----------------+--------------+
1 row in set (0.00 sec)

mysql>  select
    ->     ->  d.depart^C
mysql>   select
    ->   d.departmentname,
    -> avg(e.salary) as avg_salary
    ->  from employee e
    -> inner join department d on e.departmentid =d.departmentid
    -> group by e.departmentid,d.departmentname
    ->  order by avg_salary desc
    -> where avg_salary >50000;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where avg_salary >50000' at line 8
mysql> select
    -> d.departmentname,
    -> avg(e.salary) as avg_salary
    -> from employee e
    -> inner join department d
    -> on e.departmentid = d.departmentid
    -> group by e.departmentid,
    -> d.departmentname
    -> having avg(e.salary) > 50000
    -> ;
+----------------+--------------+
| departmentname | avg_salary   |
+----------------+--------------+
| IT             | 55000.000000 |
| Finance        | 62500.000000 |
+----------------+--------------+
2 rows in set (0.00 sec)

mysql>