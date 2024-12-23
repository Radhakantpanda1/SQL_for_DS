/*
Problem Practice
*/
/*
1- write a query to get region wise count of return orders
*/

select region ,count(r.[Order Id]) as reginal_ordders
from orders o left join returns$ r
on r.[Order Id]=o.order_id
group by o.region

-- actual ans
select region,count(distinct o.order_id) as no_of_return_orders
from orders o
inner join returns$ r on o.order_id=r.[Order Id]
group by region

/*
2- write a query to get category wise sales of orders that were not returned
*/
select o.category , sum(Sales) as totalSales
from Orders o 
left join returns$ r
on o.Order_ID=r.[Order Id]
where r.[Order Id] is  null
group by o.Category

-- actual ans
select category,sum(o.sales) as total_sales
from orders o
left join returns$ r on o.order_id=r.[Order Id]
where r.[Order Id] is null
group by category

/*
3- write a query to print dep name and average salary of employees in that dep .
*/
select dep_name,coalesce(avg(salary),0) as avg_sal
from dept d
left join emp e
on d.[dep_id]=e.[dept_id]
group by dep_name

-- 3 ans
select d.dep_name,avg(e.salary) as avg_sal
from emp e
inner join dept d on e.dept_id=d.dep_id
group by d.dep_name



/*
4- write a query to print dep names where none of the emplyees have same salary.
*/

/*
5- write a query to print sub categories where we have all 3 kinds of
returns (others,bad quality,wrong items)*/
select Sub_Category
from Orders o 
inner join returns$ r 
on o.Order_ID=r.[Order Id]
where [Return Reason] in ('Wrong Items' , 'Bad Quality' , 'Others')
group by Sub_Category
having count(distinct([Return Reason])) =3
select * from returns$
 

 --actual ans
 select o.sub_category
from orders o
inner join returns$ r on o.order_id=r.[Order Id]
group by o.sub_category
having count(distinct [return reason])=3
/*
6- write a query to find cities where not even a single order was returned.
*/

select o.City ,count(r.[Order Id]) as return_num,count(o.Order_ID) as orderC
from Orders o 
left join returns$ r
on o.Order_ID=r.[Order Id]
group by o.City
having count(r.[Order Id]) =0 --and count(o.Order_ID)>0

--6 ans
select city
from orders o
left join returns$ r on o.order_id=r.[Order Id]
group by city
having count(r.[Order Id])=0

/*
7- write a query to find top 3 subcategories by sales of returned orders
in east region
*/
select top 3 Sub_Category,sum(Sales) as total_sales
from Orders o 
inner join returns$ r
on o.Order_ID=r.[Order Id]
where o.region='East'
group by Sub_Category
order by sum(Sales) desc

-- 7 actual ans
select top 3 sub_category,sum(o.sales) as return_sales
from orders o
inner join returns$ r on o.order_id=r.[Order Id]
where o.region='East'
group by sub_category
order by return_sales  desc
/*
8- write a query to print dep name for which there is no employee
*/

 select d.dep_name ,count(d.[dep_id]),d.dep_id
from dept d 
left join emp e
on d.[dep_id]=e.[dept_id]
group by d.dep_name ,d.dep_id
having count(e.[dept_id]) =0

--8 ans
select d.dep_id,d.dep_name
from dept d 
left join emp e on e.dept_id=d.dep_id
group by d.dep_id,d.dep_name
having count(e.emp_id)=0;


/*
9- write a query to print employees name for dep id is not avaiable 
in dept table
*/
select *
from emp e 
left join dept d
on d.[dep_id]=e.[dept_id]
where d.[dep_id] is null

-- 9 ans
select e.*
from emp e 
left join dept d  on e.dept_id=d.dep_id
where d.dep_id is null;
