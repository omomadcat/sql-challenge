-- 1. List the employee number, last name, first name, gender, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s USING (emp_no);

-- 2. List the first name, last name, and hire date for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. List the manager of each department along with department number, department name, employee number, last name, and first name
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_manager m ON d.dept_no = m.dept_no
JOIN employees e ON m.emp_no = e.emp_no;

-- 4. List department number for each employee along with employee’s employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no;

-- 5. List first name, last name, and gender of each employee whose first name is Hercules and last name starts with 'B'
SELECT first_name, last_name, gender
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including employee number, last name, and first name
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
WHERE de.dept_no = 'd007';

-- 7. List each employee in the Sales and Development departments, including employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- 8. List the frequency counts of employee last names in descending order
SELECT last_name, COUNT(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;