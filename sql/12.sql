/*
 * Use a JOIN to list the total paid by each customer.
 * List the customers alphabetically by last name.
 * Use tables payment and customer.
SELECT agg_payment.customer_id, customer.first_name, customer.last_name, agg_payment."sum"
FROM (
    SELECT customer_id, sum(amount) AS "sum"
    FROM payment
    GROUP BY customer_id
) AS agg_payment
LEFT JOIN customer ON agg_payment.customer_id=customer.customer_id
GROUP BY agg_payment.customer_id, customer.first_name, customer.last_name
ORDER BY customer.last_name;
 */
SELECT agg_payment.customer_id, customer.first_name, customer.last_name, agg_payment."sum"
FROM (
    SELECT customer_id, sum(amount) AS "sum"
    FROM payment
    GROUP BY customer_id
) AS agg_payment
LEFT JOIN customer ON agg_payment.customer_id=customer.customer_id
ORDER BY customer.last_name;
