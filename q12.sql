-- Create index on customer location
CREATE INDEX idx_customer_location ON customers(location);

-- Test query to demonstrate improvement
EXPLAIN SELECT customer_id, full_name, location
FROM customers
WHERE location = 'Nairobi';