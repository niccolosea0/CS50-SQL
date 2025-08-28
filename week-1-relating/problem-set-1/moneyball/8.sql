-- How much would the A’s need to pay to get the best home run hitter this past season?
-- In 8.sql, write a SQL query to find the 2001 salary of the player who hit the most home runs in 2001.

-- Your query should return a table with one column, the salary of the player.
SELECT "s"."salary"
FROM "salaries" "s"
JOIN "performances" "p" ON "s"."player_id" = "p"."player_id"
WHERE "s"."year" = 2001 AND "p"."HR" = (
    SELECT MAX("hr")
    FROM "performances"
)
