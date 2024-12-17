create table amazon_orders(
order_Id integer,
order_Date date,
product_Name varchar(100),
total_Price decimal(5,2),
payment_Method varchar(50)
);
/* THESE ARE DML COMMANDS */
insert into amazon_orders values(1,'2024-12-16','IPhone',692.00,'Debit Card');
INSERT INTO amazon_orders VALUES (1, '2024-12-16', 'IPhone', 692.00, 'Debit Card');
INSERT INTO amazon_orders VALUES (2, '2024-12-17', 'Samsung Galaxy S21', 799.99, 'Credit Card');
INSERT INTO amazon_orders VALUES (3, '2024-12-18', 'MacBook Air', 999.00, 'Net Banking');
INSERT INTO amazon_orders VALUES (4, '2024-12-19', 'Sony Headphones', 199.50, 'UPI');
INSERT INTO amazon_orders VALUES (5, '2024-12-20', 'Apple Watch', 399.99, 'PayPal');
alter table amazon_orders alter column order_Date datetime;/* to change datatype of a column */
 select * from amazon_orders;
INSERT INTO amazon_orders VALUES (1, '2024-12-16 10:30:00', 'IPhone 15', 899.00, 'Credit Card');
INSERT INTO amazon_orders VALUES (2, '2024-12-17 14:45:00', 'Samsung Galaxy Tab S8', 749.50, 'Debit Card');
alter table amazon_orders add userName varchar(50);
alter table amazon_orders add category varchar(30); /* to add new column to table */
-- alter table amazon_orders drop column category; /* to drop a column from table /

create table my_orders(
order_Id integer NOT NULL UNIQUE,
order_Date date,
product_Name varchar(100),
total_Price decimal(5,2),
payment_Method varchar(50) check (payment_Method in ('UPI','DEBIT CARD','CREDIT CARD')),
Category varchar(20) default 'casual wear',
primary key (order_Id)
);
-- insert into my_orders values(null,'2024-12-16','IPhone',692.00,'Debit Card'); /* not null constraint applied */
insert into my_orders values(1,'2024-12-16','IPhone',692.00,'Debit Card',default);
--insert into my_orders values(2,'2024-12-16','IPhone 15',602.00,'Internet Banking'); /* check in */
--insert into my_orders values(1,'2024-12-16','IPhone 15',692.00,'Credit Card');/* order_Id must be unique */
insert into my_orders(order_Id,order_Date,product_Name,total_Price,payment_Method) values(1,'2024-12-16','IPhone',692.00,'Debit Card');
/* above is the format for default values */
insert into my_orders values(2,'2024-12-16','IPhone 15',602.00,'UPI',default);/* for default */
INSERT INTO my_orders VALUES (1, '2024-12-01', 'Nike Shoes', 129.99, 'CREDIT CARD', 'Footwear');
INSERT INTO my_orders VALUES (2, '2024-12-02', 'Levis Jeans', 89.50, 'UPI', 'Casual Wear');
INSERT INTO my_orders VALUES (3, '2024-12-03', 'Puma T-Shirt', 49.99, 'DEBIT CARD', 'Casual Wear');
INSERT INTO my_orders VALUES (4, '2024-12-04', 'Adidas Sneakers', 149.00, 'UPI', 'Footwear');
INSERT INTO my_orders VALUES (5, '2024-12-05', 'Apple Watch', 299.99, 'CREDIT CARD', 'Accessories');
INSERT INTO my_orders VALUES (6, '2024-12-06', 'Ray-Ban Sunglasses', 99.50, 'UPI', 'Accessories');
INSERT INTO my_orders VALUES (7, '2024-12-07', 'Fossil Wallet', 59.99, 'DEBIT CARD', 'Accessories');
INSERT INTO my_orders VALUES (8, '2024-12-08', 'Roadster Shirt', 39.99, 'CREDIT CARD', 'Casual Wear');
INSERT INTO my_orders VALUES (9, '2024-12-09', 'Samsung Earbuds', 149.00, 'UPI', 'Electronics');
INSERT INTO my_orders VALUES (10, '2024-12-10', 'Lenovo Laptop Bag', 79.99, 'DEBIT CARD', 'Accessories');
delete from my_orders where order_Id=3;/* deleting tuples based on conditions */
delete from my_orders;/* deletes all the tuples */
alter table my_orders add Discount integer;
update  my_orders
set Discount=50;/* updating all the rows */
update  my_orders 
set Discount=80
where order_Id=9;
select * from my_orders;/* updating column of a particular tuple */
update  my_orders 
set order_Id=8
where order_Id=9;/* primary key constraint violated */
drop table my_orders;

/*
constraints 
primary key()--> unique and not null (can be a single o a combination of attributes)
unique --> unique values only
not null --> no null values allowed
check --> checks for some condition
*/