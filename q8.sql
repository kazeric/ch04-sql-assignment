CREATE VIEW high_value_customers AS
SELECT c.customer_id, c.full_name, SUM(s.total_sales) AS total_sales
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.full_name
HAVING SUM(s.total_sales) > 15000;