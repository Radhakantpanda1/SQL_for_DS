select * from Orders;
select distinct Ship_Mode from Orders order by Ship_Mode;-- gives distinct values of ship_mode
select distinct City,Region from Orders;-- distinct combination of city,Region
-- filters
select * from orders 
where Ship_Mode='First Class';
select * from Orders
where Quantity<5
order by Quantity;
select * from Orders
where Order_Date between '2019-10-15' and '2019-11-15';-- boundary dates are also included
select * from Orders
where Quantity between 1 and 3;

select * from Orders
where Ship_Mode in ('First Class','Same Day');-- either First class or Same Day
select distinct Ship_Mode from Orders
where Ship_Mode in ('First Class','Same Day');

select distinct Ship_Mode from Orders
where Ship_Mode>='Same Day';-- based On ASCII values

-- filter on Multiple columns
select * from Orders
where Ship_Mode='Standard Class' and City='Philadelphia';
select * from Orders
where Ship_Mode='Standard Class' or City='Philadelphia';-- first checks Ship_Mode then checks city
-- below two are same 
select distinct Ship_Mode from Orders
where Ship_Mode in ('First Class','Same Day');-- checks row by row in each row it will first check for first condition if false in case or then check for second condition

select distinct Ship_Mode from Orders
where Ship_Mode='First Class' or Ship_Mode='Same Day';
-- where checks row by row
select * ,profit/sales as ratio
from Orders;-- creates a new column ratio
select * ,profit/sales as ratio,profit + sales as tf
from Orders;-- just to show not actually effect db
select Sales , getdate() as new_date from Orders;

--Pattern matching like Operator
select Customer_Name , City, Order_ID from Orders
where Customer_Name='Brosina Hoffman';

select Customer_Name , City, Order_ID from Orders
where Customer_Name like 'B%';-- after B we can have anything
select Customer_Name , City, Order_ID from Orders
where Customer_Name like '%man';-- ending with man
select Customer_Name , City, Order_ID from Orders
where Customer_Name like 'Ben%man';
select Customer_Name , City, Order_ID from Orders
where Customer_Name like '%dia%';--anything followed by dia then anything
-- by default sql db is case insensitive but for real world use we make it case sensitive
select Customer_Name , City, Order_ID,upper(Customer_Name) as Upper_CName
from Orders
where upper(Customer_Name) like 'A%A';
select Customer_Name , City, Order_ID,upper(Customer_Name) as Upper_CName
from Orders
where upper(Customer_Name) like '__B%';-- third letter from starting must be B/b then anything

select Customer_Name , City, Order_ID from Orders
where Customer_Name like '_[abc]%';-- second character must be either a or b or c
select Customer_Name , City, Order_ID from Orders
where Customer_Name like '_[^abc]%';-- second character cam be anything but not a or b or c

select Customer_Name , City, Order_ID from Orders
where Customer_Name like '_[a-c]%';-- anything in range a to c
select Customer_Name ,Order_ID, City, Order_ID from Orders
where  Order_ID like  'CA-20[0-9][1-2]%'