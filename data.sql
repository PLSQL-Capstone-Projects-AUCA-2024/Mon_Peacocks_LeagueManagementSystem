-- TESTING AND VERIFYING THE CREATED TABLES

DECLARE
    stadium_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO stadium_count FROM Stadiums;
    DBMS_OUTPUT.PUT_LINE('Total stadiums: ' || stadium_count);
END;
