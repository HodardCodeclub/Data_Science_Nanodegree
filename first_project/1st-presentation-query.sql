
/* ---------- Query 1 - We need to know how the length of rental duration of these family-friendly 
movies compares to the duration that all movies are rented for. Can you provide a table with the movie titles 
and divide them into 4 levels (first_quarter, second_quarter, third_quarter, and final_quarter)
 based on the quartiles (25%, 50%, 75%) of the rental duration for movies across all 
categories? ---------- */

SELECT f.title, c.name, f.rental_duration, NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
FROM film_category fc
     JOIN category c
     ON c.category_id = fc.category_id
     JOIN film f
     ON f.film_id = fc.film_id
WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
ORDER BY 3