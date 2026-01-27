-- FUNCTIONS

-- FUNCTION 1: obtain the average rating that a country received based on the properties located in it.

DELIMITER $$
CREATE FUNCTION get_average_rating_by_country (COUNTRY_NAME varchar (50)) 
RETURNS DECIMAL (3,2)
Reads SQL data
BEGIN
DECLARE AVG_RATING DECIMAL (3,2);

-- Exception Handling
DECLARE EXIT HANDLER FOR NOT FOUND
    BEGIN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The country entered is incorrect or contains no records';
    END;
SELECT AVG(r.id_ranking_level) INTO avg_rating
FROM review r
JOIN property p ON r.id_property = p.id_property
    JOIN city c ON p.id_city = c.id_city
    JOIN country cn ON c.id_country = cn.id_country
    WHERE cn.country_name = COUNTRY_NAME;
 RETURN avg_rating;
END$$

DELIMITER ;


-- FUNCTION 2: Count the number of properties in a specific city

DELIMITER $$
CREATE FUNCTION count_properties_in_city(city_name VARCHAR(50)) 
RETURNS INT
reads sql data
BEGIN
    DECLARE property_count INT;
   -- Exception Handling
DECLARE EXIT HANDLER FOR NOT FOUND
    BEGIN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The city entered is incorrect or contains no records';
    END;
    SELECT COUNT(*) INTO property_count
    FROM property p
    JOIN city c ON p.id_city = c.id_city
    WHERE c.city_name = city_name;
    
    RETURN property_count;
END$$
DELIMITER ;