# Morning Lab

-- 1 . How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT COUNT(f.film_id), name
FROM sakila.film_category f
JOIN sakila.category c 
USING (category_id)
GROUP BY category_id;


-- 2.Display the total amount rung up by each staff member in August of 2005.

SELECT SUM(p.amount), s.first_name
FROM sakila.payment p 
JOIN sakila.staff s
USING (staff_id)
WHERE p.payment_date LIKE '2005-08%'
GROUP BY staff_id;


-- 3. Which actor has appeared in the most films?

SELECT CONCAT(a.first_name,' ',a.last_name) AS actor_name, COUNT(fa.film_id)
FROM sakila.film_actor fa
JOIN sakila.actor a
USING (actor_id)
GROUP BY actor_name
ORDER BY COUNT(fa.film_id) DESC
LIMIT 1;


-- 4. Most active customer (the customer that has rented the most number of films)

SELECT CONCAT(c.first_name,' ',c.last_name) AS customer_name, COUNT(r.customer_id)
FROM sakila.rental r 
JOIN sakila.customer c
USING (customer_id)
GROUP BY customer_name
ORDER BY COUNT(r.customer_id) DESC
LIMIT 1;


-- 5. Display the first and last names, as well as the address, of each staff member.

SELECT CONCAT(s.first_name,' ',s.last_name) AS staff_name, address
FROM sakila.staff s
JOIN sakila.address a 
USING (address_id);

-- 6. List each film and the number of actors who are listed for that film.
SELECT f.title, COUNT(fa.actor_id) AS actor_count
FROM sakila.film_actor fa
JOIN sakila.film f
USING (film_id)
GROUP BY f.title;



-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT CONCAT(c.last_name, ', ', c.first_name) AS customer_name, SUM(p.amount) AS total_payment
FROM sakila.payment p
JOIN sakila.customer c
USING (customer_id)
GROUP BY customer_name
ORDER BY customer_name DESC;



-- 8. List the titles of films per category.
SELECT f.title, fc.category_id
FROM film f
JOIN film_category fc
USING (film_id);




