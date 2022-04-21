SELECT first_name, last_name

FROM employees

WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name

FROM employees

WHERE birth_date BETWEEN '1952-01-01' and '1952-12-31';

SELECT first_name, last_name

FROM employees

WHERE birth_date BETWEEN '1953-01-01' and '1953-12-31';

SELECT first_name, last_name

FROM employees

WHERE birth_date BETWEEN '1954-01-01' and '1954-12-31';

SELECT first_name, last_name

FROM employees

WHERE birth_date BETWEEN '1955-01-01' and '1955-12-31';

--Retirment Eligibility
SELECT first_name, last_name

FROM employees

WHERE (birth_date BETWEEN '1952-01-01' and '1955-12-31')

AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--Number of Employees Retiring
SELECT COUNT(first_name)

FROM employees

WHERE (birth_date BETWEEN '1952-01-01' and '1955-12-31')

AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--Retirment Eligibility
SELECT first_name, last_name

INTO retirement_info

FROM employees

WHERE (birth_date BETWEEN '1952-01-01' and '1955-12-31')

AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;


--Order salaries table by to_date in descending order
SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT emp_no, 
	first_name, 
	last_name,
	gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01');
	
SELECT * FROM emp_info;

--List of managers per department
SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
INTO manager_info
FROM dept_manager as dm
	INNER JOIN departments as d
		ON (dm.dept_no = d.dept_no)
	INNER JOIN current_emp as ce
		ON (dm.emp_no = ce.emp_no);
		
--List of employees and their department names
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
--INTO dept_info
FROM current_emp as ce
	INNER JOIN dept_emp as de
		ON (ce.emp_no = de.emp_no)
	INNER JOIN departments as d
		ON (de.dept_no = d.dept_no);
		
--List of retiring employees in sales
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	d.dept_name
INTO sales_retiring
FROM retirement_info as ri
	INNER JOIN dept_emp as de
		ON (ri.emp_no = de.emp_no)
	INNER JOIN departments as d
		ON (de.dept_no = d.dept_no)
WHERE d.dept_no = 'd007';

SELECT * 
FROM departments
WHERE dept_name IN ('Sales', 'Development');

--List of eligible mentors from sales and development
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	d.dept_name
INTO eligible_mentors
FROM retirement_info as ri
	INNER JOIN dept_emp as de
		ON (ri.emp_no = de.emp_no)
	INNER JOIN departments as d
		ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development');