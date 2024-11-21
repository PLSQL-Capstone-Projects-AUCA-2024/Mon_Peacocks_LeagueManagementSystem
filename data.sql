-- Cross Join: Referees and Matches 
SELECT
    Referees.referee_id, Referees.first_name, Referees.last_name,  
    Matches.match_id, Matches.match_date 
FROM Referees CROSS JOIN Matches; 

-- Full Outer Join: Referees and Matches 
SELECT  
    Referees.referee_id, Referees.first_name, Referees.last_name,  
    Matches.match_id, Matches.match_date 
FROM Referees FULL OUTER JOIN Matches ON Referees.referee_id = Matches.referee_id; 