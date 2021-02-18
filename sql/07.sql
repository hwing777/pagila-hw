/*
 * List last names of actors and the number of actors who have that last name,
 * but only for names that are shared by at least two actors
 */
SELECT last_name, last_name_count
FROM (
    SELECT last_name, count(*) AS last_name_count
    FROM actor
    GROUP BY last_name
) AS counted_names
WHERE last_name_count >= 2
ORDER BY last_name_count DESC;
