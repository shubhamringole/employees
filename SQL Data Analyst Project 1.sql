use employees;

SELECT * FROM employees;

-- 1. List of Employees by Department
-- Question: Write a query to list all employees along with their respective department names. Include employee number, first name, last name, department number, and department name.
SELECT e.emp_no,e.first_name,e.last_name,d.dept_no,d.dept_name FROM employees as e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no;

-- 2. Current and Past Salaries of an Employee
-- Question: Write a query to retrieve all the salary records of a given employee (by employee number). Include employee number, salary, from_date, and to_date.

SELECT * FROM salaries
WHERE emp_no = '10044' order by salary desc 
LIMIT 1;

-- 3. Employees with Specific Titles
-- Question: Write a query to find all employees who have held a specific title (e.g., 'Engineer'). Include employee number, first name, last name, and title.

SELECT e.emp_no,first_name,last_name,title FROM employees as e
JOIN titles  as t
ON e.emp_no = t.emp_no 
where t.title = 'Engineer';


-- 4. Departments with Their Managers
-- Question: Write a query to list all departments along with their current managers. Include department number, department name, manager's employee number, first name, and last name.

SELECT d.dept_no,d.dept_name,e.emp_no,e.first_name,e.last_name FROM departments as d
JOIN dept_manager as dm 
ON d.dept_no = dm.dept_no
JOIN employees as e 
ON e.emp_no = dm.emp_no;


-- 5. Employee Count by Department
-- 

SELECT d.dept_no,dept_name,count(de.emp_no) as emp_count FROM departments as d 
JOIN dept_emp as de 
ON d.dept_no = de.dept_no
GROUP BY dept_no,dept_name;


--  6. Employees' Birthdates in a Given Year
-- Question: Write a query to find all employees born in a specific year (e.g., 1953). Include employee number, first name, last name, and birth date.

SELECT emp_no,first_name,last_name,birth_date FROM employees
WHERE year(birth_date) = 1953;

-- 7. Employees Hired in the Last 5 Years
-- Question: Write a query to find all employees hired in the last 50 years. Include employee number, first name, last name, and hire date.

SELECT emp_no,first_name,last_name,hire_date FROM employees
WHERE hire_date >= date_sub(curdate(),INTERVAL 50 YEAR);


-- 8. Average Salary by Department
-- Question: Write a query to calculate the average salary for each department. Include department number, department name, and average salary.

SELECT d.dept_no,d.dept_name,avg(s.salary)  as avg_salary FROM departments as d
JOIN dept_emp as de
ON de.dept_no = d.dept_no
JOIN salaries as s ON de.emp_no = s.emp_no
GROUP BY d.dept_no,d.dept_name;

-- 9.Gender Distribution in Each Department
-- Question: Write a query to find the gender distribution (number of males and females) in each department. Include department number, department name, count of males, and count of females.


SELECT d.dept_no,d.dept_name,
SUM(CASE when e.gender = 'M' THEN 1 ELSE 0 END ) as male_count,
 SUM(CASE when e.gender = 'F' THEN 1 ELSE 0 END ) as female_count
 FROM  departments as d
JOIN dept_emp as de ON de.dept_no = d.dept_no
JOIN employees as e on de.emp_no = e.emp_no
GROUP by d.dept_no,d.dept_name;


-- 10. Longest Serving Employees
-- Question: Write a query to find the employees who have served the longest in the company. Include employee number, first name, last name, and number of years served.

SELECT emp_no,first_name,last_name,
timestampdiff(YEAR,hire_date,CUrdate()) as year_served
 FROM employees
 ORDER By year_served desc
 LIMIT 10



