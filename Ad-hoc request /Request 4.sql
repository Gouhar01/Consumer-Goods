# 4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields, 
segment, product_count_2020, product_count_2021, difference.

With cte1 as (
		(SELECT dp.segment, COUNT(DISTINCT(fs.product_code)) as  product_count_2020
		FROM dim_product dp INNER JOIN fact_sales_monthly fs
		USING(product_code)
		WHERE fs.fiscal_year= 2020
		GROUP BY dp.segment))
,
 cte2 as (
		(SELECT dp.segment, COUNT(DISTINCT(fs.product_code)) as  product_count_2021
		FROM dim_product dp INNER JOIN fact_sales_monthly fs
		USING(product_code)
		WHERE fs.fiscal_year= 2021
		GROUP BY dp.segment)
)
SELECT *,(product_count_2021 - product_count_2020) as difference
FROM CTE1 INNER JOIN CTE2
USING(segment)
ORDER BY difference DESC ;
