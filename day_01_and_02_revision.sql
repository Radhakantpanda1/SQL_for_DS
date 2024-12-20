-- SQL REVISION
-- Revision of Day-01
create table New_Amzn_Orders(
orderId integer primary key,
customerName varchar(50) not null,
productId varchar(50) not null,
dateOfOrder datetime ,
priceOfProduct int 
);

INSERT INTO New_Amzn_Orders (orderId, customerName, productId, dateOfOrder, priceOfProduct) VALUES
(1, 'John Smith', 'B08F5L1K9S', '2023-10-26 10:00:00', 250),
(2, 'Alice Johnson', 'B09G9D82XJ', '2023-10-26 11:30:00', 1200),
(3, 'Bob Williams', 'B07XJ8C8F5', '2023-10-26 14:45:00', 50),
(4, 'Eva Brown', 'B0932X112B', '2023-10-27 09:15:00', 75),
(5, 'Michael Davis', 'B08H93G987', '2023-10-27 16:00:00', 3000),
(6, 'Sarah Wilson', 'B07G3Q213Z', '2023-10-28 12:30:00', 150),
(7, 'David Garcia', 'B09112924K', '2023-10-28 18:00:00', 90),
(8, 'Linda Rodriguez', 'B08L8F883K', '2023-10-29 10:45:00', 600),
(9, 'Christopher Martinez', 'B07V4G123N', '2023-10-29 15:15:00', 200),
(10, 'Angela Anderson', 'B0949R267M', '2023-10-30 11:00:00', 400);

select * from New_Amzn_Orders;
select top 5 * from New_Amzn_Orders;
select top 5 * from New_Amzn_Orders
order by productId;
select customerName , productId from New_Amzn_Orders
order by priceOfProduct;
select  * from New_Amzn_Orders
order by dateOfOrder desc,priceOfProduct asc;
drop table New_Amzn_Orders;

-- Revision Of Day-02
CREATE TABLE New_Amzn_Orders(
    orderId INTEGER PRIMARY KEY,
    customerName VARCHAR(50) NOT NULL,
    productId VARCHAR(50) NOT NULL,
    dateOfOrder DATETIME,
    priceOfProduct INT,
    paymentMethod VARCHAR(50) 
);

INSERT INTO New_Amzn_Orders
(orderId, customerName, productId, dateOfOrder, priceOfProduct, paymentMethod)
VALUES
(1, 'John Smith', 'B08F5L1K9S', '2023-10-26 10:00:00', 250, 'Credit Card'),
(2, 'Alice Johnson', 'B09G9D82XJ', '2023-10-26 11:30:00', 1200, 'PayPal'),
(3, 'Bob Williams', 'B07XJ8C8F5', '2023-10-26 14:45:00', 50, 'Debit Card'),
(4, 'Eva Brown', 'B0932X112B', '2023-10-27 09:15:00', 75, 'Credit Card'),
(5, 'Michael Davis', 'B08H93G987', '2023-10-27 16:00:00', 3000, 'Bank Transfer'),
(6, 'Sarah Wilson', 'B07G3Q213Z', '2023-10-28 12:30:00', 150, 'PayPal'),
(7, 'David Garcia', 'B09112924K', '2023-10-28 18:00:00', 90, 'Debit Card'),
(8, 'Linda Rodriguez', 'B08L8F883K', '2023-10-29 10:45:00', 600, 'Credit Card'),
(9, 'Christopher Martinez', 'B07V4G123N', '2023-10-29 15:15:00', 200, 'Gift Card'),
(10, 'Angela Anderson', 'B0949R267M', '2023-10-30 11:00:00', 400, 'PayPal'),
(11, 'Kevin Taylor', 'B07PW9VBK8', NULL, 80, 'Credit Card'),
(12, 'Ashley White', 'B08P3X999M', '2023-10-31 14:20:00', 199, 'Amazon Pay');

select * from New_Amzn_Orders;
insert into New_Amzn_Orders -- VIOLATION OF PRIMARY KEY OF ORDERS_ID
values (10, 'Ashley White', 'B08P3X990M', '2023-10-31 14:20:00', 199, 'UPI');
insert into New_Amzn_Orders -- VIOLATION OF NOT NULL CONSTRAINT IN CUSTOMER_NAME
values (13, NULL, 'B08P3X990M', '2023-10-31 14:20:00', 199, 'UPI');
ALTER TABLE New_Amzn_Orders
ADD productCategory VARCHAR(30) NOT NULL DEFAULT 'Mens Wear';
select * from New_Amzn_Orders;

delete from New_Amzn_Orders
where priceOfProduct<100;-- deleting rows based upon conditions
update New_Amzn_Orders 
set paymentMethod='UPI'
where paymentMethod='PayPal';

insert into New_Amzn_Orders 
values (13, 'Radhakant Panda', 'B08P3X990M', '2023-10-31 14:20:00', 199, 'UPI',default);

alter table New_Amzn_Orders
drop column dateOfOrder;-- it got dropped

ALTER TABLE New_Amzn_Orders
DROP COLUMN productCategory;-- we can't directly drop a column upon which constraints are defined
ALTER TABLE New_Amzn_Orders
DROP COLUMN orderId;-- it can't be dropped
alter table New_Amzn_Orders
add  DateOfOrder datetime default  getdate();
update New_Amzn_Orders
set DateOfOrder=getdate()
where dateOfOrder is null;

drop table New_Amzn_Orders;



select * from orders 
where Quantity=5 and state='California' and city='Temecula'
order by Order_ID; 

select  * from Orders
where ship_mode in ('First class','Same Day')



select * from Orders;