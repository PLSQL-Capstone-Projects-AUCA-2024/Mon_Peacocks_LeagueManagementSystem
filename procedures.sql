

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



-- Procedure: Assign Default Stadium

CREATE OR REPLACE PROCEDURE AssignDefaultStadium(team_id IN NUMBER) IS
BEGIN
UPDATE Teams
SET stadium_id = (SELECT MIN(stadium_id) FROM Stadiums)
WHERE team_id = team_id AND stadium_id IS NULL;
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
-- Procedure to manage player transfer
CREATE OR REPLACE PROCEDURE transfer_player(
    p_player_id IN NUMBER,
    p_from_team_id IN NUMBER,
    p_to_team_id IN NUMBER,
    p_transfer_date IN DATE,
    p_transfer_fee IN NUMBER
) AS
BEGIN
    -- Insert into Transfers table
    INSERT INTO Transfers (player_id, from_team_id, to_team_id, transfer_date, transfer_fee)
    VALUES (p_player_id, p_from_team_id, p_to_team_id, p_transfer_date, p_transfer_fee);

    -- Update TeamPlayers table
    UPDATE TeamPlayers
    SET leave_date = p_transfer_date
    WHERE player_id = p_player_id AND team_id = p_from_team_id;

    INSERT INTO TeamPlayers (team_id, player_id, join_date)
    VALUES (p_to_team_id, p_player_id, p_transfer_date);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/
