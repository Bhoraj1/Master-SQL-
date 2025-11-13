Day 4 Basic functions
4.1 String functions

SELECT UPPER(email),
LOWER(email),
LENGTH(email)
FROM customer
WHERE LENGTH(email) < 30

-- Challenge
1 Find the those customers and output the list of these first and last names in all lower case.
SELECT LOWER(first_name),LOWER(last_name),LOWER(email) FROM customer 
WHERE LENGTH(first_name) > 10 OR LENGTH(last_name) > 10


4.1 LEFT and RIGHT functions
SELECT LEFT(first_name,2),first_name FROM CUSTOMER

SELECT RIGHT(LEFT(first_name,2),1),first_name FROM CUSTOMER

-- Challenge
1.Extract the last five characters of the email address list.
2.The email address always ends with '.org'.

SELECT RIGHT(email,50 FROM customer
SELECT LEFT(RIGHT(email,4),1) FROM customer


4.3 Concatenate(||)

SELECT LEFT(first_name,1) || LEFT(last_name,1)
FROM customer

SELECT LEFT(first_name,1) || '.' || LEFT(last_name,1)
FROM customer


-- Challenge
You need to create an anonymized version of the email address.
followed by  '***' and then the alst start with '@'

 SELECT LEFT(email,1) || '***' || RIGHT(email,19)  FROM customer
 


4.4 Position
SELECT LEFT(email,POSITION('@' IN email))FROM customer

-- Challenge
1. You have only the email address and the last name of the customers. extract the 
first name from the email address and concinate with the last name. It should in the form.
"Last name, First name".

SELECT last_name || ', ' || LEFT(email,POSITION('.' IN email)-1),last_name from customer


4.5 Substring : Used to extract a substring from a string.

SELECT email,SUBSTRING(email FROM 3 for 2)FROM customer

-- one way
SELECT email,SUBSTRING(email FROM  POSITION ('.' in email)+1 for LENGTH(last_name))
FROM customer 

-- another dynamic way
SELECT email,SUBSTRING(email FROM  POSITION ('.' in email)+1 for 
POSITION('@' in email) - POSITION('.' in email) -1)
FROM customer 


-- Challenging
1. Create and anonymized from email address in the following way.
 i. M***.S***@ram@gmail.com

SELECT LEFT(email,1) || '***' ||
SUBSTRING(email FROM POSITION('.' in email) for 2)
|| '***'|| SUBSTRING(email FROM POSITION('@' in email))
FROM customer


ii. ***A.S***@ram@gmail.com

SELECT '***' || SUBSTRING(email from POSITION('.' in email) - 1 for 3)
|| '***' ||
SUBSTRING(email from POSITION('@' in email))
FROM customer



4.6 EXTRACT DATES & TIMESTAMP -----

date    just date without time  '2020-22-18'
time    just time without date  '01:02:02.678'
timestamp  date and time        '2020-22-18 01:02:02.678'

SYNTAX : EXTRACT(field FROM date/time/interval)


SELECT EXTRACT(day from rental_date), 
COUNT(*) 
FROM rental
GROUP BY EXTRACT (day from rental_date)
ORDER BY COUNT(*) DESC

-- Challenge
1.What is the month with the most  highest total payment amount.

SELECT EXTRACT(month from payment_date) as month,
SUM(amount) as total_amount_payment
FROM payment 
GROUP BY month
ORDER BY total_amount_payment DESC

2.What is the day of week with the highest total payment amount ? (0 is sunday).
dow = day of week.

SELECT EXTRACT(dow from payment_date) as day_of_week,
SUM(amount) as total_amount_payment
FROM payment 
GROUP BY day_of_week
ORDER BY total_amount_payment DESC

3.What is the highest amount one customer has spent in a week ?

SELECT customer_id ,EXTRACT(week from payment_date) as week,
SUM(amount) as total_amount_payment
FROM payment 
GROUP BY week,customer_id
ORDER BY total_amount_payment DESC


4.7 Own custom FORMAT(TO_CHAR): Used to get custom formats timestamp/date/numbers
Syntax: TO_CHAR (rental_date,format)

SELECT *,EXTRACT(month from payment_date),
TO_CHAR(payment_date,'MM-YYYY'),
TO_CHAR(payment_date,'Day'),
TO_CHAR(payment_date,'Day Month YYYY')
FROM payment

SELECT SUM(amount),
TO_CHAR(payment_date,'Dy Mon YYYY')
FROM payment 
GROUP BY TO_CHAR(payment_date,'Dy Mon YYYY')

-- Challenge
1. You need to group in the following formats;

-- First Format
total_amount     day
84.64            Fri,24/2022

SELECT SUM(amount) as total_amount,
TO_CHAR(payment_date,'Dy DD/MM/YY') as day
FROM payment 
GROUP BY day
ORDER BY total_amount

-- Second Format
total_amount     day
84.64            May,2020

SELECT SUM(amount) as total_amount,
TO_CHAR(payment_date,'Mon,YYYY') as mon_year
FROM payment 
GROUP BY mon_year
ORDER BY total_amount


-- Thid Format
 total_amount     day 
84.64            Thu,02:44

SELECT SUM(amount) as total_amount,
TO_CHAR(payment_date,'Dy,HH:MI') as Minutes
FROM payment 
GROUP BY Minutes
ORDER BY total_amount ASC


4.8  -- Intervals and TimeStamp

SELECT CURRENT_TIMESTAMP
CURRENT_TIMESTAMP,
return_date - rental_date
FROM rental

SELECT CURRENT_TIMESTAMP,
EXTRACT(day from return_date - rental_date)
FROM rental

-- Challenge
list of rental duration of customer with customer_id 35,

SELECT customer_id, return_date-rental_date
FROM rental WHERE customer_id = 35

also customer which has longest average rental duration.

SELECT customer_id, AVG(return_date-rental_date) rental_duration
FROM rental 
GROUP BY customer_id
ORDER BY rental_duration DESC








 






