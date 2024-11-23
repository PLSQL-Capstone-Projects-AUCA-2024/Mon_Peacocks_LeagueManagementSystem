-- TESTING AND VERIFYING THE CREATED TABLES

DECLARE
    stadium_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO stadium_count FROM Stadiums;
    DBMS_OUTPUT.PUT_LINE('Total stadiums: ' || stadium_count);
END


--  Insert sample data for stadiums
INSERT INTO Stadiums (stadium_name, city, capacity, established_year) VALUES
('National Stadium', 'Kigali', 25000, 2005),
('Amahoro Arena', 'Gisenyi', 18000, 1995),
('Freedom Park', 'Butare', 15000, 2010);



--  Insert sample data for coaches
INSERT INTO Coaches (first_name, last_name, nationality, experience_years) VALUES
('John', 'Doe', 'Rwanda', 10),
('Maria', 'Lopez', 'Spain', 15),
('Alex', 'Johnson', 'England', 12);



--  Insert sample data for referees

INSERT INTO Referees (first_name, last_name, nationality, experience_years) VALUES
('Simon', 'Peter', 'Kenya', 5),
('Jane', 'Smith', 'Uganda', 8),
('Oscar', 'Mugisha', 'Rwanda', 6);

-- Cross Join: Players and Teams

SELECT
    Players.player_id, Players.first_name, Players.last_name,
    Teams.team_id, Teams.team_name
FROM Players
CROSS JOIN Teams;


-- Cross Join: Matches and Referees

SELECT
    Matches.match_id, Matches.match_date,
    Referees.referee_id, Referees.first_name, Referees.last_name
FROM Matches
CROSS JOIN Referees;


-- Inner Join: Players and Teams

SELECT
    Players.player_id, Players.first_name, Players.last_name,
    Teams.team_name
FROM Players
INNER JOIN Teams
ON Players.current_team_id = Teams.team_id;


-- Inner Join: Matches and Referees


SELECT
    Matches.match_id, Matches.match_date,
    Referees.first_name AS referee_first_name, Referees.last_name AS referee_last_name
FROM Matches
INNER JOIN Referees
ON Matches.referee_id = Referees.referee_id;


-- Verify that all league seasons have valid champion team IDs

SELECT * FROM LeagueSeasons WHERE champion_team_id NOT IN (SELECT team_id FROM Teams);

-- Ensure no player has overlapping team memberships

SELECT player_id
FROM TeamPlayers
GROUP BY player_id
HAVING COUNT(*) > 1 AND MIN(leave_date) > MAX(join_date);