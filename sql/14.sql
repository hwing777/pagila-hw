/*
 * Use a JOIN to list all films in the "Family" category.
 * Use table category, film_category, and film.
 */
SELECT film.title
FROM (
    SELECT film_category.film_id, category.category_id, category.name
    FROM film_category
    LEFT JOIN category ON film_category.category_id=category.category_id
) AS film_cats
RIGHT JOIN film ON film.film_id=film_cats.film_id
WHERE film_cats.name='Family'
ORDER BY film.title;
