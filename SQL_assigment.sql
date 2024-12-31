-- SQL_ Assignment
create database emp_1;
use emp_1;


-- 1. Create a table called employees with the following structure?
-- emp_id (integer, should not be NULL and should be a primary key)
-- emp_name (text, should not be NULL)
-- age (integer, should have a check constraint to ensure the age is at least 18)
-- email (text, should be unique for each employee)
-- salary (decimal, with a default value of 30,000).
-- Write the SQL query to create the above table with all constraints.

create table employees (
emp_id int not null,
emp_name char(20) not null,
age int check (age>=18),
mail varchar(25) unique ,
salary decimal(20,2) default 30000.00,
primary key(emp_id) );

-- 2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide examples of common types of constraints.
-- Purpose of Constraints in Databases

-- Constraints are rules enforced on data within a database to ensure data integrity. They maintain the accuracy, consistency, and reliability of the information stored. By defining these constraints, you can prevent invalid data entry, update, or deletion, safeguarding the overall quality of your database.

-- How Constraints Maintain Data Integrity

-- Enforcing Data Accuracy: Constraints define specific rules for data formats, ranges, and allowed values, ensuring that only valid data is entered into the database.
-- Preventing Data Inconsistencies: Constraints maintain relationships between tables, preventing inconsistencies and ensuring data integrity across the entire database.
-- Improving Data Quality: By enforcing data standards and preventing errors, constraints contribute to a higher level of data quality, making it more reliable for decision-making and analysis.
-- Securing Data: Some constraints can be used to restrict access to specific data, enhancing data security.
-- Common Types of Constraints

-- NOT NULL:

-- Ensures that a column cannot contain null values.
-- Example: CREATE TABLE Customers (CustomerID INT NOT NULL, CustomerName VARCHAR(50) NOT NULL);
-- UNIQUE:

-- Ensures that all values in a column are unique.
-- Example: CREATE TABLE Products (ProductID INT UNIQUE, ProductName VARCHAR(50));
-- PRIMARY KEY:

-- A combination of NOT NULL and UNIQUE constraints.
-- Uniquely identifies each row in a table.
-- Example: CREATE TABLE Orders (OrderID INT PRIMARY KEY, OrderDate DATE);
-- FOREIGN KEY:

-- References a primary key in another table, establishing a relationship between tables.
-- Ensures data consistency across tables.
-- Example: CREATE TABLE OrderDetails (OrderID INT, ProductID INT, FOREIGN KEY (OrderID) REFERENCES Orders(OrderID), FOREIGN KEY (ProductID) REFERENCES Products(ProductID));
-- CHECK:

-- Defines a specific condition that must be met for data to be valid.
-- Example: CREATE TABLE Employees (Salary DECIMAL(10,2) CHECK (Salary > 10000));
-- DEFAULT:

-- Specifies a default value for a column if no value is provided during data insertion.
-- Example: CREATE TABLE Customers (City VARCHAR(50) DEFAULT 'New York');
-- By effectively using these constraints, you can significantly improve the quality and reliability of your database, reducing errors and ensuring data accuracy.


-- 3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.
-- Why Apply NOT NULL Constraint?

-- The NOT NULL constraint is applied to a column to ensure that it cannot contain null values. This is beneficial for several reasons:

-- Data Integrity:

-- Prevents accidental or intentional omission of crucial data.
-- Ensures that every record has a complete set of information.
-- Data Consistency:

-- Maintains data consistency by enforcing the presence of required values.
-- Helps avoid errors and inconsistencies in calculations or comparisons.
-- Database Performance:

-- Can improve database performance by reducing the need for null value checks and handling during queries.
-- Data Validation:

-- Enforces data validation rules, ensuring that only valid data is entered into the database.
-- Can a Primary Key Contain NULL Values?

-- No, a primary key cannot contain NULL values.

-- A primary key is a unique identifier for a record in a table. It must be unique and not null to fulfill its purpose. If a primary key could contain null values, it would violate the fundamental principle of uniquely identifying each record.

-- Here's why:

-- Unique Identification: A primary key's primary role is to uniquely identify each row in a table. A null value would not be unique and would fail to fulfill this purpose.
-- Referential Integrity: Foreign keys often reference primary keys. If a primary key can be null, it would compromise referential integrity, as foreign key constraints would not be able to enforce valid relationships.
-- Indexing and Performance: Many database systems use primary keys for indexing, which significantly improves query performance. Null values can hinder the efficiency of indexing.
-- Therefore, it's essential to ensure that a primary key is defined as NOT NULL to maintain data integrity and database performance.




-- 4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.
-- Adding a Constraint to an Existing Table

-- To add a constraint to an existing table, you typically use the ALTER TABLE statement. Here's a general syntax:

-- ALTER TABLE table_name
-- ADD constraint_name constraint_type (column_name, ...);
-- Example: Adding a NOT NULL constraint to the 'Price' column of a 'Products' table

-- ALTER TABLE Products
-- ADD CONSTRAINT Price_NotNull CHECK (Price IS NOT NULL);
-- Removing a Constraint from an Existing Table

