/* ---------- Query 2 - Provide a table with the family-friendly film category, each of the quartiles, 
and the corresponding count of movies within each combination of film category for each 
corresponding rental duration category. --------*/

SELECT t1.name, t1.standard_quartile, COUNT(t1.standard_quartile)
FROM
  (SELECT f.title, c.name , f.rental_duration, NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
  FROM film_category fc
    JOIN category c
    ON c.category_id = fc.category_id
    JOIN film f
    ON f.film_id = fc.film_id
  WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')) t1
GROUP BY 1, 2
ORDER BY 1, 2
