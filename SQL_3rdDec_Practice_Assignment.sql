create table EmployeeDetails (EmpId int,FullName varchar(max),ManegerId int,DateOFJoining varchar(max),City varchar(max))
create table EmployeeSalary (EmpId int,Project varchar(max),Salary int,Variable int)

select * from EmployeeDetails
select * from EmployeeSalary
insert into EmployeeDetails values (121,'John Snow',321,'01/31/2019','Toronto')
insert into EmployeeDetails values (321,'Walter White',986,'01/30/2020','California')
insert into EmployeeDetails values (421,'Kuldeep Rana',876,'11/27/2021','New Delhi')


insert into EmployeeSalary values (121,'P1',8000,500)
insert into EmployeeSalary values (321,'P2',10000,1000)
insert into EmployeeSalary values (421,'P3',12000,0)

--Ques.1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.
select  EmpId,FullName from EmployeeDetails where ManagerId = 986

--Ques.2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.
select distinct(Project) from EmployeeSalary

--Ques.3. Write an SQL query to fetch the count of employees working in project ‘P1’.
select COUNT(*) from EmployeeSalary where Project = 'P1'

--Ques.4. Write an SQL query to find the maximum, minimum, and average salary of the employees.
select max(Salary), min(Salary), avg(Salary) from EmployeeSalary

--Ques.5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
select EmpId, Salary from EmployeeSalary where Salary BETWEEN 9000 AND 15000

--Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
select EmpId, City, ManagerId from EmployeeDetails where City='Toronto' AND ManagerId='321'

--Ques.7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
select EmpId, City, ManagerId from EmployeeDetails where City='California' OR ManagerId='321'

--Ques.8. Write an SQL query to fetch all those employees who work on Projects other than P1.
select EmpId from EmployeeSalary where Project <> 'P1'

--Ques.9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
select EmpId,Salary+Variable as TotalSalary from EmployeeSalary

--Ques.10. Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.
select EmpId from EmployeeDetails
union 
select EmpId from EmployeeSalary
