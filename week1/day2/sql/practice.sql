31.
SELECT * 
FROM Employee
ORDER BY salary ASC;
32.
SELECT * 
FROM Employee
ORDER BY age DESC;
33.
SELECT * 
FROM Employee
ORDER BY hire_date ASC;
34.
SELECT * 
FROM Employee
ORDER BY department_id, salary;
35.
SELECT d.name, SUM(e.salary) AS total_salary
FROM Department d
JOIN Employee e
ON d.department_id = e.department_id
GROUP BY d.name
ORDER BY total_salary;
36.
SELECT e.name AS employee_name, d.name AS department_name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;
39.
SELECT e.*, d.name AS department_name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;
40.
SELECT d.*, e.name AS employee_name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id;
43.
SELECT d.name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id
WHERE e.emp_id IS NULL;44.
SELECT name
FROM Employee
WHERE department_id = (
    SELECT department_id
    FROM Employee
    WHERE name = 'John Doe'
)
AND name <> 'John Doe';
45.
SELECT d.name
FROM Department d
JOIN Employee e
ON d.department_id = e.department_id
GROUP BY d.name
ORDER BY AVG(e.salary) DESC
LIMIT 1;
46.
SELECT *
FROM Employee
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
);
47.
SELECT *
FROM Employee
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
);
48.
SELECT MAX(salary) AS second_highest_salary
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);
49.
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
ORDER BY employee_count DESC
LIMIT 1;
50.
SELECT *
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);
51.
SELECT DISTINCT salary
FROM Employee e1
WHERE 3 = (
    SELECT COUNT(DISTINCT salary)
    FROM Employee e2
    WHERE e2.salary >= e1.salary
);
52.
SELECT *
FROM Employee
WHERE age > ALL (
    SELECT age
    FROM Employee
    WHERE department_id = (
        SELECT department_id
        FROM Department
        WHERE name = 'HR'
    )
);
53.
SELECT d.name
FROM Department d
JOIN Employee e
ON d.department_id = e.department_id
GROUP BY d.name
HAVING AVG(e.salary) > 55000;
55.
SELECT *
FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE name = 'Jane Smith'
);
56.
SELECT SUM(salary) AS total_salary
FROM Employee
WHERE YEAR(hire_date) = 2020;
57.
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
ORDER BY average_salary DESC;
58.
SELECT department_id, COUNT(*) AS employee_count, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 1
AND AVG(salary) > 55000;
59.
SELECT *
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
ORDER BY hire_date;

60.
SELECT department_id, COUNT(*) AS total_employees, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

61.
SELECT name, salary
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);
64.
SELECT d.name AS department_name, e.name AS employee_name, e.salary
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE department_id = e.department_id
);
65.
SELECT name, salary
FROM Employee e
WHERE age > (
    SELECT AVG(age)
    FROM Employee
    WHERE department_id = e.department_id
);
