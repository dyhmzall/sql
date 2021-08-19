DROP DATABASE IF EXISTS `tasks`;
CREATE DATABASE `tasks` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tasks`;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`
(
    `id`         SERIAL PRIMARY KEY,
    `login`      VARCHAR(255)        NOT NULL,
    `password`   CHAR(32)            NOT NULL,
    `first_name` VARCHAR(255)        NOT NULL,
    `last_name`  VARCHAR(255)        NOT NULL,
    `email`      VARCHAR(255) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects`
(
    `id`   SERIAL PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS `statuses`;
CREATE TABLE `statuses`
(
    `id`   SERIAL PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS `priorities`;
CREATE TABLE `priorities`
(
    `id`   SERIAL PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`
(
    `id`           SERIAL PRIMARY KEY,
    `status_id`    BIGINT UNSIGNED NOT NULL,
    `priority_id`  BIGINT UNSIGNED NOT NULL,
    `project_id`   BIGINT UNSIGNED NOT NULL,
    `name`         VARCHAR(255),
    `description`  TEXT,
    `url`          VARCHAR(255) COMMENT 'ссылка на задачу в сети',
    `created_at`   DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at`   DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deadline_at`  DATETIME,
    `planned_time` INT COMMENT 'запланированное время',

    FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
    FOREIGN KEY (`priority_id`) REFERENCES `priorities` (`id`),
    FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
);

DROP TABLE IF EXISTS `lists`;
CREATE TABLE `lists`
(
    `id`      SERIAL PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `name`    VARCHAR(255),

    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

DROP TABLE IF EXISTS `lists_tasks`;
CREATE TABLE `lists_tasks`
(
    `list_id` BIGINT UNSIGNED NOT NULL,
    `task_id` BIGINT UNSIGNED NOT NULL,

    PRIMARY KEY (`list_id`, `task_id`),
    FOREIGN KEY (`list_id`) REFERENCES `lists` (`id`),
    FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
);

DROP TABLE IF EXISTS `spend_times`;
CREATE TABLE `spend_times`
(
    `task_id`    BIGINT UNSIGNED NOT NULL,
    `user_id`    BIGINT UNSIGNED NOT NULL,
    `start_time` DATETIME,
    `end_time`   DATETIME,

    FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

DROP TABLE IF EXISTS `filters`;
CREATE TABLE `filters`
(
    `id`      SERIAL PRIMARY KEY,
    `name`    VARCHAR(255)    NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `url`     VARCHAR(255)    NOT NULL,

    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS `tasks_users_roles`;
CREATE TABLE `tasks_users_roles`
(
    `task_id` BIGINT UNSIGNED NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `role_id` BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
);

DROP TABLE IF EXISTS `projects_users_roles`;
CREATE TABLE `projects_users_roles`
(
    `project_id` BIGINT UNSIGNED NOT NULL,
    `user_id`    BIGINT UNSIGNED NOT NULL,
    `role_id`    BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
);

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`
(
    `id`         SERIAL PRIMARY KEY,
    `task_id`    BIGINT UNSIGNED NOT NULL,
    `user_id`    BIGINT UNSIGNED NOT NULL,
    `text`       TEXT,
    `created_at` DATETIME DEFAULT NOW(),

    FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);