CREATE DATABASE `linkedin`;

USE `linkedin`;

CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    `founded_year` YEAR NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `industry` VARCHAR(16) NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `connection_users` (
    `id` INT AUTO_INCREMENT,
    `person_a_id` INT,
    `person_b_id` INT,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`person_a_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`person_b_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `connection_schools` (
    `id` INT AUTO_INCREMENT,
    `student_id` INT,
    `school_id` INT,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `degree_pursued` VARCHAR(8) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`student_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE `connection_work` (
    `id` INT AUTO_INCREMENT,
    `employee_id` INT,
    `company_id` INT,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `position` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`employee_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);
