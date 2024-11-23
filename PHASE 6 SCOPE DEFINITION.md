# PHASE 6

## MUTESI Ange de Noella

Tasks: DML and Join Operations (Part 1)
Cross Joins

Write queries to perform cross joins:
- Combine Players and Teams tables to display all possible combinations.
- Combine Matches and Referees tables to display all combinations.

- Inner Joins

Write queries to perform inner joins:
- Retrieve players currently assigned to teams by joining Players and Teams on `current_team_id`.
- Fetch match details with referee names by joining Matches and Referees on `referee_id`.
Create a Function:
- Create a function to calculate a player's age based on their date of birth.
- Use this function to retrieve the age of all players in the Players table.

## Nsanzimfura Enock Nkumbuyedeni

Tasks: DML and Join Operations (Part 2)
Left Outer Joins

Write queries to perform left outer joins:
List all teams and their assigned stadiums, including teams without a stadium.
Fetch all matches and their respective home teams, including matches without valid home team assignments.
Right Outer Joins

Write queries to perform right outer joins:
List all stadiums and their associated teams, including stadiums without a team.
Retrieve all coaches and the teams they manage, including teams without assigned coaches.
Create a Trigger:

Create a trigger to automatically update the league_season_id in the Matches table when a new match is added.

## UWINEZA SEBAZINDUTSI LILIANE

Tasks: DML and Join Operations (Part 3)
Full Outer Joins
Write queries to perform full outer joins:
Retrieve all matches and the associated league seasons, including matches without seasons and seasons without matches.
Fetch all players and their transfer history, including players without transfers and transfers without players.
Self Joins

Write queries to perform self joins:
Compare players’ height in the Players table to find all pairs of players where one is taller than the other.
List all coaches who have more experience than other coaches.
Create a Procedure:

Create a stored procedure to:
Automatically assign a default stadium_id to new teams without a stadium.




## MUHAYIMANA DIVINE
Tasks: DDL and Transaction Demonstrations (Part 1)
Transaction Management Basics

Demonstrate a transaction to insert multiple rows into the Stadiums table with:
- A commit if all rows are valid.
- A rollback if any row violates a constraint (e.g., duplicate stadium name).
Complex DML Operations with Transactions

Perform a batch update on the Players table to:
- Increase the height of all midfielders by 1 cm.
- Rollback the transaction if any player’s height exceeds 220 cm.
Create a Function:
- Create a function to calculate a team’s average player height and use it in queries on the Teams table.


## MUGISHA ABDOULLATIF

Tasks: DDL and Transaction Demonstrations (Part 2)
Multi-Step Transactions

Write a transaction to:
- Transfer a player from one team to another (update current_team_id in Players).
- Insert the transfer details into the Transfers table.
- Rollback if the Transfers table insertion fails.


DDL Operations in Transactions

Demonstrate the use of transactions during DDL operations:
- Add a new column email to the Coaches table.
- Rollback if the column addition causes any dependent operations to fail.


## KWIZERA NIYO MACKENZIE

Tasks: Advanced Join Operations and Queries
Multiple Table Joins
Write queries to join multiple tables:
- Retrieve all matches with stadium names, home team names, away team names, and referee names.
- Fetch all league seasons with champion team names and their coaches.


Aggregate Queries with Joins

Write queries to:
- Find the total number of matches played in each stadium.
- Calculate the average player height per team.

Create a stored procedure to:
- Automatically add a player to the TeamPlayers table when they join a new team.

## ICYEZA KUNDWA GLOIRE NELLY
Tasks: Index Utilization and Transactions
Index Utilization in Queries

Demonstrate queries using indexes created in Phase 5:
- Retrieve all players sorted by position and team name.
- Fetch stadiums sorted by capacity for a given city.

Nested Transactions

Demonstrate nested transactions to:
- Update a player’s position.
- Rollback the parent transaction if the nested transaction to update team details fails.


## MANISHIMWE KWIZERA JEANLUC

Tasks: Transaction Validation and Procedural Logic
Transaction Isolation Levels

Demonstrate queries using different isolation levels (e.g., READ COMMITTED, SERIALIZABLE):
- Test the effect of isolation levels on concurrent updates to the Matches table.
- Validate results for phantom reads, dirty reads, and non-repeatable reads.

Error Handling in Transactions

Demonstrate the use of exception handling in PL/SQL:
- Handle exceptions during a failed INSERT into the Transfers table.
- Log errors into a separate ErrorLogs table.

Create a Function:
- Create a function to calculate the total transfer fees for a specific player over all seasons.

## CHIKELUBA STANLEY

Tasks: Final Validation and Documentation
Final Query Optimization
- Optimize join queries for the Matches and Players tables using the composite indexes created in Phase 5.
- Validate improvements with execution plans and document before-and-after performance.

Documentation and Team Collaboration

- Collect all queries, functions, triggers, and procedures from other members.
- Review and finalize scripts for submission.
- Prepare a comprehensive report on database interaction, transactions, and procedural logic, including challenges faced and solutions implemented.

## PATRIC SHEMA CYUSA

Database Interaction and Transactions
- Create a stored function to calculate the total number of matches played by a specific team in a season.
- Implement a stored procedure to manage transactions for transferring a player, updating the Transfers table and the TeamPlayers table simultaneously.