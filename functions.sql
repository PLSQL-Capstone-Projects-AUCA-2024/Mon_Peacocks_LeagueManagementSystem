-- Function: Calculate Player Age

CREATE OR REPLACE FUNCTION CalculatePlayerAge(dob DATE) 
RETURN NUMBER IS
    player_age NUMBER;
BEGIN
    player_age := TRUNC(MONTHS_BETWEEN(SYSDATE, dob) / 12);
    RETURN player_age;
END;


-- Query Using Function

SELECT 
    player_id, first_name, last_name, 
    CalculatePlayerAge(date_of_birth) AS age
FROM Players;
