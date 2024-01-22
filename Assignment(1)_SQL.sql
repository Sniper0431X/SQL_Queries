--BASIC QUESTIONS
--1) Create two Databases Name :- Brands , and  Products

create database Brands
create database Products

--2) Create two tables in SQL Server  name  as ITEMS_Table in Brands database and PRODUCT_Table in Products database.

use Brands

create table ITEMS_Table (
Item_Id	int,Item_Description varchar(max),Vendor_Nos int,
Vendor_Name varchar(max),Bottle_Size int,Bottle_Price float
)

select * from ITEMS_Table

use Products
create table PRODUCT_Table (
Product_Id int,Country varchar(max),Product varchar(max),
Units_Sold float,Manufacturing_Price float,Sale_Price float,Gross_Sales float,
Sales float,COGS float,Profit float,Date varchar(max),Month_Number int,Month_Name varchar(max),Year int
)

select * from PRODUCT_Table

--3)  After Creating both the tables Add records in that tables 

use Brands

insert into ITEMS_Table values (
1,'Travis Hasse Apple Pie',305,'Mhw Ltd',750,9.77)
,(2,'D''aristi Xtabentun',391,'Anchor Distilling (preiss Imports)',750,14.12)
,(3,'Hiram Walker Peach Brandy',370,'Pernod Ricard Usa/austin Nichols',1000,6.5)
,(4,'Oak Cross Whisky',305,'Mhw Ltd',750,'25.33')
,(5,'Uv Red(cherry) Vodka',380,'Phillips Beverage Company',200,'1.97')
,(6,'Heaven Hill Old Style White Label',259,'Heaven Hill Distilleries Inc.',750,6.37)
,(7,'Hyde Herbal Liqueur',194,'Fire Tail Brands Llc',750,'5.06')
,(8,'Dupont Calvados Fine Reserve',403,'Robert Kacher Selections',750,23.61)
select * from ITEMS_Table

use Products
insert into PRODUCT_Table values (
1,'Canada','Carretera',1618.5,3,20,32370,32370,16185,16185,'01-01-2014',1,'January',2014)
,(2,'Germany','Carretera',1321,3,20,26420,26420,13210,13210,'01-01-2014',1,'January',2015)
,(3,'France','Carretera',2178,3,15,32670,32670,21780,10890,'01-06-2014',6,'June',2016)
,(4,'Germany','Carretera',888,3,15,13320,13320,8880,4440,'01-06-2014',6,'June',2017)
,(5,'Mexico','Carretera',2470,3,15,37050,37050,24700,12350,'01-06-2014',6,'June',2018)
,(6,'Germany','Carretera',1513,3,350,529550,529550,393380,136170,'01-12-2014',12,'December',2019)
,(7,'Germany','Montana',921,5,15,13815,13815,9210,4605,'01-03-2014',3,'March',2020)
,(8,'Canada','Montana',2518,5,12,30216,30216,7554,22662,'01-06-2014',6,'June',2021)
select * from PRODUCT_Table

--4) Delete those product having the Units Sold 1618.5 , 888 and 2470.
Use Products
select * from PRODUCT_Table

delete PRODUCT_Table where Units_Sold in (1618.5,888,2470)
select * from PRODUCT_Table

--5) DROP the table and Create it again.
 
 drop table PRODUCT_Table

 create table PRODUCT_Table (
Product_Id int,Country varchar(max),Product varchar(max),
Units_Sold float,Manufacturing_Price float,Sale_Price float,Gross_Sales float,
Sales float,COGS float,Profit float,Date varchar(max),Month_Number int,Month_Name varchar(max),Year int
)

insert into PRODUCT_Table values (
1,'Canada','Carretera',1618.5,3,20,32370,32370,16185,16185,'01-01-2014',1,'January',2014)
,(2,'Germany','Carretera',1321,3,20,26420,26420,13210,13210,'01-01-2014',1,'January',2015)
,(3,'France','Carretera',2178,3,15,32670,32670,21780,10890,'01-06-2014',6,'June',2016)
,(4,'Germany','Carretera',888,3,15,13320,13320,8880,4440,'01-06-2014',6,'June',2017)
,(5,'Mexico','Carretera',2470,3,15,37050,37050,24700,12350,'01-06-2014',6,'June',2018)
,(6,'Germany','Carretera',1513,3,350,529550,529550,393380,136170,'01-12-2014',12,'December',2019)
,(7,'Germany','Montana',921,5,15,13815,13815,9210,4605,'01-03-2014',3,'March',2020)
,(8,'Canada','Montana',2518,5,12,30216,30216,7554,22662,'01-06-2014',6,'June',2021)
select * from PRODUCT_Table

