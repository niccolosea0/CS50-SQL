-- EXPLAIN QUERY PLAN
-- SELECT "courses"."title", "courses"."semester"
-- FROM "enrollments"
-- JOIN "courses" ON "enrollments"."course_id" = "courses"."id"
-- JOIN "students" ON "enrollments"."student_id" = "students"."id"
-- WHERE "students"."id" = 3;

-- CREATE INDEX "student_id_index" ON "students"("id");

-- EXPLAIN QUERY PLAN
-- SELECT "id", "name"
-- FROM "students"
-- WHERE "id" IN (
--     SELECT "student_id"
--     FROM "enrollments"
--     WHERE "course_id" = (
--         SELECT "id"
--         FROM "courses"
--         WHERE "courses"."department" = 'Computer Science'
--         AND "courses"."number" = 50
--         AND "courses"."semester" = 'Fall 2023'
--     )
-- );

-- CREATE INDEX "courses_id_index" ON "courses" ("id")
-- WHERE "departament" = 'Computer Science' AND "number" = 50;


-- EXPLAIN QUERY PLAN
-- SELECT "courses"."id", "courses"."department", "courses"."number", "courses"."title", COUNT(*) AS "enrollment"
-- FROM "courses"
-- JOIN "enrollments" ON "enrollments"."course_id" = "courses"."id"
-- WHERE "courses"."semester" = 'Fall 2023'
-- GROUP BY "courses"."id"
-- ORDER BY "enrollment" DESC;

-- CREATE INDEX "courses_semester_index" ON "courses" ("semester")
-- WHERE "semester" = 'Fall 2023';

-- CREATE INDEX "enrollments_course_id" ON "enrollments" ("course_id");

-- EXPLAIN QUERY PLAN
-- SELECT "courses"."id", "courses"."department", "courses"."number", "courses"."title"
-- FROM "courses"
-- WHERE "courses"."department" = 'Computer Science'
-- AND "courses"."semester" = 'Spring 2024';

-- CREATE INDEX "courses_department_index" ON "courses" ("department");

EXPLAIN QUERY PLAN
SELECT "requirements"."name"
FROM "requirements"
WHERE "requirements"."id" = (
    SELECT "requirement_id"
    FROM "satisfies"
    WHERE "course_id" = (
        SELECT "id"
        FROM "courses"
        WHERE "title" = 'Advanced Databases'
        AND "semester" = 'Fall 2023'
    )
);
