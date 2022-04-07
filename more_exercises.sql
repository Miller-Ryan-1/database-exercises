## USING SAKILA DATABASE - GUIDED EXERCISES
USE sakila;

#1a. Select all columns from the actor table.
SELECT * FROM actor;

#1b. Select only the last_name column from the actor table.
SELECT last_name FROM actor;

#1c. Select only the film_id, title, and release_year columns from the film table.
SELECT film_id, title, release_year FROM film;

#2a. Select all distinct (different) last names from the actor table.
SELECT DISTINCT last_name FROM actor;

#2b. Select all distinct (different) postal codes from the address table.
SELECT DISTINCT postal_code FROM address;

#2c. Select all distinct (different) ratings from the film table.
SELECT DISTINCT rating FROM film;

#3a. Select the title, description, rating, movie length columns from the films table that last 3 hours or longer.
SELECT title, description, rating, length FROM film WHERE length > 180;

#3b. Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005.
SELECT payment_id, amount, payment_date FROM payment WHERE payment_date LIKE '2005-05-27%';

#3c. Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N.
SELECT * FROM customer WHERE last_name LIKE 'S%' AND first_name LIKE '%n';

#3d. Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M".
SELECT * FROM customer WHERE active = 0 OR last_name LIKE 'M%';

#3e. Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T.
SELECT * FROM category WHERE category_id > 4 AND (name LIKE 'C%' OR name LIKE 'S%' OR name LIKE 'T%');

#3f. Select all columns minus the password column from the staff table for rows that contain a password.
SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update FROM staff WHERE password IS NOT NULL;

#3g. Select all columns minus the password column from the staff table for rows that do not contain a password.
SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update FROM staff WHERE password IS NULL;
SELECT * FROM address;
#4a. Select the phone and district columns from the address table for addresses in California, England, Taipei, or West Java.
SELECT phone, district FROM address WHERE district IN ('California', 'England', 'Taipei', 'West Java');

#4b. Select the payment id, amount, and payment date columns from the payment table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005. (Use the IN operator and the DATE function, instead of the AND operator as in previous exercises.)
SELECT payment_id, amount, payment_date FROM payment WHERE DATE(payment_date) IN ('2005-05-25','2005-05-27','2005-05-29');

#4c. Select all columns from the film table for films rated G, PG-13 or NC-17.
SELECT * FROM film WHERE rating IN ('G','PG-13','NC-17');

#5a. Select all columns from the payment table for payments made between midnight 05/25/2005 and 1 second before midnight 05/26/2005.
SELECT * FROM payment WHERE DATE(payment_date) = '2005-05-25';

#5b. Select the film_id, title, and descrition columns from the film table for films where the length of the description is between 100 and 120.
SELECT film_id, title, description FROM film WHERE length BETWEEN 100 AND 120;
-- Assumed inclusive of 100 and 120

#6a. Select the following columns from the film table for rows where the description begins with "A Thoughtful".
SELECT * FROM film WHERE description LIKE 'A Thoughtful%';

#6b. Select the following columns from the film table for rows where the description ends with the word "Boat".
SELECT * FROM film WHERE description LIKE '%Boat';

#6c. Select the following columns from the film table where the description contains the word "Database" and the length of the film is greater than 3 hours.
SELECT * FROM film WHERE description LIKE '%Database%' AND length > 180;

#7a. Select all columns from the payment table and only include the first 20 rows.
SELECT * FROM payment LIMIT 20;

#7b. Select the payment date and amount columns from the payment table for rows where the payment amount is greater than 5, and only select rows whose zero-based index in the result set is between 1000-2000.
SELECT payment_date, amount FROM payment WHERE amount > 5 LIMIT 1001 OFFSET 999;
-- Inclusive

#7c. Select all columns from the customer table, limiting results to those where the zero-based index is between 101-200.
SELECT * FROM customer LIMIT 100 OFFSET 100;
-- Inclusive, and assuming this was also fromt the result set.

#8a. Select all columns from the film table and order rows by the length field in ascending order.
SELECT * FROM film ORDER BY length;

#8b. Select all distinct ratings from the film table ordered by rating in descending order.
SELECT DISTINCT rating FROM film ORDER BY rating DESC;

#8c. Select the payment date and amount columns from the payment table for the first 20 payments ordered by payment amount in descending order.
SELECT payment_date, amount FROM payment ORDER BY amount DESC LIMIT 20;

