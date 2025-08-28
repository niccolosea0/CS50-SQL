-- The general manager has asked you for a report which details each player’s name, their salary for each year they’ve been playing, and their number of home runs for each year they’ve been playing. To be precise, the table should include:

-- All player’s first names
-- All player’s last names
-- All player’s salaries
-- All player’s home runs
-- The year in which the player was paid that salary and hit those home runs

SELECT "p"."first_name", "p"."last_name", "s"."salary", "s"."year", "pf"."HR"
FROM "players" "p"
JOIN "salaries" "s" ON "p"."id" = "s"."player_id"
JOIN "performances" "pf" ON "s"."player_id" = "pf"."player_id" AND "s"."year" = "pf"."year"
ORDER BY "p"."id", "s"."year" DESC, "pf"."HR" DESC, "s"."salary" DESC
