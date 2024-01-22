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

--Basics and Intermediate ASSINGMENT 
--ASSINGMENT nos - 1

--Q1)SQL Query to fetch records that are present in one table but not in another table.

select EmpId from EmployeeDetails
except
select EmpId from EmployeeSalary

--Q2)SQL query to fetch all the employees who are not working on any project.
insert into EmployeeDetails values (521,'Harry Potter',321,'05/20/2021','London')

--Main Query
select * from EmployeeDetails
left join EmployeeSalary
on EmployeeDetails.EmpId=EmployeeSalary.EmpId
where EmployeeSalary.EmpId is null

--Q3)SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.
select * from EmployeeDetails where right(DateOFJoining,4)=2020

--Q4)Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.
select * from EmployeeDetails
left join EmployeeSalary
on EmployeeDetails.EmpId=EmployeeSalary.EmpId
where EmployeeSalary.Salary is not null

--Q5)Write an SQL query to fetch a project-wise count of employees.
create procedure Project_WiseCountOfEmployees
@Project varchar(max)
as
begin
select count(EmpId) [project-wise count of employees] from EmployeeSalary where Project = @Project
end

execute Project_WiseCountOfEmployees 'P1'
exec Project_WiseCountOfEmployees 'P2'
Project_WiseCountOfEmployees 'P3'

--Q6)Fetch employee names and salaries even if the salary value is not present for the employee.

select FullName,Salary from EmployeeDetails
left join EmployeeSalary
on EmployeeDetails.EmpId=EmployeeSalary.EmpId

--Q7)Write an SQL query to fetch all the Employees who are also managers.

select FullName from EmployeeDetails
where EmpId = (
select EmpId from EmployeeDetails
intersect
select ManegerId from EmployeeDetails
)

--Q8)Write an SQL query to fetch duplicate records from EmployeeDetails.
insert into EmployeeDetails values (421,'kuldeep rana',876,'11/27/2021','New Delhi')

--main query
with Duplicate_CTE
as
(Select * ,row_number() over (partition by EmpId order by EmpId) as RowNumber from EmployeeDetails)
select * from Duplicate_CTE where RowNumber > 1

with Duplicate_CTE
as
(Select * ,row_number() over (partition by EmpId order by EmpId) as RowNumber from EmployeeDetails)
delete Duplicate_CTE where RowNumber > 1
 
select * from EmployeeDetails
--ASSINGMENT nos - 2
--Ques.1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.
select EmpId,FullName from EmployeeDetails where ManegerId = 986

--Ques.2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.
select distinct Project from EmployeeSalary

--Ques.3. Write an SQL query to fetch the count of employees working in project ‘P1’.
select count(EmpId) CountOfEmployees from EmployeeSalary where Project = 'P1'

--Ques.4. Write an SQL query to find the maximum, minimum, and average salary of the employees.
select max(salary) MaximumSalary from EmployeeSalary
select min(salary) MinimumSalary from EmployeeSalary
select Avg(salary) AverageSalary from EmployeeSalary

--Ques.5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
select EmpId from EmployeeSalary where Salary between 9000 and 15000

--Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
select * from EmployeeDetails where City = 'Toronto' and ManegerId = 321

--Ques.7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
select * from EmployeeDetails where City = 'California' or  ManegerId = 321


--Ques.8. Write an SQL query to fetch all those employees who work on Projects other than P1.
select * from EmployeeDetails where EmpId in (
select EmpId from EmployeeSalary
except
select EmpId from EmployeeSalary where Project = 'P1'
)

--Ques.9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
select * from EmployeeDetails
select * from EmployeeSalary

select FullName,ManagerId,DateOFJoining,City,Salary+Variable as Total_Salary from EmployeeDetails
left join EmployeeSalary
on EmployeeDetails.EmpId=EmployeeSalary.EmpId

--Ques.10. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.

select FullName,managerId,DateOFJoining,City from EmployeeDetails as temp1
left join
(select left (FullName,4) First4Text,EmpId from EmployeeDetails) as temp2
on temp1.EmpId=temp2.EmpId where right(First4Text,2) = 'hn'

--ASSINGMENT nos - 3
--Ques.1 Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.
select EmpId from EmployeeDetails
union
select EmpId from EmployeeSalary

--Ques.2 Write an SQL query to fetch common records between two tables.
select * from EmployeeDetails
inner join EmployeeSalary
on EmployeeDetails.EmpId=EmployeeSalary.EmpId

--Ques.3. Write an SQL query to fetch records that are present in one table but not in another table.
select EmpId from EmployeeDetails
except
select EmpId from EmployeeSalary

--Ques.4. Write an SQL query to fetch the EmpIds that are present in both the tables –  ‘EmployeeDetails’ and ‘EmployeeSalary.
select EmpId from EmployeeDetails
intersect
select EmpId from EmployeeSalary

