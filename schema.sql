-- Players Table Constraints
ALTER TABLE Players ADD PRIMARY KEY (player_id);
ALTER TABLE Players ADD CONSTRAINT fk_player_team FOREIGN KEY (current_team_id) REFERENCES Teams (team_id);
ALTER TABLE Players ADD CONSTRAINT chk_player_position CHECK (position IN ('Goalkeeper', 'Defender', 'Midfielder', 'Forward'));

-- Transfers Table Constraints
ALTER TABLE Transfers ADD PRIMARY KEY (transfer_id);
ALTER TABLE Transfers ADD CONSTRAINT fk_transfer_player FOREIGN KEY (player_id) REFERENCES Players (player_id);
ALTER TABLE Transfers ADD CONSTRAINT fk_transfer_from_team FOREIGN KEY (from_team_id) REFERENCES Teams (team_id);
ALTER TABLE Transfers ADD CONSTRAINT fk_transfer_to_team FOREIGN KEY (to_team_id) REFERENCES Teams (team_id);
ALTER TABLE Transfers ADD CONSTRAINT chk_transfer_teams CHECK (from_team_id <> to_team_id);

-- Matches Table Constraints
ALTER TABLE Matches ADD PRIMARY KEY (match_id);
ALTER TABLE Matches ADD CONSTRAINT fk_match_home_team FOREIGN KEY (home_team_id) REFERENCES Teams (team_id);
ALTER TABLE Matches ADD CONSTRAINT fk_match_away_team FOREIGN KEY (away_team_id) REFERENCES Teams (team_id);
ALTER TABLE Matches ADD CONSTRAINT fk_match_stadium FOREIGN KEY (stadium_id) REFERENCES Stadiums (stadium_id);
ALTER TABLE Matches ADD CONSTRAINT fk_match_season FOREIGN KEY (league_season_id) REFERENCES LeagueSeasons (season_id);
ALTER TABLE Matches ADD CONSTRAINT fk_match_referee FOREIGN KEY (referee_id) REFERENCES Referees (referee_id);
ALTER TABLE Matches ADD CONSTRAINT chk_match_teams CHECK (home_team_id <> away_team_id);
