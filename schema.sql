-- Stadiums Table Indexes
CREATE INDEX idx_stadium_city ON Stadiums (city);
CREATE INDEX idx_stadium_capacity ON Stadiums (capacity);
 
-- Teams Table Indexes
CREATE INDEX idx_team_name ON Teams (team_name);
CREATE INDEX idx_team_coach_id ON Teams (coach_id);
 
-- Players Table Indexes
CREATE INDEX idx_player_position ON Players (position);
CREATE INDEX idx_player_team ON Players (current_team_id);
