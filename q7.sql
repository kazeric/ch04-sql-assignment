SELECT 
    p.product_name,
    SUM(s.total_sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(s.total_sales) DESC) AS sales_rank
FROM products p
JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name;