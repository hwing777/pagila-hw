/*
 * Find all last names of actors whose last names contain the letters LI (case insensitive).
 * Order results alphabetically.
 */
SELECT last_name
FROM actor
WHERE lower(last_name) LIKE '%li%'
ORDER BY last_name;
