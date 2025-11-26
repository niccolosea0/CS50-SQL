CREATE TABLE `Users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `Schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(128) NOT NULL,
    `founded_year` YEAR,
    PRIMARY KEY(`id`)
);

CREATE TABLE `Companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `user_connections` (
    `user1_id` INT UNSIGNED NOT NULL,
    `user2_id` INT UNSIGNED NOT NULL,

    PRIMARY KEY(`user1_id`, `user2_id`),

    FOREIGN KEY(`user1_id`) REFERENCES `Users`(`id`)
        ON DELETE CASCADE,
    FOREIGN KEY(`user2_id`) REFERENCES `Users`(`id`)
        ON DELETE CASCADE,

    CHECK(`user1_id` < `user2_id`)
);

CREATE TABLE `user_school_affliation` (
    `id` INT UNSIGNED AUTO_INCREMENT,

    `user_id` INT UNSIGNED NOT NULL,
    `school_id` INT UNSiGNED NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `degree` VARCHAR(50),

    PRIMARY KEY(`id`),

    FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`)
        ON DELETE CASCADE,
    FOREIGN KEY(`school_id`) REFERENCES `Schools`(`id`)
        ON DELETE CASCADE,

    CHECK(`end_date` IS NULL OR `end_date` >= `start_date`)
);

CREATE TABLE `user_company_affliation` (
    `id` INT UNSIGNED AUTO_INCREMENT,

    `user_id` INT UNSIGNED NOT NULL,
    `company_id` INT UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `job_title` VARCHAR(50),

    PRIMARY KEY(`id`),

    FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`)
        ON DELETE CASCADE,
    FOREIGN KEY(`company_id`) REFERENCES `Companies`(`id`)
        ON DELETE CASCADE,

    CHECK(`end_date` IS NULL OR `end_date` >= `start_date`)
);
