
LAB EXPERIMENT 1.2
SQL SELECT Queries Using WHERE, GROUP BY, HAVING, ORDER BY

Aim of the Session:
To understand and implement SQL SELECT queries using WHERE, GROUP BY, HAVING, and ORDER BY clauses.

Objective of the Session:
- Practice SQL SELECT statements
- Apply WHERE clause
- Use GROUP BY and HAVING
- Sort results using ORDER BY

Practical / Experiment Steps:
An EMPLOYEE table is used to store employee data.
Task: Display department-wise average salary with conditions.

Procedure:
1. Open database software
2. Create EMPLOYEE table
3. Insert records
4. Execute SQL query
5. Verify output

SQL Query:
SELECT department, AVG(salary) AS avg_salary
FROM employee
WHERE salary > 20000
GROUP BY department
HAVING AVG(salary) > 30000
ORDER BY avg_salary DESC;

Learning Outcome:
Understood filtering, grouping, and sorting in SQL.
