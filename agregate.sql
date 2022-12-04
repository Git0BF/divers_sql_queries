--Agregate sum : the following query uses the SUM() aggregate function to calculate the total sales for each product category in a sales table.

SELECT category, SUM(sales) AS total_sales
FROM sales
GROUP BY category

-- Subquery: the following query uses a subquery to find the top 10 products with the highest sales in each product category.

SELECT category, product, sales
FROM sales
WHERE (category, sales) IN (
    SELECT category, MAX(sales)
    FROM sales
    GROUP BY category
    ORDER BY sales DESC
    LIMIT 10
)


