CREATE OR REPLACE PROCEDURE UpdateLeagueChampion(season_id NUMBER, team_id NUMBER) IS
BEGIN
    UPDATE LeagueSeasons
    SET champion_team_id = team_id
    WHERE season_id = season_id;
    COMMIT;
END;
