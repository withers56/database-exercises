SELECT first_name
FROM employees
WHERE hire_date IN (SELECT hire_date FROM employees WHERE emp_no = 101010);


SELECT title
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
    );

SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date > CURDATE()
    )
AND gender = 'f';

SELECT dept_name
FROM departments
WHERE dept_no IN (
    SELECT dept_no
    FROM dept_manager
    WHERE emp_no IN (
        SELECT emp_no
        FROM employees
        WHERE gender = 'f'
        )
    AND to_date > CURDATE()
    );

SELECT e.first_name, e.last_name
FROM employees as e
JOIN salaries s on e.emp_no = s.emp_no
WHERE s.to_date > CURDATE()
ORDER BY salary DESC
LIMIT 1;

SELECT first_name, last_name
from employees
where emp_no IN (
    select emp_no
    from salaries
    where salary = (select MAX(salary) from salaries)
    )


