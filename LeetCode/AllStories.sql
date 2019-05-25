--620--Not Boring Movies--
--Query--
# Write your MySQL query statement below
SELECT * 
FROM cinema
where 
description <> 'boring'
AND (id%2)<>0
ORDER BY rating DESC
--