Update player position based on new training

UPDATE Players SET position = 'Midfielder' WHERE first_name = 'Alexis' AND last_name = 'Mugabe';

Cancel a transfer due to policy violations

DELETE FROM Transfers WHERE transfer_id = 2;
