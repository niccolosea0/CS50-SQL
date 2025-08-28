-- Hits are great, but so are RBIs! In 12.sql, write a SQL query to find the players among the 10 least expensive players per hit
-- and among the 10 least expensive players per RBI in 2001.

-- Your query should return a table with two columns, one for the players’ first names and one of their last names.
-- You can calculate a player’s salary per RBI by dividing their 2001 salary by their number of RBIs in 2001.
-- You may assume, for simplicity, that a player will only have one salary and one performance in 2001.
-- Order your results by player ID, least to greatest (or alphabetically by last name, as both are the same in this case!).
-- Keep in mind the lessons you’ve learned in 10.sql and 11.sql!

SELECT "p"."first_name", "p"."last_name"
FROM "players" "p"
WHERE "p"."id" IN (
    SELECT "s"."player_id"
    FROM "salaries" "s"
    JOIN "performances" "pf" ON "s"."player_id" = "pf"."player_id" AND "s"."year" = "pf"."year"
    WHERE "pf"."H" > 0 AND "s"."year" = 2001
    ORDER BY ("s"."salary" / "pf"."H")
    LIMIT 10
) AND "p"."id" IN (
    SELECT "s"."player_id"
    FROM "salaries" "s"
    JOIN "performances" "pf" ON "s"."player_id" = "pf"."player_id" AND "s"."year" = "pf"."year"
    WHERE "pf"."RBI" > 0 AND "s"."year" = 2001
    ORDER BY ("s"."salary" / "pf"."RBI")
    LIMIT 10
)
ORDER BY "p"."id";
