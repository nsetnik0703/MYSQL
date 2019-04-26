# 1a + 1b
SELECT concat(first_name," " ,last_name) AS Actor_Name FROM actor UPPER;

# 2a
SELECT * FROM actor WHERE first_name = "joe";
# 2b
SELECT * FROM actor WHERE last_name LIKE "%GEN%";
# 2c
SELECT last_name,first_name FROM actor WHERE last_name LIKE "%LI%";
# 2d
SELECT country_id, country FROM country WHERE country IN ('Afghanistan','Bangladesh','China');

# 3a
ALTER TABLE actor ADD COLUMN Description BLOB;
# 3b
ALTER TABLE actor DROP COLUMN Description;

# 4a
SELECT last_name, COUNT(*) AS last_multiple FROM actor GROUP BY last_name;
# 4b
SELECT last_name, COUNT(*) AS last_multiple FROM actor GROUP BY last_name HAVING last_multiple >= 2 ;
# 4c
UPDATE actor SET first_name = "HARPO" WHERE first_name = "GROUCHO";
# 4d
UPDATE actor SET first_name = "GROUCHO" WHERE first_name = "HARPO";

# 5a
CREATE TABLE IF NOT EXISTS address LIKE address;

# 6a
SELECT s.first_name , s.last_name , a.address FROM staff s LEFT JOIN address a ON (s.address_id = a.address_id);
# 6b    
SELECT s.first_name , s.last_name , SUM(p.amount) FROM staff s LEFT JOIN payment p ON (p.staff_id = s.staff_id) GROUP BY first_name;
# 6c
SELECT film.title , COUNT(film_actor.actor_id) AS actor_count 
FROM film_actor
JOIN film ON film.film_id = film_actor.film_id GROUP BY film_actor.film_id;
# 6d
SELECT film.title , COUNT(film.film_id) AS Number_of_copies 
FROM inventory 
JOIN film ON film.film_id = inventory.film_id 
WHERE film.film_id = 439;
# 6e payment. , customer. list the total paid by each customer. List the customers alphabetically by last name:;
SELECT c.customer_id , c.first_name , c.last_name , SUM(p.amount) 
FROM customer c 
JOIN payment p ON p.customer_id = c.customer_id 
GROUP BY c.customer_id
ORDER BY last_name desc;

#7a AND,subqueries
SELECT film.title, film.language_id FROM film WHERE film.title LIKE "K%" OR film.title LIKE  "Q%"; #AND WHERE IN (SELECT film.language_id WHERE film.language_id = 1);
#7b
SELECT film.title, film.film_id, COUNT(*) AS Number_of_actors FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
WHERE film.film_id = 17;
#7c error
SELECT address.address_id , customer.email, address.district FROM address
JOIN customer ON customer.address_id = address.address_id
WHERE address.district = "Alberta";
#7d error
SELECT film.title, film.film_id  FROM film
WHERE film.film_id IN(SELECT film_category.category_id, category.name FROM film_category
JOIN film_category ON film.film_id = film_category.film_id
WHERE film_category_id = 7);
#7e


#8a CREATE VIEW
