create database Sales_Pizza;

Select *
from pizza_sales;


Create view TotalRevenue as
Select sum(Total_price) as TotalRevene
from pizza_sales;

Alter view Avg_Order_value as
select cast(sum(Total_price)/count(distinct order_id) as Decimal(10,2)) as Avg_Order_value
from pizza_sales;

create view TotalOrders as
select count(Distinct order_id) as TotalOrders 
from pizza_sales;

ALTER VIEW TotalOrders AS
SELECT COUNT(DISTINCT order_id) AS TotalOrders
FROM pizza_sales;


create view TotalPizza_Sold as
select sum(quantity) as Total_pizza_Sold
from pizza_sales;


create view Avg_PizzaPerOrder as
select cast(cast(sum(quantity) as Decimal(10,2)) / cast(count(Distinct order_id) as Decimal(10,2)) as Decimal (10,2)) as Avg_PizzaPerOrder
from pizza_sales;

alter view Daily_Trend_TotalOrders as
Select DateName(DW,order_date) as Order_day,count(Distinct order_id) as TotalOrders
from pizza_sales
Group by DateName(DW,order_date);

Alter view Monthly_Trend_TotalOrders as
select DateName(Month,order_id) as Order_Month,count(Distinct order_id) as TotalOrders
from pizza_sales
Group by DateName(Month,order_id)


Create view Percentage_Sales_PizzaCategory as
select pizza_category,sum(Total_Price) as TotalRevenue,sum(Total_Price) * 100 / (select sum(Total_Price) as TotalRevenue from pizza_sales) as PCT
from pizza_sales
Group by pizza_category;

Alter view Percentage_Sales_PizzaCategory as
select pizza_category,Cast(sum(Total_Price) as Decimal(10,2)) as TotalRevenue,Cast(sum(Total_Price) * 100 / (select sum(Total_Price) as TotalRevenue from pizza_sales) as Decimal(10,2)) as PCT
from pizza_sales
Group by pizza_category;



CREATE VIEW PizzaSoldByCategory_February AS
SELECT
    Top 10 SUM(quantity) AS TotalPizzaSold,
    pizza_category
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY TotalPizzaSold DESC;





Create view Top5pizza_byOrders as
select top 5 count(order_id) as Totalorders,pizza_name
from pizza_sales
group by pizza_name
order by Totalorders desc 

Create view Bottum_pizza_byOrders as
select top 5 count(order_id) as Totalorders,pizza_name
from pizza_sales
group by pizza_name
order by Totalorders asc


create view Top_pizza_ByQuantity as
select Top 5 sum(quantity) as TotalQuantity,pizza_name
from pizza_sales
Group by pizza_name
order by TotalQuantity desc

create view Bottum_pizza_ByQuantity as
select Top 5 sum(quantity) as TotalQuantity,pizza_name
from pizza_sales
Group by pizza_name
order by TotalQuantity asc




select Top 5 sum(total_price) as TotalRevenue,count(order_id) as Totalorders,sum(quantity) as TotalQuantity,pizza_name
from pizza_sales
Group by pizza_name
order by TotalRevenue asc

CREATE VIEW Top5PizzasByRevenue AS
SELECT TOP 5
    SUM(total_price) AS TotalRevenue,
    COUNT(DISTINCT order_id) AS TotalOrders,
    SUM(quantity) AS TotalQuantity,
    pizza_name
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TotalRevenue DESC;


CREATE VIEW Bottom5PizzasByRevenue AS
SELECT TOP 5
    SUM(total_price) AS TotalRevenue,
    pizza_name
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TotalRevenue ASC;






