--INTERMIDIATE  QUESTIONS
--Big Table :--
--1) Find the Total Sale Price  and  Gross Sales.
use Products

select * from PRODUCT_Table

select sum(Sales) as [Total Sales],Sum(Gross_Sales) as [Total Gross Sales] from PRODUCT_Table

--2) In which year we have got the highest sales.

Select Year from PRODUCT_Table where Sales=(Select max(Sales) From PRODUCT_Table)

--3)  Which Product having the sales of $ 37,050.00.

Select Product from  PRODUCT_Table where Sales=37050.00

--4) Which Countries lies between profit of $ 4,605 to $  22 , 662.00.

Select Country from PRODUCT_Table where Profit between 4605.00 and 22662.00

--5) Which Product Id having the Cost of Goods sales of $ 24 , 700.00.

Select Product_Id from  PRODUCT_Table where COGS=24700.00

--Small Table :--
--1) Find the item_description having the bottle size of 750.
use Brands
select * from ITEMS_Table
select Item_Description From ITEMS_Table where Bottle_Size=750

--2) Find the vendor Name having the vendor_nos 305,380,391.

select Vendor_Name From ITEMS_Table where Vendor_Nos in (305,380,391)

--3) What is total Bottle_price.

select sum(Bottle_Price) 'Total Bottle price' from ITEMS_Table

--4) Make Primary Key to Item_id

alter table Items_Table alter column Item_Id int not null
alter table ITEMS_Table add primary key(Item_Id)
select * from ITEMS_Table

--5) Which item id having the bottle_price of $ 5.06

select Item_Id from ITEMS_Table where Bottle_Price=5.06

--Advance Questions:--
--1) Apply INNER  , FULL OUTER , LEFT JOIN types on both the table.
use Brands
select * from ITEMS_Table
use Products
select * from PRODUCT_Table
select Item_Description,Vendor_Nos,Vendor_Name,Bottle_Size,Bottle_Price,Country,Product,Units_Sold,Manufacturing_Price,Sale_Price,Gross_Sales,Sales,COGS,Profit,Date,Month_Number,Month_Name,Year from [Brands].[dbo].[ITEMS_Table]
inner join [Products].[dbo].[PRODUCT_Table]
on [Brands].[dbo].[ITEMS_Table].Item_Id=[Products].[dbo].[PRODUCT_Table].Product_Id

select Item_Description,Vendor_Nos,Vendor_Name,Bottle_Size,Bottle_Price,Country,Product,Units_Sold,Manufacturing_Price,Sale_Price,Gross_Sales,Sales,COGS,Profit,Date,Month_Number,Month_Name,Year from [Brands].[dbo].[ITEMS_Table]
full outer join [Products].[dbo].[PRODUCT_Table]
on Item_Id=Product_Id

select Item_Description,Vendor_Nos,Vendor_Name,Bottle_Size,Bottle_Price,Country,Product,Units_Sold,Manufacturing_Price,Sale_Price,Gross_Sales,Sales,COGS,Profit,Date,Month_Number,Month_Name,Year from [Brands].[dbo].[ITEMS_Table]
left join [Products].[dbo].[PRODUCT_Table]
on Item_Id=Product_Id

--2) Apply  OUTER  ,  RIGHT JOIN , CROSS JOIN types  on both the table

select Item_Description,Vendor_Nos,Vendor_Name,Bottle_Size,Bottle_Price,Country,Product,Units_Sold,Manufacturing_Price,Sale_Price,Gross_Sales,Sales,COGS,Profit,Date,Month_Number,Month_Name,Year from [Brands].[dbo].[ITEMS_Table]
right join [Products].[dbo].[PRODUCT_Table]
on Item_Id=Product_Id

select Item_Description,Vendor_Nos,Vendor_Name,Bottle_Size,Bottle_Price,Country,Product,Units_Sold,Manufacturing_Price,Sale_Price,Gross_Sales,Sales,COGS,Profit,Date,Month_Number,Month_Name,Year from [Brands].[dbo].[ITEMS_Table]
cross join [Products].[dbo].[PRODUCT_Table]

--3) Find the item_description and Product having the gross sales of 13,320.00

select Item_Description,Product from [Brands].[dbo].[ITEMS_Table]
Left join [Products].[dbo].[PRODUCT_Table]
on Item_Id=Product_Id where Gross_Sales=13320.00

--4)   Split the Item_description Column into Columns Item_desc1 and Item_desc2.
use Brands
select Item_description,
left(Item_Description,charindex(' ',Item_Description,1)-1) AS Item_desc1,
left(Item_description,len(Item_description)-charindex(' ',Item_Description,1)) AS Item_desc2
from ITEMS_Table
