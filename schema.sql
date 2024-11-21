-- Stadiums Table Constraints 

ALTER TABLE Stadiums ADD PRIMARY KEY (stadium_id); 

ALTER TABLE Stadiums ADD CONSTRAINT unique_stadium_name UNIQUE (stadium_name); 

 

-- Teams Table Constraints 

ALTER TABLE Teams ADD PRIMARY KEY (team_id); 

ALTER TABLE Teams ADD CONSTRAINT unique_team_name UNIQUE (team_name); 

ALTER TABLE Teams ADD CONSTRAINT fk_team_stadium FOREIGN KEY (stadium_id) REFERENCES Stadiums (stadium_id); 

ALTER TABLE Teams ADD CONSTRAINT fk_team_coach FOREIGN KEY (coach_id) REFERENCES Coaches (coach_id); 

 

-- Referees Table Constraints 

ALTER TABLE Referees ADD PRIMARY KEY (referee_id); 