# Experiment 10 – Design of Trigger for Automatic Primary Key Generation (Enterprise Application)

## Experiment
Designing and implementing a database trigger that automatically generates and enforces unique primary key values during record insertion. This experiment demonstrates automation, data integrity, and elimination of manual errors in enterprise database systems.

---

## Aim
To create and implement a database trigger that automatically generates a unique primary key for each record inserted into a table.

---

## Objective
- To understand the concept and working of database triggers  
- To implement automatic primary key generation using triggers  
- To eliminate manual intervention in key assignment  
- To ensure uniqueness and data integrity  
- To apply trigger-based automation in enterprise systems  

---

## Software Requirements

### Database Management System:
- Oracle Database Express Edition (Oracle XE) / PostgreSQL  

### Database Administration Tool:
- Oracle SQL Developer / pgAdmin  

---

## Problem Statement
In enterprise-level applications, manually assigning primary keys can lead to duplication and errors. To maintain data integrity and ensure uniqueness, a trigger-based mechanism is required that automatically generates a primary key before inserting records into a table.

---

## Practical / Experiment Steps
- Create a table requiring automatic primary key generation  
- Create a sequence to generate unique values  
- Design a trigger that activates before insert  
- Assign the next sequence value to the primary key  
- Insert multiple records to test the trigger  
- Verify uniqueness of generated keys  

---

## Procedure
- Open Oracle SQL Developer and connect to the database  
- Create the required table  
- Create a sequence for primary key generation  
- Create a trigger using BEFORE INSERT event  
- Compile the trigger successfully  
- Insert records without specifying the primary key  
- Display the table contents  

---

## Input / Output Details

### Input
Table: employee (emp_id, name, salary)

---

## SQL Implementation

### Create Table
```sql
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);
```

### Create Sequence
```sql
CREATE SEQUENCE emp_seq
START WITH 1
INCREMENT BY 1;
```

### Create Trigger
```sql
CREATE OR REPLACE TRIGGER emp_trigger
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    IF :NEW.emp_id IS NULL THEN
        SELECT emp_seq.NEXTVAL INTO :NEW.emp_id FROM dual;
    END IF;
END;
/
```

### Insert Data
```sql
INSERT INTO employee (name, salary) VALUES ('Aman', 40000);
INSERT INTO employee (name, salary) VALUES ('Neha', 50000);
```

### View Output
```sql
SELECT * FROM employee;
```

---

## Output
1 Aman 40000  
2 Neha 50000  

---

## Learning Outcome
After completing this experiment, the learner will be able to:

- Understand the working of database triggers  
- Implement automatic primary key generation  
- Ensure data integrity without manual intervention  
- Apply trigger-based solutions in enterprise applications  
- Develop efficient and reliable database systems  