/*
 * Use a JOIN to order the films by most profitable,
 * where the profit is the total amount that customer have payer for the film.
 * Use tables payment, rental, inventory, and film. 
 */

SELECT title, sum(amount) as profit
FROM (
    SELECT payment.payment_id, payment.amount, rental_title.title
    FROM PAYMENT
    LEFT JOIN (
        SELECT rental.rental_id, inventory_title.title
        FROM rental
        LEFT JOIN (
            SELECT inventory.inventory_id, film.title
            FROM inventory
            LEFT JOIN film ON inventory.film_id=film.film_id
        ) AS inventory_title ON rental.inventory_id=inventory_title.inventory_id
    ) AS rental_title ON payment.rental_id=rental_title.rental_id
) AS payment_title
GROUP BY title
ORDER BY profit DESC;

