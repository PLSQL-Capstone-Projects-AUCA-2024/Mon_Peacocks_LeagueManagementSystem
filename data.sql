Verify that all league seasons have valid champion team IDs

SELECT * FROM LeagueSeasons WHERE champion_team_id NOT IN (SELECT team_id FROM Teams);

Ensure no player has overlapping team memberships

SELECT player_id 
FROM TeamPlayers 
GROUP BY player_id 
HAVING COUNT(*) > 1 AND MIN(leave_date) > MAX(join_date);