-- S1: Extract employees with a salary of > 50,000 USD.
SELECT * FROM employees WHERE salary > 50000;
-- S2: Extract only the employees working in Common Grounds Coffeeshop.
SELECT * FROM employees WHERE coffeeshop_id = 1;
-- S3: Extract only the employees working in Common Grounds Coffeeshop and making a salary of  > 50,000 USD.
SELECT * FROM employees WHERE coffeeshop_id = 1 and salary > 50000;
-- S4: Extract only the male employees working in Common Grounds CoffeeShop, making a salary of > 50,000 USD.
SELECT * FROM employees WHERE coffeeshop_id = 1 AND salary > 50000 AND gender = 'M';
-- S5: Extract all the employees who work in Common Grounds or make more than 50k or are male.
SELECT * FROM employees WHERE coffeeshop_id = 1 OR salary > 50000 OR gender = 'M';
-- S6: Extract all rows from the suppliers table where the supplier is Beans and Barley.
SELECT * FROM suppliers WHERE supplier_name = 'Beans and Barley';
-- S7: Select all rows from the suppliers table where the supplier is not Beans and Barley.
SELECT * FROM suppliers WHERE NOT supplier_name ='Beans and Barley';
-- S8: Extract all coffee types that are not Robusta or Arabica.
SELECT * FROM suppliers WHERE NOT coffee_type IN ('Robusta', 'Arabica');

-- S9: Extract all employees with missing email addresses.
SELECT * FROM employees WHERE email IS NULL;
-- S10: Extract all employees whose emails are not missing.
SELECT * FROM employees WHERE NOT email is NULL;
-- S11: Extract all employees who make between 35,000 and 50,000 USD.
SELECT * FROM employees WHERE salary BETWEEN 35000 AND 50000;
-- S12: Extract employee_id, first_name, and last_name sorted by salary in descending order.
SELECT employee_id, first_name, last_name, salary FROM employees ORDER BY salary DESC;
-- S13: Find the top 10 highest paid employees.
SELECT * FROM employees ORDER BY salary DESC LIMIT 10;
-- S14: Extract  all unique coffeeshop ids in the employees table.
SELECT DISTINCT coffeeshop_id FROM employees;
-- S15: Extract year, month, and day of hire
SELECT hire_date, EXTRACT (YEAR from hire_date) as year,
EXTRACT (MONTH from hire_date) as month,
EXTRACT (DAY from hire_date) as day
FROM employees;
-- S16: Concatenate first and last names to create full names.
SELECT first_name, last_name, first_name || ' ' || last_name as full_name FROM employees;
-- S17:	Extract the full name of the employees. If a person makes < 50,000 USD, then true; otherwise, false.
SELECT first_name || ' '  || last_name as full_name, salary < 50000 as less_than_50k
FROM employees ;
-- S18:	Extract the full name of the employees. If a person is a female and makes less than 50,000 USD, then true.
SELECT first_name || ' ' || last_name as full_name,
(gender = 'F' AND salary < 50000) as less_than_50k_female FROM employees;
-- S19: If an email has '.com', return true, otherwise false.
SELECT email, email LIKE '%.com%' FROM employees;
-- S20: Extract the full name of the only government employees.
SELECT first_name || ' ' || last_name as full_name FROM employees WHERE email LIKE '%.gov%';

-- S21: Return the email addresses beginning from the 5th character.
SELECT email, SUBSTRING(email FROM 5) FROM employees;
-- S22: Find the position of the '@'.
SELECT email, POSITION('@' IN email) as at_pos FROM employees;
-- S23: Find the email addresses of the employees via a substring.
SELECT email, SUBSTRING(email FROM POSITION('@' IN email)+1) FROM employees;
-- S24: Fill the null emails as NO EMAIL PROVIDED.
SELECT email, COALESCE(email, 'NO EMAIL PROVIDED') FROM employees;

-- S25: Find the minimum salary.
SELECT MIN(salary) as min_salary FROM employees;
-- S26: Find the difference between maximum and minimum salary.
SELECT MAX(salary)-MIN(salary) as diff FROM employees;
-- S27: Select the average salary.
SELECT AVG(salary) FROM employees;
-- S28: Round average salary to the nearest integer.
SELECT ROUND(AVG(salary),0) FROM employees;
-- S29: Sum up the salaries
SELECT SUM(salary) as total_salary FROM employees;
-- S30: Count the number of entries in the employees table.
SELECT COUNT(*) FROM employees;

-- S31: Find the number of employees for each coffee shop.
SELECT coffeeshop_id, COUNT(*) FROM employees GROUP BY coffeeshop_id;
-- S32: Find the total salaries for each coffee shop.
SELECT coffeeshop_id, SUM(salary) as total_salary FROM employees GROUP BY coffeeshop_id;
-- S33: Find the number of employees and the average, minimum, maximum, and total salaries for each coffeeshop.
SELECT coffeeshop_id, COUNT(employee_id), AVG(salary) as avg_salary, MIN(salary) as min_salary,
MAX(salary) as max_salary, SUM(salary) as total_salary FROM employees GROUP BY coffeeshop_id;
-- S34: Find the number of employees and the average, minimum, maximum, and total salaries of coffeeshops with more than 200 employees, where coffeeshops are sorted in descending order by number of employees.
SELECT coffeeshop_id, COUNT(employee_id) as nuOfEmp, AVG(salary) as avg_salary, MIN(salary) as min_salary,
MAX(salary) as max_salary, SUM(salary) as sum_salary FROM employees GROUP BY coffeeshop_id
HAVING COUNT(employee_id) > 200 ORDER BY COUNT(employee_id) DESC;
-- S35: Extract only the coffeeshops with a minimum salary of less than 10,000 USD.
SELECT coffeeshop_id, COUNT(employee_id) as nuOfEmp, AVG(salary) as avg_salary, MIN(salary) as min_salary,
MAX(salary) as max_salary, SUM(salary) as sum_salary FROM employees GROUP BY coffeeshop_id
HAVING MIN(salary) < 10000 ORDER BY COUNT(employee_id) DESC;
-- S36: Return employee_id, full_name, salary ,and pay_category, i.e high pay or low pay If pay is less than 50,000 USD, then low pay, otherwise high pay. Sort the return by salaries in descending order.
SELECT employee_id, first_name || ' ' || last_name as full_name, salary,
CASE
WHEN salary < 50000 THEN 'low pay'
ELSE 'high pay'
END as pay_category
FROM employees ORDER BY salary DESC;

