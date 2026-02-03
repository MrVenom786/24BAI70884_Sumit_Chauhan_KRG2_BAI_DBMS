DECLARE
    num NUMBER := -5;
BEGIN
    IF num > 0 THEN
        DBMS_OUTPUT.PUT_LINE('The number ' || num || ' is Positive');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The number ' || num || ' is Non-Positive');
    END IF;
END;
/

DECLARE
    marks NUMBER := 82;
BEGIN
    IF marks >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: A');
    ELSIF marks >= 75 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: B');
    ELSIF marks >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: C');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Grade: Fail');
    END IF;
END;
/

DECLARE
    marks NUMBER := 68;
BEGIN
    IF marks >= 85 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Excellent');
    ELSIF marks >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Very Good');
    ELSIF marks >= 55 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Good');
    ELSIF marks >= 40 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Average');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Performance: Poor');
    END IF;
END;
/
  
DECLARE
    day_no NUMBER := 3;
    day_name VARCHAR2(20);
BEGIN
    day_name := CASE day_no
        WHEN 1 THEN 'Sunday'
        WHEN 2 THEN 'Monday'
        WHEN 3 THEN 'Tuesday'
        WHEN 4 THEN 'Wednesday'
        WHEN 5 THEN 'Thursday'
        WHEN 6 THEN 'Friday'
        WHEN 7 THEN 'Saturday'
        ELSE 'Invalid Day Number'
    END;

    DBMS_OUTPUT.PUT_LINE('Day: ' || day_name);
END;
/
