With Profit AS (
	SELECT product_id, round(sum(totalprice_rupiah - totalcost_rupiah),0) 
	AS product_profit
	FROM fact_sales
	GROUP BY product_id)
SELECT dp.product_name, dp.model_name, dp.sub_category, dp.category, pr.product_profit
FROM dim_product dp LEFT JOIN Profit pr ON dp.product_id = pr.product_id
GROUP BY dp.product_name, dp.model_name
ORDER BY pr.product_profit DESC
LIMIT 10
