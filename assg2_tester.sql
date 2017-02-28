-- use the psql command
-- \i assg2_tester.sql
-- to load and run this batch file

-- Assignment Two: Tester
-- Use the nba database. The expected results are only for the
-- database instance provided. Other database instances with
-- different results may be in evaluating the correctness of 
-- your solutions
--
-- @author Mark Holliday
-- @author Joshua Sims
-- @author Evan Arroyo
-- @version 03 March 2017

\i create_tables.sql



\i populate_tables.sql



\echo 'Problem 1: Find the names of the teams that have had at least one player be a member who also went to college at WCU.'

\echo '\nResult should be:\ntname\nTimberwolves\nRockets\nThunder\nKings\n'

SELECT DISTINCT tname
FROM hasPlayedFor NATURAL JOIN player
WHERE college = 'WCU';



\echo 'Problem 2: Find the name of each player who has been a member of at least three teams.'

\echo 'Result should be:\npname\nRedick\nIguodala\nMalone\nMartin\n'

SELECT pname
FROM hasPlayedFor
GROUP BY pname
HAVING COUNT(tname) >= 3;



\echo 'Problem 3: Find the average number of players who have played for a team. This query is asking for one number  that is the average over all of the teams of the number of players that have played for that team.'

\echo 'Result should be:\naverage_number_players\n1.60000\n'

WITH playerCountPerTeam AS (
SELECT COUNT(pname) AS playerCount
FROM hasPlayedFor
GROUP BY tname)
SELECT AVG(playerCount)
from playerCountPerTeam;



\echo 'Problem 4:Find the names of the players who played the SmallForward position but did not play for the Spurs.'

\echo 'Result should be:\npname\nIguodala\n'

WITH notSpursPlayer AS 
(
	SELECT pname
	FROM player
	EXCEPT
	SELECT pname
	FROM hasPlayedFor
	WHERE tname = 'Spurs'
)
SELECT player.pname
FROM notSpursPlayer, player
WHERE player.pname = notSpursPlayer.pname AND player.position = 'SmallForward';




\echo 'Problem 5: Find the colleges of the players who have played for both the team named the 'Spurs' and the team named 'Bucks'.'

\echo 'Result should be:\ncollege\nMaryland\n'

WITH spursAndBucksPlayers AS
(
	SELECT pname
	FROM hasPlayedFor
	WHERE tname = 'Spurs'
    INTERSECT
    SELECT pname
    FROM hasPlayedFor
    WHERE tname = 'Bucks'
)
SELECT college
FROM spursAndBucksPlayers, player
WHERE player.pname = spursAndBucksPlayers.pname;



\echo 'Problem 6: Find the colleges which have had either players who have played for the 'Hornets' or who play the 'Center' position.'

\echo 'Result should be:\ncollege\nWisconsin\nWakeForest\nMaryland\n'

WITH hornetsOrCenterPlayer AS
(
	SELECT pname 
	FROM hasPlayedFor
	WHERE tname = 'Hornets'
	UNION
	SELECT pname
	FROM player
	WHERE position = 'Center'
)
SELECT college
FROM hornetsOrCenterPlayer, player
WHERE player.pname = hornetsOrCenterPlayer.pname;



\echo 'Problem 7: Find the position which the largest number of players play. If one than one position is tied for the largest numbers of players, then all the tied positions are in the result table.'

\echo 'Result should be:\nposition\nSG\n'

WITH playerCountPerPosition AS
(
	SELECT position, COUNT(pname) AS playerCount
	FROM player
	GROUP BY position
)
SELECT position
FROM playerCountPerPosition
WHERE playerCount = (SELECT MAX(playerCount) FROM playerCountPerPosition);



\echo 'Problem 8: Find the cities of the teams that the player named “Leonard” has played for.'

\echo 'Result should be:\ncity\nSanAntonio\n'

SELECT city
FROM hasPlayedFor NATURAL JOIN team
WHERE pname = 'Leonard';



\echo 'Problem 9: Find the college that has had the most players who have played the 'Point Guard' position who have played for at least one team. Note that a player is listed in the players relation does not imply that the have played for any teams.'

\echo 'Result should be:\ncollege\nWakeForest\n'

WITH playerCountPerCollege AS
(
	WITH teamPlayer AS
	(
		SELECT pname
		FROM hasPlayedFor
	)
	SELECT college, COUNT(pname) as playerCount
	FROM teamPlayer NATURAL JOIN player
	WHERE position = 'PointGuard'
    GROUP BY college
)
SELECT college
FROM playerCountPerCollege
WHERE playerCount = (SELECT MAX(playerCount) FROM playerCountPerCollege);



\echo 'Problem 10: Find the names of the players who have not played for any team. Note that a player is listed in the players relation does not imply that the have played for any teams.'

\echo 'Result should be:\npname\nSmith\n'

SELECT pname
FROM player
EXCEPT
SELECT pname
FROM hasPlayedFor;



\echo 'Problem 11: Find the names of the players taller than every player who went to college at WCU.'

\echo 'Result should be:\npname\nDuncan\nParker\nKaminsky\nMalone\nSmith\n'

WITH maxHeightOfWcuPlayers AS
(
	SELECT MAX(height) AS maxHeight
	FROM player
	WHERE college = 'WCU'
)
SELECT pname
FROM player, maxHeightOfWcuPlayers
WHERE height > maxHeightOfWcuPlayers.maxHeight;



\i drop_tables.sql
