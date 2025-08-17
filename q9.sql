DELIMITER //
CREATE PROCEDURE GetCustomersByLocation(IN input_location VARCHAR(50))
BEGIN
    SELECT c.full_name, c.location, COALESCE(SUM(s.total_sales), 0) AS total_spending
    FROM customers c
    LEFT JOIN sales s ON c.customer_id = s.customer_id
    WHERE c.location = input_location
    GROUP BY c.customer_id, c.full_name, c.location;
END //
DELIMITER ;