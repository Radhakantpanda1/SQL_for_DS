/* it is a DDL COMMANDS */
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
/* values inserted */
/* THESE ARE DQL COMMANDS */
select * from amazon_orders;/* to view all the rows of the table */
select total_Price,payment_Method from amazon_orders;/* to view required columns only */
select top 3 * from amazon_orders;/* to view top n rows */
select * from amazon_orders
order by order_Date;/* sorts data on the basis of date by default ascending order*/
select * from amazon_orders
order by order_Date desc;/* in descending order */
select * from amazon_orders
order by order_Date desc,total_Price asc;/* if order date is same then it will sort on the basis of total_price */

-- drop table amazon_orders;/* to delete the table schema is gone so is the data */
-- delete from amazon_orders;/* deletes the rows of the table but schema remains uneffected */