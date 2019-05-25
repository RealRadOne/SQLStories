#Solutions to SQLZoo More Joins
#1.List the films where the yr is 1962 [Show id, title]
--SOL--
SELECT id, title
 FROM movie
 WHERE yr=1962
#2.Give year of 'Citizen Kane'.
--SOL--
select yr from movie where title='Citizen Kane'
#3.List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
--SOL--
select id,title,yr from movie where title like('Star Trek%')
#4.What id number does the actor 'Glenn Close' have?
--SOL--
select id from actor where name='Glenn Close'
#5.What is the id of the film 'Casablanca'
--SOL--
select id from movie where title='Casablanca'
#6.Obtain the cast list for 'Casablanca'.
--SOL--
select name from actor
join casting
on(actorid=id)
where movieid=(select id from movie where title='Casablanca')
#7.Obtain the cast list for the film 'Alien'
--SOL--
select name from actor
join casting
on(id=actorid)
where movieid=(select id from movie where title='Alien')
#8.List the films in which 'Harrison Ford' has appeared
--SOL--
select title from movie
join casting 
on(id=movieid)
where casting.actorid=(select id from actor where name='Harrison Ford')
#9.List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
--SOL--
select title from movie
join casting on
(id=movieid)
where casting.actorid=(select id from actor where name='Harrison Ford')
AND casting.ord>1
#10.List the films together with the leading star for all 1962 films.
--SOL--
select movie.title,actor.name
from movie
join casting on(movie.id=movieid)
join actor on(actorid=actor.id)
where movie.yr='1962' and casting.ord=1
#11.Which were the busiest years for 'John Travolta', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
select yr,count(title)
--SOL--
from movie 
join casting
on(movie.id=casting.movieid)
where 
casting.actorid=(select id from actor where name='John Travolta')
group by movie.yr 
having count(title)>2
#12.List the film title and the leading actor for all of the films 'Julie Andrews' played in.
select movie.title,actor.name
--SOL--
from movie 
join casting on (movie.id=casting.movieid)
join actor on(actor.id=casting.actorid)
where casting.movieid IN
(
select movieid 
from casting
join actor on(actor.id=casting.actorid)
where actor.name='Julie Andrews'
)
AND casting.ord=1