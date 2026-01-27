-- VIEWS

-- Show the properties (ID) that have received a rating of 4 or higher and their respective users:

CREATE OR REPLACE VIEW VW_best_rated AS
SELECT id_user,id_ranking_level,id_property
FROM review
WHERE id_ranking_level >= 4
ORDER BY id_ranking_level DESC;


-- Show these properties, but now identifying the addresses and cities to which they belong:

CREATE OR REPLACE VIEW VW_best_rated_address AS
SELECT v.id_ranking_level, p.id_propietor, p.address, c.city_name
FROM  VW_best_rated v
JOIN property p ON  v.id_property = p.id_property
JOIN city c on p.id_city = c.id_city
ORDER BY id_ranking_level DESC;


-- See the total number of days of each reservation:

CREATE OR REPLACE VIEW VW_total_days AS
SELECT b.id_booking, u.id_register_user, b.arriving_date, b.leaving_date, DATEDIFF(leaving_date,arriving_date) AS total_days
FROM booking b
JOIN register_user u on b.ID_USER = u.ID_register_user
ORDER BY total_days ASC;


-- Show the total amount of money received for each reservation:

CREATE OR REPLACE VIEW VW_total_income AS
SELECT b.id_booking,b.id_user,b.id_property,p.price_per_night, DATEDIFF(b.leaving_date,b.arriving_date) * p.price_per_night AS total_income
FROM booking b
JOIN property p ON p.id_property =b.id_property
ORDER BY total_income ASC;


-- Show the names of the users and their country of origin who used long-term stays (>60 days):

CREATE OR REPLACE VIEW VW_long_stay AS
SELECT u.first_name, u.LAST_NAME, c.country_name, v.total_days
FROM register_user u
JOIN country c ON u.ID_COUNTRY = c.id_country
JOIN VW_total_days v on  u.id_register_user = v.id_register_user
WHERE total_days >= 60
ORDER BY total_days ASC;