WITH older AS (
	SELECT customer_id, customer_name, strftime('%Y', date('now')) - strftime('%Y', date(birthdate)) as age
	FROM dim_customer
	WHERE age >=60
	ORDER BY age DESC)
SELECT ol.customer_id, ol.customer_name, ol.age
FROM older ol left join fact_sales fs ON ol.customer_id = fs.customer_id
GROUP BY ol.customer_id
ORDER BY round(sum(fs.totalprice_rupiah),0) DESC
LIMIT 10
