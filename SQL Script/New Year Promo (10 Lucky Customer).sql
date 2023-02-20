WITH promo AS (
	SELECT customer_id, customer_name, strftime('%m', birthdate) as birth_month
	from dim_customer)
select pr.customer_id, pr.customer_name, round(0.7*(sum(fs.totalprice_rupiah)),0) as discount_amount
from promo pr left join fact_sales fs on pr.customer_id = fs.customer_id
WHERE birth_month is '01' and pr.customer_id is not null
GROUP BY pr.customer_id
ORDER BY discount_amount DESC
LIMIT 10

