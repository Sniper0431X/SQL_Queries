create table EmployeeDetailsTable (EmployeeID int,FirstName varchar(max),LastName varchar(max),Salary int,JoiningDate varchar(max),Department varchar(max),Gender varchar(max))

insert into EmployeeDetailsTable values (1,'Vikas','Ahlawat',600000,'02/12/2013 11:26','IT','Male')
insert into EmployeeDetailsTable values (2,'Nikita','Jain',530000,'02/14/2013 11:26','HR','Female')
insert into EmployeeDetailsTable values (3,'Ashish','Kumar',1000000,'02/14/2013 11:26','IT','Male')
insert into EmployeeDetailsTable values (4,'Nikhil','Sharma',480000,'02/15/2013 11:26','HR','Male')
insert into EmployeeDetailsTable values (5,'Anish','Kadian',500000,'02/16/2013 11:26','Paroll','Male')

--1) Write a query to get all employee detail from "EmployeeDetail" table
select * from EmployeeDetailsTable

--2) Write a query to get only "FirstName" column from "EmployeeDetail" table
select FirstName from EmployeeDetailsTable

--3) Write a query to get FirstName in upper case as "First Name".
select upper(FirstName) as 'First Name' from EmployeeDetailsTable

--4) Write a query to get FirstName in upper case as "First Name".(Here I get LastName)
select upper(LastName) as 'Last Name' from EmployeeDetailsTable

--5) Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name)
select left(FirstName,len(FirstName))+' '+left(LastName,len(LastName))  [Name]  from EmployeeDetailsTable

--6) select employee detail whose name is "Vikas".
select * from EmployeeDetailsTable where FirstName = 'Vikas'

--7) Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'.
select * from EmployeeDetailsTable where left(FirstName,1) = 'a'

--8) Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'.(Here I get LastName)
select * from EmployeeDetailsTable where left(LastName,1) = 'a'

--9. Get all employee details from EmployeeDetail table whose "FirstName" end with 'h'
select * from EmployeeDetailsTable where right(FirstName,1) = 'h'

--10. Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p'.
select * from EmployeeDetailsTable where left(FirstName,1) between 'a' and 'p'

--11)	 Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p'
select * from EmployeeDetailsTable where left(FirstName,1) not between 'a' and 'p'

--12)	 Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. The Underscore(_) Wildcard Character represents any single character
select * from EmployeeDetailsTable where right(Gender,2) = 'le' and len(Gender) = 4

--13)	 Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters
select * from EmployeeDetailsTable where left(FirstName,1) = 'a' and len(FirstName) = 5

--14)	 Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".
select * from EmployeeDetailsTable
where charindex('%',FirstName,1) <> 0

--15)	 Get all unique "Department" from EmployeeDetail table
select distinct(Department) from EmployeeDetailsTable

--16)	 Get the highest "Salary" from EmployeeDetail table.
select top 1* from EmployeeDetailsTable
order by Salary desc

--17)	 Get the lowest "Salary" from EmployeeDetail table
select top 1* from EmployeeDetailsTable
order by Salary

--18)	 Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013".
select convert(varchar(max),day(JoiningDate))+' '+
left(datename(month, JoiningDate), 3)+' '+
convert(varchar(max),year(JoiningDate)) as FormatedJoinDate from EmployeeDetailsTable

--19)	Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"
select convert(varchar(max),year(Joiningdate))+'/'+
convert(varchar(max),month(Joiningdate))+'/'+
convert(varchar(max),day(JoiningDate)) [FormatedJoinDate] from EmployeeDetailsTable

--20)	 Show only time part of the "JoiningDate"
select right(JoiningDate,len(JoiningDate)-CHARINDEX(' ',JoiningDate,1)) as TimeOfJoining 
from EmployeeDetailsTable

--21)	Get only Year part of "JoiningDate"
select right(left(JoiningDate,CHARINDEX(' ',JoiningDate,1)-1),4) [JoiningYear]
from EmployeeDetailsTable

--22)	Get only Month part of "JoiningDate”
select left(JoiningDate,2) as [JoiningMonth] from EmployeeDetailsTable

--23)	Get system date.
select getdate() as CurrentSystemDate

