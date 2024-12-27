/* DAY-06 */
Select * from emp
select * from dept
/* employess with salary more than their managers */

select e1.emp_id,e1.emp_name,e2.emp_name as manager_name
from emp e1
inner join emp e2
on e1.manager_id=e2.emp_id
where e1.salary>e2.salary

/*                     STRING AGGREGATION                          */

/* all the employees of a department */

select e1.dept_id,STRING_AGG(e1.emp_name,' , ') as employees
from emp e1
group by e1.dept_id


select e1.dept_id,STRING_AGG(e1.emp_name,' , ') within group (order by emp_name) as employees
from emp e1
group by e1.dept_id


/*                     DATE FUNCTION                                   */

select Order_ID,Order_Date,datepart(year,Order_Date)
from Orders

select Order_ID,Order_Date,datepart(year,Order_Date)
from Orders
where DATEPART(year,Order_Date)=2020

select Order_ID,Order_Date,datepart(year,Order_Date)
from Orders
where DATEPART(month,Order_Date)=11

select Order_ID,Order_Date,datepart(year,Order_Date) as YearOf,DATEPART(month,Order_Date) as MonthNum,DATENAME(month,Order_Date) as monthOf
from Orders

select DATENAME(WEEKDAY,Order_Date),DATENAME(month,Order_Date)
from Orders

select Order_ID,Ship_Date,DATEADD(week,10,Ship_Date),DATEADD(year,100,Ship_Date)
from Orders

select Order_ID,Ship_Date,DATEADD(week,10,Ship_Date),DATEADD(year,-100,Ship_Date)
from Orders

/*  date difference */

select Order_ID,Order_Date,Ship_Date,DATEDIFF(day,Order_Date,Ship_Date) as daysOffDiff
from Orders

select Order_ID,Order_Date,Ship_Date,DATEDIFF(month,Order_Date,Ship_Date) as monthsOffDiff
from Orders

select Order_ID,Profit,
case
when profit < 0 then 'loss'
when profit <100 then 'low'
when profit <200 then 'medium'/* executed when top to bottom */
when profit <500 then 'high'
when profit >500 and profit< 1000 then 'very high'
else 'Paisa he paisa hoga babu bhaiya'
end as profitCategory
from Orders