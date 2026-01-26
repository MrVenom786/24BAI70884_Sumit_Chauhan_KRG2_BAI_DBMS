CREATE TABLE employee (
    emp_id       INT PRIMARY KEY,
    emp_name     VARCHAR(50),
    department   VARCHAR(50),
    salary       NUMERIC(10,2),
    joining_date DATE
);


INSERT INTO employee (emp_id, emp_name, department, salary, joining_date) VALUES
(101, 'Amit Sharma',   'IT',        45000, '2022-01-10'),
(102, 'Neha Verma',    'HR',        22000, '2021-03-15'),
(103, 'Rahul Singh',   'IT',        30000, '2020-06-20'),
(104, 'Priya Mehta',   'Finance',   55000, '2019-09-05'),
(105, 'Karan Gupta',   'HR',        18000, '2023-02-12'),
(106, 'Sneha Kapoor',  'Finance',   28000, '2020-11-25'),
(107, 'Rohit Jain',    'Sales',     35000, '2021-07-30'),
(108, 'Ananya Joshi',  'Sales',     15000, '2022-12-01'),
(109, 'Vikram Rao',    'IT',        25000, '2022-04-18');

SELECT * FROM employee;

SELECT department,AVG(salary) AS avg_salary
FROM employee
GROUP BY department;


SELECT department,AVG(salary) AS avg_salary
FROM employee
WHERE salary > 20000
GROUP BY department;

SELECT department,AVG(salary) AS avg_salary
FROM employee
WHERE salary > 20000
GROUP BY department
HAVING AVG(salary) > 30000;

SELECT department,AVG(salary) AS avg_salary
FROM employee
WHERE salary > 20000
GROUP BY department
HAVING AVG(salary) > 30000
ORDER BY avg_salary DESC;
