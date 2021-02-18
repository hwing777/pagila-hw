/*
 * Use a JOIN to display the total amount rung up by each staff member in January of 2020.
 * Use tables staff and payment.
*/ 
SELECT staff.first_name, staff.last_name, sum(payment.amount) AS "sum"
FROM staff
LEFT JOIN payment ON staff.staff_id=payment.staff_id
WHERE to_char(payment.payment_date, 'YYYY')='2020' AND to_char(payment.payment_date, 'MM')='01'
GROUP BY staff.staff_id
ORDER BY "sum";
