WITH purch AS (
    SELECT customer_id, sum(totalprice_rupiah) AS purchase
    from fact_sales
    GROUP BY 1
    ORDER BY purchase DESC)
SELECT pu.customer_id, dc.customer_name, pu.purchase
FROM purch pu LEFT JOIN dim_customer dc ON pu.customer_id = dc.customer_id
WHERE purchase is not null
GROUP BY pu.customer_id
ORDER BY purchase DESC
LIMIT 5
