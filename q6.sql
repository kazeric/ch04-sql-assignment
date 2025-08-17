WITH customer_sales AS (
    SELECT c.customer_id, c.full_name, SUM(s.total_sales) AS total_sales
    FROM customers c
    JOIN sales s ON c.customer_id = s.customer_id
    GROUP BY c.customer_id, c.full_name
),
avg_sales AS (
    SELECT AVG(total_sales) AS average_sales
    FROM customer_sales
)
SELECT cs.full_name, cs.total_sales
FROM customer_sales cs
CROSS JOIN avg_sales a
WHERE cs.total_sales > a.average_sales;