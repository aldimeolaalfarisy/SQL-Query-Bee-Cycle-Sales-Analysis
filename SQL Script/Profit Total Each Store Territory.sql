WITH prof AS (
    SELECT territory_id, 
    round(sum(totalprice_rupiah - totalcost_rupiah),0) AS store_profit
    FROM fact_sales
    GROUP BY 1)
SELECT dt.region, dt.country, pr.store_profit
FROM dim_territory dt LEFT JOIN prof pr ON dt.territory_id = pr.territory_id
WHERE store_profit is not null
GROUP BY dt.region
ORDER BY store_profit DESC
