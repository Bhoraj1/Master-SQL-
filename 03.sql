--Basic Grouping : Day 3
-- 3.1: Aggregation functions : Aggregate values in multiple rows to one value
-- most common 	aggretation functions:
SUM() MIN() COUNT()
AVG() MAX()

SELECT SUM(amount) from payment
SELECT SUM(amount),ROUND(AVG(amount),2) as Average from payment

--Challenge
What is the minimum,maximum,averate(rounded) and sum of the the replacement cost of the film.

SELECT MIN(replacement_cost),MAX(replacement_cost),
ROUND(AVG(replacement_cost),2),SUM(replacement_cost) FROM film


--3.2 Group by; Use to Group aggregiations by specific columns
SELECT customer_id, SUM(amount)
FROM payment WHERE customer_id > 3
GROUP BY customer_id ORDER BY customer_id

-- Challenge
Which of the two employee responsible for a higher overall payment amount ?
SELECT staff_id, SUM(amount),COUNT(*) FROM payment
GROUP BY staff_id ORDER BY sum(amount) 


How do these amounts change if we don't consider amount equailt to 0 ?

SELECT staff_id,SUM(amount),COUNT(*) FROM payment 
WHERE amount != 0
GROUP BY staff_id

-- GROUP BY multiple Column

SELECT staff_id ,customer_id,
SUM(amount),COUNT(*) FROM payment
GROUP BY staff_id,customer_id
ORDER BY COUNT(*) DESC

SELECT DATE(payment_date) from payment

-- Challenge
Which employee has the highest sales amount in a single day ?

SELECT staff_id, DATE(payment_date),SUM(amount) FROM payment GROUP BY staff_id,DATE(payment_date)
ORDER BY SUM(amount) DESC

Which employee had the most sales in a single day.

SELECT staff_id, DATE(payment_date),SUM(amount),COUNT(*) FROM payment 
WHERE amount != 0 GROUP BY staff_id,DATE(payment_date)
ORDER BY COUNT(*) DESC

-- Having : Used to filter groupings by aggretations. Use only when using grouping data.

SELECT customer_id,SUM(amount) from payment GROUP BY customer_id HAVING SUM(amount) > 200

SELECT staff_id, DATE(payment_date), SUM(amount), COUNT(*) from payment
WHERE amount !=0 GROUP BY staff_id, DATE(payment_date)
HAVING COUNT(*) > 400
ORDER BY COUNT(*) DESC

SELECT staff_id, DATE(payment_date), SUM(amount), COUNT(*) from payment
WHERE amount !=0 GROUP BY staff_id, DATE(payment_date)
HAVING COUNT(*) = 45 OR COUNT(*) = 40
ORDER BY COUNT(*) DESC

-- Challenge
What is the average payment amount group by customer and day - consider only the days/customers with more 
than 1 payment(per custoer and day) order by the average amount in decending order.

SELECT customer_id, DATE(payment_date),ROUND(AVG(amount),2),COUNT(*) FROM payment 
WHERE DATE(payment_date) IN('2020-04-28','2020-04-29','2020-04-30')
GROUP BY customer_id, DATE(payment_date)
HAVING COUNT(*) > 1 
ORDER BY ROUND(AVG(amount),2) DESC
