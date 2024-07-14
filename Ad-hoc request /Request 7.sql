# 7. Get the complete report of the Gross sales amount for the customer  “Atliq Exclusive”  for each month. 
This analysis helps to  get an idea of low and high-performing months and take strategic decisions? 
The final report contains these columns: Month, Year, Gross sales Amount.

WITH cte1 AS ( 
(SELECT s.*, g.gross_price FROM fact_sales_monthly s INNER JOIN fact_gross_price g
ON s.product_code = g.product_code AND s.fiscal_year = g.fiscal_year)
)
SELECT CONCAT(MONTHNAME(ct.date),' ', YEAR(ct.date)) as month, ct.fiscal_year,
CONCAT("$ ",ROUND(SUM(ct.sold_quantity*ct.gross_price)/1000000,2)) gross_sales_amount_mln
FROM cte1 ct INNER JOIN dim_customer c 
USING(customer_code)
WHERE c.customer = "Atliq Exclusive"
GROUP BY month, s.fiscal_year;
