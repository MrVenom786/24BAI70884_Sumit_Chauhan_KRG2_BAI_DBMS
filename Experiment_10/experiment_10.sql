CREATE TABLE employee (
emp_id INT PRIMARY KEY,
name VARCHAR(50),
salary INT
);

CREATE SEQUENCE emp_seq
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER emp_trigger
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
IF :NEW.emp_id IS NULL THEN
SELECT emp_seq.NEXTVAL INTO :NEW.emp_id FROM dual;
END IF;
END;
/

INSERT INTO employee (name, salary) VALUES ('Aman', 40000);
INSERT INTO employee (name, salary) VALUES ('Neha', 50000);
INSERT INTO employee (name, salary) VALUES ('Rahul', 45000);
INSERT INTO employee (name, salary) VALUES ('Simran', 55000);

SELECT * FROM employee;