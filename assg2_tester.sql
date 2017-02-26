-- use the psql command
-- \i assg2_tester.sql
-- to load and run this batch file

-- Assignment Two: Tester
-- Use the nba database. The expected results are only for the
-- database instance provided. Other database instances with
-- different results may be in evaluating the correctness of 
-- your solutions
-- @author Mark Holliday
-- @version 10 February 2017

\echo 'Problem 1: Find the names of the teams that have had at least one player be a member who also went to college at WCU.'

\echo '\nResult should be:\ntname\nTimberwolves\nRockets\nThunder\nKings\n'

\echo 'replace this line (including \echo) with your query'



\echo 'Problem 2: Find the name of each player who has been a member of at least three teams.'

\echo 'Result should be:\npname\nRedick\nIguodala\nMalone\nMartin\n'

\echo 'replace this line (including \echo) with your query'




\echo 'Problem 3: Find the average number of players who have played for a team. This query is asking for one number  that is the average over all of the teams of the number of players that have played for that team.'

\echo 'Result should be:\naverage_number_players\n1.60000\n'

\echo 'replace this line (including \echo) with your query'



\echo 'Problem 4:Find the names of the players who played the SmallForward position but did not play for the Spurs.'

\echo 'Result should be:\npname\nIguodala\n'

\echo 'replace this line (including \echo) with your query'




\echo 'Problem 5: Find the colleges of the players who have played for both the team named the 'Spurs' and the team named 'Bucks'.'

\echo 'Result should be:\ncollege\nMaryland\n'

\echo 'replace this line (including \echo) with your query'



\echo 'Problem 6: Find the colleges which have had either players who have played for the 'Hornets' or who play the 'Center' position.'

\echo 'Result should be:\ncollege\nWisconsin\nWakeForest\nMaryland\n'

\echo 'replace this line (including \echo) with your query'



\echo 'Problem 7: Find the position which the largest number of players play. If one than one position is tied for the largest numbers of players, then all the tied positions are in the result table.'

\echo 'Result should be:\nposition\nSG\n'

\echo 'replace this line (including \echo) with your query'



\echo 'Problem 8: Find the cities of the teams that the player named “Leonard” has played for.'

\echo 'Result should be:\ncity\nSanAntonio\n'

SELECT city;
FROM hasPlayedFor natural join team;
WHERE pname = 'Leonard';


\echo 'Problem 9: Find the college that has had the most players who have played the 'Point Guard' position who have played for at least one team. Note that a player is listed in the players relation does not imply that the have played for any teams.'

\echo 'Result should be:\ncollege\nWakeForest\n'

\echo 'replace this line (including \echo) with your query'



\echo 'Problem 10: Find the names of the players who have not played for any team. Note that a player is listed in the players relation does not imply that the have played for any teams.'

\echo 'Result should be:\npname\nSmith\n'

\echo 'replace this line (including \echo) with your query'



\echo 'Problem 11: Find the names of the players taller than every player who went to college at WCU.'

\echo 'Result should be:\npname\nDuncan\nParker\nKaminsky\nMalone\nSmith\n'

\echo 'replace this line (including \echo) with your query'
