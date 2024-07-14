# 9.  Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?
  The final output  contains these fields, channel, gross sales Million, percentage.

WITH cte1 AS(
SELECT c.channel, ROUND(SUM(g.gross_price * s.sold_quantity)/1000000,2) as gross_sales_mln
FROM fact_sales_monthly s INNER JOIN fact_gross_price g
ON s.product_code = g.product_code AND s.fiscal_year = g.fiscal_year
Join dim_customer c  ON  s.customer_code = c.customer_code
WHERE s.fiscal_year = 2021 
GROUP BY channel
)
SELECT 
    channel,
    gross_sales_mln,
   CONCAT(ROUND((gross_sales_mln/SUM(gross_sales_mln) OVER ())*100,2),'%') AS percentage_contribution
FROM 
    cte1;
