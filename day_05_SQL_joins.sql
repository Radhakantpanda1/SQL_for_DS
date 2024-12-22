select count(*) from returns$; 
select * from Orders
-- database joins
select o.Order_ID,o.Order_Date,r.[Return Reason] from 
Orders o
inner join returns$ r on
o.Order_ID=r.[Order Id]

select o.* from 
Orders o
inner join returns$ r on
o.Order_ID=r.[Order Id]

select r.* from 
Orders o
inner join returns$ r on
o.Order_ID=r.[Order Id]

select * from 
Orders o
left join returns$ r on
o.Order_ID=r.[Order Id]

/*
all the records which are not present in returns table
*/
select * from orders o
left join returns$ r on
o.Order_ID=r.[Order Id]
where r.[Order Id] is null;
/*  order of execution from --> join --> where -->select
*/

select r.[Return Reason], sum(sales) as total_sales
from Orders o 
left join returns$ r on
o.Order_ID=r.[Order Id]
group by r.[Return Reason] /* groups on the basis of return_reason */


select r.[Return Reason], sum(sales) as total_sales
from Orders o 
inner join returns$ r on
o.Order_ID=r.[Order Id]
group by r.[Return Reason]

/* cross join */

-- Create the 'employee' table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

-- Create the 'department' table
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Insert data into 'employee' table
INSERT INTO employee (emp_id, emp_name, dept_id) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', NULL),
(4, 'David', 103),
(5, 'Eve', 105);

-- Insert data into 'department' table
INSERT INTO department (dept_id, dept_name) VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'IT'),
(104, 'Marketing');

select * from 
employee e , department d
order by e.emp_id asc;

select * from employee e
inner join department d on
e.dept_id=d.dept_id;

select * from employee e
left join department d on
e.dept_id=d.dept_id;

select * from employee e
right join department d on
e.dept_id=d.dept_id;

select * from employee e
full outer join department d on
e.dept_id=d.dept_id;

-- Create the 'project' table
CREATE TABLE project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    emp_id INT
);

-- Insert data into 'project' table
INSERT INTO project (project_id, project_name, emp_id) VALUES
(1, 'Project Alpha', 1),  -- Alice is working on Project Alpha
(2, 'Project Beta', 2),   -- Bob is working on Project Beta
(3, 'Project Gamma', 4),  -- David is working on Project Gamma
(4, 'Project Delta', 6);  -- This project has no matching employee

select * from employee e
inner join department d on 
e.dept_id=d.dept_id
inner join project p on 
p.emp_id=e.emp_id

/*
we can't join tables based on different data type of columns or attributes*/

