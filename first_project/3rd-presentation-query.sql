/* ---------- Query 3 - Amount spent by the top 10 paying customers between February and May 2007 ---------- */

/*-------We would like to know who were our top 10 paying customers, how many payments they made on 
a monthly basis during 2007, and what was the amount of the monthly payments. Can you write a 
query to capture the customer name, month and year of payment, and total payment amount for each 
month by these top 10 paying customers?----------*/



SELECT DATE_TRUNC('month', p.payment_date) pay_month, c.first_name || ' ' || c.last_name AS full_name, COUNT(p.amount) AS pay_countpermon, SUM(p.amount) AS pay_amount
FROM customer c
     JOIN payment p
     ON p.customer_id = c.customer_id
WHERE c.first_name || ' ' || c.last_name IN
(SELECT t1.full_name
     FROM
          (SELECT c.first_name || ' ' || c.last_name AS full_name, SUM(p.amount) as amount_total
          FROM customer c
               JOIN payment p
               ON p.customer_id = c.customer_id
          GROUP BY 1
          ORDER BY 2 DESC
LIMIT 10) t1) AND (p.payment_date BETWEEN '2007-01-01' AND '2008-01-01')
GROUP BY 2, 1
ORDER BY 2, 1, 3