-- DDL COMMANDS:  

-- Create the database
create database Employees;

-- using the newly created db
use Employees;

-- Create Departments table to store department details
create table Departments(
dept_id int,
dept_name varchar(100));

-- Create Location table to store location details
create	table Location(
location_id int,
location varchar(30));

-- Create Employee table to store employee-related information
create table employee(
emp_id int,
emp_name varchar(50),
gender enum('M','F'),
age int,
hire_date date,
designation varchar(100),
department_id int,
location_id int,
salary decimal(10,2));

-- Add a new column to store employee email addresses
alter table employee add column email varchar(50);

-- Modify the designation column length to accommodate longer designation
alter table employee modify column designation varchar(200);

-- Remove the age column as it is no longer required
alter table employee drop column age;

-- Rename hire_date column to date_of_joining 
alter table employee rename column hire_date to date_of_joining;

-- Rename Departments table to Departments_Info
rename table Departments to Departments_Info;

-- Rename Location table to Locations
rename table Location to Locations;

-- Remove all rows from the Employee table but keeping its structure
truncate table employee;

-- Permanently delete the Employee table from the database
drop table Employee;

-- Permanently delete the entire 'employees' database
drop database employees;


-- Constraints:

-- Create the database
create database Employees;

use Employees;
-- Department table created 
create table Departments(
dept_id int primary key,
dept_name varchar(100) not null unique);
-- Location table created 
create	table Location(
location_id int primary key auto_increment, 
location varchar(30)not null unique);
-- Employee table created
create table employee(
emp_id int primary key,
emp_name varchar(50) not null,
gender enum('M','F'),
age int check(age >= 18),
hire_date datetime DEFAULT current_timestamp,
designation varchar(100),
department_id int,
location_id int,
salary decimal(10,2),
CONSTRAINT fkdep 
FOREIGN KEY(department_id) REFERENCES Departments(dept_id),
CONSTRAINT fkloc FOREIGN KEY (location_id) REFERENCES Location(location_id));




