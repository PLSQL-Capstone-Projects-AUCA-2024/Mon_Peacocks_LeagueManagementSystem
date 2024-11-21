-- Update stadium capacity to reflect renovations 
UPDATE Stadiums SET capacity = 30000 WHERE stadium_name = 'National Stadium'; 

 
-- Add a new team after league expansion 
INSERT INTO Teams (team_name, founded_year, city, stadium_id, manager, coach_id) VALUES ('New Horizon', 2021, 'Musanze', 1, 'Michael', 2); 