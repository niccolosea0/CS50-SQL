CREATE TABLE IF NOT EXISTS "triplet" (
    "sentence_number" INTEGER,
    "character_start_number" INTEGER,
    "message_length" INTEGER
);

INSERT INTO "triplet" ("sentence_number", "character_start_number", "message_length")
VALUES
    (14, 98, 4),
    (114, 3, 5),
    (618, 72, 9),
    (630, 7, 3),
    (932, 12, 5),
    (2230, 50, 7),
    (2346, 44, 10),
    (3041, 14, 5);

CREATE VIEW "message" AS
    SELECT substr("sentence", "character_start_number", "message_length") AS "phrase"
    FROM "sentences"
    JOIN "triplet" ON "id" = "sentence_number";