--24)	Get UTC date.
select getutcdate() as CurrentUTCDate

--a)	Get the first name, current date, joiningdate and diff between current date and joining date in months.
select FirstName,GETDATE() as CurrentDate,JoiningDate,
DATEDIFF(MONTH,JoiningDate,GETDATE()) as MonthsFromJoining
from EmployeeDetailsTable

--25)	Get the first name, current date, joiningdate and diff between current date and joining date in days.
select FirstName,GETDATE() as CurrentDate,JoiningDate,
DATEDIFF(DAY,JoiningDate,GETDATE()) as MonthsFromJoining
from EmployeeDetailsTable

--26)	 Get all employee details from EmployeeDetail table whose joining year is 2013.
select * from EmployeeDetailsTable
where right(left(JoiningDate,CHARINDEX(' ',JoiningDate,1)-1),4) = '2013'

--27)	Get all employee details from EmployeeDetail table whose joining month is Jan(1)
select * from EmployeeDetailsTable where left(JoiningDate,2) = 01

--28)	Get all employee details from EmployeeDetail table whose joining month is Jan(1).(here i get feb(2))
select * from EmployeeDetailsTable where left(JoiningDate,2) = 02

--29)	Get how many employee exist in "EmployeeDetail" table.
select count(*) as [EmpCount] from EmployeeDetailsTable

--31. select only one/top 1 record from "EmployeeDetail" table
select top 1* from EmployeeDetailsTable

--32. select all employee detail with First name "Vikas","Ashish", and "Nikhil".
select * from EmployeeDetailsTable where FirstName in ('Vikas','Ashish','Nikhil')

--33. select all employee detail with First name not in "Vikas","Ashish", and "Nikhil"
select * from EmployeeDetailsTable where FirstName not in ('Vikas','Ashish','Nikhil')

--34. select first name from "EmployeeDetail" table after removing white spaces from right side
select replace(left(FirstName,len(FirstName)),' ','') as 'FirstNameWithNoSpace' from EmployeeDetailsTable

--35. select first name from "EmployeeDetail" table after removing white spaces from left side
select replace(right(FirstName,len(FirstName)),' ','') as 'FirstNameWithNoSpace' from EmployeeDetailsTable

--36. Display first name and Gender as M/F.(if male then M, if Female then F)
select FirstName,Gender,
Case Gender
when 'Male' then 'M'
when 'Female' then 'F'
else 'Other'
end 'Remarks'
from EmployeeDetailsTable

--37. select first name from "EmployeeDetail" table prifixed with "Hello".
select 'Hello'+' '+FirstName as [Prifixed FirstName] from EmployeeDetailsTable

--38. Get employee details from "EmployeeDetail" table whose Salary greater than 600000.
select * from EmployeeDetailsTable where Salary > 600000

--39. Get employee details from "EmployeeDetail" table whose Salary less than 700000
select * from EmployeeDetailsTable where Salary < 700000

--40. Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000.
select * from EmployeeDetailsTable where Salary between 500000 and 600000

create table ProjectDetailsTable (ProjectDetailID int primary key,EmployeeDetailId int,ProjectName varchar (max))

insert into ProjectDetailsTable values (1,1,'Task Track')
insert into ProjectDetailsTable values (2,1,'CLP')
insert into ProjectDetailsTable values (3,1,'Survey Management')
insert into ProjectDetailsTable values (4,2,'HR Manegement')
insert into ProjectDetailsTable values (5,3,'Task Track')
insert into ProjectDetailsTable values (6,3,'GRS')
insert into ProjectDetailsTable values (7,3,'DDS')
insert into ProjectDetailsTable values (8,4,'HR Manegement')
insert into ProjectDetailsTable values (9,6,'GL Manegement')

--41. Give records of ProjectDetail table.
select * from ProjectDetailsTable

--42. Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table.
select Department,sum(Salary) as [TotalSalaryDepWise]from EmployeeDetailsTable
group by Department

--43. Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.
select Department,sum(Salary) as [TotalSalaryDepWise]from EmployeeDetailsTable
group by Department
order by [TotalSalaryDepWise] asc

