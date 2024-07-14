# 3.  Provide a report with all the unique product counts for each  segment  and sort them in descending order of product counts ? The final output contains 2 fields 
segment, product_count.


SELECT dp.segment, count(distinct(fs.product_code)) as product_count 
FROM dim_product dp INNER JOIN  fact_sales_monthly fs
ON dp.product_code = fs.product_code
GROUP BY segment 
order by product_count desc;
