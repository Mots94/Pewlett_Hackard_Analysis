SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_title
FROM employees e
JOIN titles ti
	ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT DISTINCT ON (rt.emp_no)
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_retirement
FROM retirement_title rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT ur.title, COUNT(ur.title) 
INTO retiring_titles
FROM unique_retirement ur
GROUP BY (ur.title)
ORDER BY COUNT(ur.title) DESC;

SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentors
FROM employees e
	JOIN dept_emp de
		ON (e.emp_no = de.emp_no)
	JOIN titles ti
		ON (e.emp_no = ti.emp_no)
WHERE de.to_date = '9999-01-01'
	AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no, ti.title;
