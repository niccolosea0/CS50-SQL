-- Write a single SQL query to list the first and last names of all players of above average height, sorted tallest to shortest, then by first and last name.

SELECT "first_name", "last_name", AVG("height") AS "Average height"
FROM "players"
GROUP BY "first_name", "last_name"
HAVING "height" > "Average height"
ORDER BY "height" DESC