-- S37: If pay is less than 20k, then low pay
-- if between 20k-50k inclusive, then medium pay
-- if over 50k, then high pay
SELECT employee_id, first_name || ' ' || last_name as full_name, salary,
CASE
WHEN salary < 20000 THEN 'low pay'
WHEN salary > 20000 AND salary < 50000 THEN 'medium pay'
ELSE 'high pay'
END as pay_category
FROM employees ORDER BY salary DESC;
-- S38: Return the count of employees in each pay category.
SELECT pC.pay_category, COUNT(*) FROM (
SELECT employee_id, first_name || ' ' || last_name as full_name, salary,
	CASE
	WHEN salary < 20000 THEN 'low pay'
	WHEN salary > 20000 AND salary < 50000 THEN 'medium pay'
	ELSE 'high pay'
	END as pay_category
FROM employees ORDER BY salary DESC
) as pC
GROUP BY pC.pay_category;
-- S39: Tranposed form of the returned list above.
SELECT
	SUM(CASE WHEN salary < 20000 THEN 1 ELSE 0 END) AS low_pay,
	SUM(CASE WHEN salary BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END) AS medium_pay,
	SUM(CASE WHEN salary > 50000 THEN 1 ELSE 0 END) AS high_pay
FROM employees;
-- S40: INNER JOIN of shops table with locations table.
INSERT INTO locations VALUES (4, 'Paris', 'France');
INSERT INTO shops VALUES (6, 'Happy Brew', NULL);
SELECT s.coffeeshop_name, l.city, l.country
FROM shops s
JOIN locations l
ON s.city_id = l.city_id;

SELECT s.coffeeshop_name, l.city, l.country
FROM shops s
INNER JOIN locations l
ON s.city_id = l.city_id;

-- S41: LEFT JOIN of shops table with locations table.
SELECT s.coffeeshop_name, l.city, l.country FROM shops s
LEFT JOIN locations l
ON s.city_id = l.city_id;

-- S42: RIGHT JOIN of shops table with locations table.
SELECT s.coffeeshop_name, l.city, l.country FROM shops s
RIGHT JOIN locations l
ON s.city_id = l.city_id;
-- S43: FULL OUTER JOIN of shops table with locations table.
SELECT s.coffeeshop_name, l.city, l.country FROM shops s
FULL JOIN locations l
ON s.city_id = l.city_id;
DELETE FROM locations WHERE city_id = 4;
DELETE FROM shops WHERE coffeeshop_id = 6;

-- UNION
-- S44: Return all cities and countries.
SELECT city FROM locations
UNION
SELECT country FROM locations;

-- S45: Removing country duplicates with the union function.
SELECT country FROM locations
UNION
SELECT country FROM locations;
-- S46: Keep the duplicate countries with the union function.
SELECT country FROM locations
UNION ALL
SELECT country FROM locations;
-- S47: Return all coffeeshop names, cities, and countries.
SELECT coffeeshop_name FROM shops
UNION
SELECT city FROM locations
UNION
SELECT country FROM locations;
--Subqueris
-- S48: Return everyting from employees where coffeeshop_id is 3 or 4 via a subquery.
SELECT * FROM (SELECT * FROM employees WHERE coffeeshop_id IN (3,4));
-- S49: Return employee_id, first_name, and last_name of employees where coffeeshop_id is 3 or 4 via a subquery.
SELECT emp.employee_id, emp.first_name, emp.last_name
FROM (SELECT * FROM employees WHERE coffeeshop_id IN(3,4)) as emp;
-- S50: Return the first_name, last_name, and salary of employee with the highest salary via a subquery.
SELECT first_name, last_name, salary, (SELECT MAX(salary) FROM employees LIMIT 1) max_salary FROM employees;
-- S51: Return the first_name, last_name, salary, the difference between salary and average salary  via a subquery.
SELECT first_name, last_name, salary, salary-(SELECT AVG(salary) FROM employees LIMIT 1) difSalary FROM employees;
-- S52: Return all of the US coffee shops via subquery.
SELECT * FROM shops WHERE city_id IN (SELECT city_id FROM locations WHERE city_id IN (1,2));
-- S53: Return all employees who work in US coffeeshops.
SELECT * FROM employees WHERE coffeeshop_id IN (SELECT coffeeshop_id FROM shops WHERE city_id IN (
SELECT city_id FROM locations WHERE country = 'United States'));
-- S54: Return all employees who make over 35,000 USD and work in US coffeeshops.
SELECT * from employees WHERE salary > 35000 AND coffeeshop_id IN
(SELECT coffeeshop_id FROM shops WHERE city_id IN (SELECT city_id FROM locations
WHERE country = 'United States'));
-- S55: Return 30-day moving total pay.
SELECT hire_date, salary,(SELECT SUM(salary) FROM employees ev2
WHERE ev2.hire_date BETWEEN e.hire_date - 30 AND e.hire_date) AS pay_pattern
FROM employees e
ORDER BY hire_date;
