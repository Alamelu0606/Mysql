use employees;

-- Retrieve distinct salary values from employee table
select distinct salary
from employee
order by salary desc;

-- Display employee name, age, and salary with aliases
select 
emp_name,
age Employee_Age,
salary as Employee_Salary
 from employee
 order by Employee_salary;

-- Employees with salary above 50000 and hired before 2016
select 
employee.*,
DATE_FORMAT(hire_date, '%d-%b-%Y') Hire_date 
from employee
where salary>50000 and hire_date<'2016-01-01';
    
select * from employee;
-- Updatedmissing designation values to Data Scientist
update employee 
set designation = 'Data Scientist' 
where designation IS NULL;

-- Sort employees by department (asc) and salary (desc)
select * from employee
order by department_id,
salary desc;

-- First 5 employees hired in 2018
select *from employee 
where year(hire_date) = 2018 
order by hire_date 
limit 5;

-- Sum of salaries in Finance department
select 
d.dept_name,
sum(e.salary) as Totalsalary_Finance
 from employee e join departments d on e.department_id=d.dept_id
 where dept_name='Finance';

-- Minimum age among employees
select min(age) from employee;

 -- Maximum salary for each location
select * from location;
select l.location,
max(e.salary) as Salary_Max from location l join employee e on l.location_id=e.location_id 
group by l.location;

 -- Average salary of analyst designation
select designation,
       avg(salary) as avg_salary
from employee
where designation like '%Analyst%'
group by designation;

-- Designations having <3 employees
select designation,
count(designation) emp from employee
 group by designation 
 having emp<3;
 
 -- Female employees with avg age <= 30
select l.location,
avg(e.age) age,
e.gender from employee e join location l on l.location_id=e.location_id
where gender='f'
group by l.location 
having age<=30;

-- Inner Join
select 
e.emp_name Name,
e.designation Designation,
d.dept_name Department from employee e join departments d on e.department_id=d.dept_id;

-- Left Join
select d.dept_name,
       count(e.emp_id) as total_employees
from departments d
left join employee e on e.department_id = d.dept_id
group by d.dept_name;

-- Right join
select l.location,
       e.emp_name
from location l
right join employee e on l.location_id = e.location_id;





