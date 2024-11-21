 Insert sample data for league seasons.

INSERT INTO LeagueSeasons (season_name, start_date, end_date, champion_team_id) VALUES 
('2023/24 Season', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), 1),
('2022/23 Season', TO_DATE('2022-09-01', 'YYYY-MM-DD'), TO_DATE('2023-05-30', 'YYYY-MM-DD'), 3);


Insert sample data for matches.

INSERT INTO Matches (home_team_id, away_team_id, stadium_id, match_date, league_season_id, referee_id, home_team_score, away_team_score) VALUES 
(1, 2, 1, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 1, 1, 2, 1),
(3, 1, 3, TO_DATE('2023-11-15', 'YYYY-MM-DD'), 1, 2, 1, 1),
(2, 3, 2, TO_DATE('2023-12-10', 'YYYY-MM-DD'), 1, 3, 0, 3);


Insert sample data for team players.

INSERT INTO TeamPlayers (team_id, player_id, join_date, leave_date) VALUES 
(1, 1, TO_DATE('2021-01-01', 'YYYY-MM-DD'), NULL),
(2, 2, TO_DATE('2020-06-01', 'YYYY-MM-DD'), TO_DATE('2022-06-01', 'YYYY-MM-DD')),
(3, 3, TO_DATE('2019-09-01', 'YYYY-MM-DD'), NULL);
