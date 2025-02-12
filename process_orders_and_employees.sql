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
            -- Example of a nested query in the loop
            SELECT col1, col2
            FROM some_table
            WHERE col1 = i AND col2 = j;
            
            SET j = j + 1;
        END WHILE;

        SET i = i + 1;
    END WHILE;

END $$

DELIMITER ;
