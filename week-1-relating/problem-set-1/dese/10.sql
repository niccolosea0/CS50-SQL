-- In Massachusetts, school district expenditures are in part determined by local taxes on property (e.g., home)
-- values. In 10.sql, write a SQL query to find the 10 public school districts with the highest per-pupil expenditures.
-- Your query should return the names of the districts and the per-pupil expenditure for each.
SELECT "d"."name", "e"."per_pupil_expenditure"
FROM "districts" "d"
JOIN "expenditures" "e" ON "d"."id" = "e"."district_id"
JOIN "schools" "s" ON "d"."id" = "s"."district_id"
WHERE "s"."type" = 'Public School'
GROUP BY "d"."name"
ORDER BY "e"."per_pupil_expenditure" DESC
LIMIT 10