-- To remove a constraint, you also use the ALTER TABLE statement, but with the DROP CONSTRAINT clause:

-- ALTER TABLE table_name
-- DROP CONSTRAINT constraint_name;
-- Example: Removing the 'Price_NotNull' constraint from the 'Products' table

-- ALTER TABLE Products
-- DROP CONSTRAINT Price_NotNull;
-- Important Considerations:

-- Constraint Naming: It's recommended to give constraints meaningful names to improve readability and maintainability of your database schema.
-- Data Validation: Before adding or removing constraints, ensure that your data is consistent and valid. Removing a constraint might introduce inconsistencies, so be cautious.
-- Database System Specifics: The exact syntax and supported constraint types may vary slightly between different database systems (e.g., MySQL, PostgreSQL, SQL Server).
-- Additional Tips:

-- Consider the Impact: Before modifying constraints, carefully analyze the potential impact on your database, especially if you have a large dataset or complex relationships.
-- Use a Test Environment: Test your changes in a development or testing environment to minimize the risk of unintended consequences.
-- Backup Your Database: Always back up your database before making significant changes, so you can easily restore it if necessary.
-- By following these guidelines and understanding the basic steps, you can effectively add and remove constraints to maintain data integrity and improve the overall quality of your database.


-- 5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.Provide an example of an error message that might occur when violating a constraint.
-- Consequences of Violating Constraints

-- When you attempt to insert, update, or delete data that violates a constraint, the database system will typically:

-- Reject the Operation: The database system will prevent the operation from completing and return an error message. This prevents invalid data from being entered into the database, maintaining data integrity.
-- Trigger an Error: The database system will generate an error message that indicates the specific constraint that was violated. This error message can help you identify and correct the issue.
-- Rollback the Transaction: If the operation is part of a transaction, the entire transaction may be rolled back to its previous state, undoing any changes made.
-- Example Error Message:

-- Suppose you have a table named Products with a Price column that has a CHECK constraint to ensure the price is positive:

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2) CHECK (Price > 0)
);
-- If you try to insert a product with a negative price:

INSERT INTO Products (ProductID, ProductName, Price)
VALUES (1, 'Product A', -10);
-- You might encounter an error message like:

-- Error Code: 1048
-- Column 'Price' cannot be NULL
-- This error message indicates that the CHECK constraint on the Price column has been violated. The database system will reject the insert operation and prevent the invalid data from being entered into the table.

-- Other Potential Consequences:

-- Data Inconsistencies: If constraints are not enforced, it can lead to data inconsistencies, where different parts of the database may contain conflicting information.
-- Incorrect Reporting and Analysis: Inconsistent data can lead to incorrect reports and analysis, making it difficult to make informed decisions.
-- System Errors and Crashes: In severe cases, violating constraints can cause system errors or crashes, especially if the database is heavily used.
-- By enforcing constraints, you can ensure the accuracy, consistency, and reliability of your database, preventing errors and improving data quality.



-- 6.You created a products table without constraints as follows:
CREATE TABLE products (

    product_id INT,

    product_name VARCHAR(50),

    price DECIMAL(10, 2));
-- Now, you realise that?

-- 1.The product_id should be a primary key.

-- 2The price should have a default value of 50.00.

-- for product_id should be a primary key
ALTER TABLE products
ADD PRIMARY KEY (product_id);
-- for default value
ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.00;


-- 7. You have two tables:
-- Students-

-- student_id	Student_name	class_id
-- 1	Alice	101
-- 2	Bob	102
-- 3	Charlie	101
-- Classes-

-- class_id	class_nmae
-- 101	Math
-- 102	Science
-- 103	History
-- Write a query to fetch the student_name and class_name for each student using an INNER JOIN.

SELECT Students.student_name, Classes.class_name
FROM Students
INNER JOIN Classes ON Students.class_id = Classes.class_id;



-- 8.Consider the following three tables:
-- Orders-

-- order_id	order_date	customer_id
-- 1	2024-01-01	101
-- 2	2024-01-03	102
-- Customers-

-- customer_id	customer_name
-- 101	Alice
-- 102	Bob
-- Products-

-- product_id	Product_name	order_id
-- 1	Laptop	1
-- 2	Phone	NULL
-- Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are listed even if they are not associated with an order

-- Hint: (use INNER JOIN and LEFT JOIN)

SELECT O.order_id, C.customer_name, P.product_name
FROM Orders O
INNER JOIN Customers C ON O.customer_id = C.customer_id
LEFT JOIN Products P ON O.order_id = P.order_id;



-- 9. Given the following tables:
-- Sales-

-- sale_id	product_id	amount
-- 1	101	500
-- 2	102	300
-- 3	101	700
-- Products-

-- product_id	Product_name
-- 101	Laptop
-- 102	Phone
-- Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function

SELECT p.product_name, SUM(s.amount) AS total_sales
FROM Products p
INNER JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.product_name;

-- 10. You are given three tables:
-- Orders-

