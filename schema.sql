-- Add unique constraint to Transfers table
ALTER TABLE Transfers
ADD CONSTRAINT unique_player_transfer UNIQUE (player_id, transfer_date);

-- Add check constraint to LeagueSeasons table
ALTER TABLE LeagueSeasons
ADD CONSTRAINT check_season_dates CHECK (start_date < end_date);

-- Create composite index on Matches for league_season_id and stadium_id
CREATE INDEX idx_matches_season_stadium ON Matches (league_season_id, stadium_id);
