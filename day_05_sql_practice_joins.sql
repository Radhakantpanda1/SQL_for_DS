CREATE TABLE emp (
    emp_id INT,
    emp_name VARCHAR(20),
    dept_id INT,
    salary INT,
    manager_id INT,
    emp_age INT
);
INSERT INTO emp VALUES (1, 'Ankit', 100, 10000, 4, 39);
INSERT INTO emp VALUES (2, 'Mohit', 100, 15000, 5, 48);
INSERT INTO emp VALUES (3, 'Vikas', 100, 10000, 4, 37);
INSERT INTO emp VALUES (4, 'Rohit', 100, 5000, 2, 16);
INSERT INTO emp VALUES (5, 'Mudit', 200, 12000, 6, 55);
INSERT INTO emp VALUES (6, 'Agam', 200, 12000, 2, 14);
INSERT INTO emp VALUES (7, 'Sanjay', 200, 9000, 2, 13);
INSERT INTO emp VALUES (8, 'Ashish', 200, 5000, 2, 12);
INSERT INTO emp VALUES (9, 'Mukesh', 300, 6000, 6, 51);
INSERT INTO emp VALUES (10, 'Rakesh', 500, 7000, 6, 50);

CREATE TABLE dept (
    dep_id INT,
    dep_name VARCHAR(20)
);
INSERT INTO dept VALUES (100, 'Analytics');
INSERT INTO dept VALUES (200, 'IT');
INSERT INTO dept VALUES (300, 'HR');
INSERT INTO dept VALUES (400, 'Text Analytics');

select * from emp
select * from dept
/*
Basic Join Questions
1. Retrieve a list of employees along with the names of the
departments they belong to.
2. Retrieve all employees and their departments,
including employees without a department.
3. Retrieve all departments and their employees,
including departments without employees.
4. Find employees who are not assigned to any department.
5. Find departments that do not have any employees.
*/

-- 1 ans
select * from emp e
inner join dept d on
e.dept_id=d.dep_id

-- 2 ans
select * from emp e
left join dept d on
e.dept_id=d.dep_id 

-- 3 ans
select * from emp e
right join dept d on
e.dept_id=d.dep_id 

-- 4 ans
select * from emp e
left join dept d on 
e.dept_id=d.dep_id
where d.dep_id is null;

-- 5 ans
select * from emp e
right join dept d on 
e.dept_id=d.dep_id
where e.emp_id is null;/* better */

select * from emp e
full outer join dept d on 
e.dept_id=d.dep_id
where e.emp_id is null;

/*
Intermediate Join Questions
6. Calculate the total salary for each department.
7. Retrieve employees along with their managers’ names
(managers are also employees).
8. List departments along with the average age of employees in each department.
9. Find the total number of employees in each department.
10. Retrieve employees whose salary is greater than the average 
salary of their department.

*/
-- 6 ans

select dep_name , sum(salary) as total_salary
from emp e 
right join dept d on 
e.dept_id=d.dep_id
group by dep_name  /* if some dept has no employee in that case salary
will be null*/


select dep_name , coalesce(sum(salary),0) as total_salary
from emp e 
right join dept d on 
e.dept_id=d.dep_id
group by dep_name
 /* if some dept has no employee in that case salary will be 0 rather then null*/

 -- 7 ans
 select e1.*,e2.emp_name
 from emp e1 , emp e2
 where e1.manager_id=e2.emp_id

-- better industry practice
select e1.*,e2.emp_name
from emp e1
join emp e2 on 
e1.manager_id=e2.emp_id

-- 8 ans
select d.dep_name,coalesce(avg(e.emp_age),0) as  dept_emp_avg_age
from dept d 
left join emp e
on d.dep_id=e.dept_id
group by d.dep_name

-- 9 ans
select d.dep_name,coalesce(count(e.emp_id),0) as  num_of_emp
from dept d 
left join emp e
on d.dep_id=e.dept_id
group by d.dep_name

-- 10 ans
-- out of knowledge :-}
