-- 1. Insert sample data into Coaches

INSERT INTO Coaches (first_name, last_name, nationality, experience_years)
VALUES ('Habimana', 'Innocent', 'Rwanda', 12);

INSERT INTO Coaches (first_name, last_name, nationality, experience_years)
VALUES ('Rukundo', 'Samuel', 'Rwanda', 8);

INSERT INTO Coaches (first_name, last_name, nationality, experience_years)
VALUES ('Mukamisha', 'Vestine', 'Rwanda', 5);

INSERT INTO Coaches (first_name, last_name, nationality, experience_years)
VALUES ('Uwizeye', 'Faustin', 'Rwanda', 10);

INSERT INTO Coaches (first_name, last_name, nationality, experience_years)
VALUES ('Kamanzi', 'Ben', 'Rwanda', 6);


-- 2. Insert sample data into Stadiums
INSERT INTO Stadiums (stadium_name, city, capacity, established_year)
VALUES ('Amahoro Stadium', 'Kigali', 25000, 1987);

INSERT INTO Stadiums (stadium_name, city, capacity, established_year)
VALUES ('Nyamirambo Regional Stadium', 'Kigali', 12000, 1986);

INSERT INTO Stadiums (stadium_name, city, capacity, established_year)
VALUES ('Huye Stadium', 'Huye', 8000, 2015);

INSERT INTO Stadiums (stadium_name, city, capacity, established_year)
VALUES ('Bugesera Stadium', 'Bugesera', 5000, 2020);

INSERT INTO Stadiums (stadium_name, city, capacity, established_year)
VALUES ('Umuganda Stadium', 'Rubavu', 12000, 2006);


-- 3. Insert sample data into Referees
INSERT INTO Referees (first_name, last_name, nationality, experience_years)
VALUES ('Bizimungu', 'Thierry', 'Rwanda', 9);

INSERT INTO Referees (first_name, last_name, nationality, experience_years)
VALUES ('Kabera', 'Eric', 'Rwanda', 12);

INSERT INTO Referees (first_name, last_name, nationality, experience_years)
VALUES ('Uwimana', 'Alice', 'Rwanda', 5);

INSERT INTO Referees (first_name, last_name, nationality, experience_years)
VALUES ('Niyonsaba', 'Jean Pierre', 'Rwanda', 7);

INSERT INTO Referees (first_name, last_name, nationality, experience_years)
VALUES ('Nsengiyumva', 'Damien', 'Rwanda', 11);



-- 4. Insert sample data into Teams
INSERT INTO Teams (team_name, founded_year, city, stadium_id, manager, coach_id)
VALUES ('APR FC', 1993, 'Kigali', 1, 'Kagabo Patrick', 1);

INSERT INTO Teams (team_name, founded_year, city, stadium_id, manager, coach_id)
VALUES ('Rayon Sports', 1968, 'Nyanza', 2, 'Mukiza Eric', 2);

INSERT INTO Teams (team_name, founded_year, city, stadium_id, manager, coach_id)
VALUES ('Police FC', 2000, 'Kigali', 3, 'Bizimana Claude', 3);

INSERT INTO Teams (team_name, founded_year, city, stadium_id, manager, coach_id)
VALUES ('AS Kigali', 1999, 'Kigali', 4, 'Nziza Jean-Claude', 4);

INSERT INTO Teams (team_name, founded_year, city, stadium_id, manager, coach_id)
VALUES ('Etincelles FC', 1987, 'Rubavu', 5, 'Mukamba Innocent', 5);

-- 5. Insert sample data into Players
INSERT INTO Players (first_name, last_name, date_of_birth, nationality, position, current_team_id, height, weight)
VALUES ('Kamanzi', 'Jean', DATE '1995-05-12', 'Rwanda', 'Goalkeeper', 2, 1.90, 85);

INSERT INTO Players (first_name, last_name, date_of_birth, nationality, position, current_team_id, height, weight)
VALUES ('Mugisha', 'Alexis', DATE '1998-07-23', 'Rwanda', 'Defender', 3, 1.82, 78);

INSERT INTO Players (first_name, last_name, date_of_birth, nationality, position, current_team_id, height, weight)
VALUES ('Nshimiyimana', 'Emmanuel', DATE '2000-10-15', 'Rwanda', 'Midfielder', 4, 1.75, 70);