#8d. Select the title, description, special features, length, and rental duration columns from the film table for the first 10 films with behind the scenes footage under 2 hours in length and a rental duration between 5 and 7 days, ordered by length in descending order.
SELECT title, description, special_features, length, rental_duration FROM film WHERE special_features LIKE '%Behind the Scenes%' AND length < 120 AND rental_duration BETWEEN 5 AND 7 ORDER BY length DESC LIMIT 10;

#9a. Select customer first_name/last_name and actor first_name/last_name columns from performing a left join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
SELECT customer.first_name AS customer_first_name, customer.last_name AS customer_last_name, actor.first_name AS actor_first_name, actor.last_name AS actor_last_name FROM customer LEFT JOIN actor ON customer.last_name = actor.last_name;

#9b. Select the customer first_name/last_name and actor first_name/last_name columns from performing a /right join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
SELECT customer.first_name AS customer_first_name, customer.last_name AS customer_last_name, actor.first_name AS actor_first_name, actor.last_name AS actor_last_name FROM customer RIGHT JOIN actor ON customer.last_name = actor.last_name;

#9c. Select the customer first_name/last_name and actor first_name/last_name columns from performing an inner join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
SELECT customer.first_name AS customer_first_name, customer.last_name AS customer_last_name, actor.first_name AS actor_first_name, actor.last_name AS actor_last_name FROM customer JOIN actor ON customer.last_name = actor.last_name;

#9d.  Select the city name and country name columns from the city table, performing a left join with the country table to get the country name column.
SELECT city.city, country.country FROM country LEFT JOIN city USING(country_id);

#9e. Select the title, description, release year, and language name columns from the film table, performing a left join with the language table to get the "language" column.
SELECT film.title, film.description, film.release_year, language.name FROM film LEFT JOIN language USING(language_id);

#9f. Select the first_name, last_name, address, address2, city name, district, and postal code columns from the staff table, performing 2 left joins with the address table then the city table to get the address and city related columns.
SELECT staff.first_name, staff.last_name, address.address, address.address2, city.city, address.district, address.postal_code FROM staff LEFT JOIN address USING(address_id) LEFT JOIN city USING(city_id);



##USING SAKILA DATABASE - OPEN EXERCISES
USE sakila;

#1. Display the first and last names in all lowercase of all the actors.
SELECT LOWER(first_name), LOWER(last_name) FROM actor;

#2. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you could use to obtain this information?
SELECT actor_id, first_name, last_name FROM actor WHERE first_name = 'Joe';

#3. Find all actors whose last name contain the letters "gen":
SELECT first_name, last_name FROM actor WHERE last_name LIKE '%gen%';

#4. Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.
SELECT first_name, last_name FROM actor WHERE last_name LIKE '%li%' ORDER BY last_name, first_name;

#5. Using IN, display the country_id and country columns for the following countries: Afghanistan, Bangladesh, and China:
SELECT country_id, country FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

#6. List the last names of all the actors, as well as how many actors have that last name.
SELECT last_name, COUNT(*) AS count FROM actor GROUP BY last_name;

#7. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
SELECT last_name, COUNT(*) FROM actor GROUP BY last_name HAVING COUNT(*)>1;

#8. You cannot locate the schema of the address table. Which query would you use to re-create it?
DESCRIBE address;

#9. Use JOIN to display the first and last names, as well as the address, of each staff member.
SELECT staff.first_name, staff.last_name, address.address FROM staff JOIN address USING(address_id);

#10. Use JOIN to display the total amount rung up by each staff member in August of 2005.
SELECT CONCAT(staff.first_name,' ', staff.last_name) AS full_name, SUM(sales_table.amount) FROM staff JOIN (SELECT staff_id, amount FROM payment WHERE payment_date LIKE '2005-08%') AS sales_table USING(staff_id) GROUP BY full_name;

#11. List each film and the number of actors who are listed for that film.
SELECT film.title, COUNT(film_actor.actor_id) FROM film JOIN film_actor USING(film_id) GROUP BY film.title;

#12. How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT COUNT(film_id) FROM inventory WHERE film_id = (SELECT film_id FROM film WHERE title = 'Hunchback Impossible');

#13. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
SELECT title FROM film WHERE (title LIKE 'Q%' OR title LIKE 'K%') AND language_id = (SELECT language_id FROM language WHERE name = 'English');

