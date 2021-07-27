DROP DATABASE IF EXISTS bot;
CREATE DATABASE bot;
USE bot;

-- таблица пользователей
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(64) NOT NULL,
    `surname` VARCHAR(64) NOT NULL,
    `password` CHAR(32) NOT NULL,
    `balance` DECIMAL(11,2)
) COMMENT 'пользователи';

-- таблица проектов
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `name` VARCHAR(64) NOT NULL,
    `is_default` TINYINT(1),
    `image` VARCHAR(64),

    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- таблица ботов

-- таблица типов ботов (квиз, фидбек, консультант, продажник и тд)

-- таблица элементов ботов

-- таблица платежных транзакций (пополнения счета, расход, вывод)

--