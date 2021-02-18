/* 
 * Use a JOIN to list the number of copies of each film in the inventory system that begins with the letter h.
 * Use tables inventory and film.
 * Order by film title alphabetically.
 */
SELECT film_id, title, "count"
FROM (
    SELECT film.film_id, film.title, count(*) AS "count"
    FROM film
    LEFT JOIN inventory ON film.film_id=inventory.film_id
    WHERE lower(film.title) LIKE 'h%'
    GROUP BY film.film_id
) AS aggregated_inventory
WHERE "count" > 1
ORDER BY title DESC;
