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


-- Tasks: Transaction Management and DML (Part 1)
-- Transaction: Insert Match and Update Referee

BEGIN
    INSERT INTO Matches (match_id, home_team_id, away_team_id, stadium_id, match_date, referee_id, league_season_id)
    VALUES (101, 1, 2, 3, TO_DATE('2024-11-30', 'YYYY-MM-DD'), 4, 1);

    UPDATE Referees
    SET experience_years = experience_years + 1
    WHERE referee_id = 4;

    COMMIT;
END;


-- Function: Calculate Average Match Score

CREATE OR REPLACE FUNCTION AverageMatchScore(season_id NUMBER)
RETURN NUMBER IS
    avg_score NUMBER;
BEGIN
    SELECT AVG(home_team_score + away_team_score) INTO avg_score
    FROM Matches
    WHERE league_season_id = season_id;
    RETURN avg_score;
END;


-- Query Using Function

SELECT
    season_id,
    AverageMatchScore(season_id) AS avg_score
FROM LeagueSeasons;

