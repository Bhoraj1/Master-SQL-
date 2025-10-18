Day 2 (fltering Data)
1.Where: Used to Filter the data in the output . always after FROM

SELECT * FROM payment WHERE amount = 10.99
SELECT * FROM customer WHERE first_name = 'ADAM'

--Challenge
 i.How many payment were made by the customer where customer_id = 100 ?
SELECT COUNT(*) FROM payment WHERE  customer_id = 100

 ii.What is the last name of our customer with first name 'ERICA'
SELECT first_name,last_name FROM customer where first_name = 'ERICA'


1.1 Where Operators
SELECT * from payment WHERE amount > 10.99
SELECT * from payment WHERE amount < 10.99 ORDER BY amount DESC
SELECT * from payment WHERE amount <= 10.99 ORDER BY amount DESC
SELECT * from payment WHERE amount != 10.99 

SELECT first_name,last_name FROM customer WHERE first_name is null
SELECT first_name,last_name FROM customer WHERE first_name is not null

--Challenge
 i.The Inventory Manager asks you how rentals have not been returned yet(return_date is null)
 SELECT COUNT(*) FROM rental WHERE return_date is null
 
 ii. The Sales Manager asks you how for a list of the all payment_ids with an amount is less than or equal to $2.include payment_id and the amount
 SELECT payment_id,amount FROM payment WHERE amount <= 2 ORDER BY amount DESC

 2. AND/OR :Use to connect two conditions (AND=Must tru both conditions/ OR=Either of those conditions must be true))
 SELECT * FROM payment WHERE amount = 10.99 AND customer_id = 426
 
 SELECT * FROM payment WHERE amount = 10.99 OR amount = 426
 
 SELECT * FROM payment WHERE amount = 10.99 OR (amount = 9.99 AND customer_id = 426)
 SELECt * FROM payment WHERE (customer_id = 30 OR customer_id=31) AND amount = 2.99   


 --Challenge 
 i.The Support Manager asks you about a list of all the payments of the customers 322,346 and 354 where the amount is either less then 2 or greater than 10
 It should be ordered by the customers first(acending) and then as second condition order by amount in a decending order.
 
 SELECT * FROM payment WHERE (customer_id = 322 OR customer_id = 346 OR customer_id = 354)
 AND (amount < 2 OR amount > 10) 
 ORDER BY customer_id ASC,amount DESC


--3.Between/AND
SELECT * FROM payment WHERE amount BETWEEN 1.99 AND 6.99
SELECT * FROM payment WHERE amount NOT BETWEEN 1.99 AND 6.99
SELECT * FROM rental WHERE rental_date BETWEEN '2005-05-24' AND '2005-05-26 23:59' ORDER BY rental_date DESC

--Challenge
There have been some faulty payments and you need to help to found out how many paments have been affected.

How many payments have been made on january 26th and 27th 2020 with an amount between 1.99 and 3.99

SELECT COUNT(*) FROM payment WHERE amount BETWEEN 1.99 AND 3.99
AND payment_date BETWEEN '2020-01-26' AND '2020-01-27 23:59'

-- IN	
SELECT * FROM customer WHERE customer_id IN(123,212,323,243)

-- Challenge
There have been 6 complaints of customers abaout  their payments (customer_id:12,25,67,93,124,234). the concerned payments 
are all the payments of these customers with amount 4.99,7.99 and 9.99 in january 2020.

SELECT * FROM payment WHERE customer_id IN (12,25,67,93,124,234)
AND amount IN (4.99,7.99,9.99)
AND payment_date BETWEEN '2020-01-01' AND '2020-02-01'


-- LIKE : Used to filter by matching against a pattern. use wildercards _(single character) or %(sequence characters).
i.Case sensitive of character os use use ILIKE instead of LIKE for that.
ii. 'A%' : Started
iii. '%A%' : any where in the text.
iv.  '_A%'  : It represent any first[0] character and second will be [A].
v.   '__A%'  : A will be third character.


SELECT * FROM film
WHERE description LIKE '%Drama%'
AND title LIKE '_T%'

-- Challenges
-- How many movies are there that contain the "Documentary" in the description.

SELECT COUNT(*) from film 
WHERE description LIKE '%Documentary%'

/*How many customers are there with a first name that is 3 letters long and either an 'X' or 'Y'
as the letter in the last name */

SELECT COUNT(*) from customer
WHERE first_name LIKE '___' 
AND (last_name LIKE '%X%'
OR last_name LIKE '%Y%')

-- Aliases
SELECT payment_id as innovice_no FROM payment
SELECT COUNT(*) as num_of_movies FROM film WHERE description LIKE '%Documentary%'


-- Today 2 days Summary Challenges:
1.How many moveis are there that contain 'Saga' in the description and where the title starts either
 with 'A' or ends with 'R' ? use the alias 'no_of_movies'.

 SELECT COUNT(*) as no_of_movies FROM film
 where description LIKE '%Saga%'
 AND (title LIKE 'A%' OR title LIKE '%R')

2.Create a list of all customers where the first name contains 'ER' and has an 'A' as the second 
letter. Order the results by the last name descendingly.

SELECT * FROM customer WHERE first_name LIKE '%ER%' 
AND first_name LIKE '_A%' ORDER BY last_name DESC

3. How many payments are tehre where the amount is either 0 or is between 3.99 and 7.99 and in the
same time has happened on 2020-05-01.

SELECT COUNT(*) from payment
WHERE (amount=0
OR amount BETWEEN 3.99 AND 7.99)
AND payment_date BETWEEN '2020-05-01' AND '2020-05-02' 
 
 
