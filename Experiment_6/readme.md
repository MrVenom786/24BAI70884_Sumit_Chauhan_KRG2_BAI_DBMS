# EXPERIMENT 6  
## Title: Understanding and Implementing Cursors for Row-by-Row Data Processing  

---

## AIM
To understand the concept and working of cursors in PL/SQL for row-by-row data processing and to analyze how implicit cursors, explicit cursors, and cursor attributes are used to implement business logic on multiple rows in a database table.

---

## APPARATUS / SOFTWARE REQUIREMENTS

### Database Management System (DBMS):
- Oracle Database Express Edition  
- PostgreSQL  

### Database Client Tool:
- Oracle SQL Developer  
- pgAdmin  

---

## OBJECTIVE
- To implement implicit and explicit cursors in PL/SQL.  
- To process multiple rows individually using explicit cursors.  
- To use cursor attributes such as `%FOUND`, `%NOTFOUND`, `%ROWCOUNT`, and `%ISOPEN`.  
- To simulate enterprise-level business logic processing.  

---

## THEORY

A **Cursor** is a pointer to the result set of a query.

### 1. Implicit Cursor
- Automatically created by Oracle for DML statements (`INSERT`, `UPDATE`, `DELETE`, `SELECT INTO`).  
- Managed internally by Oracle.  

### 2. Explicit Cursor
- Declared and controlled manually by the programmer.  
- Used when query returns multiple rows.  

### Cursor Attributes
- `SQL%FOUND`  
- `SQL%NOTFOUND`  
- `SQL%ROWCOUNT`  
- `cursor_name%ISOPEN`  

---

## PROBLEM STATEMENT

Enterprise applications often retrieve multiple records that require row-by-row processing to apply business rules such as salary increments, bonus allocation, eligibility checks, etc.

---

# EXPERIMENT STEPS

## Step 1: Create Employee Table

```sql
CREATE TABLE EMPLOYEE (
    EMP_ID NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(50),
    SALARY NUMBER
);
```

---

## Step 2: Insert Sample Data

```sql
INSERT INTO EMPLOYEE VALUES (101, 'Amit', 25000);
INSERT INTO EMPLOYEE VALUES (102, 'Riya', 32000);
INSERT INTO EMPLOYEE VALUES (103, 'Rahul', 45000);
INSERT INTO EMPLOYEE VALUES (104, 'Sneha', 28000);
INSERT INTO EMPLOYEE VALUES (105, 'Arjun', 50000);
COMMIT;
```

---

# PART A: Implicit Cursor Example

### Business Logic:
Increase salary by 10% for employees earning less than 30000.

```sql
BEGIN
    UPDATE EMPLOYEE
    SET SALARY = SALARY * 1.10
    WHERE SALARY < 30000;

    DBMS_OUTPUT.PUT_LINE('Rows Updated: ' || SQL%ROWCOUNT);

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Update Successful');
    END IF;
END;
/
```

### Output
```
Rows Updated: 2
Update Successful
```

---

# PART B: Explicit Cursor Example

### Business Logic:
Display employees with salary greater than 30000.

```sql
DECLARE
    CURSOR emp_cursor IS
        SELECT EMP_ID, EMP_NAME, SALARY
        FROM EMPLOYEE
        WHERE SALARY > 30000;

    v_id EMPLOYEE.EMP_ID%TYPE;
    v_name EMPLOYEE.EMP_NAME%TYPE;
    v_salary EMPLOYEE.SALARY%TYPE;

BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO v_id, v_name, v_salary;
        EXIT WHEN emp_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || v_id ||
            ' Name: ' || v_name ||
            ' Salary: ' || v_salary
        );
    END LOOP;

    CLOSE emp_cursor;
END;
/
```

---

# PART C: Using Cursor Attributes

```sql
DECLARE
    CURSOR emp_cursor IS SELECT * FROM EMPLOYEE;
    emp_record EMPLOYEE%ROWTYPE;

BEGIN
    OPEN emp_cursor;

    IF emp_cursor%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor Opened Successfully');
    END IF;

    LOOP
        FETCH emp_cursor INTO emp_record;
        EXIT WHEN emp_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Employee: ' || emp_record.EMP_NAME ||
            ' | Salary: ' || emp_record.SALARY
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total Rows Processed: ' || emp_cursor%ROWCOUNT);

    CLOSE emp_cursor;
END;
/
```

---

# OUTPUT


```
Cursor Opened Successfully
Employee: Amit | Salary: 27500
Employee: Riya | Salary: 32000
Employee: Rahul | Salary: 45000
Employee: Sneha | Salary: 30800
Employee: Arjun | Salary: 50000
Total Rows Processed: 5
```

---

# RESULT

The PL/SQL programs successfully demonstrated:
- Use of implicit cursors for DML operations.
- Use of explicit cursors for multi-row processing.
- Application of cursor attributes to control program execution.

---

# CONCLUSION

Cursors play a critical role in enterprise-level database applications by enabling row-by-row processing. Explicit cursors provide fine-grained control, while implicit cursors simplify DML operations. Proper use of cursor attributes enhances control flow and reliability.

---

# LEARNING OUTCOMES

After completing this experiment, the learner can:

- Understand cursor architecture in PL/SQL.
- Differentiate between implicit and explicit cursors.
- Use `%FOUND`, `%NOTFOUND`, `%ROWCOUNT`, `%ISOPEN`.
- Develop enterprise-level PL/SQL logic similar to systems used in organizations like:
  - Oracle Corporation
  - Accenture
  - Scaler
  - D. E. Shaw & Co.
