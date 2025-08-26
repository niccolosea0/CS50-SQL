-- In 13.sql, write a SQL query to explore a question of your choice. This query should:
-- Involve at least one condition, using WHERE with AND or OR
SELECT "title", "topic"
FROM "episodes"
WHERE "topic" LIKE "%data%" AND "season" BETWEEN 1 AND 5;
