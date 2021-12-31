USE job_adverts;
-- SELECT job_id,  job_title,removed_date,
-- IFNULL(removed_date,CURDATE())AS removed_date_NEW, headquarters_of_company,state_of_company,
-- IFNULL(state_of_company,headquarters_of_company)AS stateofcomp, company_name,
-- IFNULL(company_name,'Not Available')
-- FROM jobs;
-- -- SELECT * FROM jobs;
-- SELECT job_id, job_title,removed_date,company_name,headquarters_of_company FROM jobs
-- WHERE removed_date IS NULL OR
-- company_name IS NULL OR 
-- headquarters_of_company IS NULL;
-- SELECT job_id,job_title,published_date,removed_date from jobs 
-- WHERE YEAR(published_date) =2016;
-- SELECT job_id,job_title,published_date,removed_date from jobs 
-- WHERE TIMESTAMPDIFF(HOUR, published_date, removed_date) =24 ;
-- SELECT * from jobs 
-- WHERE MONTH(published_date) = MONTH(CURDATE()) AND
-- 	DAY(published_date) = DAY(CURDATE());
-- SELECT job_id,job_title,published_date,removed_date from jobs 
-- WHERE TIMESTAMPDIFF(HOUR, published_date, removed_date) <0 ;

SELECT  company_name, company_market_value, 
CASE
	WHEN company_market_value BETWEEN 0 AND 300 THEN 'low Range'
    WHEN company_market_value BETWEEN 301 AND 600 THEN 'mid Range'
    WHEN company_market_value BETWEEN 601 AND 900 THEN 'high Range'
	ELSE 'other range'
END AS company_market_value_rank 
FROM jobs;

SELECT  * FROM jobs;

SELECT  job_title, company_name, company_size_min, company_size_max, 
CASE
	WHEN REPLACE(company_size_max,'Employees','') < 60 THEN 'Small Company'
    WHEN REPLACE(company_size_max,'Employees','') BETWEEN 61 AND 120 THEN 'Medium Company'
    WHEN REPLACE(company_size_max,'Employees','') BETWEEN 121 AND 180 THEN 'Medium Company'
    ELSE 'Unknown'
END AS company_size FROM jobs;
