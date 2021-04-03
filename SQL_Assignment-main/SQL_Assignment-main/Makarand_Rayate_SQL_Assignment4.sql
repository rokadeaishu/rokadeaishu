select * from superstore.cust_dimen;
select * from superstore.market_fact;
select * from superstore.orders_dimen;
select * from superstore.prod_dimen;
select * from superstore.shipping_dimen;

#Que_1_=============================================================================================
select Customer_Name  as `Customer Name`,
Customer_Segment as `Customer Segment`
from superstore.cust_dimen;

#Que_2_=============================================================================================
select * from superstore.cust_dimen order by 1 desc;

#Que 3 ==============================================================================================
select Order_ID , Order_Date from superstore.orders_dimen where Order_Priority = 'HIGH';

#Que 4 =============================================================================================
select sum(Sales) as total_sales,avg(Sales) as avg_sales from superstore.market_fact;

#Que 5 =============================================================================================
select max(Sales) as max_sale,min(Sales) as min_sale from superstore.market_fact;

#Que 6 =============================================================================================
select Region,count(Customer_Name) as 'Number_of_Customers' from superstore.cust_dimen group by Region 
order by count(Customer_Name) desc;

#Que 7 ==============================================================================================
select Region,count(customer_name) as 'Number_of_Customers' from superstore.cust_dimen group by Region 
order by count(Customer_Name) desc limit 1 ;

#Que 8 ================================================================================================
select Customer_Name, count(*) as num_tables from 
superstore.market_fact s, superstore.cust_dimen c, superstore.prod_dimen p     
where s.Cust_id = c.Cust_id and s.Prod_id = p.Prod_id and 
p.Product_Sub_Category = 'TABLES' and c.Region = 'ATLANTIC'     
group by Customer_Name;

#Que 9 ==============================================================================================
select Customer_Name,count(*) as `no of small business owners` from superstore.cust_dimen 
where Customer_Segment = 'SMALL BUSINESS' and Province = 'ONTARIO'
group by Customer_Name;

#Que 10 ==============================================================================================
select Prod_id,count(*) as `no_of_products sold` from superstore.market_fact group by Prod_id 
order by count(`no_of_products sold`) desc;

#Que 11 ==============================================================================================
select Prod_id,Product_Sub_Category from superstore.prod_dimen
where Product_Category='FURNITURE' or Product_Category='TECHNOLOGY'
group by Prod_id;

#Que 12 =================================================================================================
select Product_Category,Profit from superstore.market_fact s,superstore.prod_dimen p
where s.Prod_id = p.Prod_id
group by Product_Category order by Profit desc;

#Que 13 =====================================================================================================
select Product_Category,Product_Sub_Category,Profit from superstore.market_fact s,superstore.prod_dimen p
where s.Prod_id = p.Prod_id;

#Que 14 =====================================================================================================
select Order_Date,Order_Quantity,Sales from superstore.market_fact s, superstore.orders_dimen c
where s.Ord_id = c.Ord_id;

#Que 15 ======================================================================================================
select Customer_Name from superstore.cust_dimen 
where Customer_Name like '_R%' and Customer_Name like '___D%';

#Que 16 ===================================================================================================
select 	c.Cust_id,s.Sales,c.Customer_Name,c.Region from superstore.market_fact s,superstore.cust_dimen c
where s.Cust_id = c.Cust_id and Sales between 1000 and 5000;

#Que 17 ======================================================================================================
select min(Sales) as `3rd highest salary` 
FROM (  
select Sales from superstore.market_fact order by Sales desc limit 3
 ) as a;

#Que 18 =====================================================================================================
select Region,count(Ship_id) as no_of_shipment,sum(Profit) as profit_in_each_region from 
superstore.cust_dimen c,superstore.market_fact s,superstore.prod_dimen p
where c.Cust_id = s.Cust_id and s.Prod_id = p.Prod_id
group by Region
order by profit_in_each_region asc;
