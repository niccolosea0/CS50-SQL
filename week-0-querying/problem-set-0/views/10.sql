-- In 10.sql, write a SQL query to answer a question of your choice about the prints. The query should:
-- Make use of AS to rename a column
-- Involve at least one condition, using WHERE
-- Sort by at least one column, using ORDER BY

SELECT "artist", COUNT("id") AS "Number of paintings"
FROM "views"
WHERE "birghtness" > 0.2
GROUP BY "artist"
ORDER BY "artist"