-- order_id	order_date	customer_id
-- 1	2024-01-02	1
-- 2	2024-01-05	2
-- Customers-

-- customer_id	customer_name
-- 1	Alice
-- 2	Bob
-- Oeder_Details -

-- order_id	product_id	qunatity
-- 1	101	2
-- 2	102	1
-- 3	101	3
-- Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables.

SELECT O.order_id, C.customer_name, SUM(OD.quantity) AS total_quantity
FROM Orders O
INNER JOIN Customers C ON O.customer_id = C.customer_id
INNER JOIN Order_Details OD ON O.order_id = OD.order_id
GROUP BY O.order_id, C.customer_name;








-- SQL Commands


use mavenmovies;




-- 1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences
show tables;


SELECT 
    TABLE_NAME, 
    COLUMN_NAME
FROM 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE 
    CONSTRAINT_NAME IN (
        SELECT 
            CONSTRAINT_NAME
        FROM 
            INFORMATION_SCHEMA.TABLE_CONSTRAINTS
        WHERE 
            CONSTRAINT_TYPE = 'PRIMARY KEY'
    );
    
    
    SELECT 
    TABLE_NAME, 
    COLUMN_NAME 
FROM 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE 
    TABLE_SCHEMA = 'mavenmovies' 
    AND CONSTRAINT_NAME = 'PRIMARY';
    
    
    SELECT 
    TABLE_NAME AS 'Foreign Table', 
    COLUMN_NAME AS 'Foreign Key Column', 
    REFERENCED_TABLE_NAME AS 'Referenced Table', 
    REFERENCED_COLUMN_NAME AS 'Referenced Column'
FROM 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE 
    TABLE_SCHEMA = 'mavenmovies' 
    AND REFERENCED_TABLE_NAME IS NOT NULL;


    
    
    
-- 2- List all details of actors

select a.first_name,a.last_name,aa.awards,f.title
from 
actor a
 left join actor_award aa
on a.actor_id=aa.actor_id
left join film_actor fa
on a.actor_id=fa.actor_id 
left join film f
on fa.film_id=f.film_id;

select a.first_name,a.last_name,aa.awards
from 
actor a
left join actor_award aa
on a.actor_id=aa.actor_id;


-- 3 -List all customer information from DB.


select 
  cu.first_name as first_name ,
  cu.last_name as last_name,
  cu.email as email,
  ad.address as address,
  ad.postal_code as postal_code,
  ad.phone as phone
from 
customer as cu
join address as ad
on cu.address_id=ad.address_id;


-- 4 -List different countries. 

select country 
from country;


-- 5 -Display all active customers.

select 
	first_name,
    last_name
from customer
where active=1;

-- 6 -List of all rental IDs for customer with ID 1.

select 
	rental_id
 from
	rental
where
	customer_id=1;






-- 7 - Display all the films whose rental duration is greater than 5 .

select 
	title
from
	film
where
	rental_duration>5;



-- 8 - List the total number of films whose replacement cost is greater than $15 and less than $20.
select 
	count(*) as total_number_films
from 
	film
where 
	replacement_cost between 15 and 20;





-- 9 - Display the count of unique first names of actors.

select  count(distinct first_name) as unique_first_name
from actor;

-- 10- Display the first 10 records from the customer table .

select * 
from customer
limit 10;



-- 11 - Display the first 3 records from the customer table whose first name starts with ‘b’.

select *
from customer
where first_name like 'b%'
limit 3;

-- 12 -Display the names of the first 5 movies which are rated as ‘G’.

select title
from film
where rating='G'
limit 5;




-- 13-Find all customers whose first name starts with "a".

select first_name,last_name 
from customer
where first_name like 'a%';



-- 14- Find all customers whose first name ends with "a".

select first_name,last_name 
from customer
where first_name like '%a';

-- 15- Display the list of first 4 cities which start and end with ‘a’ .

select city
from city
where city like 'a%a'
limit 4;



-- 16- Find all customers whose first name have "NI" in any position.

select first_name,last_name 
from customer
where first_name like '%ni%';

-- 17- Find all customers whose first name have "r" in the second position .

select first_name,last_name 
from customer
where first_name like '_r%';


-- 18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.

select first_name,last_name 
from customer
where first_name like 'a%' and length(first_name)>=5 ;

-- 19- Find all customers whose first name starts with "a" and ends with "o".

select first_name,last_name 
from customer
where first_name like 'a%o';


-- 20 - Get the films with pg and pg-13 rating using IN operator.

select title,rating
from film
where rating in ('PG','PG-13');

-- 21 - Get the films with length between 50 to 100 using between operator.

select title,length
from film
where length between 50 and 100 ;

-- 22 - Get the top 50 actors using limit operator.

select first_name,last_name
from actor
order by first_name asc,last_name asc
limit 50;
 


-- 23 - Get the distinct film ids from inventory table.

select distinct film_id
from inventory;



-- Functions

-- Basic Aggregate Functions:


