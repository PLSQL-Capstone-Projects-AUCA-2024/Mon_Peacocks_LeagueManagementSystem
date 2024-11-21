-- Procedure: Update Referee Experience 
CREATE OR REPLACE PROCEDURE UpdateRefereeExperience(referee_id NUMBER, years NUMBER) IS 
BEGIN 
    UPDATE Referees 
    SET experience_years = experience_years + years 
    WHERE referee_id = referee_id; 
    COMMIT; 
END; 