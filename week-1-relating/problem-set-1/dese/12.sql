-- A parent asks you for advice on finding the best public school districts in Massachusetts.
-- In 12.sql, write a SQL query to find public school districts with above-average per-pupil expenditures and an above-average percentage of teachers rated “exemplary”.
-- Your query should return the districts’ names, along with their per-pupil expenditures and percentage of teachers rated exemplary.
-- Sort the results first by the percentage of teachers rated exemplary (high to low), then by the per-pupil expenditure (high to low).
SELECT "d"."name", "e"."per_pupil_expenditure", "sa"."exemplary"
FROM "districts" "d"
JOIN "expenditures" "e" ON "d"."id" = "e"."district_id"
JOIN "staff_evaluations" "sa" ON "d"."id" = "sa"."district_id"
WHERE "e"."per_pupil_expenditure" > (
    SELECT AVG("per_pupil_expenditure")
    FROM "expenditures"
)
AND
    "sa"."exemplary" > (
        SELECT AVG("exemplary")
        FROM "staff_evaluations"
    )
AND "d"."type" = 'Public School District'
ORDER BY "sa"."exemplary" DESC, "e"."per_pupil_expenditure" DESC