-- Question 1:
-- Retrieve the total number of rentals made in the Sakila database.
-- Hint: Use the COUNT() function.

select count(*) as total_number from rental;





-- Question 2:
-- Find the average rental duration (in days) of movies rented from the Sakila database.
-- Hint: Utilize the AVG() function.

select avg(rental_duration) as average_rental_duration from film;


-- String Functions:

-- Question 3:
-- Display the first name and last name of customers in uppercase.
-- Hint: Use the UPPER () function.

select upper(first_name) as first_name, upper(last_name) as last_name from customer;


-- Question 4:
-- Extract the month from the rental date and display it alongside the rental ID.
-- Hint: Employ the MONTH() function.

select month(rental_date) as month_rental,rental_id from rental;


-- GROUP BY:

-- Question 5:
-- Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
-- Hint: Use COUNT () in conjunction with GROUP BY.

select
	customer_id ,count(rental_id) as count_rental 
from 
	rental
group by customer_id;


-- Question 6:
-- Find the total revenue generated by each store.
-- Hint: Combine SUM() and GROUP BY.

select
	staff_id as store_id,
	sum(amount) as total_revenue
from 
	payment
group by staff_id;



-- Question 7:
-- Determine the total number of rentals for each category of movies.
-- Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.

select 
	fc.category_id,
    sum(f.rental_duration)
from 
	film as f
join film_category as fc
on f.film_id=fc.film_id
group by fc.category_id ;
	






-- Question 8:
-- Find the average rental rate of movies in each language.
-- Hint: JOIN film and language tables, then use AVG () and GROUP BY.

select 
	l.name,
    avg(f.rental_rate) as average_rental_rate
from film as f
right join  language as l
on f.language_id=l.language_id
group by l.name ;



-- Joins

-- Questions 9 -
-- Display the title of the movie, customer s first name, and last name who rented it.
-- Hint: Use JOIN between the film, inventory, rental, and customer tables.

select 
	f.title as title_movie,
    c.first_name as first_name,
    c.last_name as last_name
from
	film as f
join inventory as i
on f.film_id=i.film_id
join rental as r
on i.inventory_id=r.inventory_id
join customer as c
on r.customer_id=c.customer_id;




-- Question 10:
-- Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
-- Hint: Use JOIN between the film actor, film, and actor tables.


select 
	a.first_name,
    a.last_name
from
	film as f
join
	film_actor as fa
on
	f.film_id=fa.film_id
join
	actor as a
on 
	fa.actor_id=a.actor_id ;



-- Question 11:
-- Retrieve the customer names along with the total amount they've spent on rentals.
-- Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.


select 
	concat(c.first_name,' ',c.last_name) as customer_name,
    sum(p.amount) as total_spent_amount
from
	customer as c
join payment as p
on c.customer_id=p.customer_id
join rental as r
on p.rental_id=r.rental_id
group by c.first_name,c.last_name;



-- Question 12:
-- List the titles of movies rented by each customer in a particular city (e.g., 'London').
-- Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.

select f.title,ci.city
from 
    film as f
join inventory as i
on f.film_id=i.film_id
join rental as r
on i.inventory_id=r.inventory_id
join customer as c
on r.customer_id=c.customer_id
join address as a
on c.address_id=a.address_id
join city as ci
on a.city_id=ci.city_id
where ci.city='London'
group by f.title;



-- Advanced Joins and GROUP BY:


-- Question 13:
-- Display the top 5 rented movies along with the number of times they've been rented.
-- Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.
 
select 
	f.title,
    count(r.rental_id) as number_times_ranted
from film as f
join inventory as i
on f.film_id=i.film_id
join rental as r
on i.inventory_id=r.inventory_id
group by f.title
order by count(r.rental_id) desc
limit 5;



-- Question 14:
-- Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
-- Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.


SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name
FROM 
    customer c
JOIN 
    rental r ON c.customer_id = r.customer_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    store s ON i.store_id = s.store_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
HAVING 
    COUNT(DISTINCT s.store_id) = 2;

-- window functions

-- 1. Rank the customers based on the total amount they've spent on rentals.
select customer_id,sum(amount) as total_amount,
rank() over (order by sum(amount) desc) as rank_no
from payment
group by customer_id;


-- 2. Calculate the cumulative revenue generated by each film over time.

