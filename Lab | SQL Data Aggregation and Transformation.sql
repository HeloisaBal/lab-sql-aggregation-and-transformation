#Challenge 1

-- 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
SELECT MIN(length) as min_duration, max(length) as max_duration
FROM sakila.film;


-- 1.2. Express the average movie duration in hours and minutes. Don't use decimals. Hint: look for floor and round functions.
SELECT CONCAT(FLOOR(AVG(length) / 60), ' Hours ', ROUND(AVG(length) % 60), ' Minutes') AS avg_duration
FROM film;


-- 2.1 Calculate the number of days that the company has been operating. Hint: To do this, use the rental table, and the DATEDIFF() function to subtract the earliest date in the rental_date column from the latest date.
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date))
AS operating_days
FROM rental;


-- 2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.
SELECT *, MONTH(rental_date)
AS 'Month', DAYNAME(rental_date)
AS 'Weekday'
FROM rental
LIMIT 20;


-- 2.3 Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week. Hint: use a conditional expression.
SELECT *, MONTH(rental_date)
AS 'Month', DAYNAME(rental_date)
AS 'Weekday', 
CASE 
	WHEN DAYNAME(rental_date) IN ('Saturday', 'Sunday') THEN 'Weekend'
    WHEN DAYNAME(rental_date) NOT IN ('Saturday', 'Sunday') THEN 'Weekday'
    END AS 'Day Type'
    FROM rental;

-- 3. We need to ensure that our customers can easily access information about our movie collection.

SELECT title, IFNULL(rental_duration, 'Not Available') AS 'rental_duration'
FROM sakila.film
ORDER BY title ASC;

-- 4. 

SELECT concat(first_name, " ", last_name, left(email,3))
AS 'Personalized' FROM sakila.customer
ORDER BY last_name ASC;

#Challenge 2
-- 1.
SELECT DISTINCT COUNT(title) 
FROM sakila.film;

-- 1.2
SELECT DISTINCT rating,
COUNT(title)
FROM sakila.film
GROUP BY rating;

-- 1.3 
SELECT DISTINCT rating,
COUNT(title)
FROM sakila.film
GROUP BY rating
ORDER BY COUNT(title) DESC;

-- 2.

SELECT DISTINCT staff_id,
COUNT(rental_id)
FROM sakila.rental
GROUP BY staff_id;

-- 3.
SELECT DISTINCT rating, ROUND(AVG(length))
FROM sakila.film
GROUP BY rating
ORDER BY (AVG(length)) DESC;

-- 3.2
SELECT DISTINCT rating, ROUND(AVG(length))
FROM sakila.film
GROUP BY rating
HAVING AVG(length) > 120;

-- 4.
SELECT last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) = 1;



























