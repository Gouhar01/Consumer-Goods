# 8.  In which quarter of 2020, got the maximum total sold quantity? The final output contains these fields sorted by the total sold quantity? 
Quarter, total sold quantity.


WITH cte1 AS (
SELECT month(date) AS month,sold_quantity 
FROM fact_sales_monthly
WHERE fiscal_year = "2020"

)
SELECT (CASE
			WHEN month in (9,10,11) THEN "Q1"
            WHEN month in (12,1,2) THEN "Q2"
            WHEN month in (3,14,5) THEN "Q3"
			ELSE("Q4")
       END) AS quarter, SUM(sold_quantity) AS total_sold_quantiy
FROM cte1
GROUP BY quarter
ORDER BY total_sold_quantiy DESC;
