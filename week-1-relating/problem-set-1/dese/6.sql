-- DESE wants to assess which schools achieved a 100% graduation rate.
-- In 6.sql, write a SQL query to find the names of schools (public or charter!) that reported a 100% graduation rate.

SELECT "s"."name"
FROM "schools" "s"
JOIN "graduation_rates" "g" ON "s"."id" = "g"."school_id"
WHERE "g"."graduated" = 100;
