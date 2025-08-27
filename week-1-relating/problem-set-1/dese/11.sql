-- Is there a relationship between school expenditures and graduation rates? In 11.sql, write a SQL query to display the names of schools,
-- their per-pupil expenditure, and their graduation rate. Sort the schools from greatest per-pupil expenditure to least.
-- If two schools have the same per-pupil expenditure, sort by school name.
-- You should assume a school spends the same amount per-pupil their district as a whole spends.

SELECT "s"."name", "e"."per_pupil_expenditure", "g"."graduated"
FROM "schools" "s"
JOIN "graduation_rates" "g" ON "s"."id" = "g"."school_id"
JOIN "districts" "d" ON "s"."district_id" = "d"."id"
JOIN "expenditures" "e" ON "d"."id" = "e"."district_id"
ORDER BY "e"."per_pupil_expenditure" DESC, "s"."name"
