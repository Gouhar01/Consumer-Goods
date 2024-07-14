# 10.  Get the Top 3 products in each division that have a high total sold quantity in the fiscal year 2021?
 The final output contains these fields, division, product code.

WITH cte1 as (
SELECT p.division,p.product_code, p.product,
SUM(sold_quantity) as total_sold_quantity
FROM dim_product p INNER JOIN fact_sales_monthly s 
ON p.product_code = s.product_code
WHERE fiscal_year = 2021
GROUP BY p.division,p.product_code, p.product
)
,
cte2 as(
SELECT *,
RANK() OVER ( PARTITION BY division ORDER BY total_sold_quantity DESC ) as rank_order
FROM cte1)
 SELECT * FRoM cte2 
 WHERE rank_order <=3;
