-- STORED PROCEDURES

-- SP 1: Sort the "propietor" table by field and sort direction. This will allow us to sort the first_name and last_name columns in the order we choose (ASC/DESC)

USE AIRBNB;

DELIMITER $$

CREATE PROCEDURE `sp_get_propietor_names_order` (IN order_column CHAR(20), IN order_direction CHAR(4))
BEGIN
    DECLARE order_query VARCHAR(100);
    
    IF order_column <> '' THEN
        SET order_query = CONCAT('ORDER BY', ' ', order_column, ' ', order_direction);
    ELSE
        SET order_query = '';
    END IF;
    
    SET @consulta = CONCAT('SELECT * FROM airbnb.propietor', ' ', order_query);
    
    PREPARE `query` FROM @consulta;
    EXECUTE `query`;
    DEALLOCATE PREPARE `query`;
END $$


-- SP 2: Store records in the booking table of the database.

DELIMITER $$
CREATE PROCEDURE create_booking(
    IN id_user INT,
    IN id_property INT,
    IN arriving_date DATE,
    IN leaving_date DATE,
    IN id_payment_method INT
)
BEGIN
    -- Verify if all the parameters were provided
    IF id_user IS NULL OR id_property IS NULL OR arriving_date IS NULL OR leaving_date IS NULL OR id_payment_method IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Se deben proporcionar todos los parámetros.';
    ELSE
        -- Insert record into the booking table
        INSERT INTO booking (id_user, id_property, arriving_date, leaving_date, id_payment_method)
        VALUES (id_user, id_property, arriving_date, leaving_date, id_payment_method);
        
    END IF;
END$$
DELIMITER ;