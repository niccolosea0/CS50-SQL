-- In 13.sql, write a SQL query to answer a question you have about the data! The query should:
SELECT "s"."name", "g"."dropped"
FROM "schools" "s"
JOIN "graduation_rates" "g" ON "s"."id" = "g"."school_id"
ORDER BY "g"."dropped" DESC