SELECT 
    f.film_id,
    f.title,
    p.payment_date,
    SUM(p.amount) OVER (
        PARTITION BY f.film_id 
        ORDER BY p.payment_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue
FROM 
    payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
ORDER BY f.film_id, p.payment_date;




-- 3. Determine the average rental duration for each film, considering films with similar lengths.

WITH FilmGroups AS (
    SELECT 
        f.film_id,
        f.title,
        f.length,
        ROUND(f.length / 10) * 10 AS length_group -- Group films by ±10-minute lengths
    FROM film f
),
RentalDurations AS (
    SELECT 
        r.rental_id,
        i.film_id,
        DATEDIFF(r.return_date, r.rental_date) AS rental_duration
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    WHERE r.return_date IS NOT NULL -- Ensure rentals have been returned
)
SELECT 
    fg.film_id,
    fg.title,
    fg.length AS film_length,
    fg.length_group,
    rd.rental_duration,
    AVG(rd.rental_duration) OVER (PARTITION BY fg.length_group) AS avg_rental_duration_in_group
FROM FilmGroups fg
JOIN RentalDurations rd ON fg.film_id = rd.film_id
ORDER BY fg.length_group, fg.film_id;


-- 4. Identify the top 3 films in each category based on their rental counts.

WITH FilmRentalCounts AS (
    SELECT
        fc.category_id,
        c.name AS category_name,
        f.film_id,
        f.title,
        COUNT(r.rental_id) AS rental_count
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY fc.category_id, c.name, f.film_id, f.title
),
RankedFilms AS (
    SELECT
        category_id,
        category_name,
        film_id,
        title,
        rental_count,
        RANK() OVER (PARTITION BY category_id ORDER BY rental_count DESC) AS rank_in_category
    FROM FilmRentalCounts
)
SELECT
    category_name,
    title AS film_title,
    rental_count,
    rank_in_category
FROM RankedFilms
WHERE rank_in_category <= 3
ORDER BY category_name, rank_in_category;

-- 5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.

WITH CustomerRentalCounts AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        COUNT(r.rental_id) AS total_rentals
    FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
),
AverageRentals AS (
    SELECT
        AVG(total_rentals) AS avg_rentals
    FROM CustomerRentalCounts
)
SELECT
    crc.customer_id,
    crc.customer_name,
    crc.total_rentals,
    ar.avg_rentals,
    crc.total_rentals - ar.avg_rentals AS rental_difference
FROM CustomerRentalCounts crc
CROSS JOIN AverageRentals ar
ORDER BY rental_difference DESC;

-- 6. Find the monthly revenue trend for the entire rental store over time.

SELECT 
    EXTRACT(YEAR FROM p.payment_date) AS year,
    EXTRACT(MONTH FROM p.payment_date) AS month,
    SUM(p.amount) AS total_revenue
FROM payment p
GROUP BY EXTRACT(YEAR FROM p.payment_date), EXTRACT(MONTH FROM p.payment_date)
ORDER BY year, month;


-- 7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.

WITH CustomerSpending AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(p.amount) AS total_spending
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
),
RankedCustomers AS (
    SELECT
        customer_id,
        customer_name,
        total_spending,
        NTILE(5) OVER (ORDER BY total_spending DESC) AS spending_percentile
    FROM CustomerSpending
)
SELECT
    customer_id,
    customer_name,
    total_spending
FROM RankedCustomers
WHERE spending_percentile = 1
ORDER BY total_spending DESC;

-- 8. Calculate the running total of rentals per category, ordered by rental count.

WITH RentalCountsPerCategory AS (
    SELECT
        c.name AS category_name,
        f.film_id,
        f.title,
        COUNT(r.rental_id) AS rental_count
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY c.name, f.film_id, f.title
)
SELECT
    category_name,
    title AS film_title,
    rental_count,
    SUM(rental_count) OVER (PARTITION BY category_name ORDER BY rental_count DESC) AS running_total_rentals
FROM RentalCountsPerCategory
ORDER BY category_name, rental_count DESC;

-- 9. Find the films that have been rented less than the average rental count for their respective categories.

WITH RentalCounts AS (
    SELECT
        c.name AS category_name,
        f.film_id,
        f.title,
        COUNT(r.rental_id) AS rental_count
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY c.name, f.film_id, f.title
),
CategoryAverages AS (
    SELECT
        category_name,
        AVG(rental_count) AS avg_rental_count
    FROM RentalCounts
    GROUP BY category_name
)
SELECT
    rc.category_name,
    rc.title AS film_title,
    rc.rental_count,
    ca.avg_rental_count
FROM RentalCounts rc
JOIN CategoryAverages ca ON rc.category_name = ca.category_name
WHERE rc.rental_count < ca.avg_rental_count
ORDER BY rc.category_name, rc.rental_count;

-- 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.
SELECT 
    DATE_FORMAT(p.payment_date, '%m') AS month_no,
    SUM(p.amount) AS total_revenue
FROM payment p
GROUP BY DATE_FORMAT(p.payment_date, '%m')
ORDER BY total_revenue DESC
LIMIT 5;


-- Normalisation & CTE

-- a. Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.
-- Understanding First Normal Form (1NF):
-- A table is in First Normal Form (1NF) if:
-- Every column contains atomic (indivisible) values, meaning that each column contains only a single value for each row.
-- Each column contains values of a single type (homogeneous).
-- Each column must have a unique name.
-- The order in which data is stored does not matter.
-- Example of a Table Violating 1NF in the Sakila Database:
-- A common example from the Sakila database that could violate 1NF is the actor_award table, specifically in the awards column.
-- Violation of 1NF:
-- The awards column contains multiple values (e.g., "Best Actor, Best Drama") in a single cell, which violates the atomicity requirement of 1NF. Each column should only contain one value per row.
-- Normalizing the actor_award Table to Achieve 1NF:
-- To bring the table into 1NF, we need to ensure that the awards column contains atomic values, meaning each award should be stored in a separate row.
-- Changes Made:
-- Each award now occupies a separate row.
-- The column award contains only a single value per row, thus satisfying the atomicity requirement of 1NF.
-- Summary:
-- The awards column in the actor_award table violated 1NF by containing multiple values.
-- To normalize it to 1NF, we separated the multiple awards into distinct rows, ensuring each column contains atomic values.


