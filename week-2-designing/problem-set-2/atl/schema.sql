CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "airline_name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline_id" INTEGER,
    "depart_airport_code" TEXT NOT NULL,
    "heading_airport_code" TEXT NOT NULL,
    "expected_departure_datetime" TEXT NOT NULL,
    "expected_arrival_datetime" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);

CREATE TABLE "check-ins" (
    "id" INTEGER,
    "passenger_id" INTEGER NOT NULL,
    "check_in_datetime" TEXT NOT NULL,
    "flight_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
)
