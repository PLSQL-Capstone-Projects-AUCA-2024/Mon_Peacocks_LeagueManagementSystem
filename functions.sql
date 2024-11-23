-- Function: Calculate Player Age

CREATE
OR REPLACE FUNCTION CalculatePlayerAge(dob DATE)
RETURN NUMBER IS
    player_age NUMBER;
BEGIN
    player_age
:= TRUNC(MONTHS_BETWEEN(SYSDATE, dob) / 12);
RETURN player_age;
END;


-- Query Using Function

SELECT player_id,
       first_name,
       last_name,
       CalculatePlayerAge(date_of_birth) AS age
FROM Players;


CREATE
OR REPLACE FUNCTION TotalTransferFees(player_id NUMBER)
RETURN NUMBER IS
    total_fees NUMBER;
BEGIN
SELECT NVL(SUM(transfer_fee), 0)
INTO total_fees
FROM Transfers
WHERE player_id = player_id;
RETURN total_fees;
END;


-- Query Using Function

SELECT player_id,
       TotalTransferFees(player_id) AS total_fees
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

CREATE
OR REPLACE FUNCTION AverageMatchScore(season_id NUMBER)
RETURN NUMBER IS
    avg_score NUMBER;
BEGIN
SELECT AVG(home_team_score + away_team_score)
INTO avg_score
FROM Matches
WHERE league_season_id = season_id;
RETURN avg_score;
END;


-- Query Using Function

SELECT season_id,
       AverageMatchScore(season_id) AS avg_score
FROM LeagueSeasons;


-- Tasks: Transaction Management and DML (Part 2)
-- Transaction: Player Transfer with Fee
Update
    BEGIN
INSERT
INTO Transfers (transfer_id, player_id, from_team_id, to_team_id, transfer_date, transfer_fee)
VALUES (201, 5, 1, 2, SYSDATE, 500000);

UPDATE Teams
SET budget = budget - 500000
WHERE team_id = 2;

UPDATE Teams
SET budget = budget + 500000
WHERE team_id = 1;

COMMIT;
END;


-- Function: Count Players by Team
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


-- Query Using Function

SELECT
   team_name,
   CountPlayersByTeam(team_id) AS player_count
FROM Teams;

-- Function: Calculate Total Goals for a Team

CREATE OR REPLACE FUNCTION TotalGoalsByTeam(team_id NUMBER)
RETURN NUMBER IS
    total_goals NUMBER;
BEGIN
    SELECT NVL(SUM(home_team_score + away_team_score), 0) INTO total_goals
    FROM Matches
    WHERE home_team_id = team_id OR away_team_id = team_id;
    RETURN total_goals;
END;


-- Query Using Function

SELECT
    team_name,
    TotalGoalsByTeam(team_id) AS total_goals
FROM Teams;

-- Function to calculate total matches played by a team in a season
CREATE OR REPLACE FUNCTION calculate_matches(team_id IN NUMBER, season_id IN NUMBER)
RETURN NUMBER IS
    total_matches NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO total_matches
    FROM Matches
    WHERE (home_team_id = team_id OR away_team_id = team_id)
      AND league_season_id = season_id;

    RETURN total_matches;
END;
/
