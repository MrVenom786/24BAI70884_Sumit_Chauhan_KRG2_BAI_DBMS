-- ================================
-- EXPERIMENT 9: PL/SQL PACKAGE
-- Employee Details using Shared Cursor
-- ================================

-- STEP 1: CREATE TABLE
-- This step creates the employee table structure
CREATE TABLE employee (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    gender VARCHAR2(10),
    salary NUMBER
);

-- STEP 2: INSERT SAMPLE DATA
-- This step inserts sample employee records
INSERT INTO employee VALUES (1, 'Amit', 'Male', 50000);
INSERT INTO employee VALUES (2, 'Neha', 'Female', 60000);
INSERT INTO employee VALUES (3, 'Raj', 'Male', 55000);
INSERT INTO employee VALUES (4, 'Priya', 'Female', 65000);

COMMIT;

-- STEP 3: PACKAGE SPECIFICATION
-- Declares procedures and cursor structure (interface of package)
CREATE OR REPLACE PACKAGE emp_package AS

    -- Procedure declaration to display employees
    PROCEDURE display_employees;

END emp_package;
/

-- STEP 4: PACKAGE BODY
-- Defines actual logic of procedures and cursor

CREATE OR REPLACE PACKAGE BODY emp_package AS

    -- Shared cursor: fetches all employee records
    CURSOR emp_cursor IS
        SELECT id, name, gender, salary FROM employee;

    -- Procedure implementation
    PROCEDURE display_employees IS

        -- Variables to store fetched cursor data
        v_id employee.id%TYPE;
        v_name employee.name%TYPE;
        v_gender employee.gender%TYPE;
        v_salary employee.salary%TYPE;

    BEGIN
        -- Open cursor
        OPEN emp_cursor;

        -- Loop through all records
        LOOP
            FETCH emp_cursor INTO v_id, v_name, v_gender, v_salary;

            -- Exit when no more records
            EXIT WHEN emp_cursor%NOTFOUND;

            -- Display each employee record
            DBMS_OUTPUT.PUT_LINE(
                'ID: ' || v_id ||
                ' | Name: ' || v_name ||
                ' | Gender: ' || v_gender ||
                ' | Salary: ' || v_salary
            );
        END LOOP;

        -- Close cursor
        CLOSE emp_cursor;

    END display_employees;

END emp_package;
/

-- STEP 5: EXECUTE PACKAGE PROCEDURE
-- Calls the procedure inside the package
BEGIN
    emp_package.display_employees;
END;
/