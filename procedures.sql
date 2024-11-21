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
