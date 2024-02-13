--Capstone Project-----
--Customer_Orders_Products Database.

create database Customers_Orders_Products
use Customers_Orders_Products

create table Customers(CustomerId int primary key,Name varchar(50),Email varchar(100))
select * from Customers

INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com')
 
 CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
)

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1)
  select * from Orders

  CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
)

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99)
  select * from Products


--  Task 1 :-
--1.	Write a query to retrieve all records from the Customers table.

select * from Customers

--2.	Write a query to retrieve the names and email addresses of customers whose names start with 'J'.

select Name,Email from Customers where left (Name,1) = 'J'

--3.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders..
Select OrderID, ProductName, Quantity from Orders

--4.	Write a query to calculate the total quantity of products ordered.
select * from Orders
select * from Customers
select * from Products

select sum(quantity) as [Total quantity of products] from Orders

--5.	Write a query to retrieve the names of customers who have placed an order.

select Name from Customers where CustomerId in (select CustomerId from Orders)

--6.	Write a query to retrieve the products with a price greater than $10.00.

select * from Products where Price > 10.00

--7.	Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.

select Name,OrderDate from Customers
left join Orders
on Customers.CustomerId=Orders.CustomerID
where OrderDate >= '2023-07-05'

--8.	Write a query to calculate the average price of all products.

select avg(Price) 'Average price' from Products

--9.	Write a query to retrieve the customer names along with the total quantity of products they have ordered.

Select Name,Quantity from Customers
left join Orders
on Customers.CustomerId=Orders.CustomerID

--10.	Write a query to retrieve the products that have not been ordered.

select ProductName from Products
except
select ProductName from Orders

--Task 2 :-
--1.	Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.

select top 5 * from Orders
Order by Quantity desc

--2.	Write a query to calculate the average price of products for each product category.

select ProductName,avg(Price) AVG_Price from Products
group by ProductName  

--3.	Write a query to retrieve the customers who have not placed any orders.

select * from Customers where CustomerId in (select CustomerId from Customers
except
select CustomerId from Orders)

--4.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M'.

select OrderID,ProductName,Quantity
from Orders where CustomerID in (select CustomerID from Customers where left (Name,1) = 'M')

--5.	Write a query to calculate the total revenue generated from all orders.

select sum(O.Quantity * P.Price) TotalRevenue from Orders O
left join Products P
on O.ProductName = P.ProductName

--6.	Write a query to retrieve the customer names along with the total revenue generated from their orders.

select C.Name,sum(O.Quantity * P.Price) TotalRevenue from Orders O
left join Products P
on O.ProductName = P.ProductName
left join Customers C
on C.CustomerId = O.CustomerID
group by C.Name

--7.	Write a query to retrieve the customers who have placed at least one order for each product category.

SELECT C.CustomerID, C.Name
FROM Customers C
WHERE NOT EXISTS (
  SELECT 1 FROM Products P
  WHERE NOT EXISTS (
    SELECT 1 FROM Orders O
    WHERE O.CustomerID = C.CustomerID AND O.ProductName = P.ProductName
  )
)

--8.	Write a query to retrieve the customers who have placed orders on consecutive days.
with t1
as
(select Name,right(OrderDate,2)-row_number() over (order by OrderDate) as ConsecDay from Orders
left join Customers
on Customers.CustomerId=Orders.CustomerID)
select Name from t1 where ConsecDay in (
select ConsecDay from (select ConsecDay,count(ConsecDay) as num from t1 
group by ConsecDay) t2
where num > 1)


--9.	Write a query to retrieve the top 3 products with the highest average quantity ordered.
select top 3 ProductName,avg(Quantity) HighestAvgQuantity from Orders
group by ProductName
order by avg(Quantity) desc

select * from Orders

--10.	Write a query to calculate the percentage of orders that have a quantity greater than the average quantity.
select count(Quantity)* 100/(select count(Quantity) from Orders) as Order_Percentage from Orders
where Quantity > (select avg(Quantity) from Orders)

--Task 3:-
--1.	Write a query to retrieve the customers who have placed orders for all products.
select * from Customers where CustomerID in (select CustomerId from Orders where ProductName not in (
select distinct (ProductName) from Products))

--2.	Write a query to retrieve the products that have been ordered by all customers.
Select distinct(ProductName) from Orders

