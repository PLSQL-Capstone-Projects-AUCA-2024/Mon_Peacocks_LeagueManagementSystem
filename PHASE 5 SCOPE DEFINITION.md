# PHASE 5

## MUTESI Ange de Noella
- Test and verify the total number of records in the Stadiums table.
- Write additional verification scripts for tables like Coaches, Referees, Teams, and Players.
- Display the results of verification in the database output console.


## Nsanzimfura Enock Nkumbuyedeni
- Insert sample data for the Stadiums table, including attributes such as stadium_name, city, capacity, and established_year.
- Populate the Coaches table with realistic sample data for first_name, last_name, nationality, and experience_years.
- Add sample records to the Referees table with attributes such as first_name, last_name, nationality, and experience_years.


## UWINEZA SEBAZINDUTSI LILIANE
- Insert sample data for the Teams table, ensuring data integrity by linking stadium_id and coach_id.
- Add realistic player records to the Players table, including attributes such as first_name, last_name, position, and associated team_id.
- Populate the Transfers table with data capturing details like player_id, from_team_id, to_team_id, transfer_date, and transfer_fee.

## MUHAYIMANA DIVINE
- Insert sample data for the LeagueSeasons table, ensuring attributes like season_name, start_date, and champion_team_id are meaningful.
- Populate the Matches table with match details, including home_team_id, away_team_id, stadium_id, match_date, and scores.
- Add sample records to the TeamPlayers table to capture team membership history for players.


## MUGISHA ABDOULLATIF
- Update the capacity field of the Stadiums table to reflect renovations for a specific stadium.
- Add a new record to the Teams table to account for a league expansion.


## KWIZERA NIYO MACKENZIE
- Update the position of a specific player in the Players table based on new training outcomes.
- Remove a specific transfer record from the Transfers table to account for a canceled transfer.

## ICYEZA KUNDWA GLOIRE NELLY
- Verify that all entries in the LeagueSeasons table have valid references to existing team_id values in the Teams table.
- Ensure no player has overlapping memberships in the TeamPlayers table by checking for consistency in join_date and leave_date.


## MANISHIMWE KWIZERA JEANLUC
- Test the effectiveness of the index on the city column in the Stadiums table by running a query and analyzing its execution plan.
- Optimize a query that filters players by position in the Players table for better performance.

## CHIKELUBA STANLEY
- Test the composite index on home_team_id and away_team_id columns in the Matches table by analyzing query execution plans.
- Prepare deployment scripts to export database schemas and data for deployment across environments, ensuring consistency.


## PATRIC SHEMA CYUSA
- Verify that the Transfers table does not have duplicate entries for the same player on the same date after the unique constraint was applied.
- Insert additional realistic data into the Matches table that includes valid league_season_id and stadium_id values for testing the composite index.
- Update the LeagueSeasons table to correct any invalid start_date and end_date combinations.