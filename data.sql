-- TESTING AND VERIFYING THE CREATED TABLES

DECLARE
stadium_count NUMBER;
BEGIN
SELECT COUNT(*)
INTO stadium_count
FROM Stadiums;
DBMS_OUTPUT
.
PUT_LINE
('Total stadiums: ' || stadium_count);
END


--  Insert sample data for stadiums
INSERT INTO Stadiums (stadium_name, city, capacity, established_year)
VALUES ('National Stadium', 'Kigali', 25000, 2005),
       ('Amahoro Arena', 'Gisenyi', 18000, 1995),
       ('Freedom Park', 'Butare', 15000, 2010);


--  Insert sample data for coaches
INSERT INTO Coaches (first_name, last_name, nationality, experience_years)
VALUES ('John', 'Doe', 'Rwanda', 10),
       ('Maria', 'Lopez', 'Spain', 15),
       ('Alex', 'Johnson', 'England', 12);


--  Insert sample data for referees

INSERT INTO Referees (first_name, last_name, nationality, experience_years)
VALUES ('Simon', 'Peter', 'Kenya', 5),
       ('Jane', 'Smith', 'Uganda', 8),
       ('Oscar', 'Mugisha', 'Rwanda', 6);


-- Insert sample data for league seasons.
-- Update player position based on new training

UPDATE Players SET position = 'Midfielder' WHERE first_name = 'Alexis' AND last_name = 'Mugabe';

-- Cancel a transfer due to policy violations

DELETE FROM Transfers WHERE transfer_id = 2;

INSERT INTO LeagueSeasons (season_name, start_date, end_date, champion_team_id)
VALUES ('2023/24 Season', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), 1),
       ('2022/23 Season', TO_DATE('2022-09-01', 'YYYY-MM-DD'), TO_DATE('2023-05-30', 'YYYY-MM-DD'), 3);


-- Insert sample data for matches.

INSERT INTO Matches (home_team_id, away_team_id, stadium_id, match_date, league_season_id, referee_id, home_team_score,
                     away_team_score)
VALUES (1, 2, 1, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 1, 1, 2, 1),
       (3, 1, 3, TO_DATE('2023-11-15', 'YYYY-MM-DD'), 1, 2, 1, 1),
       (2, 3, 2, TO_DATE('2023-12-10', 'YYYY-MM-DD'), 1, 3, 0, 3);


-- Insert sample data for team players.

INSERT INTO TeamPlayers (team_id, player_id, join_date, leave_date)
VALUES (1, 1, TO_DATE('2021-01-01', 'YYYY-MM-DD'), NULL),
       (2, 2, TO_DATE('2020-06-01', 'YYYY-MM-DD'), TO_DATE('2022-06-01', 'YYYY-MM-DD')),
       (3, 3, TO_DATE('2019-09-01', 'YYYY-MM-DD'), NULL);

-- Update stadium capacity to reflect renovations
UPDATE Stadiums SET capacity = 30000 WHERE stadium_name = 'National Stadium';


-- Add a new team after league expansion
INSERT INTO Teams (team_name, founded_year, city, stadium_id, manager, coach_id) VALUES ('New Horizon', 2021, 'Musanze', 1, 'Michael', 2);
-- Cross Join: Players and Teams

SELECT Players.player_id,
       Players.first_name,
       Players.last_name,
       Teams.team_id,
       Teams.team_name
FROM Players
         CROSS JOIN Teams;

-- Test the index on Stadiums(city) with a query

EXPLAIN PLAN FOR SELECT * FROM Stadiums WHERE city = 'Kigali';


-- Optimize a query using Players(position)

SELECT * FROM Players WHERE position = 'Midfielder';

-- Cross Join: Matches and Referees

SELECT Matches.match_id,
       Matches.match_date,
       Referees.referee_id,
       Referees.first_name,
       Referees.last_name
FROM Matches
         CROSS JOIN Referees;


-- Inner Join: Players and Teams

SELECT Players.player_id,
       Players.first_name,
       Players.last_name,
       Teams.team_name
FROM Players
         INNER JOIN Teams
                    ON Players.current_team_id = Teams.team_id;


-- Inner Join: Matches and Referees


SELECT Matches.match_id,
       Matches.match_date,
       Referees.first_name AS referee_first_name,
       Referees.last_name  AS referee_last_name
FROM Matches
         INNER JOIN Referees
                    ON Matches.referee_id = Referees.referee_id;


-- Verify that all league seasons have valid champion team IDs

SELECT *
FROM LeagueSeasons
WHERE champion_team_id NOT IN (SELECT team_id FROM Teams);

-- Ensure no player has overlapping team memberships

SELECT player_id
FROM TeamPlayers
GROUP BY player_id
HAVING COUNT(*) > 1
   AND MIN(leave_date) > MAX(join_date);