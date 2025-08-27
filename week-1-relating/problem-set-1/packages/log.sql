
-- *** The Lost Letter ***
-- SELECT "address", "type"
-- FROM "addresses"
-- WHERE "id" = (
--     SELECT "to_address_id"
--     FROM "packages"
--     WHERE "contents" LIKE "%Congratulatory letter%"
-- )


-- *** The Devious Delivery ***
SELECT *
FROM "packages"
WHERE "from_address_id" IS NULL;

-- +------+---------------+-----------------+---------------+
-- |  id  |   contents    | from_address_id | to_address_id |
-- +------+---------------+-----------------+---------------+
-- | 5098 | Duck debugger | NULL            | 50            |
-- +------+---------------+-----------------+---------------+

SELECT *
FROM scans
WHERE "package_id" = 5098;

-- +-------+-----------+------------+------------+--------+----------------------------+
-- |  id   | driver_id | package_id | address_id | action |         timestamp          |
-- +-------+-----------+------------+------------+--------+----------------------------+
-- | 30123 | 10        | 5098       | 50         | Pick   | 2023-10-24 08:40:16.246648 |
-- | 30140 | 10        | 5098       | 348        | Drop   | 2023-10-24 10:08:55.610754 |
-- +-------+-----------+------------+------------+--------+----------------------------+

SELECT *
FROM "addresses"
WHERE "id" = 348;
-- +-----+------------------+----------------+
-- | id  |     address      |      type      |
-- +-----+------------------+----------------+
-- | 348 | 7 Humboldt Place | Police Station |
-- +-----+------------------+----------------+

-- *** The Forgotten Gift ***
SELECT *
FROM "scans"
WHERE "package_id" = (
    SELECT "id"
    FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id"
        FROM "addresses"
        WHERE "address" = '109 Tileston Street'
    )
);
-- +-------+-----------+------------+------------+--------+----------------------------+
-- |  id   | driver_id | package_id | address_id | action |         timestamp          |
-- +-------+-----------+------------+------------+--------+----------------------------+
-- | 10432 | 11        | 9523       | 9873       | Pick   | 2023-08-16 21:41:43.219831 |
-- | 10500 | 11        | 9523       | 7432       | Drop   | 2023-08-17 03:31:36.856889 |
-- | 12432 | 17        | 9523       | 7432       | Pick   | 2023-08-23 19:41:47.913410 |
-- +-------+-----------+------------+------------+--------+----------------------------+
SELECT "name"
FROM "drivers"
WHERE "id" = 17
-- +-------+
-- | name  |
-- +-------+
-- | Mikel |
-- +-------+
