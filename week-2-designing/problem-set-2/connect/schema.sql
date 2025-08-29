CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year_founded" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL
);

CREATE TABLE "people_connections" (
    "user_id_1" INTEGER NOT NULL,
    "user_id_2" INTEGER NOT NULL,
    "connection_date" TEXT NOT NULL,
    PRIMARY KEY("user_id_1", "user_id_2"),
    FOREIGN KEY("user_id_1") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("user_id_2") REFERENCES "users"("id") ON DELETE CASCADE
);

CREATE TABLE "schools_connections" (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "school_id" INTEGER NOT NULL,
    "affiliation_start_date" TEXT NOT NULL,
    "affiliation_end_date" TEXT,
    "degree_type" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("school_id") REFERENCES "schools"("id") ON DELETE CASCADE
);

CREATE TABLE "companies_connections" (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    "affiliation_start_date" TEXT NOT NULL,
    "affiliation_end_date" TEXT,
    "user_title" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("company_id") REFERENCES "companies"("id") ON DELETE CASCADE
);
