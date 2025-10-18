1.SELECT : Used to select and return data

SELECT first_name,last_name FROM actor

1.1.All columns
SELECT * FROM actor

-- Challenge no 1 
Your first day as a Data Analyst has started!
The Marketing Manager asks you for a
list of all customers.
With first name, last name and the customer's email address.

2.ORDER BY : Used to order results based on a column
Alphabetically, numerically, chronologically etc.

SELECT first_name, last_name FROM actor ORDER BY first_name


3. ASC/DESC
SELECT first_name,last_name FROMactor ORDER BY first_name DESC
SELECT first_name,last_name FROM actor ORDER BY first_name DESC,last_name

4.SELECT DISTINCT :Used to SELECT the DISTINCT values in a table
SELECT DISTINCT first_name FROM actor ORDER BY first_name 
SELECT DISTINCT first_name, last_name FROM actor ORDER BY first_name

5.Limit : Used to LIMIT the number of rows in the output Always at the very end of your query SELECT first_name FROM actor ORDER BY first_name LIMIT 4

6.Count :Used to COUNT the number of rows in a output Used often in combination with grouping & SELECT COUNT first_name) FROM actor
SELECT COUNT (*) FROM actor
SELECT COUNT (DISTINCT first_name) FROM actor

Chalanges question:
1.Create a list of all the distinct districts customers are from.
SELECT DISTINCT district FROM address

2.What is the latest rental date
SELECT rental_date FROM rental ORDER BY rental_date DESC LIMIT 1 

3.How many films does the company have?
SELECT COUNT (*) FROM film

4.How many distinct last names of the customers are there?
SELECT COUNT (DISTINCT last_name) FROM customer
