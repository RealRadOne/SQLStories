#Solutions to SQLZoo Joins exercises
/*1.show the player, teamid, stadium and mdate for every German goal
--SOL--*/
SELECT goal.player,goal.teamid,game.stadium,game.mdate
FROM game 
JOIN goal ON(game.id=goal.matchid) where goal.teamid='GER'

--#2.Show the team1, team2 and player for every goal scored by a player called Mario 
--#SOL--
select game.team1,game.team2,goal.player 
from game
JOIN goal on (game.id=goal.matchid) where goal.player like 'Mario%'

--#3.Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
--#SOL--
select goal.player,goal.teamid,eteam.coach,goal.gtime
from eteam
join goal on (goal.teamid=eteam.id) where goal.gtime<=10

--#4.List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
--SOL--
select game.mdate,eteam.teamname
from game
join eteam on(game.team1=eteam.id) 
where eteam.coach='Fernando Santos'

--5.List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
--SOL--
select goal.player 
from goal
join game on (game.id=goal.matchid) 
where game.stadium='National Stadium, Warsaw'

--6.show the name of all players who scored a goal against Germany.
--SOL--
SELECT goal.player
FROM goal 
JOIN game ON goal.matchid = game.id 
WHERE game.team2='GER'

--7.Show teamname and the total number of goals scored.
--SOL--
SELECT teamname, count(matchid)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname

--8.Show the stadium and the number of goals scored in each stadium.
--SOL--
select game.stadium,count(goal.matchid)
from game
join goal on (game.id=goal.matchid)
group by game.stadium

--9.For every match involving 'POL', show the matchid, date and the number of goals scored.
--SOL--
select matchid,mdate,count(matchid)
from game
join goal
on(id=matchid)
where(team1='POL' OR team2='POL')
group by matchid,mdate

--10.For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
--SOL--
select matchid,mdate,count(matchid)
from goal
join game on(matchid=id)
where(teamid='GER')
group by matchid,mdate
