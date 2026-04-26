-- Step 1: Create Employee Table START
CREATE TABLE employee (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    gender VARCHAR2(10)
);
-- Step 1: Create Employee Table END


-- Step 2: Insert Sample Data START
INSERT INTO employee VALUES (1, 'Amit', 'Male');
INSERT INTO employee VALUES (2, 'Neha', 'Female');
INSERT INTO employee VALUES (3, 'Raj', 'Male');
INSERT INTO employee VALUES (4, 'Priya', 'Female');
INSERT INTO employee VALUES (5, 'Karan', 'Male');
COMMIT;
-- Step 2: Insert Sample Data END


-- Step 3: Create Stored Procedure START
CREATE OR REPLACE PROCEDURE get_employee_count_by_gender (
    p_gender IN VARCHAR2,
    p_count OUT NUMBER
)
AS
BEGIN
    SELECT COUNT(*)
    INTO p_count
    FROM employee
    WHERE gender = p_gender;
END;
/
-- Step 3: Create Stored Procedure END


-- Step 4: Execute Stored Procedure for Male START
DECLARE
    v_count NUMBER;
BEGIN
    get_employee_count_by_gender('Male', v_count);
    DBMS_OUTPUT.PUT_LINE('Male Count: ' || v_count);
END;
/
-- Step 4: Execute Stored Procedure for Male END


-- Step 5: Execute Stored Procedure for Female START
DECLARE
    v_count NUMBER;
BEGIN
    get_employee_count_by_gender('Female', v_count);
    DBMS_OUTPUT.PUT_LINE('Female Count: ' || v_count);
END;
/
-- Step 5: Execute Stored Procedure for Female END
