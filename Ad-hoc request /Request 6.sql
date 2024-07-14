# 6. Generate a report which contains the top 5 customers who received an average high pre invoice discount percentage  for the  fiscal  year 2021  and in the Indian  market?
The final output contains these fields customer code, customer, average discount percentage.

SELECT c.customer_code, c.customer,
CONCAT(ROUND(AVG(p.pre_invoice_discount_pct)*100, 2), "%") as avrage_discount_percentage FROM 
dim_customer c INNER JOIN fact_pre_invoice_deductions p 
USING(customer_code)
WHERE P.fiscal_year = 2021 AND c.market = "India" 
GROUP BY c.customer_code, c.customer
ORDER BY ROUND(AVG(p.pre_invoice_discount_pct)*100, 2) DESC LIMIT 5;


