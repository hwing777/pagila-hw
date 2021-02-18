/*
 * Use a JOIN to order the countries by most profitable,
 * where the profit is the total amount that all customers from that country have payed.
 * Use tables payment, rental, customer, address, city, and country.
 * Order by country alphabetically.
 */

SELECT country, sum(amount) as profit
FROM (
    SELECT payment.amount, rental_country.country
    FROM payment
    LEFT JOIN (
        SELECT rental.rental_id, customer_country.country
        FROM rental
        LEFT JOIN (
            SELECT customer.customer_id, address_country.country
            FROM customer
            LEFT JOIN (
                SELECT address.address_id, city_country.country
                FROM address
                LEFT JOIN (
                    SELECT city.city_id, country.country
                    FROM city
                    LEFT JOIN country ON city.country_id=country.country_id
                ) AS city_country ON address.city_id=city_country.city_id
            ) AS address_country ON customer.address_id=address_country.address_id
        ) AS customer_country ON rental.customer_id=customer_country.customer_id
    ) AS rental_country ON payment.rental_id=rental_country.rental_id
) as payment_country
GROUP BY country
ORDER BY country;