--Ques.5. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.
select EmpId from EmployeeDetails
except
select EmpId from EmployeeSalary

--Ques.6. Write an SQL query to fetch the employee’s full names and replace the space.

--Ques.7. Write an SQL query to fetch the position of a given character(s) in a field.
select CHARINDEX('S',FullName,1) [character(S) Position] from EmployeeDetails

--Ques.8. Write an SQL query to display both the EmpId and ManagerId together.
select EmpId,ManagerId from EmployeeDetails

--Ques.9. Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table.
select left (FullName,CHARINDEX(' ',FullName,1)-1) FirstName from EmployeeDetails

--Ques.10. Write an SQL query to uppercase the name of the employee and lowercase the city values.
update EmployeeDetails set FullName = upper(FullName)
update EmployeeDetails set City = lower(City)

--ASSINGMENT nos - 4
--Ques.1. Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field.
select sum(len(FullName) - len(replace(FullName,'n',''))) AS 'Count of N' from EmployeeDetails

--Ques.2. Write an SQL query to update the employee names by removing leading and trailing spaces.
update EmployeeDetails
set FullName = replace(left(FullName,CHARINDEX(' ',FullName,1)-1),' ','')+' '+replace(right(FullName,len(FullName)-CHARINDEX(' ',FullName,1)),' ','')

UPDATE EmployeeDetails
SET FullName = TRIM(' ' FROM FullName)

select * from EmployeeDetails
--Ques.3. Fetch all the employees who are not working on any project
select * from EmployeeDetails
left join EmployeeSalary
on EmployeeDetails.EmpId=EmployeeSalary.EmpId
where EmployeeSalary.EmpId is null

--Ques.4. Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000.
select FullName from EmployeeDetails
where  EmpId in (select EmpId from EmployeeSalary where Salary between 5000 and 10000)

--Ques.5. Write an SQL query to find the current date-time.
select getdate() as [Current Date-Time]

--Ques.6. Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020.
select * from EmployeeDetails where right(DateOFJoining,4)='2020'

--Ques.7. Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table.
select * from EmployeeDetails where EmpId in (select EmpId from EmployeeSalary)

--Ques.8. Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order.

select Project,count(EmpId) [EmployeeCount] from EmployeeSalary
GROUP BY Project
ORDER BY EmployeeCount DESC

--Ques.9. Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee.
select FullName,Salary from EmployeeDetails
left join EmployeeSalary
on EmployeeDetails.EmpId=EmployeeSalary.EmpId

--Ques.10. Write an SQL query to join 3 tables.
select * from EmployeeDetails
left join EmployeeSalary
on EmployeeDetails.EmpId=EmployeeSalary.EmpId

--Advanced ASSINGMENT 

create table EmployeeInfo_Table (EmpId int,EmpFname varchar(max),EmpLname varchar(max),Department varchar(max),Project varchar(max),Address varchar(max),DOB varchar(max),Gender varchar(max))
create table EmployeePosition_Table (EmpId int,EmpPosition varchar(max),DateOfjoining varchar(max),Salary int)

insert into EmployeeInfo_Table values (1,'Sanjay','Mehra','HR','P1','Hyderabad(HYD)','01/12/1976','M')
insert into EmployeeInfo_Table values (2,'Ananya','Mishra','Admin','P2','Delhi(DEL)','02/05/1968','F')
insert into EmployeeInfo_Table values (3,'Rohan','Diwan','Account','P3','Mumbai(BOM)','01/01/1980','M')
insert into EmployeeInfo_Table values (4,'Sonia','Kulkarni','HR','P1','Hyderabad(HYD)','05/05/1992','F')
insert into EmployeeInfo_Table values (5,'Ankit','Kapoor','Admin','P2','Delhi(DEL)','03/07/1994','M')


insert into EmployeePosition_Table values (1,'Manager','01/05/2022',500000)
insert into EmployeePosition_Table values (2,'Executive','02/05/2022',75000)
insert into EmployeePosition_Table values (3,'Manager','01/05/2022',90000)
insert into EmployeePosition_Table values (4,'Lead','02/05/2022',85000)
insert into EmployeePosition_Table values (5,'Executive','01/05/2022',300000)

select * from EmployeeInfo_Table
select * from EmployeePosition_Table

--Q1)Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.
select upper(EmpFname) 'EmpName' from EmployeeInfo_Table

--Q2)Write a query to fetch the number of employees working in the department ‘HR’.
select count(EmpId) as 'HR Emplyees' from EmployeeInfo_Table where department = 'HR'

--Q3)Write a query to get the current date.
select getdate() [CurrentDate]