-- 2. Second Normal Form (2NF):
-- a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. If it violates 2NF, explain the steps to normalize it.
-- Understanding Second Normal Form (2NF):
-- A table is in Second Normal Form (2NF) if:
-- It is in First Normal Form (1NF).
-- All non-key attributes are fully functionally dependent on the entire primary key (i.e., there are no partial dependencies).
-- In other words, for a table to be in 2NF:
-- It must have no partial dependency, meaning that no non-key column depends on only part of a composite primary key.
-- If the table has a composite primary key, every non-key attribute must depend on the entire key, not just a part of it.
-- Example of a Table in the Sakila Database:
-- Let's take the film_category table, which has a composite primary key consisting of film_id and category_id.
-- film_category Table:
-- Primary Key: (film_id, category_id)
-- Step 1: Checking if the Table is in 1NF
-- The film_category table is already in 1NF because it has atomic values, and each record represents a unique combination of film_id and category_id.
-- Step 2: Checking for Partial Dependencies
-- To determine if the table violates 2NF, we need to check if any non-key attribute depends on only a part of the composite primary key.
-- In this case, the last_update column depends on both film_id and category_id, but it's not unique to any particular film or category combination. The last_update could be related to the film_id (i.e., when the film was last updated) and not to the category_id directly. This indicates a partial dependency because the last_update does not depend on the entire composite primary key.
-- Step 3: Normalizing to 2NF
-- To bring the film_category table into 2NF, we need to remove the partial dependency. Specifically, the last_update column should be moved into a table where it is fully dependent on the film_id alone.

-- Summary of Steps to Normalize:
-- The film_category table violates 2NF due to a partial dependency of the last_update column on only part of the composite key (film_id).
-- To normalize it:
-- Move the last_update column to the film table, where it is fully dependent on the film_id.
-- The film_category table now only contains the relationship between film_id and category_id, which is the full key.
-- By removing the partial dependency, both tables are now in 2NF. The film_category table is normalized to 2NF, and the new film table ensures that the last_update is related only to the film_id.


-- 3. Third Normal Form (3NF):
-- a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies present and outline the steps to normalize the table to 3NF.
-- Understanding Third Normal Form (3NF):
-- A table is in Third Normal Form (3NF) if:

-- It is in Second Normal Form (2NF).
-- There are no transitive dependencies, meaning that non-key columns do not depend on other non-key columns.
-- A transitive dependency occurs when a non-key column depends on another non-key column, which in turn depends on the primary key.

-- Example of a Table Violating 3NF in Sakila:
-- One table in the Sakila database that could potentially violate 3NF is the staff table.

-- staff Table:
-- staff_id	first_name	last_name	address_id	picture	email	store_id	active	username	password	last_update
-- 1	John	Doe	1	NULL	john.doe@example.com	1	1	jdoe	abc123	2024-01-01 12:00:00
-- 2	Jane	Smith	2	NULL	jane.smith@example.com	2	1	jsmith	xyz789	2024-01-01 12:00:00
-- Primary Key: staff_id

-- Step 1: Identifying Transitive Dependencies
-- In the staff table, the following transitive dependency exists:

-- store_id → store_name (not in the staff table but assumed to be in the store table)
-- store_id determines store_name, and store_name is a non-key column that depends on store_id, which in turn is part of the table. This is a transitive dependency.
-- Additionally:

-- address_id → address, district, city_id (where address_id is a foreign key in the address table)
-- The address_id determines address-related details (address, district, city_id), which are not related directly to the staff's identity but depend on the address ID. This also creates a transitive dependency.
-- Step 2: Normalizing to 3NF
-- To normalize the staff table to 3NF, we need to remove the transitive dependencies. Here's how we can do it:

-- Remove the transitive dependency of store_id on store_name:

-- The store_name should be moved to the store table.
-- Remove the transitive dependency of address_id:

