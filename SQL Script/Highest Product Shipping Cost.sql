SELECT sub_category,category, 
round(sum(shippingprice_rupiah),0) AS shipping_cost
FROM fact_sales fs
LEFT JOIN dim_product dp on fs.product_id = dp.product_id
GROUP BY sub_category,category
ORDER BY shipping_cost DESC
LIMIT 5