--Q4)Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
select left (EmpLname,4) 'First4Text from EmpLname' from EmployeeInfo_Table

--Q5)Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.
select left (Address,charindex('(',Address,1)-1) as 'EmpAddress'  from EmployeeInfo_Table

--Q6)Write a query to create a new table that consists of data and structure copied from the other table.
select * into New_Table from EmployeeInfo_Table
select * from New_Table

--Q7)Write q query to find all the employees whose salary is between 50000 to 100000.
select * from EmployeeInfo_Table where EmpId in (select EmpId from EmployeePosition_Table where Salary between 50000 and 100000)

--Q8)Write a query to find the names of employees that begin with ‘S’.
select EmpFname from EmployeeInfo_Table where left(EmpFname,1) = 'S'

--Q9)Write a query to fetch top N records.
select top 4 * from EmployeeInfo_Table
select top 3 * from EmployeePosition_Table

--Q10)Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.
select left(EmpFname,len(EmpFname))+' '+left(EmpLname,len(EmpLname)) as FullName
from employeeInfo_Table

--Q11. Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender.
select count(EmpId) as [EmpBet02/05/1970 to 31/12/1975] from EmployeeInfo_Table
where DOB between '02/05/1970' and '31/12/1975' and Gender = 'M'

--Q12. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.
select * from EmployeeInfo_Table
order by EmpLname desc , Department asc

--Q13. Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.
select EmpLname from EmployeeInfo_Table where right (EmpLname,1) = 'A' and len(EmpLname) = 5

--Q14. Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.
select * from EmployeeInfo_Table where EmpFname not in ('Sanjay','Sonia')

--Q15. Write a query to fetch details of employees with the address as “DELHI(DEL)”.
select * from EmployeeInfo_Table where Address = 'DELHI(DEL)'

--Q16. Write a query to fetch all employees who also hold the managerial position.
select * from EmployeeInfo_Table
where EmpId in (select EmpId from EmployeePosition_Table where EmpPosition = 'Manager')

--Q17. Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.
select Department,count(EmpID) 'Dep_Wise_Emp' from EmployeeInfo_Table
group by Department
order by Dep_Wise_Emp asc

--Q18. Write a query to calculate the even and odd records from a table.
SELECT * FROM EmployeeInfo_Table 
SELECT * FROM EmployeeInfo_Table WHERE (EmpId%2) = 0 ---Even records 

SELECT * FROM EmployeeInfo_Table WHERE (EmpId%2) <> 0 --odd records

--Q19. Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.

select * from EmployeeInfo_Table
where EmpId in (select EmpId From EmployeePosition_Table
where DateOfjoining is not null)

--Q20. Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.

select top 2 *from EmployeePosition_Table
order by salary asc

select top 2 *from EmployeePosition_Table 
order by salary desc

--Q21. Write a query to find the Nth highest salary from the table without using TOP/limit keyword.

Select distinct(Salary) from EmployeePosition_Table e1
where (
select COUNT(Salary) from EmployeePosition_Table e2
where e1.Salary <= e2.Salary
) = 4

--Q22. Write a query to retrieve duplicate records from a table.
with Double_Entry_CTE
as
(select *, row_number() over (partition by EmpId order by EmpId) as RowNumber from EmployeeInfo_Table)
select * from Double_Entry_CTE where RowNumber > 1

--Q23. Write a query to retrieve the list of employees working in the same department.

select * from EmployeeInfo_Table where Department = 'HR'

--Q24. Write a query to retrieve the last 3 records from the EmployeeInfo table.
select top 3 * from EmployeeInfo_Table
order by EmpId desc

----Q25. Write a query to find the third-highest salary from the EmpPosition table.
Select distinct(Salary) from EmployeePosition_Table e1
where (
select COUNT(Salary) from EmployeePosition_Table e2
where e1.Salary <= e2.Salary
) = 3

----Q26. Write a query to display the first and the last record from the EmployeeInfo table.
select * from EmployeeInfo_Table
where EmpId in ((select top 1 EmpId from EmployeeInfo_Table),
(select top 1 EmpId from EmployeeInfo_Table
order by EmpId desc))

--Q27. Write a query to add email validation to your database.


--Q28. Write a query to retrieve Departments who have less than 2 employees working in it.
select Department,count(*) [Dep_wise_Emp] from EmployeeInfo_Table
group by Department
having count(*) < 2

--Q29. Write a query to retrieve EmpPostion along with total salaries paid for each of them.

select EmpPosition,sum(Salary) [Total_Salaries]from EmployeePosition_Table
group by EmpPosition

--Q30. Write a query to fetch 50% records from the EmployeeInfo table.
select * from EmployeeInfo_Table
where EmpId <= (select count(*)/2 from EmployeeInfo_Table)