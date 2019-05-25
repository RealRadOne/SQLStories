#1List each country name where the population is larger than that of 'Russia'.
--SOL--
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
#2Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
--SOL--
select name 
from world 
where continent='Europe' 
and gdp/population>
(
	select gdp/population 
	from world 
	where name='United Kingdom'
)
#3List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
--SOL--
select name,continent 
from world 
where continent 
IN ('Argentina','Australia') 
order by name
#4Which country has a population that is more than Canada but less than Poland? Show the name and the population.
--SOL--
select name,population
from world 
where 
population>(select population from world where name ='Canada') 
AND
population<(select population from world where name ='Poland')
#5Percentages of Germany
--SOL--
select 
name,concat(round((population*100)/(select population from world where name='Germany')),'%') 
from world where continent='Europe'
#7Largest in each continent
--SOL--
SELECT continent, name, population FROM world x
  WHERE population >= ALL
    (SELECT population FROM world y
        WHERE y.continent=x.continent
          AND population>0)
    