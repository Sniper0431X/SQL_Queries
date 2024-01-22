--Task 1:-
--1.create University Database give any University name you want.

create database Boston_University

--4. Under this University Create four tables and each table should have following three Column named as:-
use Boston_University

create table College_Table (
    College_ID int primary key,
    College_Name varchar(max),
    College_Area varchar(max)
)

create table Department_Table (
    Dept_ID int primary key,
    Dept_Name varchar(max),
    Dept_Facility varchar(max)
)

create table Professor_table (
    Professor_ID int primary key,
    Professor_Name varchar(max),
    Professor_Subject varchar(max)
)

create table Student_table (
    Student_ID int primary key,
    Student_Name varchar(max),
    Student_Stream varchar(max)
)

--4. Apply foreign key on Department key from College_table.
ALTER TABLE Department_Table ADD FOREIGN KEY (Dept_ID) REFERENCES College_Table(College_ID)

--1. Apply foreign Key on Student_Table from Professor_Table.
ALTER TABLE Student_Table ADD FOREIGN KEY (Student_ID) REFERENCES Professor_Table(Professor_ID)

--5. Insert atleast 10 Records in each table.

insert into College_Table values
(101, 'Engineering College', 'Science Area'),
(102, 'Business School', 'Business Area'),
(103, 'Arts College', 'Arts Area'),
(104, 'Medical College', 'Health Sciences Area'),
(105, 'Law School', 'Law Area'),
(106, 'Computer Science College', 'Technology Area'),
(107, 'Social Sciences College', 'Social Sciences Area'),
(108, 'Education College', 'Education Area'),
(109, 'Nursing College', 'Health Sciences Area'),
(110, 'Music and Fine Arts College', 'Arts Area')


insert into Department_Table values
(101, 'Computer Science', 'Computer Labs'),
(102, 'Business Administration', 'Conference Rooms'),
(103, 'Physics', 'Research Labs'),
(104, 'Medicine', 'Hospital Facilities'),
(105, 'Law', 'Moot Court'),
(106, 'Psychology', 'Counseling Center'),
(107, 'History', 'Archives'),
(108, 'Education', 'Classrooms'),
(109, 'Nursing', 'Clinical Labs'),
(110, 'Visual Arts', 'Art Studios')


insert into Professor_table values
(101, 'Dr. John Smith', 'Computer Networks'),
(102, 'Prof. Emily Davis', 'Marketing'),
(103, 'Dr. Michael Johnson', 'Theoretical Physics'),
(104, 'Dr. Sarah Anderson', 'int primary keyernal Medicine'),
(105, 'Prof. Robert Thompson', 'Constitutional Law'),
(106, 'Dr. Jessica Taylor', 'Clinical Psychology'),
(107, 'Prof. David Brown', 'Medieval History'),
(108, 'Dr. Jennifer White', 'Pedagogy'),
(109, 'Prof. Nancy Miller', 'Nursing Ethics'),
(110, 'Dr. Alexander Turner', 'Fine Arts')


insert into Student_table values
(101, 'Alice Johnson', 'Computer Science'),
(102, 'Bob Williams', 'Business Administration'),
(103, 'Charlie Davis', 'Physics'),
(104, 'Diana Miller', 'Medicine'),
(105, 'Edward Brown', 'Law'),
(106, 'Fiona Taylor', 'Psychology'),
(107, 'George White', 'History'),
(108, 'Helen Turner', 'Education'),
(109, 'Ivy Thompson', 'Nursing'),
(110, 'Jackie Taylor', 'Visual Arts')

select * from College_Table
select * from Professor_table
select * from Department_Table
select * from Student_table

--Task 2:-
--1.	Give the information of College_ID and College_name from College_Table

select College_ID,College_Name from College_Table

--2.	Show  Top 5 rows from Student table.
select top 5 * from Student_table

--3.	What is the name of  professor  whose ID  is 5
select Professor_Name from  Professor_table where Professor_ID=105

--4.	Convert the name of the Professor into Upper case.
update Professor_table set Professor_Name = upper(Professor_Name)

--5.	Show me the names of those students whose name is start with 'A'.
select Student_Name from Student_table where left(Student_Name,1)='A'

--6.	Give the name of those colleges whose end with 'A'.
select College_Name from College_Table where right(College_Name,1)='A'

--7.	 Add one Salary Column in Professor_Table
alter table Professor_Table add Salary int

--8.	Add one Contact Column in Student_table
alter table Student_Table add Contact int

--9.	Find the total Salary of Professor.
select sum(salary) [Total of Salary] from Professor_table

--10.	Change datatype of any one column of any one Table
alter table Professor_table alter column Salary float

--Task 3---
--1.	Show first 5 records from Students table and Professor table Combine
select top 5 * from Student_table
left join Professor_table
on Student_table.Student_ID=Professor_table.Professor_ID

--2.	Apply Inner join on all 4 tables together
select * from College_Table
inner join Department_Table
on Department_Table.Dept_ID=College_Table.College_ID
inner join Professor_table
on Department_Table.Dept_ID=Professor_table.Professor_ID
inner join Student_table
on Department_Table.Dept_ID=Student_table.Student_ID

--3.	Show Some null values from Department table and Professor table.
SELECT *
FROM Department_Table
WHERE Dept_ID IS NULL OR Dept_Name IS NULL OR Dept_Facility IS NULL

SELECT *
FROM Professor_table
WHERE Professor_ID IS NULL or Professor_Name IS NULL or Professor_Subject IS NULL or Salary is null

--4.	Create a View from College Table  and give those records whose college name starts with C
create view College_Table_Veiw
as
select * from College_Table where left (College_Name,1)='C'

select * from College_Table_Veiw
--5.	Create Stored Procedure  of Professor table whatever customer ID will be given by user it should show whole records of it.
create procedure Para_Professor_Table
@ProfID int
as
begin
select * from Professor_table where Professor_ID=@ProfID
end

execute Para_Professor_Table '102'

select * from Professor_table

--6.	Rename the College_Table to College_Tables_Data .
sp_rename 'College_Table','College_Tables_Data'
select * from College_Tables_Data