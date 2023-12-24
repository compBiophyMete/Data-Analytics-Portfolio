PostgreSQL was utilized to query data of employees working in coffeeshops from the database of 4 tables: employees, suppliers, locations, and shops. 

The employees table encompasses employee_id, first_name, last_name, email, hire_date, gender, salary, and coffeeshop_id columns. employee_id is the primary key, whereas coffeeshop_id is the foreign key.

The suppliers table is made up of coffeeshop_id, supplier_name, and coffee_type columns, where the first two columns are the primary key. 

The locations table harbors city_id, city, and country columns, where city_id is the primary key.

The table entitled shops is comprised of coffee_shop, coffeeshop_name, and city_id columns. The coffee_shop and city_id columns are primary and foreign keys, respectively.

database.sql needs to be executed to generate the database. 

extract.sql file fulfills the following tasks:

1.	Extract employees with a salary of > 50,000 USD.
2.	Extract only the employees working in Common Grounds Coffeeshop.
3.	Extract only the employees working in Common Grounds Coffeeshop and making a salary of > 50,000 USD
4.	 Extract only the male employees working in Common Grounds Coffeeshop, making a salary of > 50,000 USD.
5.	Extract all the employees who work in Common Grounds or make more than 50,000 USD or are male.
6.	Extract all rows from the suppliers table where the supplier is Beans and Barley.
7.	Extract all rows from the suppliers table where the supplier is not Beans and Barley.
8.	Extract all coffee types that are not Robusta or Arabica.
9.	Extract all employees with missing email addresses. 
10.	Extract all employees whose emails are not missing.
11.	Extract all employees who make between 35,000 and 50,000 USD.
12.	Extract employee_id, first_name, and last_name sorted by salary in descending order. 
13.	Find the top 10 highest-paid employees.
14.	Extract all unique coffeeshop ids in the employees table.
15.	Extract year, month, and day of hire.
16.	Concatenate first and last names to create full names.
17.	Extract the full name of the employees. If a person makes < 50,000 USD, then true; otherwise, false.
18.	Extract the full name of the employees. If a person is a female and makes less than 50,000 USD, then true.
19.	If an email has '.com', return true, otherwise false.
20.	Extract the full name of only government employees.
21.	Return the email addresses beginning from the 5th character.
22.	Find the position of the '@'.
23.	Find the email addresses of the employees via a substring.
24.	Fill the null emails as NO EMAIL PROVIDED.
25.	Find the minimum salary.
26.	Find the difference between maximum and minimum salary.
27.	Find the average salary.
28.	Round average salary to the nearest integer.
29.	Sum up the salaries.
30.	Count the number of entries in the employees table.
31.	Find the number of employees for each coffeeshop.
32.	Find the total salaries for each coffeeshop.
33.	Find the number of employees and the average, minimum, maximum, and total salaries for each coffeeshop.
34.	Find the number of employees and the average, minimum, maximum, and total salaries of coffeeshops with more than 200 employees, where coffeeshops are sorted in descending order by number of employees.
35.	Extract only the coffeeshops and number of employees with a minimum salary of less than 10 000 USD.
36.	Return employee_id, full_name, salary ,and pay_category, i.e high pay or low pay If pay is less than 50,000 USD, then low pay, otherwise high pay. Sort the return by salaries in descending order.
37.	If pay is less than 20,000 USD, then low pay  
if between 20,000-50,000 inclusive, then medium pay 
 if over 50,000, then high pay
38.	Return the count of employees in each pay category.
39.	Return the transposed form of the returned list above.
40.	INNER JOIN of shops table with locations table.
41.	LEFT JOIN of shops table with locations table.
42.	RIGHT JOIN of shops table with locations table.
43.	FULL JOIN of shops table with locations table.
44.	Return all cities and countries.
45.	Removing country duplicates with the union function.
46.	Keep the duplicate countries with the union function.
47.	Return all coffeeshop names, cities, and countries.
48.	Return everything from the employees table where coffeeshop_id is 3 or 4 via a subquery.
49.	Return employee_id, first_name, and last_name of employees where coffeeshop_id is 3 or 4 via a subquery.
50.	Return the first_name, last_name, and salary of the employees with the highest salary via a subquery.
51.	Return the first_name, last_name, salary, the difference between salary and average salary via a subquery.
52.	Return all of the US coffeeshops via subquery.
53.	Return all employees who work in US coffeeshops.
54.	Return all employees who make over 35,000 USD and work in US coffeeshops.
55.	Return 30-day moving total pay.

