SELECT 
    Transfers.transfer_id, Transfers.transfer_date, Transfers.transfer_fee, 
    Teams.team_name AS from_team
FROM Transfers
LEFT OUTER JOIN Teams 
ON Transfers.from_team_id = Teams.team_id;


Right Outer Join: Transfers and Teams

SELECT 
    Transfers.transfer_id, Transfers.transfer_date, Transfers.transfer_fee, 
    Teams.team_name AS to_team
FROM Transfers
RIGHT OUTER JOIN Teams 
ON Transfers.to_team_id = Teams.team_id;
