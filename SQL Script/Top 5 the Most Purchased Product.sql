WITH trans AS (
    SELECT product_id, count(distinct order_detail_id) AS quantity_sold
    from fact_sales
    GROUP BY 1)
SELECT dp.product_id, dp.product_name, dp.model_name, dp.category, dp.sub_category, ts.quantity_sold
FROM dim_product dp LEFT JOIN trans ts ON dp.product_id = ts.product_id
WHERE ts.quantity_sold is not null
GROUP BY dp.product_id 
ORDER BY ts.quantity_sold DESC
LIMIT 5
