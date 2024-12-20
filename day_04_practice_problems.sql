select * from Orders;

/*
1- write a update statement to update city as null for order ids : 
CA-2020-161389 , US-2021-156909
*/
update Orders
set City=null
where Order_ID in ('CA-2020-161389','US-2021-156909')

select * from Orders
where Order_ID in ('CA-2020-161389','US-2021-156909')

-- actual ans 
update orders set city=null where order_id in ('CA-2020-161389','US-2021-156909')
/*
2- write a query to find orders where city is null (2 rows)
*/
select * from Orders
where city is null;

-- actual ans 
select * from orders where city is null;

/*
3- write a query to get total profit, first order date and latest order 
date for each category
*/
select category,sum(profit) as total_profit,min(Order_Date) as first_order,max(Order_Date) as latest_order
from Orders
group by Category;
-- execution sequence = from --> group by select
select count(distinct Category) from Orders

-- actual ans
select category , sum(profit) as total_profit, min(order_date) as first_order_date
,max(order_date) as latest_order_date
from orders
group by category 

/*
4- write a query to find sub-categories where average profit is more
than the half of the max profit in that sub-category
*/
select Sub_Category,avg(Profit) as avgPr, max(profit) as maxpr
from Orders 
group by Sub_Category
having avg(Profit)>max(Profit)/2;

-- actual ans
select sub_category
from orders
group by sub_category
having avg(profit) > max(profit)/2

/*
5- create the exams table with below script;
create table exams (student_id int, subject varchar(20), marks int);

insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);
write a query to find students who have got same marks in Physics and Chemistry.
*/
CREATE TABLE exams (
    student_id INT,
    subject VARCHAR(20),
    marks INT
);
INSERT INTO exams VALUES 
    (1, 'Chemistry', 91), 
    (1, 'Physics', 91), 
    (1, 'Maths', 92),
    (2, 'Chemistry', 80), 
    (2, 'Physics', 90),
    (3, 'Chemistry', 80), 
    (3, 'Maths', 80),
    (4, 'Chemistry', 71), 
    (4, 'Physics', 54),
    (5, 'Chemistry', 79);

select student_id , marks
from exams
where subject in ('Physics','Chemistry')
group by student_id , marks
having count(1)=2;
/*
6- write a query to find total number of products in each category.
*/
select Category ,count(distinct product_id) as total_quan
from Orders
group by Category;

-- actual ans 
select category,count(distinct product_id) as no_of_products
from orders
group by category

/*
7- write a query to find top 5 sub categories in west region 
by total quantity sold
*/
select top 5 Sub_Category,sum(Quantity) as total_quantity
from Orders
where Region='West'
group by Sub_Category
order by total_quantity desc;

-- actual ans
select top 5  sub_category, sum(quantity) as total_quantity
from orders
where region='West'
group by sub_category
order by total_quantity desc

/*
8- write a query to find total sales for each region and ship mode 
combination for orders in year 2020
*/
select region,ship_mode,sum(Sales) as total_sales
from Orders
where Order_Date between '2020-01-01' and '2020-12-31'
group by region,ship_mode

-- actual ans
select region,ship_mode ,sum(sales) as total_sales
from orders
where order_date between '2020-01-01' and '2020-12-31'
group by region,ship_mode

select * from Orders