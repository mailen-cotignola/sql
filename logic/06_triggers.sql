-- TRIGGERS

-- 1st: Create a log table for the 'property' table to have a history of changes in the nightly price updates for each property

CREATE TABLE price_per_night_register(
    id_price_per_night_register INT AUTO_INCREMENT PRIMARY KEY,
    id_property INT,
    old_price DECIMAL(6, 2),
    new_price DECIMAL (6,2),
    `user` VARCHAR (50),
    operation_date DATE,
    operation_time TIME
);

-- Then create a trigger to save backups when price changes occur by property ID

DELIMITER $$

CREATE TRIGGER price_per_night_before_update
BEFORE UPDATE ON property
FOR EACH ROW
BEGIN
    IF NEW.price_per_night <> OLD.price_per_night THEN
        INSERT INTO price_per_night_register (id_property, old_price, new_price,`user`,operation_date, operation_time)
        VALUES ( NEW.id_property, OLD.price_per_night, NEW.price_per_night, USER(), CURDATE(), CURTIME());
    END IF;
END $$
DELIMITER ;

-- 2nd Trigger: Save the email change record of an owner

CREATE TABLE propietor_update_email (
    id_propietor_update_email INT PRIMARY KEY,
    old_email VARCHAR(50),
    new_email VARCHAR (50),
    date_change DATE
);

DELIMITER $$
CREATE TRIGGER after_propietor_update_email
AFTER UPDATE ON propietor
FOR EACH ROW
BEGIN
    IF NEW.email <> OLD.email THEN
        INSERT INTO propietor_update_email (id_propietor, old_email, new_email, date_change)
        VALUES (OLD.id_propietor, OLD.email, NEW.email, CURDATE());
    END IF;
END $$
DELIMITER ;