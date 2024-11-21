Tasks: DML and Join Operations (Part 2)
Left Outer Join: Teams and Stadiums


SELECT 
    Teams.team_id, Teams.team_name, 
    Stadiums.stadium_name, Stadiums.city
FROM Teams
LEFT OUTER JOIN Stadiums 
ON Teams.stadium_id = Stadiums.stadium_id;



Left Outer Join: Matches and Home Teams

SELECT 
    Matches.match_id, Matches.match_date, 
    Teams.team_name AS home_team_name
FROM Matches
LEFT OUTER JOIN Teams 
ON Matches.home_team_id = Teams.team_id;


Right Outer Join: Stadiums and Teams

SELECT 
    Stadiums.stadium_name, Stadiums.city, 
    Teams.team_name
FROM Teams
RIGHT OUTER JOIN Stadiums 
ON Teams.stadium_id = Stadiums.stadium_id;



Right Outer Join: Coaches and Teams

SELECT 
    Coaches.first_name, Coaches.last_name, 
    Teams.team_name
FROM Teams
RIGHT OUTER JOIN Coaches 
ON Teams.coach_id = Coaches.coach_id;