INSERT INTO Players (first_name, last_name, date_of_birth, nationality, position, current_team_id, height, weight)
VALUES ('Twizeyimana', 'John', DATE '1993-03-05', 'Rwanda', 'Forward', 5, 1.88, 82);

INSERT INTO Players (first_name, last_name, date_of_birth, nationality, position, current_team_id, height, weight)
VALUES ('Uwimana', 'Alice', DATE '1997-09-29', 'Rwanda', 'Midfielder', 6, 1.65, 60);



-- 6. Insert sample data into League Seasons
INSERT INTO LeagueSeasons (season_name, start_date, end_date, champion_team_id)
VALUES ('2023-2024 Season', DATE '2023-09-01', DATE '2024-06-30', 2);

INSERT INTO LeagueSeasons (season_name, start_date, end_date, champion_team_id)
VALUES ('2022-2023 Season', DATE '2022-09-01', DATE '2023-06-30', 2);

INSERT INTO LeagueSeasons (season_name, start_date, end_date, champion_team_id)
VALUES ('2021-2022 Season', DATE '2021-09-01', DATE '2022-06-30', 3);

INSERT INTO LeagueSeasons (season_name, start_date, end_date, champion_team_id)
VALUES ('2020-2021 Season', DATE '2020-09-01', DATE '2021-06-30', 4);

INSERT INTO LeagueSeasons (season_name, start_date, end_date, champion_team_id)
VALUES ('2019-2020 Season', DATE '2019-09-01', DATE '2020-06-30', 5);




-- 7. Insert sample data into Matches
INSERT INTO Matches (home_team_id, away_team_id, stadium_id, match_date, league_season_id, referee_id, home_team_score, away_team_score)
VALUES (2, 3, 1, DATE '2024-03-15', 2, 1, 2, 1);

INSERT INTO Matches (home_team_id, away_team_id, stadium_id, match_date, league_season_id, referee_id, home_team_score, away_team_score)
VALUES (3, 4, 3, DATE '2024-04-22', 2, 2, 0, 0);

INSERT INTO Matches (home_team_id, away_team_id, stadium_id, match_date, league_season_id, referee_id, home_team_score, away_team_score)
VALUES (2, 5, 2, DATE '2024-05-10', 2, 3, 1, 3);

INSERT INTO Matches (home_team_id, away_team_id, stadium_id, match_date, league_season_id, referee_id, home_team_score, away_team_score)
VALUES (4, 6, 4, DATE '2024-06-30', 2, 4, 2, 2);

INSERT INTO Matches (home_team_id, away_team_id, stadium_id, match_date, league_season_id, referee_id, home_team_score, away_team_score)
VALUES (5, 3, 5, DATE '2024-07-15', 2, 5, 1, 1);


-- 8. Insert sample data into Transfers
INSERT INTO Transfers (player_id, from_team_id, to_team_id, transfer_date, transfer_fee)
VALUES (4, 2, 3, DATE '2024-01-15', 10000);

INSERT INTO Transfers (player_id, from_team_id, to_team_id, transfer_date, transfer_fee)
VALUES (5, 2, 3, DATE '2024-02-10', 8000);

INSERT INTO Transfers (player_id, from_team_id, to_team_id, transfer_date, transfer_fee)
VALUES (7, 3, 4, DATE '2024-03-05', 12000);

INSERT INTO Transfers (player_id, from_team_id, to_team_id, transfer_date, transfer_fee)
VALUES (8, 4, 5, DATE '2024-04-15', 15000);

INSERT INTO Transfers (player_id, from_team_id, to_team_id, transfer_date, transfer_fee)
VALUES (6, 5, 6, DATE '2024-05-25', 7000);

-- 9. Insert sample data into Team Players
INSERT INTO TeamPlayers (team_id, player_id, join_date, leave_date)
VALUES (2, 4, DATE '2023-09-01', NULL);

INSERT INTO TeamPlayers (team_id, player_id, join_date, leave_date)
VALUES (2, 5, DATE '2023-09-01', NULL);

INSERT INTO TeamPlayers (team_id, player_id, join_date, leave_date)
VALUES (3, 6, DATE '2023-09-01', NULL);

INSERT INTO TeamPlayers (team_id, player_id, join_date, leave_date)
VALUES (4, 7, DATE '2023-09-01', NULL);

INSERT INTO TeamPlayers (team_id, player_id, join_date, leave_date)
VALUES (5, 8, DATE '2023-09-01', NULL);