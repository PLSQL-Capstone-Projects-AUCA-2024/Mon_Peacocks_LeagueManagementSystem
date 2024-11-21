-- Test the index on Stadiums(city) with a query
 
EXPLAIN PLAN FOR SELECT * FROM Stadiums WHERE city = 'Kigali';
 
 
-- Optimize a query using Players(position)
 
SELECT * FROM Players WHERE position = 'Midfielder';
