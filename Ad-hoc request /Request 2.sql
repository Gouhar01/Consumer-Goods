# 2.  What is the percentage of unique product increase in 2021 vs. 2020?
 The final output contains these fields, unique_products_2020, unique_products_2021k, percentage_chg?


SELECT A.*,B.*,CONCAT(ROUND((unique_product_2021/unique_product_2020 - 1)*100,2), '%') AS percentage_cng
FROM
(
	(SELECT COUNT(DISTINCT product_code) as unique_product_2020  FROM fact_sales_monthly
	WHERE fiscal_year = 2020) as A
	,
	(SELECT COUNT(DISTINCT product_code) as unique_product_2021 FROM fact_sales_monthly
	WHERE fiscal_year = 2021) as B
)
