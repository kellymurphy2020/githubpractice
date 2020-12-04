--DATA ANALYSIS (Part B)
--Where unspecified in instructions, data has been ordered by alphabetical order for clarity.

-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp
	LEFT JOIN salaries AS sal ON sal.emp_no = emp.emp_no
ORDER BY emp.last_name ASC, emp.first_name ASC;

-- 2.List first name, last name, and hire date for employees who were hired in 1986. Date displayed as 1986-XX=XX so use %.
SELECT * FROM employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY last_name;

-- 3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dep.dept_no, dep.dept_name, dept_manager.emp_no, 
		emp.last_name, emp.first_name
FROM employees AS emp
	INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
	INNER JOIN departments AS dep ON dep.dept_no = dept_emp.dept_no
	INNER JOIN dept_manager AS dept_manager ON dept_manager.emp_no = emp.emp_no
ORDER BY dep.dept_name ASC;

-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees AS emp 
	INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
	INNER JOIN departments AS dep ON dep.dept_no = dept_emp.dept_no
ORDER BY dep.dept_name ASC, emp.last_name ASC, emp.first_name ASC;

-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%'
ORDER BY first_name ASC;

-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name. Sales dept id is 'd007'
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees AS emp
	INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
	INNER JOIN departments AS dep ON dep.dept_no = dept_emp.dept_no
WHERE dep.dept_no = 'd007'
ORDER BY emp.last_name ASC;


-- 7.List all employees in the Sales (d007) and Development departments (d005), including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees AS emp
	INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
	INNER JOIN departments AS dep ON dep.dept_no = dept_emp.dept_no
WHERE dep.dept_no IN ('d007', 'd005')
ORDER BY dep.dept_name ASC;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(first_name) AS employee_count
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;
