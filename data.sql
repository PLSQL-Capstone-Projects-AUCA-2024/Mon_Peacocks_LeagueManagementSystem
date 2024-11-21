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
