--Create a Student table and ADD 20 records in them
create table Student (
Student_Id int,Name varchar(max),Surname varchar(max),Birth_Date varchar(max),
Gender varchar(max),Class varchar(max),Point Float
)

-- Insert 20 records into Student table
insert into Student values
(1, 'John', 'Doe', '05-01-1989', 'M', '9Math', 85),
(2, 'Jane', 'Smith', '10-02-1989', 'F', '10Sci', 78),
(3, 'Alice', 'Johnson', '15-03-1990', 'F', '8Eng', 92),
(4, 'Bob', 'Williams', '20-04-1988', 'M', '10Bio', 75),
(5, 'Eva', 'Miller', '25-05-1990', 'F', '8Math', 88),
(6, 'David', 'Jones', '30-06-1991', 'M', '8His', 79),
(7, 'Sophia', 'Brown', '07-05-1988', 'F', '10Chem', 95),
(8, 'Michael', 'Anderson', '10-08-1989', 'M', '10Sci', 86),
(9, 'Katie', 'Taylor', '15-09-1988', 'F', '10Eng', 91),
(10, 'James', 'White', '20-10-1988', 'M', '10Bio', 73),
(11, 'Ava', 'Martin', '25-11-1989', 'F', '10Math', 87),
(12, 'Daniel', 'Thompson', '30-12-1989', 'M', '11His', 80),
(13, 'Emma', 'Harris', '05-01-1990', 'F', '9Chem', 94),
(14, 'William', 'Clark', '10-02-1988', 'M', '10Sci', 84),
(15, 'Mia', 'Lewis', '15-03-1988', 'F', '10Eng', 89),
(16, 'Alexander', 'Turner', '20-04-1989', 'M', '10Bio', 72),
(17, 'Charlotte', 'Wright', '25-05-1991', 'F', '9Math', 91),
(18, 'Robbert', 'Stark', '30-06-1991', 'M', '8His', 78),
(19, 'Abigail', 'Evans', '05-07-1992', 'F', '8Chem', 93),
(20, 'Kevin', 'Baker', '10-08-1988', 'M', '10Sci', 88)

-- Example 1: List all records in the Student table
select * from Student

-- Example 2: List Name, Surname, and Class of students
select Name, Surname, Class from Student

-- Example 3: List Female (F) records in the Student table
select * from Student where Gender = 'F'

-- Example 4: List names of each class
select distinct Class from Student

-- Example 5: List Female students in class 10Math
select * from Student where Gender = 'F' AND Class = '10Math'

-- Example 6: List names, surnames, and classes of students in class 10Math or 10Sci
select Name, Surname, Class from Student where Class = '10Math' or Class = '10Sci'

-- Example 7: List students, name, surname, and school_Id in the student table.
select Name, Surname, Student_Id from Student

-- Example 8: List students' name and surname combined
select CONCAT(Name, ' ', Surname) AS 'Full Name' from Student

-- Example 9: List students with names starting with "A" 
select * from Student where left (Name,1)='A'

-- Example 10: List book names and pages count with pages between 50 and 200 in the Book table.
---------------------Read Carefully This Example 10 If it's wrong------------------------------.

-- Example 11: List students with names Emma, Sophia, and Robert
select * from Student where Name IN ('Emma', 'Sophia', 'Robert')

-- Example 12: List students with names starting with A, D, and K
select * from Student where left (Name,1) in('A','D','K')

-- Example 13: List names, surnames, classes, and genders of males in 9Math or females in 9His
select Name, Surname, Class, Gender from Student where Gender in ('M','F') and Class = '9Math' or Class = '9His'

-- Example 14: List males in classes 10Math or 10Bio
select * from Student where Gender = 'M' AND Class = '10Math' or Class = '10Bio'

-- Example 15: List students with birth year 1989
select * from Student where right (Birth_Date,4)=1989