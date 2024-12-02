-- SCOPE
-- Triggers enforce business rules and track sensitive changes.
-- Cursors handle row-by-row data processing.
-- Packages improve modularity and organization of related logic.
-- Auditing enhances accountability and compliance.


-- LIMITATIONS
-- Multi-row triggers may incur performance overhead.
-- Cursor-based operations may be less efficient for large datasets.
-- Auditing increases storage and processing requirements.


-- PROBLEM STATEMENT
-- To ensure the efficient management of league operations and enhance data integrity, the League Management System requires
-- advanced database programming techniques. By incorporating triggers, cursors, functions, packages, and auditing mechanisms,
-- the system will automate critical processes, enforce business rules, and enhance security. These techniques will address
-- challenges such as maintaining accurate player and match records, tracking transfers, and monitoring user actions to ensure
-- accountability and compliance with league regulations.


-- Trigger: Enforce Transfer Fee Constraint

CREATE OR REPLACE TRIGGER EnforceTransferFee
BEFORE INSERT OR UPDATE ON Transfers
                                   FOR EACH ROW
BEGIN
    IF :NEW.transfer_fee < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Transfer fee cannot be negative.');
END IF;
END;



-- Trigger: Prevent Same Teams in a Match

CREATE OR REPLACE TRIGGER PreventSameTeams
BEFORE INSERT OR UPDATE ON Matches
                                   FOR EACH ROW
BEGIN
    IF :NEW.home_team_id = :NEW.away_team_id THEN
        RAISE_APPLICATION_ERROR(-20002, 'Home team and Away team cannot be the same.');
END IF;
END;


-- Trigger: Enforce Player Position Check

CREATE OR REPLACE TRIGGER EnforcePlayerPosition
BEFORE INSERT OR UPDATE ON Players
                                 FOR EACH ROW
BEGIN
    IF :NEW.position NOT IN ('Goalkeeper', 'Defender', 'Midfielder', 'Forward') THEN
        RAISE_APPLICATION_ERROR(-20003, 'Invalid position.');
END IF;
END;




-- AUDITING
-- Trigger: Auto-Log Player Transfers

CREATE OR REPLACE TRIGGER LogPlayerTransfer
AFTER INSERT ON Transfers
FOR EACH ROW
BEGIN
INSERT INTO TransferLogs (transfer_id, log_date, details)
VALUES (:NEW.transfer_id, SYSDATE, 'Player transferred with ID ' || :NEW.player_id);
END;


-- Logging changes in the Players table
CREATE OR REPLACE TRIGGER trg_log_player_changes
AFTER UPDATE OR DELETE ON Players
    FOR EACH ROW
BEGIN
INSERT INTO AuditLog (action_type, table_name, changed_by, change_date, details)
VALUES (
           CASE
               WHEN UPDATING THEN 'UPDATE'
               WHEN DELETING THEN 'DELETE'
               END,
           'Players',
           USER,
           SYSDATE,
           'Player ID: ' || :OLD.player_id
       );
END;
/


-- Compound Trigger: Auditing multi-row transactions on Transfers


CREATE OR REPLACE TRIGGER trg_audit_transfers
FOR INSERT OR DELETE OR UPDATE ON Transfers
COMPOUND TRIGGER
    TYPE transfer_row IS RECORD (
        player_id Transfers.player_id%TYPE,
        action_type VARCHAR2(10)
    );
    TYPE transfer_row_list IS TABLE OF transfer_row;
    transfer_changes transfer_row_list := transfer_row_list();

    BEFORE EACH ROW IS
BEGIN
        transfer_changes.EXTEND;
        transfer_changes(transfer_changes.LAST).player_id := :NEW.player_id;
        transfer_changes(transfer_changes.LAST).action_type := CASE
            WHEN INSERTING THEN 'INSERT'
            WHEN UPDATING THEN 'UPDATE'
            WHEN DELETING THEN 'DELETE'
END;
END BEFORE EACH ROW;

    AFTER STATEMENT IS
BEGIN
FOR i IN transfer_changes.FIRST..transfer_changes.LAST LOOP
            INSERT INTO AuditLog (action_type, table_name, changed_by, change_date, details)
            VALUES (transfer_changes(i).action_type, 'Transfers', USER, SYSDATE,
                    'Player ID: ' || transfer_changes(i).player_id);
END LOOP;
END AFTER STATEMENT;
END;
/


