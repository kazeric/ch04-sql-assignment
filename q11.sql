-- First, create an index
CREATE INDEX idx_sales_total_sales ON sales(total_sales);

-- Then use the optimized query
SELECT sales_id, customer_id, product_id, total_sales
FROM sales 
WHERE total_sales > 5000;