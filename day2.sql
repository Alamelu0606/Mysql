-- Create database
create database Online_Book_store;
use Online_Book_store;

-- Create books table
create table books( 
BookID int PRIMARY KEY,
Title VARCHAR(100) NOT NULL,
Author VARCHAR(50) NOT NULL,
ISBN  VARCHAR(20) UNIQUE,
Price DECIMAL(8,2) CHECK(Price > 0));

-- Create orders table with FK reference to books
create table orders(  
OrderID int PRIMARY KEY,
BookID INT ,
OrderDate DATE NOT NULL,
Quantity INT CHECK(Quantity>0),
constraint fk_bookid foreign key(BookID) references books(bookID)
);

-- Making ISBN unique
alter table books modify ISBN varchar(20) unique;

-- Insert book records
INSERT INTO books (BookID, Title, Author, ISBN, Price) VALUES
(1, 'SQL', 'Alan Beauli', 'SQL101', 450.25),
(2, 'Python', 'Eric Matthes', 'PY2024', 520.00),
(3, 'HTML & CSS', 'Duckett', 'WEB123', 480.75),
(4, 'Operating System', 'Abraham', 'OS7890', 650.30),
(5, 'Database System Concepts', 'Henry', 'DB5566', 550.00);

-- checking constraint 
INSERT INTO books (BookID, Title, Author, ISBN, Price) VALUES
(6, 'SQL', 'Alan Beauli', 'SQL101',0);


-- Insert order records
INSERT INTO orders (OrderID, BookID, OrderDate, Quantity) VALUES
(101, 1, '2025-01-10', 2),   
(102, 2, '2025-01-11', 1),   
(103, 3, '2025-01-12', 3),   
(104, 4, '2025-01-13', 1),   
(105, 5, '2025-01-14', 2);  

-- checking fk,constraint
INSERT INTO orders (OrderID, BookID, OrderDate, Quantity) VALUES
(101, 7, '2025-01-10', 0);

-- Validating records
select * from books;
select * from orders;

-- using where 
DELETE FROM orders 
WHERE OrderID = 101;

-- Deleting records having schemas alone
truncate table books;
truncate table orders;


