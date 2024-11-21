Trigger: Auto-Log Player Transfers

CREATE OR REPLACE TRIGGER LogPlayerTransfer
AFTER INSERT ON Transfers
FOR EACH ROW
BEGIN
    INSERT INTO TransferLogs (transfer_id, log_date, details)
    VALUES (:NEW.transfer_id, SYSDATE, 'Player transferred with ID ' || :NEW.player_id);
END;


Function: Calculate Total Goals for a Team

CREATE OR REPLACE FUNCTION TotalGoalsByTeam(team_id NUMBER) 
RETURN NUMBER IS
    total_goals NUMBER;
BEGIN
    SELECT NVL(SUM(home_team_score + away_team_score), 0) INTO total_goals 
    FROM Matches 
    WHERE home_team_id = team_id OR away_team_id = team_id;
    RETURN total_goals;
END;


Query Using Function

SELECT 
    team_name, 
    TotalGoalsByTeam(team_id) AS total_goals
FROM Teams;

