**Situation:**
In a database environment, PostgreSQL was employed to manage data related to employees working in various coffeeshops. The database consists of four tables: employees, suppliers, locations, and shops, each with specific columns and relationships.

**Task:**
The objective was to execute SQL queries to extract and manipulate data from the database. The goal is to obtain relevant information about employees, coffeeshops, and suppliers based on specified criteria.

**Action:**

*1. Problem-solving and Query Execution:*

Execute the provided employee_db.sql to generate the database.

*2. Data Extraction Queries:*

Extract employees with a salary greater than $20,000.
Extract employees working in "Common Grounds Coffeeshop."
Extract male employees in "Common Grounds Coffeeshop" with a salary exceeding $40,000.
Extract all employees meeting specific criteria (salary, workplace, and gender).
Extract relevant data from the suppliers table based on supplier name.
Extract information about coffee types that are not "Robusta" or "Arabica."
Identify and extract employees with missing or non-missing email addresses.
Extract employees with salaries between $25,000 and $55,000.
Extract specific employee details and sort them by salary in descending order.
Identify the top 5 highest-paid employees.

*3.Data Transformation and Manipulation:*

Extract unique coffeeshop IDs from the employees table.
Extract year, month, and day of hire from the hire_date column.
Concatenate first and last names to create full names.
Evaluate conditions and generate boolean values for specific criteria.
Extract full names of government employees.
Data Cleaning and Formatting:
Perform substring operations on email addresses.
Replace null email addresses with "MISSING EMAIL INFO."

*4. Statistical Analysis:*

Find the minimum, maximum, and average salary.
Round the average salary to the nearest integer.
Calculate the sum of all salaries.
Count the number of entries in the employees table.

*5. Aggregation and Grouping:*

Find the number of employees for each coffeeshop.
Calculate total salaries for each coffeeshop.
Provide aggregated statistics (count, average, minimum, maximum, total) for each coffeeshop.
Identify coffeeshops with more than 100 employees, sorted by employee count in descending order.
Advanced Queries and Categorization:
Extract coffeeshops meeting specific salary criteria.
Categorize employees as "low pay" or "high pay" based on salary thresholds.
Count employees in each pay category.

*6. Data Presentation and Joins:*

Perform various types of joins (INNER, LEFT, RIGHT, FULL) between the shops and locations tables.
Display city and country information, removing or keeping duplicates using the union function.
Retrieve information about coffeeshop names, cities, and countries.

**Result:**

By executing these queries, a comprehensive understanding of employee data, supplier details, and coffeeshop information were obtained, which would facilitate informed decision-making and analysis in the context of the provided database.

PS: This project was adopted from the SQL Database Course: Beginner to Intermediate delivered by Mo Chen.
