-- League Seasons Table Constraints
ALTER TABLE LeagueSeasons ADD PRIMARY KEY (season_id);
ALTER TABLE LeagueSeasons ADD CONSTRAINT fk_season_champion_team FOREIGN KEY (champion_team_id) REFERENCES Teams (team_id);

-- TeamPlayers Table Constraints
ALTER TABLE TeamPlayers ADD PRIMARY KEY (team_player_id);
ALTER TABLE TeamPlayers ADD CONSTRAINT fk_team_player_team FOREIGN KEY (team_id) REFERENCES Teams (team_id);
ALTER TABLE TeamPlayers ADD CONSTRAINT fk_team_player_player FOREIGN KEY (player_id) REFERENCES Players (player_id);
-- Matches Table Composite Index
CREATE INDEX idx_match_teams ON Matches (home_team_id, away_team_id);

-- Transfers Table Composite Index
CREATE INDEX idx_transfer_player_date ON Transfers (player_id, transfer_date);

-- Use EXPLAIN PLAN or SQL Trace for Query Optimization
-- Example: EXPLAIN PLAN FOR SELECT * FROM Matches WHERE home_team_id = 1;
