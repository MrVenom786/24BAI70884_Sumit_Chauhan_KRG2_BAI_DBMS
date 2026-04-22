CREATE TABLE EMPLOYEE (
    EMP_ID NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(50),
    SALARY NUMBER
);
INSERT INTO EMPLOYEE VALUES (101, 'Amit', 25000);
INSERT INTO EMPLOYEE VALUES (102, 'Riya', 32000);
INSERT INTO EMPLOYEE VALUES (103, 'Rahul', 45000);
INSERT INTO EMPLOYEE VALUES (104, 'Sneha', 28000);
INSERT INTO EMPLOYEE VALUES (105, 'Arjun', 50000);

COMMIT;

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

DECLARE
    CURSOR emp_cursor IS
        SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE
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
