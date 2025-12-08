-- PROJECT: E-Learning Platform Analysis(ALAMELU)
-- DESCRIPTION:
--     This script creates the schema, inserts sample data, 
--     and performs analytical queries using JOINs, GROUP BY, and aggregations.
-- TASK 1: DATABASE & TABLE CREATION

-- Creating the database 

create database E_Learning;
use E_Learning;

-- Creating learners table to store user information
create table learners (
    learner_id int primary key,
    full_name varchar(100) not null,
    country varchar(50)
);

-- Creating courses table to store course information
create table courses (
    course_id int primary key,
    course_name varchar(100) not null,
    category varchar(50),
    unit_price decimal(10,2) not null
);
alter table courses modify unit_price int;

-- Creating purchases table to store transactional purchase records
create table purchases (
    purchase_id int primary key,
    learner_id int,
    course_id int,
    quantity int not null,
    purchase_date date,
    foreign key (learner_id) references learners(learner_id),
    foreign key (course_id) references courses(course_id)
);

-- Inserting records one by one
-- learners
insert into learners (learner_id, full_name, country) values
(1, 'alamelu', 'india'),
(2, 'prada', 'india'),
(3, 'madhuprasath', 'india'),
(4, 'muthiah', 'india'),
(5, 'animarry', 'india'),
(6, 'keerthana', 'india'),
(7, 'vignesh', 'india'),
(8, 'rahul', 'uk'),
(9, 'kavitha', 'uk'),
(10, 'dinesh', 'uk');
-- courses
insert into courses (course_id, course_name, category, unit_price) values
(101, 'python programming', 'technology', 1500.00),
(102, 'sql basics to advanced', 'technology', 1200.00),
(103, 'advanced excel', 'business', 1000.00),
(104, 'power bi desktop', 'analytics', 1800.00),
(105, 'web development', 'technology', 2500.00),
(106, 'data analytics', 'analytics', 2200.00);
-- Purchases
insert into purchases (purchase_id, learner_id, course_id, quantity, purchase_date) values
(1, 1, 101, 1, '2022-03-05'),
(2, 2, 103, 2, '2022-06-11'),
(3, 3, 104, 1, '2022-09-20'),
(4, 4, 102, 1, '2022-12-15'),
(5, 5, 105, 1, '2023-01-10'),
(6, 6, 106, 1, '2023-03-17'),
(7, 7, 101, 2, '2023-05-22'),
(8, 8, 103, 1, '2023-07-30'),
(9, 9, 104, 1, '2023-10-08'),
(10, 10, 105, 1, '2023-12-19'),
(11, 1, 102, 1, '2024-02-14'),
(12, 2, 104, 1, '2024-04-25'),
(13, 3, 106, 2, '2024-06-11'),
(14, 4, 101, 1, '2024-08-09'),
(15, 5, 103, 3, '2024-11-05'),
(16, 6, 105, 1, '2024-12-28'),
(17, 7, 102, 1, '2025-01-18'),
(18, 8, 104, 2, '2025-02-20'),
(19, 9, 106, 1, '2025-03-26'),
(20, 10, 101, 1, '2025-04-15');

-- TASK 2: JOINS & DATA EXPLORATION

-- 1)Altering table courses column price into accepting with two decimal places
alter table courses modify unit_price decimal(10,2);

-- 2)using alise name for revenue and
-- 3) grouping all courses into highest price to lowest(combined)
select 
c.course_name,
sum(c.unit_price * p.quantity) as total_revenue
from courses c
join purchases p on c.course_id = p.course_id
group by c.course_name
order by total_revenue desc;

select * from courses;
select * from learners;
select * from purchases;

-- Combaining three tables meaningfully
SELECT 
    l.full_name,
    l.country,
    c.course_name,
    c.category,
    c.unit_price,
    p.quantity,
    p.purchase_date
FROM learners l
LEFT JOIN purchases p ON l.learner_id = p.learner_id
RIGHT JOIN courses c ON c.course_id = p.course_id
ORDER BY purchase_date DESC;

-- TASK 3: ANALYTICAL QUERY

-- 1)Ensuring proper name and country and total revenue contributed by each learner using JOIN
--   utilizes group and order by for better evaluation
select 
concat(ucase(left(l.full_name,1)), substring(full_name,2)) as Name,
concat(ucase(left(l.country,1)), substring(l.country,2)) as Country,
sum(c.unit_price * p.quantity) as Total_revenue
from purchases p
join learners l on p.learner_id = l.learner_id
join courses c on c.course_id = p.course_id
group by Name, Country
order by Total_revenue desc;

-- 2)Finding top 3 most purchased courses based on total quantity sold
select 
concat(ucase(left(c.course_name,1)), substring(c.course_name,2)) as Course,
sum(p.quantity) as Quantity_sold
from courses c
join purchases p on c.course_id = p.course_id
group by course
order by Quantity_sold desc
limit 3;

-- 3)Category-wise revenue with number of unique learners purchasing from each category
select 
c.category,
sum(c.unit_price * p.quantity) as revenue,
count(distinct l.learner_id) as unique_learners
from courses c
join purchases p on c.course_id = p.course_id
join learners l on l.learner_id = p.learner_id
group by c.category
order by revenue desc;

-- 4) Listing learners who purchased from more than one category
select 
l.full_name,
count(distinct c.category) as category_count
from courses c
join purchases p on c.course_id = p.course_id
join learners l on l.learner_id = p.learner_id
group by full_name
having category_count > 1;

-- 5) Identifying courses with no purchases using LEFT JOIN
select 
c.course_id,
c.course_name,
c.category,
c.unit_price
from courses c
left join purchases p on c.course_id = p.course_id
where p.course_id is null;

-- Demonstrates how LEFT JOIN identifies non-purchased records
INSERT INTO courses (course_id, course_name, category, unit_price)
VALUES (107, 'cloud computing', 'technology', 2000.00);




