-- заполнение базы исходными тестовыми данными
INSERT INTO `users` (`name`, `birthday_at`, `created_at`, `updated_at`)
VALUES ('Иван', '1988-08-31', '20.10.2017 8:10', '20.10.2017 8:10'),
       ('Петр', '1990-03-19', '11.10.2018 14:20', '11.10.2018 14:20'),
       ('Саша', '1992-01-15', '6.12.2020 4:36', '6.12.2020 4:36');


-- сначала изменим содержимое полей
UPDATE `users`
SET `created_at` = STR_TO_DATE(`created_at`, '%d.%m.%Y %k:%i'),
    `updated_at` = STR_TO_DATE(`updated_at`, '%d.%m.%Y %k:%i');


-- затем изменим типо полей
ALTER TABLE `users` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `users` CHANGE `updated_at` `updated_at` DATETIME;