-- The address and related columns (e.g., district, city_id) should be placed in the address table.
-- Normalized Tables:
-- staff Table (after 3NF):
-- staff_id	first_name	last_name	address_id	picture	email	store_id	active	username	password	last_update
-- 1	John	Doe	1	NULL	john.doe@example.com	1	1	jdoe	abc123	2024-01-01 12:00:00
-- 2	Jane	Smith	2	NULL	jane.smith@example.com	2	1	jsmith	xyz789	2024-01-01 12:00:00
-- Primary Key: staff_id
-- Removed store_name and address-related fields (transitive dependencies).
-- store Table (new table for store details):
-- store_id	store_name	manager_staff_id	address_id	last_update
-- 1	Downtown Store	1	1	2024-01-01 12:00:00
-- 2	Uptown Store	2	2	2024-01-01 12:00:00
-- Primary Key: store_id
-- address Table (new table for address details):
-- address_id	address	address2	district	city_id	postal_code	phone	last_update
-- 1	123 Main St	NULL	Downtown	1	12345	555-1234	2024-01-01 12:00:00
-- 2	456 Oak Ave	Suite 101	Uptown	2	67890	555-5678	2024-01-01 12:00:00
-- Primary Key: address_id
-- Summary of Steps to Normalize:
-- Identified Transitive Dependencies:

-- store_id → store_name: Transitive dependency between store_id and store_name.
-- address_id → address, district, city_id: Transitive dependency between address_id and address-related fields.
-- Normalization to 3NF:

-- Removed the transitive dependency by moving the store details to a separate store table.
-- Moved address-related fields to a new address table, with the address_id as a foreign key in the staff table.
-- By removing these transitive dependencies, the staff table is now in 3NF, and the data is more logically structured, reducing redundancy and improving data integrity.




-- 4. Normalization Process:
-- a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF.
-- Let's take a look at the customer table from the Sakila database and walk through the process of normalizing it from its initial unnormalized form (UNF) to Second Normal Form (2NF).

-- Step 1: Understanding the customer Table (Unnormalized Form)
-- The customer table might look like this in an unnormalized form, with some redundant information and partial dependencies:

-- customer_id	store_id	first_name	last_name	email	address_id	address	district	city_id	city	country_id	country	active	create_date	last_update
-- 1	1	John	Doe	john.doe@example.com	1	123 Main St	Downtown	1	New York	1	USA	1	2024-01-01 12:00:00	2024-01-01 12:00:00
-- 2	2	Jane	Smith	jane.smith@example.com	2	456 Oak Ave	Uptown	2	Los Angeles	2	USA	1	2024-01-01 12:00:00	2024-01-01 12:00:00
-- Primary Key: customer_id

-- Issues in the Unnormalized Form (UNF):
-- Redundancy: The address, district, city, and country columns contain repeating information. For instance, the address is tied to the address_id, and the city and country are tied to city_id and country_id, but this data is repeated for each customer.
-- Violation of Atomicity: The table combines unrelated attributes into one table. For example, address and customer details are mixed.
-- Step 2: Normalize to 1NF
-- To bring the table into First Normal Form (1NF), we need to:

-- Ensure that all columns contain atomic values.
-- Remove any repeating groups.
-- We already have atomic values in most cases, but we should eliminate the redundancy in address and city details.

-- customer Table (in 1NF):
-- We can split the redundant data into separate rows, keeping atomic values:

-- customer_id	store_id	first_name	last_name	email	address_id	active	create_date	last_update
-- 1	1	John	Doe	john.doe@example.com	1	1	2024-01-01 12:00:00	2024-01-01 12:00:00
-- 2	2	Jane	Smith	jane.smith@example.com	2	1	2024-01-01 12:00:00	2024-01-01 12:00:00
-- address Table:
-- Now we move the address details to a separate table to eliminate redundancy:

-- address_id	address	district	city_id	postal_code	phone	last_update
-- 1	123 Main St	Downtown	1	12345	555-1234	2024-01-01 12:00:00
-- 2	456 Oak Ave	Uptown	2	67890	555-5678	2024-01-01 12:00:00
-- city Table:
-- Move the city_id and country_id to a city table:

-- city_id	city	country_id	last_update
-- 1	New York	1	2024-01-01 12:00:00
-- 2	Los Angeles	2	2024-01-01 12:00:00
-- country Table:
-- Move the country_id to the country table:

-- country_id	country	last_update
-- 1	USA	2024-01-01 12:00:00
-- 2	Canada	2024-01-01 12:00:00
-- Step 3: Normalize to 2NF
-- To bring the table into Second Normal Form (2NF), we need to ensure that:

-- The table is already in 1NF.
-- All non-key attributes are fully functionally dependent on the entire primary key (no partial dependencies).
-- In the customer table, the store_id is part of the primary key and could be the source of a partial dependency with store_name (if it existed in this table). However, no such partial dependency exists in this case, as all non-key columns (i.e., first_name, last_name, etc.) depend fully on the customer_id.

-- The table is therefore already in 2NF.

-- Final Normalized Schema:
-- customer Table (No changes needed for 2NF):
-- customer_id	store_id	first_name	last_name	email	address_id	active	create_date	last_update
-- 1	1	John	Doe	john.doe@example.com	1	1	2024-01-01 12:00:00	2024-01-01 12:00:00
-- 2	2	Jane	Smith	jane.smith@example.com	2	1	2024-01-01 12:00:00	2024-01-01 12:00:00
-- address Table:
-- address_id	address	district	city_id	postal_code	phone	last_update
-- 1	123 Main St	Downtown	1	12345	555-1234	2024-01-01 12:00:00
-- 2	456 Oak Ave	Uptown	2	67890	555-5678	2024-01-01 12:00:00
-- city Table:
-- city_id	city	country_id	last_update
-- 1	New York	1	2024-01-01 12:00:00
-- 2	Los Angeles	2	2024-01-01 12:00:00
-- country Table:
-- country_id	country	last_update
-- 1	USA	2024-01-01 12:00:00
-- 2	Canada	2024-01-01 12:00:00


