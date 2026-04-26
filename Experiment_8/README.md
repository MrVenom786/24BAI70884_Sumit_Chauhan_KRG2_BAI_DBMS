# Experiment 8 – Design of a Parameterized PL/SQL Stored Procedure for Employee Count by Gender (CData, Toddle)

## Experiment
Experiment 8: Designing and implementing a parameterized PL/SQL stored procedure that accepts gender as an input parameter and returns the total number of employees based on the given gender. This experiment demonstrates procedural programming, parameterized logic, and dynamic data retrieval in a database environment.

## Aim
To design and implement a stored procedure that accepts gender as an input parameter and returns the total number of employees based on the gender passed, thereby demonstrating procedural programming and parameterized logic in PL/SQL.

## Objective
- To understand the structure and components of a PL/SQL stored procedure.
- To implement IN and OUT parameters in stored procedures.
- To pass dynamic input values to procedures.
- To apply aggregate functions for data analysis.
- To develop reusable database logic for real-world business scenarios.

## Software Requirements
### Database Management System:
- Oracle Database Express Edition (Oracle XE)
- PostgreSQL Database

### Database Administration Tool / Client Tool:
- Oracle SQL Developer (for Oracle XE)
- pgAdmin (for PostgreSQL)

## Problem Statement
Organizations often require flexible reporting mechanisms to analyze workforce distribution based on gender for compliance and internal analytics. A dynamic and reusable solution is needed to efficiently retrieve employee counts based on gender input.

## Practical / Experiment Steps
- Create an employee table with relevant attributes.
- Insert sample data into the employee table.
- Design a stored procedure that accepts gender as an input parameter.
- Use an aggregate function to count employees based on the given gender.
- Return the result using an OUT parameter.
- Execute the stored procedure with different gender inputs.
- Analyze the output.

## Procedure
1. Open Oracle SQL Developer or pgAdmin and connect to the database.
2. Create the employee table with fields such as id, name, and gender.
3. Insert sample records into the table.
4. Create a PL/SQL stored procedure with IN and OUT parameters.
5. Write a SELECT COUNT(*) query inside the procedure.
6. Compile the procedure successfully.
7. Execute the procedure using different gender values.
8. Display the output.
9. Capture results for documentation.

## Input / Output Details

### Input
- Table:
  - employee (id, name, gender)
- Input Parameter:
  - Gender value (e.g., 'Male', 'Female')

### Step-wise Output

**Step 1 – Create Employee Table**  
![Employee Table Creation](ScreenShots/s1.png)

**Step 2 – Insert Sample Data**  
![Insert Sample Data](ScreenShots/s2.png)

**Step 3 – Create Stored Procedure**  
![Create Stored Procedure](ScreenShots/s3.png)

**Step 4 – Execute Stored Procedure**  
![Execute Stored Procedure](ScreenShots/s4.png)

**Step 5 – Display Output**  
![Display Output](ScreenShots/s5.png)

## Learning Outcome
After completing this experiment, the learner will be able to:

- Understand procedural programming in PL/SQL.
- Implement parameterized stored procedures using IN and OUT parameters.
- Perform dynamic data retrieval based on user input.
- Use aggregate functions like COUNT() within procedures.
- Develop reusable and efficient database logic for enterprise applications used in companies like CData and Toddle.
