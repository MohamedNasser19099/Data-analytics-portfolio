Select *
from superstore;

create view Average_Order_Value as
select cast(sum(profit) / count(distinct Order_ID) as Decimal(4,2)) as Average_Order_Value
from Superstore;


create view Categories_Performance as
select category,sum(profit) as TotalRevenue
from Superstore
Group by category;


create view Declining_Products as
select Product_Name,sum(Sales) as TotalSales
from Superstore
Group by Product_Name;


create view Regions_underperforming as
select Region,sum(Profit) as TotalRevenue
from Superstore
Group by Region


create view RevenueOverTime as
select Month,sum(profit) as TotalRevenue
from Superstore
Group by Month;


create view Top_ten_customers as
select Top 10 Customer_Name, count(Order_ID) as TotalOrders
from Superstore
Group by Customer_Name
Order by TotalOrders desc;



create view Top_ten_customers_Revenue as
select Top 10 Customer_Name,sum(profit) as TotalRevenue
from Superstore
Group by Customer_Name
Order by TotalRevenue desc



create view Top_ten_Products as
select Top 10 Product_Name,sum(profit) as TotalRevenue
from Superstore
Group by Product_Name
Order by TotalRevenue desc



create view Total_Revenue as
select sum(profit) as TotalRevenue
from Superstore



create view TotalOrders as
select count(Order_ID) as TotalOrders
from Superstore

