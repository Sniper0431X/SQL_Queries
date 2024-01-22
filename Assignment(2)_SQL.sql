--Q1) Create   Database Name as Order_Stores_Data 
create database Order_Stores_Data
use Order_Stores_Data

--Q2) Create two Table names as Orders_Table and Stores_Table
create table Orders_Table (
OrderDate varchar(max),Region varchar(max),Rep varchar(max),Order_Item varchar(max),Units int,Unit_Cost float,Total_Price float,Order_Id int
)

create table Stores_Table (
Store_Id int ,Store_Type varchar(max),Assortment int,Competition_Distance float,Month int,Year int,Promo_Interval varchar(max)
)

--Q3) Insert All records present here in the Orders_table and Stores_Table.
insert into Orders_Table values ('06-01-2021','East','Aruna','Pencil',95,1.99,189.05,1)
,('23-01-2021','Central','Kivell','Eraser',50,19.99,999.5,2)
,('09-02-2021','Central','Ganesh','',36,4.99,179.64,3)
,('26-02-2021','Central','Payal','',27,19.99,539.73,4)
,('15-03-2021','West','Sorvino','',56,2.99,167.44,5)
,('01-04-2021','East','Hitesh','Pencil',60,4.99,299.4,6)
,('18-04-2021','Central','Akshita','',75,1.99,149.25,7)
,('05-05-2021','Central','Ruchika','Books',90,4.99,449.1,8)
,('22-05-2021','West','Surbhi ','',32,1.99,63.68,9)
,('08-06-2021','East','Jones','Suitcase',60,8.99,539.4,10)
select * from Orders_Table

insert into Stores_Table values (1,'c',22,1270,9,2008,'Jan')
,(2,'a',22,570,11,2007,'Feb')
,(3,'a',22,14130,12,2006,'Mar')
,(4,'c',37,620,9,2009,'')
,(5,'a',18,29910,4,2015,'May')
,(6,'a',14,310,12,2013,'June')
,(7,'a',37,24000,4,2013,'')
,(8,'a',13,7520,10,2014,'Aug')
,(9,'a',28,2030,8,2000,'')
,(10,'a',45,3160,9,2009,'Oct')
select * from Stores_Table

--Q3) Make Order_Id  Column as Primary Key.
select * from Orders_Table
alter table Orders_Table alter column Order_Id int not null
alter table Orders_Table add primary key(Order_Id)

--Q4) Add one Column Name  as Store_Names and insert the records given above in Stores table.
alter table Stores_Table add Store_Name varchar(max)
update Stores_Table set Store_Name='Car' where Store_Id=1
update Stores_Table set Store_Name='Bikes' where Store_Id=2
update Stores_Table set Store_Name='Hardware' where Store_Id=3
update Stores_Table set Store_Name='Electrics' where Store_Id=4
update Stores_Table set Store_Name='Fibers' where Store_Id=5
update Stores_Table set Store_Name='Elastics' where Store_Id=6
update Stores_Table set Store_Name='Books' where Store_Id=7
update Stores_Table set Store_Name='Shoes' where Store_Id=8
update Stores_Table set Store_Name='Clothes' where Store_Id=9
update Stores_Table set Store_Name='Scraps' where Store_Id=10
select * from Stores_Table

--Q5) Make Stored_Id as a Foreign Key with reference too Orders_Table 
select * from Stores_Table
select * from Orders_Table
alter table Stores_Table add foreign key (Store_Id) references Orders_Table(Order_Id)

--Q6) Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet
Select * from Orders_Table
update Orders_Table set Order_Item='Compass' where Order_Id=3
update Orders_Table set Order_Item='Torch' where Order_Id=4
update Orders_Table set Order_Item='Phone' where Order_Id=5
update Orders_Table set Order_Item='Laptop' where Order_Id=7
update Orders_Table set Order_Item='Box' where Order_Id=9

--Q7) Update the missing records in the PromoInterval Column in Stores Table.
select * from Stores_Table
update Stores_Table set Promo_Interval='Apr' where Store_Id=4
update Stores_Table set Promo_Interval='July' where Store_Id=7
update Stores_Table set Promo_Interval='Sept' where Store_Id=9

--Q8) Rename the column name  of Assortment to Store_Nos in Stores_Table.
sp_rename 'Stores_Table.Assortment','Store_Nos','Column'
select * from Stores_Table

--Q9) Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table.
sp_rename 'Orders_Table.Order_Item','Item_Name','column'
sp_rename 'Orders_Table.Rep','Customers_Name','column'
select* from Orders_Table

--Q10) Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order.
select Unit_Cost from Orders_Table
order by Unit_Cost desc

select Total_Price from Orders_Table
order by Unit_Cost asc

--Q11) Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region.
select * from Orders_Table
sp_rename 'Orders_Table.Customers_Name','Cus_Name','column'

select Cus_Name from Orders_Table where Region='East'
select Cus_Name from Orders_Table where Region='West'
select Cus_Name from Orders_Table where Region='Central'

--Q12) Find the sum of Total_Price Column and Unit Cost  in Orders_Table 
select sum(Total_Price) as [Total of Total price],sum(Unit_Cost) as [Total of Unit Cost] from Orders_Table

--Q13) Show me OrderDate,Unit_Cost,StoreType and Year in One table and names that table as Order_Stores_Table.
select * from Stores_Table
select * from Orders_Table

select OrderDate,Unit_Cost,Store_Type,Year from Orders_Table
right join Stores_Table
on Stores_Table.Store_Id=Orders_Table.Order_Id

--Q14)  Give me Order_Item>(Item_Name)  and Region whose Order_Id is 4 , 5, 6 ,9
select Item_Name,Region from Orders_Table where Order_Id in (4,5,6,9)

--Q15) Show me year  whose ComptetitionDistance is 29910  , 310 , 3160
select Year from Stores_Table where Competition_Distance in (29910,310,3160)

--Q16)  Give me that Item_name whose  Total_Price is greater than 200 and less than 400
select Item_Name from Orders_Table where Total_Price between 200 and 400

--Q17) Rename the CompetitionDistance as CD and find the total CD in Stores_Table.
sp_rename 'Stores_Table.Competition_Distance','CD','column'
select sum(CD) as [Total CD] from Stores_Table

--Q18) What is the Total Count of Stores_Type and CD columns
Select count(Store_Type) 'Total Count of Store',count(CD) 'Total Count of CD' from Stores_Table

--Q19) Apply the Cross Join in  Orders_Table and Stores_Table.
select * from Stores_Table
select * from Orders_Table

select OrderDate,Region,Cus_Name,Item_Name,Units,Unit_Cost,
Total_Price,Order_Id,Store_Id,Store_Type,Store_Nos,CD,
Month,Year,Promo_Interval,Store_Name from Orders_Table
cross join Stores_Table


--Q20) DROP both the databases
drop table Orders_Table
drop table Stores_Table