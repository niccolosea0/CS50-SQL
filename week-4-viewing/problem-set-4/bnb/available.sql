-- In available.sql, write a SQL statement to create a view named available.
-- This view should contain all dates that are available at all listings. Ensure the view contains the following columns:

-- id, which is the id of the listing from the listings table.
-- property_type, from the listings table.
-- host_name, from the listings table.
-- date, from the availabilities table, which is the date of the availability.

CREATE VIEW "available" AS
    SELECT "L"."id", "L"."property_type", "L"."host_name", "A"."date"
    FROM "listings" "L"
    JOIN "availabilities" "A" ON "L"."id" = "A"."listing_id"
    WHERE "A"."available" IS "TRUE"

