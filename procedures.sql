CREATE OR REPLACE PROCEDURE UpdateLeagueChampion(season_id NUMBER, team_id NUMBER) IS
BEGIN
    UPDATE LeagueSeasons
    SET champion_team_id = team_id
    WHERE season_id = season_id;
    COMMIT;
END;


BEGIN
    INSERT INTO Transfers (transfer_id, player_id, from_team_id, to_team_id, transfer_date, transfer_fee)
    VALUES (201, 5, 1, 2, SYSDATE, 500000);

    UPDATE Teams
    SET budget = budget - 500000
    WHERE team_id = 2;

    UPDATE Teams
    SET budget = budget + 500000
    WHERE team_id = 1;

    COMMIT;
END;



-- Procedure: Assign Player to Default Team

CREATE OR REPLACE PROCEDURE AssignPlayerToDefault(player_id NUMBER) IS
BEGIN
    UPDATE Players
    SET current_team_id = (SELECT team_id FROM Teams WHERE team_name = 'Default Team')
    WHERE player_id = player_id AND current_team_id IS NULL;
    COMMIT;
END;