--44. Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary
select Department,sum(Salary) as [TotalSalaryDepWise]from EmployeeDetailsTable
group by Department
order by [TotalSalaryDepWise] desc

--45. Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table.
select Department,count(Department)as 'TotalNO.Of.Dep',sum(Salary) as [TotalSalaryDepWise]from EmployeeDetailsTable
group by Department

--46. Get department wise average salary from "EmployeeDetail" table order by salary ascending
select Department,avg(Salary) as [TotalSalaryDepWise]from EmployeeDetailsTable
group by Department
order by TotalSalaryDepWise asc

--47 . Get department wise maximum salary from "EmployeeDetail" table order by salary ascending
select Department,max(Salary) as [TotalSalaryDepWise]from EmployeeDetailsTable
group by Department
order by TotalSalaryDepWise asc

--48.Get department wise minimum salary from "EmployeeDetail" table order by salary ascending.
select Department,min(Salary) as [TotalSalaryDepWise]from EmployeeDetailsTable
group by Department
order by TotalSalaryDepWise asc

--49. Get department wise minimum salary from "EmployeeDetail" table order by salary ascending.(here i get descending)
select Department,min(Salary) as [TotalSalaryDepWise]from EmployeeDetailsTable
group by Department
order by TotalSalaryDepWise desc

--50. Join both the table that is Employee and ProjectDetail based on some common paramter.
select * from EmployeeDetailsTable
join ProjectDetailsTable
on EmployeeDetailsTable.EmployeeId=ProjectDetailsTable.EmployeeDetailID

--51. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already.
select FirstName,LastName,ProjectName from EmployeeDetailsTable
join ProjectDetailsTable
on EmployeeDetailsTable.EmployeeID=ProjectDetailsTable.EmployeeDetailId
order by FirstName

--52. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee even they have not assigned project.
select FirstName,LastName,ProjectName from EmployeeDetailsTable
full join ProjectDetailsTable
on EmployeeDetailsTable.EmployeeID=ProjectDetailsTable.EmployeeDetailId
order by FirstName

--53) Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned"
select FirstName+' '+LastName [EmployeeName],
case when ProjectName is null then '-No Project Assigned'
else ProjectName
end 'ProjectName'
from EmployeeDetailsTable E
left join ProjectDetailsTable P
on E.EmployeeID = P.EmployeeDetailId
order by FirstName

--54.Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail".
select FirstName,LastName,ProjectName AS ProjectName
from EmployeeDetailsTable E
left join ProjectDetailsTable P
on E.EmployeeID = P.EmployeeDetailId
order by FirstName


--55. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL.
select FirstName+' '+LastName as [EmployeeName],ProjectName from EmployeeDetailsTable
full join ProjectDetailsTable
on EmployeeDetailsTable.EmployeeID=ProjectDetailsTable.EmployeeDetailId

--56. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL.
select FirstName+' '+LastName as [EmployeeName],ProjectName from EmployeeDetailsTable
full join ProjectDetailsTable
on EmployeeDetailsTable.EmployeeID=ProjectDetailsTable.EmployeeDetailId

--57.Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL
select FirstName+' '+LastName as [EmployeeName],ProjectName from EmployeeDetailsTable
full join ProjectDetailsTable
on EmployeeDetailsTable.EmployeeID=ProjectDetailsTable.EmployeeDetailId

--58.Write down the query to fetch EmployeeName & Project who has assign more than one project.
select FirstName+' '+LastName as [EmployeeName],count(ProjectName) as 'NoOfProject' from EmployeeDetailsTable
join ProjectDetailsTable
on EmployeeDetailsTable.EmployeeID=ProjectDetailsTable.EmployeeDetailId
group by FirstName+' '+LastName
having count(ProjectName) > 1

--59. Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName.
select ProjectName,count(FirstName+' '+LastName) AS NoOfEmployee
from ProjectDetailsTable
join EmployeeDetailsTable
on EmployeeDetailsTable.EmployeeID=ProjectDetailsTable.EmployeeDetailId
group by ProjectName
having count(FirstName+' '+LastName) > 1

--60. Apply Cross Join in Both the tables
select * from EmployeeDetailsTable
cross join ProjectDetailsTable