-- Day-04
/*
4- write a query to get all the orders where customer
name neither start with "A" and nor ends with "n"
*/
-- method 01
select * from Orders
where Customer_Name not like 'A%n'

-- method 02
select * from Orders
where not (Customer_Name like 'A%' and  Customer_Name like '%n')


-- Exploring Null
update  Orders
set City=null
where Order_ID in ('CA-2018-115812','CA-2018-115812','US-2019-118983');

select * from Orders
where Order_ID in ('CA-2018-115812','CA-2018-115812','US-2019-118983');

select * from orders where city =null -- error

select * from Orders 
where city is null

select * from Orders 
where not (city is not null)

-- null can't be compared with anything


-- Aggregation functions
select  count(*) from orders
where city is null;

select  count(*) from orders;

select  count(*) as counting from orders;

select  count(*) as counting,
sum(Sales) total_sales,
max(Sales) as max_sal,
min(Profit) as min_prof,
AVG(Profit) as avgpr
from orders;

select region, count(*) as counting,
sum(Sales) total_sales,
max(Sales) as max_sal,
min(Profit) as min_prof,
AVG(Profit) as avgpr
from orders
group by (Region);

select region,category ,count(*) as counting,
sum(Sales) total_sales,
max(Sales) as max_sal,
min(Profit) as min_prof,
AVG(Profit) as avgpr
from orders
group by Region,Category;

select region,category ,count(*) as counting,
sum(Sales) total_sales,
max(Sales) as max_sal,
min(Profit) as min_prof,
AVG(Profit) as avgpr
from orders
group by Region;
-- error we can't have attributes in select which are not in group by

select region ,count(*) as counting,
sum(Sales) total_sales,
max(Sales) as max_sal,
min(Profit) as min_prof,
AVG(Profit) as avgpr
from orders
where profit>100
group by Region; 
-- from order ->where -> group by -> select

select top 3 Region,sum(sales) as tf
from Orders
where profit>50
group by region
order by tf;
-- execution order  from -> where -> group by ->select -> order by -> top 3

select * from Orders

select sub_category, sum(sales) as total_sales   
from Orders
where total_sales>100000
group by sub_category;-- error
-- execution sequence from --> where --> group by --> select

select sub_category, sum(sales) as total_sales   
from Orders
where sum(sales)>100000
group by sub_category;-- error
-- execution sequence from --> where --> group by --> select 

select sub_category, sum(sales) as total_sales   
from Orders
group by sub_category
having sum(sales)>100000
;
-- execution sequence from --> groupby -->having--> select

select sub_category, sum(sales) as total_sales   
from Orders
where sales >100
group by sub_category
having sum(sales)>100000
order by total_sales
;
-- execution sequence from--> where --> group by --> having --> select -->orderby

select top 3 sub_category, sum(sales) as total_sales   
from Orders
where sales >100
group by sub_category
having sum(sales)>100000
order by total_sales
;
-- execution sequence from--> where --> group by --> having --> select -->orderby--> top 3


-- which of the 2 below is more efficient

select top 5 sub_category, sum(sales) as total_sales
from orders
group by sub_category
having sub_category = 'Phones'
order by total_sales desc;

select top 5 sub_category, sum(sales) as total_sales
from orders
where sub_category = 'Phones'
group by sub_category
order by total_sales desc 
-- it is more efficient 

--Count function
select count (*) from orders;
select count (Order_ID) from orders;
select count ( distinct Order_ID) from orders;
select count (city) from orders;-- doesn't count null values

-- aggregate function ignores null values

