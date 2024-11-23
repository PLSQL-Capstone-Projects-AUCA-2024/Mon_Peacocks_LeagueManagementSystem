# PHASE 4

## MUTESI Ange de Noella Tasks
Database Creation and Initialization
Create Database:
- Set up the Oracle database with the format: mon_peacock_leagueManagementSystem.
  username: mon_peacock
  password: peacock
- Grant Privileges:
  Grant privileges like CREATE TABLE, ALTER, SELECT, INSERT, etc., to the created user.

## Nsanzimfura Enock Nkumbuyedeni Tasks
- Create Stadiums Table:
  Entities: stadium_id, stadium_name, city, capacity, established_year.
- Create Coaches Table:
  Entities: coach_id, first_name, last_name, nationality, experience_years.

- Create Referees Table:
  Entities: referee_id, first_name, last_name, nationality, experience_years.

## UWINEZA SEBAZINDUTSI LILIANE Tasks

Create Teams Table:
Entities: team_id, team_name, founded_year, city, stadium_id, manager, coach_id.
Create Players Table:
Entities: player_id, first_name, last_name, date_of_birth, nationality, position, current_team_id, height, weight.
Create Transfers Table:
Entities: transfer_id, player_id, from_team_id, to_team_id, transfer_date, transfer_fee.

## MUHAYIMANA DIVINE Tasks

Create League Seasons Table:
Entities: season_id, season_name, start_date, end_date, champion_team_id.

Create Matches Table:
Entities: match_id, home_team_id, away_team_id, stadium_id, match_date, league_season_id, referee_id, home_team_score, away_team_score.

Create TeamPlayers Table:
Entities: team_player_id, team_id, player_id, join_date, leave_date.

## MUGISHA ABDOULLATIF Tasks

Add Constraints and Relationships (Part 1)

Add Constraints to Stadiums Table:
Add primary key (stadium_id), unique constraint (stadium_name).

Add Constraints to Teams Table:
Add primary key (team_id), unique constraint (team_name), and foreign keys (stadium_id, coach_id).

Add Constraints to Referees Table:
Add primary key (referee_id).

## KWIZERA NIYO MACKENZIE Tasks
Add Constraints and Relationships (Part 2)

Add Constraints to Players Table:
Add primary key (player_id), foreign key (current_team_id), check constraint (position values).

Add Constraints to Transfers Table:
Add primary key (transfer_id), foreign keys (player_id, from_team_id, to_team_id), and check (from_team_id ≠ to_team_id).

Add Constraints to Matches Table:
Add primary key (match_id), foreign keys (home_team_id, away_team_id, stadium_id, league_season_id, referee_id), and check (home_team_id ≠ away_team_id).

## ICYEZA KUNDWA GLOIRE NELLY Tasks

Add Constraints and Relationships (Part 3)

Add Constraints to League Seasons Table:
Add primary key (season_id), foreign key (champion_team_id).

Add Constraints to TeamPlayers Table:
Add primary key (team_player_id), foreign keys (team_id, player_id), and check (leave_date >= join_date or leave_date is NULL).



## PATRIC SHEMA CYUSA

- Add a unique constraint to the Transfers table on the combination of player_id and transfer_date to prevent duplicate transfer entries.
- Add a check constraint to the LeagueSeasons table to ensure start_date is earlier than end_date.
- Create a composite index on Matches for the combination of league_season_id and stadium_id to optimize queries filtering by season and stadium.


## MANISHIMWE KWIZERA JEANLUC Tasks

Index Creation
1. Stadiums Table:
- Create an index on city for efficient city-based queries.
- Create an index on capacity for faster searches by stadium capacity.

2. Teams Table:

- Create an index on team_name for optimizing team name lookups.
- Create an index on coach_id to speed up queries involving coaches assigned to teams.

3. Players Table:

- Create an index on position for efficient queries related to player roles.
- Create an index on current_team_id for improving searches by team.


## CHIKELUBA STANLEY
Optimization and Deployment

1. Query Optimization Using Indexes:

- Analyze and optimize queries on the Matches Table using the composite index on (home_team_id, away_team_id).
- Optimize the Transfers Table queries with a composite index on (player_id, transfer_date).

2. Index Validation:
- Validate the effectiveness of indexes created by Member 8 using EXPLAIN PLAN or SQL Trace.
- Document improvements in query execution time, including before-and-after comparisons.

3. Deployment and GitHub Management:
- Oversee the GitHub repositories, ensuring all members' work is integrated.
- Manage pull requests and merge the final database creation scripts into the main repository.
  Prepare a well-documented README covering deployment steps and team contributions.