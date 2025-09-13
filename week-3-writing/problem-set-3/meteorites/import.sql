CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

.import --csv --skip 1 meteorites.csv meteorites_temp

CREATE TABLE "meteorites" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long"
);

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT
    "name",
    "class",
    CASE WHEN NULLIF("mass", '') IS NULL THEN NULL ELSE ROUND("mass", 2) END,
    "fall",  -- goes into "discovery"
    CASE WHEN NULLIF("year", '') IS NULL THEN NULL ELSE CAST("year" AS INTEGER) END,
    CASE WHEN NULLIF("lat", '') IS NULL THEN NULL ELSE ROUND("lat", 2) END,
    CASE WHEN NULLIF("long", '') IS NULL THEN NULL ELSE ROUND("long", 2) END
FROM "meteorites_temp"
WHERE "nametype" != 'Relict'
ORDER BY
    CAST("year" AS INTEGER),
    "name";
