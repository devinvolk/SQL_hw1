-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- Answer = 2
-- 2. How many payments were made between $3.99 and $5.99?
SELECT amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- Answer = 4794
-- 3. What film does the store have the most of? (search in inventory table)
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
HAVING COUNT(film_id) > 7
ORDER BY COUNT(film_id) DESC;

-- Answer = there are 72 films with 8 copies, no films have more than 8 copies
-- 4. How many customers have the last name ‘William’?
SELECT last_name
FROM customer
WHERE last_name = 'William';

-- Answer = 0
-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(rental_id)
FROM rental
GROUP BY staff_id
ORDER BY COUNT(rental_id) DESC;

-- Answer = staff_id: 1
-- 6. How many different distinct names are there?
SELECT DISTINCT first_name, last_name
FROM customer
UNION
SELECT DISTINCT first_name, last_name
FROM actor

-- Answer = 815
-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY count(actor_id) DESC;

-- Answer = film_id: 508
-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(last_name)
FROM customer
WHERE store_id = 1 and last_name like '%es';

-- Answer = 13
-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT COUNT(amount), amount
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;

-- Answer = 3
-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;

-- Answer = 5 rating categories and PG-13 has the most movies total