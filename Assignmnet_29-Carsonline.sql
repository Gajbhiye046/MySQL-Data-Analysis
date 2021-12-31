USE carsonline;
SELECT C.car_id, C.price, CT.car_make,CT.car_model, CT.car_year AS Production_year
FROM cars C 
INNER JOIN car_types CT ON C.car_type_id = CT.car_type_id
WHERE car_make ='bmw' AND CT.car_year = 2019
ORDER BY CT.car_year ;

SELECT CT.car_make, CT.car_model, AVG(C.price) AS Average_price
FROM cars C 
INNER JOIN car_types CT ON C.car_type_id = CT.car_type_id
WHERE  CT.car_year = 2019
GROUP BY  CT.car_make, CT.car_model;


SELECT FT.fuel_type_name,COUNT(C.car_id) AS Number_of_cars
FROM cars C 
INNER JOIN fuel_types FT ON C.fuel_type_id = FT.fuel_type_id
GROUP BY  FT.fuel_type_name
ORDER BY COUNT(C.car_id) DESC;
-- WHERE  CT.car_year = 2019


SELECT TT.transmission_name , AVG(C.price) AS Average_price
FROM cars C 
INNER JOIN transmission_types TT ON C.transmission_type_id = TT.transmission_type_id
GROUP BY  TT.transmission_type_id
ORDER BY AVG(C.price) DESC;


SELECT FT.fuel_type_name,CT.car_make, COUNT(CT.car_make)
FROM cars C 
INNER JOIN car_types CT ON C.car_type_id = CT.car_type_id
INNER JOIN fuel_types FT ON C.fuel_type_id = FT.fuel_type_id
WHERE FT.fuel_type_name = 'Hybrid'
GROUP BY  FT.fuel_type_name,CT.car_make
ORDER BY COUNT(CT.car_make) DESC;


SELECT  TT.transmission_name, CT.car_make,  CT.car_year, COUNT(TT.transmission_name) AS Number_of_cars
FROM cars C 
LEFT JOIN car_types CT ON C.car_type_id = CT.car_type_id
LEFT JOIN transmission_types TT ON C.transmission_type_id = TT.transmission_type_id
WHERE TT.transmission_name ='Manual'
GROUP BY  TT.transmission_type_id, CT.car_make,CT.car_year
ORDER BY COUNT(TT.transmission_name) DESC;

SELECT G.gender,TIMESTAMPDIFF(YEAR,DATE(birth_date),CURDATE()) AS Age, COUNT(G.gender) AS Customer_count
FROM customers C
INNER JOIN genders G ON C.gender_code = G.gender_code
GROUP BY G.gender,TIMESTAMPDIFF(YEAR,DATE(birth_date),CURDATE())
ORDER BY Customer_count DESC;

SELECT G.gender,TIMESTAMPDIFF(YEAR,DATE(birth_date),CURDATE()) AS Age, COUNT(G.gender) AS Customer_count
FROM customers C
INNER JOIN genders G ON C.gender_code = G.gender_code
WHERE TIMESTAMPDIFF(YEAR,DATE(birth_date),CURDATE()) >59 
GROUP BY G.gender,TIMESTAMPDIFF(YEAR,DATE(birth_date),CURDATE())
ORDER BY Customer_count DESC;

SELECT *
FROM customers C
INNER JOIN locations LOC ON C.location_code = LOC.location_code
WHERE LOC.country = 'Australia';


SELECT COUNT(*)  AS Number_of_customers 
FROM customers C
INNER JOIN locations LOC ON C.location_code = LOC.location_code
WHERE LOC.country = 'Australia' AND C.phone_number IS NOT NULL;



SELECT LOC.city,COUNT(*)  AS Number_of_customers 
FROM customers C
INNER JOIN locations LOC ON C.location_code = LOC.location_code
WHERE LOC.country = 'Australia' AND C.phone_number IS NULL
GROUP BY LOC.city
ORDER BY Number_of_customers DESC;

SELECT CONCAT(C.first_name,' ',C.last_name) AS Customer_name, COUNT(S.customer_id) AS Purchases
FROM customers C 
INNER JOIN SALES S ON C.customer_id = S.customer_id 
GROUP BY S.customer_id
HAVING Purchases > 5;


SELECT 
CASE
	WHEN S.sale_id IS NULL THEN '0'
    ELSE 1
END AS Inventory_shape, COUNT(*) AS Number_of_cars
FROM cars C
LEFT JOIN SALES S ON C.car_id = S.car_id 
GROUP BY  Inventory_shape;


SELECT 
CASE
	WHEN S.sale_id IS NULL THEN 'UNSOLD'
    ELSE 'SOLD'
END AS Inventory_shape, COUNT(*) AS Number_of_cars , (COUNT(*) / (SELECT COUNT(*) FROM cars)) * 100 AS 'Percentage to all items'
FROM cars C
LEFT JOIN SALES S ON C.car_id = S.car_id 
GROUP BY  Inventory_shape;



SELECT CT.car_make, CT.car_model, AVG(C.price) AS Average_price
FROM cars C 
INNER JOIN car_types CT ON C.car_type_id = CT.car_type_id
INNER JOIN SALES S ON C.car_id = S.car_id 
WHERE  CT.car_year = 2019 AND CT.car_make = 'audi'
GROUP BY CT.car_model
ORDER BY  Average_price DESC;
