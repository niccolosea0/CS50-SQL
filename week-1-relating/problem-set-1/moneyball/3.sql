-- Your team is going to need a great home run hitter. Ken Griffey Jr., a long-time Silver Slugger and Gold Glove award winner,
-- might be a good prospect. In 3.sql, write a SQL query to find Ken Griffey Jr.’s home run history.

-- Sort by year in descending order.
-- Note that there may be two players with the name “Ken Griffey.” This Ken Griffey was born in 1969.
-- Your query should return a table with two columns, one for year and one for home runs.
SELECT "pf"."year", "pf"."HR"
FROM "performances" "pf"
JOIN "players" "p" ON "pf"."player_id" = "p"."id"
WHERE "p"."birth_year" = 1969 AND "p"."first_name" = 'Ken' AND "p"."last_name" = 'Griffey'
ORDER BY "year" DESC
