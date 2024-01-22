create table Departments (DEPARTMENT_ID int,DEPARTMENT_NAME varchar(max),MANAGER_ID int,LOCATION_ID int)
create table Employees (EMPLOYEE_ID int,FIRST_NAME varchar(max),LAST_NAME varchar(max),EMAIL varchar(max),PHONE_NUMBER varchar (max),HIRE_DATE varchar(max),JOB_ID varchar(max),SALARY int,COMMISSION_PCT float,MANAGER_ID int,DEPARTMENT_ID int)
create table Locations(LOCATION_ID int,STREET_ADDRESS  varchar(max), POSTAL_CODE int,CITY varchar(max),STATE_PROVINCE varchar (max),COUNTRY_ID varchar(max))
create table Job_Grades(GRADE_LEVEL varchar(max),LOWEST_SAL int,HIGHEST_SAL int)

select*from Departments
select*from Employees
select*from Locations
select*from Job_Grades

select Employees.FIRST_NAME,Employees.LAST_NAME,departments.DEPARTMENT_ID,Departments.DEPARTMENT_NAME from Employees
left join Departments
on Departments.DEPARTMENT_ID=Employees.DEPARTMENT_ID

select Employees.FIRST_NAME,Employees.LAST_NAME,departments.department_name,Locations.CITY,Locations.STATE_PROVINCE from departments
right join Employees
on Employees.DEPARTMENT_ID=departments.DEPARTMENT_ID
left join Locations
on Locations.LOCATION_ID=departments.LOCATION_ID

-----Two different command passed here.
select Employees.FIRST_NAME,Employees.LAST_NAME,Employees.SALARY,Job_Grades.GRADE_LEVEL from Job_Grades
left join Employees
on Employees.SALARY between Job_Grades.LOWEST_SAL and Job_Grades.HIGHEST_SAL


select Employees.FIRST_NAME,Employees.LAST_NAME,Employees.SALARY,Job_Grades.GRADE_LEVEL from Job_Grades
left join Employees
on Employees.Salary>=Job_Grades.LOWEST_SAL and Employees.Salary<=Job_Grades.HIGHEST_SAL

select  Employees.FIRST_NAME,Employees.LAST_NAME,departments.DEPARTMENT_ID,Departments.DEPARTMENT_NAME from Employees
left join Departments
on Departments.DEPARTMENT_ID=Employees.DEPARTMENT_ID
where Employees.DEPARTMENT_ID=80
order by LAST_NAME asc