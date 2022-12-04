--INNER JOIN : the following query uses the INNER JOIN clause to combine data from a sales table and a products table, based on the product ID.


SELECT products.product_name, sales.sales_date, sales.sales_amount
FROM sales
INNER JOIN products
ON sales.product_id = products.product_id
