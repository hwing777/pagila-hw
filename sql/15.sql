/*
 * Use a JOIN to count the number of English language films in each category.
 * Use table category, film_category, film, and language.
*/

SELECT category.name, final_category_count."sum"
FROM category
LEFT JOIN (
    SELECT count(film_id) AS "sum", category_id
    FROM (
        SELECT film_category.category_id, english_films.film_id
        FROM film_category
        LEFT JOIN (
            SELECT film_id
            FROM (
                SELECT film.film_id, language.name
                FROM film
                LEFT JOIN language ON film.language_id=language.language_id
            ) AS film_language
            WHERE name='English'
        ) AS english_films ON film_category.film_id=english_films.film_id
    ) AS film_category_name
    GROUP BY category_id
) AS final_category_count ON category.category_id=final_category_count.category_id
ORDER BY category.name;