-- 5. CTE Basics:
-- a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film_actor tables.
WITH ActorFilmCounts AS (
    SELECT
        a.first_name || ' ' || a.last_name AS actor_name,
        COUNT(fa.film_id) AS film_count
    FROM
        actor a
    JOIN
        film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY
        a.actor_id
)
SELECT
    actor_name,
    film_count
FROM
    ActorFilmCounts
ORDER BY
    film_count DESC;




-- 6. CTE with Joins:
-- a. Create a CTE that combines information from the film and language tables to display the film title, language name, and rental rate.
WITH FilmLanguageInfo AS (
    SELECT
        f.title AS film_title,
        l.name AS language_name,
        f.rental_rate
    FROM
        film f
    JOIN
        language l ON f.language_id = l.language_id
)
SELECT
    film_title,
    language_name,
    rental_rate
FROM
    FilmLanguageInfo
ORDER BY
    film_title;



-- 7. CTE for Aggregation:
-- a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment tables
WITH CustomerRevenue AS (
    SELECT
        c.customer_id,
        c.first_name || ' ' || c.last_name AS customer_name,
        SUM(p.amount) AS total_revenue
    FROM
        customer c
    JOIN
        payment p ON c.customer_id = p.customer_id
    GROUP BY
        c.customer_id
)
SELECT
    customer_name,
    total_revenue
FROM
    CustomerRevenue
ORDER BY
    total_revenue DESC;


-- 8.CTE with Window Functions:
-- a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.
WITH FilmRanked AS (
    SELECT
        f.title AS film_title,
        f.rental_duration,
        RANK() OVER (ORDER BY f.rental_duration DESC) AS rental_rank
    FROM
        film f
)
SELECT
    film_title,
    rental_duration,
    rental_rank
FROM
    FilmRanked
ORDER BY
    rental_rank;


-- 9.CTE and Filtering:
-- a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve additional customer details
WITH CustomerRentalCount AS (
    SELECT
        p.customer_id,
        COUNT(p.rental_id) AS rental_count
    FROM
        payment p
    GROUP BY
        p.customer_id
    HAVING
        COUNT(p.rental_id) > 2
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.address_id,
    c.active,
    c.create_date,
    c.last_update
FROM
    customer c
JOIN
    CustomerRentalCount crc ON c.customer_id = crc.customer_id
ORDER BY
    c.first_name, c.last_name;


-- 10.CTE for Date Calculations:
-- a. Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table
WITH MonthlyRentals AS (
    SELECT
        YEAR(r.rental_date) AS rental_year,
        MONTH(r.rental_date) AS rental_month,
        COUNT(r.rental_id) AS total_rentals
    FROM
        rental r
    GROUP BY
        YEAR(r.rental_date),
        MONTH(r.rental_date)
)
SELECT
    rental_year,
    rental_month,
    total_rentals
FROM
    MonthlyRentals
ORDER BY
    rental_year DESC,
    rental_month DESC;


-- 11.CTE and Self-Join:
-- a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.
WITH ActorPairs AS (
    SELECT
        fa1.actor_id AS actor_id_1,
        fa2.actor_id AS actor_id_2,
        fa1.film_id
    FROM
        film_actor fa1
    JOIN
        film_actor fa2 ON fa1.film_id = fa2.film_id
    WHERE
        fa1.actor_id < fa2.actor_id  -- To avoid duplicate pairs
)
SELECT
    ap.actor_id_1,
    ap.actor_id_2,
    f.title AS film_title
FROM
    ActorPairs ap
JOIN
    film f ON ap.film_id = f.film_id
ORDER BY
    f.title, ap.actor_id_1, ap.actor_id_2;


-- 12. CTE for Recursive Search:
-- a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to column
WITH RECURSIVE EmployeeHierarchy AS (
    -- Base case: Get the employees who report directly to the specific manager
    SELECT
        s.staff_id,
        s.first_name,
        s.last_name,
        s.reports_to
    FROM
        staff s
    WHERE
        s.reports_to = <manager_staff_id>  -- Replace <manager_staff_id> with the manager's staff_id

    UNION ALL

    -- Recursive case: Get employees who report to the employees found in the previous step
    SELECT
        s.staff_id,
        s.first_name,
        s.last_name,
        s.reports_to
    FROM
        staff s
    INNER JOIN EmployeeHierarchy eh ON s.reports_to = eh.staff_id
)
-- Final select to get all employees in the hierarchy
SELECT
    staff_id,
    first_name,
    last_name
FROM
    EmployeeHierarchy;









