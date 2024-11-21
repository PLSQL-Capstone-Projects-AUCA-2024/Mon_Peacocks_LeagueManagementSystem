-- Trigger to update champion_team_id in LeagueSeasons
CREATE OR REPLACE TRIGGER trg_update_champion
AFTER UPDATE OF champion_team_id ON LeagueSeasons
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Champion updated to team ID: ' || :NEW.champion_team_id);
END;
/

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
