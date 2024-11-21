-- Function to calculate total matches played by a team in a season
CREATE OR REPLACE FUNCTION calculate_matches(team_id IN NUMBER, season_id IN NUMBER)
RETURN NUMBER IS
    total_matches NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO total_matches
    FROM Matches
    WHERE (home_team_id = team_id OR away_team_id = team_id)
      AND league_season_id = season_id;

    RETURN total_matches;
END;
/
