-- Matches Table Composite Index
CREATE INDEX idx_match_teams ON Matches (home_team_id, away_team_id);

-- Transfers Table Composite Index
CREATE INDEX idx_transfer_player_date ON Transfers (player_id, transfer_date);

-- Use EXPLAIN PLAN or SQL Trace for Query Optimization
-- Example: EXPLAIN PLAN FOR SELECT * FROM Matches WHERE home_team_id = 1;