--3.	Write a query to calculate the total revenue generated from orders placed in each month.
select Month(OrderDate) as 'Month',sum(Price* Quantity) as 'Total_Revenue_Generated' from Orders
join Products
on Orders.ProductName=Products.ProductName
group by month(OrderDate)

--4.	Write a query to retrieve the products that have been ordered by more than 50% of the customers.
with CTE_New
as
(select ProductName,count(ProductName) as Ordered_Product FROM Orders group by ProductName)
select * from CTE_New where Ordered_Product > (select count(CustomerID) from Orders) * 0.5

--5.	Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders.
with Orders_Revenue
as
(select CustomerID,sum(Price*Quantity) as 'Total_Revenue' from Orders
join Products
on Products.ProductName=Orders.ProductName
group by CustomerID)
select top 5 Name,Email,Total_Revenue from Customers
join Orders_Revenue
on Orders_Revenue.CustomerID=Customers.CustomerId
order by Total_Revenue desc

--6.	Write a query to calculate the running total of order quantities for each customer.
select CustomerID,sum(Quantity) as RunningTotal_order
FROM Orders
group by CustomerID

--7.	Write a query to retrieve the top 3 most recent orders for each customer.
select top 3* from Orders
order by OrderDate desc

--8.	Write a query to calculate the total revenue generated by each customer in the last 30 days.
select Name,Total_Revenue from Customers
join (select CustomerID,Sum(Quantity*Price) as Total_Revenue from Orders
left join Products
on Orders.ProductName=Products.ProductName
group by CustomerID) as t1
on t1.CustomerID=Customers.CustomerId
join Orders
on Orders.CustomerID=t1.CustomerID
where OrderDate between '2023-07-01' and '2023-07-30'

--9.	Write a query to retrieve the customers who have placed orders for at least two different product categories.
select Name from Customers
join (select CustomerID,count(distinct (ProductName)) as [Diff_Order_Count]  from Orders group by CustomerID) as t1
on Customers.CustomerId=t1.CustomerID
where [Diff_Order_Count] >=2

--10.	Write a query to calculate the average revenue per order for each customer.
select CustomerID,avg(Price*Quantity) Orders_Avg_Revenue from Orders
join Products
on Orders.ProductName= Products.ProductName
group by CustomerID

--11.	Write a query to retrieve the customers who have placed orders for every month of a specific year.
select CustomerId,Name from  Customers
where CustomerId in (select CustomerId from Orders where month(OrderDate) in ( 01,12) and year(OrderDate) in (select distinct(year(OrderDate)) from Orders))


--12.	Write a query to retrieve the customers who have placed orders for a specific product in consecutive months.
select * from (select *,row_number() over (Partition by ProductName order by OrderDate) as Consecutive_Day from Orders O where CustomerID in (select CustomerID from (select O.OrderID,O.CustomerID,C.Name,O.ProductName,O.OrderDate,row_number() over(Partition by C.Name,O.ProductName order by C.Name) as Consec_day From Customers C
join Orders O
on O.CustomerID=C.CustomerId) as T1 where Consec_day >=2)) as T2 where CustomerID not in (select CustomerID from (select *,row_number() over (Partition by ProductName order by OrderDate) as Consecutive_Day from Orders O where CustomerID in (select CustomerID from (select O.OrderID,O.CustomerID,C.Name,O.ProductName,O.OrderDate,row_number() over(Partition by C.Name,O.ProductName,year(OrderDate),month(OrderDate) order by C.Name) as Consec_day From Customers C
join Orders O
on O.CustomerID=C.CustomerId) as T1 where Consec_day >=2)) as T3)

--13.	Write a query to retrieve the products that have been ordered by a specific customer at least twice.
select OrderID,CustomerID,ProductName,OrderDate,Quantity from (select *,row_number() over (Partition by ProductName order by OrderDate) as Consecutive_Day from Orders O where CustomerID in (select CustomerID from (select O.OrderID,O.CustomerID,C.Name,O.ProductName,O.OrderDate,row_number() over(Partition by C.Name,O.ProductName order by C.Name) as Consec_day From Customers C
join Orders O
on O.CustomerID=C.CustomerId) as T1 where Consec_day >=2)) as T2