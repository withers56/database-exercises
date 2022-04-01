USE william;

# Using the example in the Associative Table Joins section as a guide,
# write a query that shows each department along with the name of the current manager for that department.
SELECT department.dept_name AS Department_name,
       CONCAT(manager.first_name, ' ', manager.last_name) AS Department_Manager
FROM employees as manager
JOIN dept_manager AS deptManager ON manager.emp_no = deptManager.emp_no
JOIN departments AS department ON deptManager.dept_no = department.dept_no
WHERE deptManager.to_date = '9999-01-01';
# Find the name of all departments currently managed by women
SELECT department.dept_name AS Department_name,
       CONCAT(manager.first_name, ' ', manager.last_name) AS Department_Manager
FROM employees as manager
         JOIN dept_manager AS deptManager ON manager.emp_no = deptManager.emp_no
         JOIN departments AS department ON deptManager.dept_no = department.dept_no
WHERE gender = 'f' AND deptManager.to_date = '9999-01-01';
# Find the current titles of employees currently working in the Customer Service department.

# SELECT COUNT(emp.first_name), department.dept_name
# FROM employees as emp
# JOIN dept_emp as department_emp ON emp.emp_no = department_emp.emp_no
# JOIN departments as department ON department_emp.dept_no = department.dept_no;
SELECT t.title AS title, COUNT(t.emp_no) AS Total
FROM titles as t
    JOIN dept_emp de on t.emp_no = de.emp_no
    JOIN departments d on de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
AND t.to_date = '9999-01-01'
AND d.dept_name = 'Customer Service'
GROUP BY t.title;

# Find the current salary of all current managers.
SELECT department.dept_name AS Department_name,
       CONCAT(manager.first_name, ' ', manager.last_name) AS Department_Manager,
       managerSalary.salary

FROM employees as manager
         JOIN dept_manager AS deptManager ON manager.emp_no = deptManager.emp_no
         JOIN departments AS department ON deptManager.dept_no = department.dept_no
         JOIN salaries AS managerSalary ON managerSalary.emp_no = manager.emp_no
WHERE deptManager.to_date = '9999-01-01' AND managerSalary.to_date = '9999-01-01'
GROUP BY department.dept_name;

# Bonus Find the names of all current employees, their department name, and their current manager's name .

SELECT CONCAT(emp.first_name, ' ', emp.last_name) AS Employee
     , dept.dept_name AS Department
     , CONCAT(manager.first_name, ' ', manager.last_name) AS Manager
FROM employees AS emp
    JOIN dept_emp AS deptEmp ON emp.emp_no = deptEmp.emp_no
    JOIN departments AS dept ON deptEmp.dept_no = dept.dept_no
    JOIN dept_manager AS deptMang ON dept.dept_no = deptMang.dept_no
    JOIN employees AS manager ON deptMang.emp_no = manager.emp_no
WHERE deptEmp.to_date = '9999-01-01' AND deptMang.to_date = '9999-01-01'






