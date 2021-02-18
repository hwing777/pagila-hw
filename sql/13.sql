/*
 * The music of Queen and Kris Kristofferson have seen an unlikely resurgence.
 * As an unintended consequence, films starting with the letters K and Q have also soared in popularity.
 * Use a JOIN to display the titles of movies starting with the letters K and Q whose language is English.
 * Use tables film and language, and order the results alphabetically by film title.
 */

SELECT film_agg.film_id, film_agg.title, language.language_id, language.name
FROM (
    SELECT title, language_id, film_id
    FROM film
    WHERE lower(title) LIKE 'k%' OR lower(title) LIKE 'q%'
    GROUP BY film_id
) AS film_agg
LEFT JOIN language ON film_agg.language_id=language.language_id
WHERE language.name='English'
ORDER BY film_agg.title;
