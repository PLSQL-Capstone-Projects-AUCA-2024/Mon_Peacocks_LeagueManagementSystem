Tasks: Transaction Management and DML (Part 1)
Transaction: Insert Match and Update Referee

BEGIN
    INSERT INTO Matches (match_id, home_team_id, away_team_id, stadium_id, match_date, referee_id, league_season_id)
    VALUES (101, 1, 2, 3, TO_DATE('2024-11-30', 'YYYY-MM-DD'), 4, 1);

    UPDATE Referees
    SET experience_years = experience_years + 1
    WHERE referee_id = 4;

    COMMIT;
END;


Function: Calculate Average Match Score

CREATE OR REPLACE FUNCTION AverageMatchScore(season_id NUMBER) 
RETURN NUMBER IS
    avg_score NUMBER;
BEGIN
    SELECT AVG(home_team_score + away_team_score) INTO avg_score 
    FROM Matches 
    WHERE league_season_id = season_id;
    RETURN avg_score;
END;


Query Using Function

SELECT 
    season_id, 
    AverageMatchScore(season_id) AS avg_score
FROM LeagueSeasons;


Trigger: Prevent Same Teams in a Match

CREATE OR REPLACE TRIGGER PreventSameTeams
BEFORE INSERT OR UPDATE ON Matches
FOR EACH ROW
BEGIN
    IF :NEW.home_team_id = :NEW.away_team_id THEN
        RAISE_APPLICATION_ERROR(-20002, 'Home team and Away team cannot be the same.');
    END IF;
END;
