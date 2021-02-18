/*
 * Use a JOIN to count the number of English language films in each category.
 * Use table category, film_category, film, and language.
*/

SELECT film_cats.name, count(*) as "sum"
FROM (
    SELECT film_category.film_id, category.category_id, category.name
    FROM film_category
    LEFT JOIN category ON film_category.category_id=category.category_id
) AS film_cats
JOIN (
    SELECT film.film_id, language.name
    FROM film
    LEFT JOIN language ON film.language_id=language.language_id
    GROUP BY film_id, name
    HAVING name='English'
) AS film_langs ON film_langs.film_id=film_cats.film_id
GROUP BY film_cats.name;