-- Cursor to Process Active Players

DECLARE
CURSOR active_players_cursor IS
SELECT player_id, first_name, last_name
FROM Players
WHERE current_team_id IS NOT NULL;
v_player active_players_cursor%ROWTYPE;
BEGIN
OPEN active_players_cursor;
LOOP
FETCH active_players_cursor INTO v_player;
        EXIT WHEN active_players_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Player ID: ' || v_player.player_id || ' - Name: ' || v_player.first_name || ' ' || v_player.last_name);
END LOOP;
CLOSE active_players_cursor;
END;
/

-- Attributes and Functions
-- Using %TYPE and %ROWTYPE

DECLARE
v_stadium_name Stadiums.stadium_name%TYPE;
    v_team_record Teams%ROWTYPE;
BEGIN
SELECT stadium_name INTO v_stadium_name FROM Stadiums WHERE stadium_id = 1;
DBMS_OUTPUT.PUT_LINE('Stadium: ' || v_stadium_name);

SELECT * INTO v_team_record FROM Teams WHERE team_id = 1;
DBMS_OUTPUT.PUT_LINE('Team: ' || v_team_record.team_name || ' - City: ' || v_team_record.city);
END;
/


-- Function to Calculate Total Goals in a Season

CREATE OR REPLACE FUNCTION calculate_total_goals(season_id IN NUMBER)
RETURN NUMBER IS
    total_goals NUMBER;
BEGIN
SELECT SUM(home_team_score + away_team_score) INTO total_goals
FROM Matches
WHERE league_season_id = season_id;

RETURN NVL(total_goals, 0);
END;
/


-- Package Development
-- Package 1: Player Operations

CREATE OR REPLACE PACKAGE PlayerOperations IS
    FUNCTION calculate_age(player_id IN NUMBER) RETURN NUMBER;
    PROCEDURE deactivate_player(player_id IN NUMBER);
END;
/

CREATE OR REPLACE PACKAGE BODY PlayerOperations IS
    FUNCTION calculate_age(player_id IN NUMBER) RETURN NUMBER IS
        birth_date DATE;
        age NUMBER;
BEGIN
SELECT date_of_birth INTO birth_date FROM Players WHERE player_id = player_id;
age := FLOOR(MONTHS_BETWEEN(SYSDATE, birth_date) / 12);
RETURN age;
END;

    PROCEDURE deactivate_player(player_id IN NUMBER) IS
BEGIN
UPDATE Players SET current_team_id = NULL WHERE player_id = player_id;
END;
END;
/

-- Package 2: Match Management


CREATE OR REPLACE PACKAGE MatchManagement IS
    PROCEDURE add_match(home_team_id IN NUMBER, away_team_id IN NUMBER, stadium_id IN NUMBER, match_date IN DATE, season_id IN NUMBER, referee_id IN NUMBER);
END;
/

CREATE OR REPLACE PACKAGE BODY MatchManagement IS
    PROCEDURE add_match(home_team_id IN NUMBER, away_team_id IN NUMBER, stadium_id IN NUMBER, match_date IN DATE, season_id IN NUMBER, referee_id IN NUMBER) IS
BEGIN
INSERT INTO Matches (home_team_id, away_team_id, stadium_id, match_date, league_season_id, referee_id, home_team_score, away_team_score)
VALUES (home_team_id, away_team_id, stadium_id, match_date, season_id, referee_id, 0, 0);
END;
END;
/


-- Auditing with Restrictions and Tracking
-- Audit Trigger for Logging Sensitive Changes

CREATE OR REPLACE TRIGGER trg_audit_sensitive_data
AFTER UPDATE ON Players
                 FOR EACH ROW
                 WHEN (OLD.date_of_birth <> NEW.date_of_birth OR OLD.nationality <> NEW.nationality)
BEGIN
INSERT INTO AuditLog (action_type, table_name, changed_by, change_date, details)
VALUES ('UPDATE', 'Players', USER, SYSDATE, 'Sensitive data change: Player ID ' || :OLD.player_id);
END;
/


-- Restrictions Based on User Roles

CREATE OR REPLACE FUNCTION is_authorized(role_name IN VARCHAR2) RETURN BOOLEAN IS
    user_role VARCHAR2(50);
BEGIN
SELECT role INTO user_role FROM UserRoles WHERE username = USER;
RETURN (user_role = role_name);
END;
/
