-- https://www.kaggle.com/datasets/lorenzovzquez/data-jobs-salaries
-- Step-1: Listing column names together with their types
PRAGMA table_info(salaries);

-- Step-2: Number of full-time, part-time, contract-based, and freelancer positions in AI, ML, and Data Science according to the employment type by countries
SELECT company_location,
COUNT(CASE WHEN employment_type = 'FT' THEN job_title END) AS numberOfFullTimePositions,
COUNT(CASE WHEN employment_type = 'PT' THEN job_title END) AS numberOfPartTimePositions,
COUNT(CASE WHEN employment_type = 'CT' THEN job_title END) AS numberOfContractPositions,
COUNT(CASE WHEN employment_type = 'FL' THEN job_title END) AS numberOfFreelancePositions,
COUNT(employment_type) as numberOfPaidPositions
FROM salaries
GROUP BY company_location ORDER By numberOfPaidPositions DESC;
-- Step-3: Number of on-site, hybrid, and fully-remote jobs
UPDATE salaries
SET remote_ratio = 
CASE WHEN remote_ratio = '0' THEN 'On-site'
WHEN remote_ratio = '50' THEN 'Hybrid'
WHEN remote_ratio = '100' THEN 'Fully remote'
END;


SELECT remote_ratio, COUNT(remote_ratio) FROM salaries  GROUP BY remote_ratio;
-- Step-4: Number of companies based on large-, medium-, and small-sized companies
UPDATE salaries
SET company_size = 
CASE WHEN company_size = 'L' THEN 'Large'
WHEN company_size = 'M' THEN 'Medium'
WHEN company_size = 'S' THEN 'Small'
END;
SELECT company_location,company_size, count(company_size) as numberOfCompanies FROM salaries GROUP BY company_location, company_size ORDER BY company_location;
-- Step-5: Comparing the salary column with the salary_in_usd column and insert the comparison column into the table. If they are the same 1, else 0.
ALTER TABLE salaries 
ADD COLUMN Comparison;
SELECT * FROM salaries;

UPDATE salaries
SET Comparison = CASE
WHEN salary = salary_in_usd THEN '1'
ELSE '0'
END;

SELECT * FROM salaries;
-- Step-6: Average salaries  ($) of jobs
SELECT job_title, AVG(salary_in_usd) as avgSalaryAll FROM salaries GROUP BY job_title;
-- Step-7: Average salaries ($) among the countries
SELECT company_location, AVG(salary_in_usd) as avgSalaries FROM salaries GROUP BY company_location ORDER BY avgSalaries DESC;

-- Step-8: Average salaries ($) of companies depending on their sizes
SELECT company_size,
AVG(CASE WHEN employment_type ='FT' THEN salary_in_usd END) AS avgSalaryFullTime, 
AVG(CASE WHEN employment_type = 'PT' THEN salary_in_usd END) AS avgSalaryPartTime,
AVG(CASE WHEN employment_type ='CT' THEN salary_in_usd END) AS avgSalaryContract, 
AVG(CASE WHEN employment_type = 'FL' THEN salary_in_usd END) AS avgSalaryFreelance 
FROM salaries
GROUP BY company_size ORDER BY avgSalaryFullTime DESC;
-- Step-9: Average salaries of entry-, mid-, senior, and executive-level positions when only the full-time contracts are considered
SELECT work_year, experience_level,
AVG(CASE WHEN experience_level = 'EN' THEN salary_in_usd END) AS avgENSalary,
AVG(CASE WHEN experience_level = 'MI' THEN salary_in_usd END) AS avgMISalary,
AVG(CASE WHEN experience_level = 'SE' THEN salary_in_usd END) AS avgSESalary,
AVG(CASE WHEN experience_level = 'EX' THEN salary_in_usd END) AS avgEXSalary
FROM salaries
WHERE employment_type = 'FT'
GROUP BY  work_year, experience_level;

 
