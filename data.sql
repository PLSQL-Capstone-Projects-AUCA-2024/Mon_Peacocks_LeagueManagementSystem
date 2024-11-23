-- TESTING AND VERIFYING THE CREATED TABLES

DECLARE
stadium_count NUMBER;
BEGIN
SELECT COUNT(*)
INTO stadium_count
FROM Stadiums;
DBMS_OUTPUT.PUT_LINE('Total stadiums: ' || stadium_count);
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
-- Verify no duplicates in Transfers table
SELECT player_id, transfer_date, COUNT(*)
FROM Transfers
GROUP BY player_id, transfer_date
HAVING COUNT(*) > 1;

-- Insert additional data into Matches table
INSERT INTO Matches (home_team_id, away_team_id, stadium_id, match_date, league_season_id, referee_id, home_team_score, away_team_score)
VALUES
(1, 3, 1, TO_DATE('2023-10-25', 'YYYY-MM-DD'), 1, 2, 3, 2),
(2, 1, 2, TO_DATE('2023-11-12', 'YYYY-MM-DD'), 1, 1, 2, 1);

-- Update LeagueSeasons to fix invalid start and end dates
UPDATE LeagueSeasons
SET start_date = TO_DATE('2023-09-01', 'YYYY-MM-DD'),
    end_date = TO_DATE('2024-05-30', 'YYYY-MM-DD')
WHERE start_date >= end_date;

UPDATE Players
SET position = 'Midfielder'
WHERE first_name = 'Alexis'
  AND last_name = 'Mugabe';

-- Cancel a transfer due to policy violations

DELETE
FROM Transfers
WHERE transfer_id = 2;

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
UPDATE Stadiums
SET capacity = 30000
WHERE stadium_name = 'National Stadium';


-- Add a new team after league expansion
INSERT INTO Teams (team_name, founded_year, city, stadium_id, manager, coach_id)
VALUES ('New Horizon', 2021, 'Musanze', 1, 'Michael', 2);

-- Insert sample data for teams

INSERT INTO Teams (team_name, founded_year, city, stadium_id, manager, coach_id)
VALUES ('Kigali FC', 1998, 'Kigali', 1, 'James', 1),
       ('Butare United', 2002, 'Butare', 3, 'David', 2),
       ('Gisenyi Stars', 2010, 'Gisenyi', 2, 'Edward', 3);


-- Insert sample data for players.


INSERT INTO Players (first_name, last_name, date_of_birth, nationality, position, current_team_id, height, weight)
VALUES ('Eric', 'Twagira', TO_DATE('1995-07-12', 'YYYY-MM-DD'), 'Rwanda', 'Forward', 1, 1.82, 75),
       ('Sam', 'Kamanzi', TO_DATE('1998-03-22', 'YYYY-MM-DD'), 'Rwanda', 'Midfielder', 2, 1.76, 68),
       ('Alexis', 'Mugabe', TO_DATE('2000-11-05', 'YYYY-MM-DD'), 'Uganda', 'Defender', 3, 1.89, 80);


-- Insert sample data for transfers.

INSERT INTO Transfers (player_id, from_team_id, to_team_id, transfer_date, transfer_fee)
VALUES (1, 2, 1, TO_DATE('2023-06-15', 'YYYY-MM-DD'), 150000),
       (2, 1, 3, TO_DATE('2022-12-10', 'YYYY-MM-DD'), 90000),
       (3, 3, 2, TO_DATE('2021-08-20', 'YYYY-MM-DD'), 75000);



-- Test the index on Stadiums(city) with a query
EXPLAIN PLAN FOR SELECT * FROM Stadiums WHERE city = 'Kigali';


-- Test queries on matches with composite index

EXPLAIN PLAN FOR SELECT * FROM Matches WHERE home_team_id = 1 AND away_team_id = 2;



-- Optimize a query using Players(position)

SELECT * FROM Players WHERE position = 'Midfielder';


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



-- Cross Join: Players and Teams

SELECT Players.player_id,
       Players.first_name,
       Players.last_name,
       Teams.team_id,
       Teams.team_name
FROM Players
         CROSS JOIN Teams;

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



-- Tasks: DML and Join Operations (Part 2)
-- Left Outer Join: Teams and Stadiums


SELECT
    Teams.team_id, Teams.team_name,
    Stadiums.stadium_name, Stadiums.city
FROM Teams
         LEFT OUTER JOIN Stadiums
                         ON Teams.stadium_id = Stadiums.stadium_id;



-- Left Outer Join: Matches and Home Teams

SELECT
    Matches.match_id, Matches.match_date,
    Teams.team_name AS home_team_name
FROM Matches
         LEFT OUTER JOIN Teams
                         ON Matches.home_team_id = Teams.team_id;


-- Right Outer Join: Stadiums and Teams

SELECT
    Stadiums.stadium_name, Stadiums.city,
    Teams.team_name
FROM Teams
         RIGHT OUTER JOIN Stadiums
                          ON Teams.stadium_id = Stadiums.stadium_id;



-- Right Outer Join: Coaches and Teams

SELECT
    Coaches.first_name, Coaches.last_name,
    Teams.team_name
FROM Teams
         RIGHT OUTER JOIN Coaches
                          ON Teams.coach_id = Coaches.coach_id;



SELECT
    Matches.match_id, Matches.match_date,
    LeagueSeasons.season_name
FROM Matches
         FULL OUTER JOIN LeagueSeasons
                         ON Matches.league_season_id = LeagueSeasons.season_id;



Full Outer Join: Players and Transfers

SELECT
    Players.first_name, Players.last_name,
    Transfers.transfer_date, Transfers.transfer_fee
FROM Players
         FULL OUTER JOIN Transfers
                         ON Players.player_id = Transfers.player_id;



-- Self Join: Compare Players’ Heights

SELECT
    P1.first_name || ' ' || P1.last_name AS taller_player,
    P2.first_name || ' ' || P2.last_name AS shorter_player
FROM Players P1
         INNER JOIN Players P2
                    ON P1.height > P2.height;


-- Self Join: Compare Coaches’ Experience

SELECT
    C1.first_name || ' ' || C1.last_name AS more_experienced,
    C2.first_name || ' ' || C2.last_name AS less_experienced
FROM Coaches C1
         INNER JOIN Coaches C2
                    ON C1.experience_years > C2.experience_years;


SELECT
    Transfers.transfer_id, Transfers.transfer_date, Transfers.transfer_fee,
    Teams.team_name AS from_team
FROM Transfers
LEFT OUTER JOIN Teams
ON Transfers.from_team_id = Teams.team_id;


-- Right Outer Join: Transfers and Teams

SELECT
    Transfers.transfer_id, Transfers.transfer_date, Transfers.transfer_fee,
    Teams.team_name AS to_team
FROM Transfers
RIGHT OUTER JOIN Teams
ON Transfers.to_team_id = Teams.team_id;
