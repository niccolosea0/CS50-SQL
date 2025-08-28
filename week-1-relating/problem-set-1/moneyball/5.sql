-- It’s a bit of a slow day in the office. Though Satchel no longer plays, in 5.sql, write a SQL query to find all teams that Satchel Paige played for.

-- Your query should return a table with a single column, one for the name of the teams.
SELECT "t"."name"
FROM "teams" "t"
JOIN "performances" "pf" ON "t"."id" = "pf"."team_id"
JOIN "players" "p" ON "pf"."player_id" = "p"."id"
WHERE "p"."first_name" = 'Satchel' AND "p"."last_name" = 'Paige'

