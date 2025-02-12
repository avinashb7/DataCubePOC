DELIMITER $$

CREATE PROCEDURE ComplexProcedure()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE j INT DEFAULT 1;
    DECLARE max_outer INT DEFAULT 5;
    DECLARE max_inner INT DEFAULT 3;

    -- Outer loop
    WHILE i <= max_outer DO
        -- Inner loop
        SET j = 1;
        WHILE j <= max_inner DO
            -- Query 1: Select data from `orders_table` based on loop variables
            SELECT order_id, customer_id
            FROM orders_table
            WHERE order_id = i AND customer_id = j;

            -- Query 2: Insert data into `order_details_table` based on the selected data
            INSERT INTO order_details_table (order_id, product_id)
            SELECT order_id, product_id
            FROM products_table
            WHERE order_id = i AND product_id = j;

            -- Query 3: Update values in `inventory_table` based on the loop variables
            UPDATE inventory_table
            SET stock_quantity = stock_quantity - 1
            WHERE product_id = j;

            -- Query 4: Delete records from `customer_feedback_table` based on certain condition
            DELETE FROM customer_feedback_table
            WHERE customer_id = j AND feedback_status = 'pending';

            -- Query 5: Select summary data from `shipment_table`
            SELECT COUNT(*) AS total_shipments
            FROM shipment_table
            WHERE order_id = i AND shipment_status = 'shipped';

            SET j = j + 1;
        END WHILE;

        SET i = i + 1;
    END WHILE;

END $$

DELIMITER ;
