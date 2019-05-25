--BASIC SELECTS
--Problem--
--Weather Observation Station-6
--Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
--SOL--
select city from station where
city like 'a%' or 
city like 'e%' or 
city like 'i%' or
city like 'o%' or 
city like 'u%'
--Weather Observation Station-7
--Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
--SOL--
select distinct(city) from station where
city like '%a' or 
city like '%e' or 
city like '%i' or
city like '%o' or 
city like '%u'
--Weather Observation Station-8
--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters.
--SOL--
select distinct(city) from station where
RIGHT(city,1) IN ('a','e','i','o','u') AND
LEFT(city,1) IN  ('a','e','i','o','u')
--Weather Observation Station-9
--Query the list of CITY names from STATION that do not start with vowels. 
--SOL--
select distinct(city) from station where
city NOT like 'a%' AND 
city NOT like 'e%' AND
city NOT like 'i%' AND
city NOT like 'o%' AND
city NOT like 'u%'
--Higher than 75
--SOL--
select Name 
from STUDENTS
where marks>75
ORDER BY 
RIGHT(Name,3),
ID ASC


