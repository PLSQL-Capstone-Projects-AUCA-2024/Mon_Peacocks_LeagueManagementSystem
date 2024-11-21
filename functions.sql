-- Create a trigger
CREATE OR REPLACE TRIGGER EnforcePlayerPosition
BEFORE INSERT OR UPDATE ON Players
FOR EACH ROW
BEGIN
   IF :NEW.position NOT IN ('Goalkeeper', 'Defender', 'Midfielder', 'Forward') THEN
       RAISE_APPLICATION_ERROR(-20003, 'Invalid position.');
   END IF;
END;
 
 
Function: Count Players by Team
-- Create a function
CREATE OR REPLACE FUNCTION CountPlayersByTeam(team_id NUMBER)
RETURN NUMBER IS
   player_count NUMBER;
BEGIN
   SELECT COUNT(*) INTO player_count
   FROM Players
   WHERE current_team_id = team_id;
   RETURN player_count;
END;
 
 
Query Using Function
 
SELECT
   team_name,
   CountPlayersByTeam(team_id) AS player_count
FROM Teams;