#14. Use subqueries to display all actors who appear in the film Alone Trip.
SELECT CONCAT(first_name, ' ', last_name) FROM actor WHERE actor_id IN (SELECT actor_id FROM film_actor JOIN film USING(film_id) WHERE film_id = (SELECT film_id FROM film WHERE title = 'Alone Trip'));

#15. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.
-- SELECT CONCAT(customer.first_name, ' ', customer.last_name), FROM customer ;
-- We can work back from the city to find customers name, email where customer.address_id <address_id>  <city_id> city.city_id <country_id> country.country = 'Canada'

#16. 
#17.
#18.
#19.



## USING SAKILA DATABASE - CHECK EXERCISES
USE sakila;

#1. What is the average replacement cost of a film? Does this change depending on the rating of the film?
SELECT AVG(replacement_cost) FROM film;
SELECT rating, AVG(replacement_cost) FROM film GROUP BY rating ORDER BY rating;

#2. How many different films of each genre are in the database?
SELECT category.name, COUNT(category.name) FROM category JOIN film_category USING(category_id) JOIN film USING(film_id) GROUP BY category.name;

#3. What are the 5 [most] frequently rented films?
SELECT MAX(inventory_id) FROM rental;

#4. What are the most most profitable films (in terms of gross revenue)?
SELECT film.title, SUM(payment.amount) AS total FROM film JOIN inventory USING(film_id) JOIN rental USING(inventory_id) JOIN payment USING(rental_id) GROUP BY film.title ORDER BY total DESC LIMIT 5;

#5. Who is the best customer?
SELECT CONCAT(customer.last_name, ', ',customer.first_name) AS name, total FROM customer JOIN (SELECT customer_id, SUM(amount) AS total FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC LIMIT 1) AS top_payer USING(customer_id);

#6. Who are the most popular actors (that have appeared in the most films)?
SELECT CONCAT(actor.last_name, ', ',actor.first_name) AS name, total FROM actor JOIN (SELECT film_actor.actor_id, COUNT(film.title) AS total FROM film_actor JOIN film USING(film_id) GROUP BY film_actor.actor_id ORDER BY total DESC LIMIT 5) AS top_actors USING(actor_id);

#7. What are the sales for each store for each month in 2005?
SELECT CASE WHERE ;

#8 (BONUS).



## USING EMPLOYEES DATABASE - SINGLE QUESTION
USE employees;

#1. How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?



## USING WORLD DATABASE - CHECK EXERCISES
USE world;

#1. What languages are spoken in Santa Monica?
SELECT countrylanguage.Language, countrylanguage.Percentage FROM countrylanguage JOIN (SELECT CountryCode FROM city WHERE Name = 'Santa Monica') as santa_monica_languages USING(CountryCode) ORDER BY countrylanguage.Percentage;

#2. How many different countries are in each region?
SELECT Region, COUNT(*) AS num_countries FROM country GROUP BY Region ORDER BY num_countries;

#3. What is the population for each region?
SELECT Region, SUM(Population) AS population FROM country GROUP BY Region ORDER BY population DESC;

#4. What is the population for each continent?
SELECT Continent, SUM(Population) AS population FROM country GROUP BY Continent ORDER BY population DESC;

#5. What is the average life expectancy globally?
SELECT AVG(LifeExpectancy) FROM country;

#6. What is the average life expectancy for each region, each continent? Sort the results from shortest to longest
SELECT Region, AVG(LifeExpectancy) AS life_expectancy FROM country GROUP BY Region ORDER BY life_expectancy;
SELECT Continent, AVG(LifeExpectancy) AS life_expectancy FROM country GROUP BY Continent ORDER BY life_expectancy;

#7 (BONUS). Find all the countries whose local name is different from the official name
SELECT Name, LocalName FROM country WHERE LocalName != Name;



## USING PIZZA DATABASE - ADVANCED EXERCISES
USE pizza;

#1. What information is stored in the toppings table? How does this table relate to the pizzas table?
SELECT * FROM toppings;
SELECT * FROM pizza_toppings;
SELECT * FROM pizzas;
-- The name, price and a PK called 'topping_id' which is how it can be related to the pizza_id (which seemingly contains all permutations of pizza toppings) in the pizzas table via the pizza_toppings table.

#2. What information is stored in the modifiers table? How does this table relate to the pizzas table?
SELECT * from modifiers;
-- Modifiers has three seperate pizza modifiers - extra cheese, well done, no cheese.  Extra cheese has a price of $1.99 while the other two are gratis.alter











