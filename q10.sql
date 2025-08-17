WITH RECURSIVE running_totals AS (
    -- Base case: first sale
    SELECT sales_id, total_sales, total_sales as running_total
    FROM sales
    WHERE sales_id = (SELECT MIN(sales_id) FROM sales)
    
    UNION ALL
    
    -- Recursive case: add subsequent sales
    SELECT s.sales_id, s.total_sales, rt.running_total + s.total_sales
    FROM sales s
    JOIN running_totals rt ON s.sales_id = rt.sales_id + 1
)
SELECT sales_id, total_sales, running_total
FROM running_totals
ORDER BY sales_id;