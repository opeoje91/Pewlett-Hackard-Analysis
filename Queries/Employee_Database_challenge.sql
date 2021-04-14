-- Use Dictinct with Orderby to remove duplicate rows
SELECT emp_no, first_name, last_name, title 
FROM retirement_titles


SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no,to_date DESC;

SELECT COUNT(title)
FROM unique_titles;


SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

--DELIVERABLE 2
SELECT emp_no, first_name, last_name,birth_date
FROM employees;

SELECT from_date, to_date
FROM dept_emp;

SELECT title
FROM titles;

SELECT DISTINCT ON (emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibilty
FROM employees as e
JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;
