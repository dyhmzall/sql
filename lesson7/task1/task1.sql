-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

-- посмотрим список пользователей
SELECT *
FROM `users`;

-- посмотрим список заказов
SELECT *
FROM `orders`;

-- вставим пару заказов
INSERT INTO `orders`
VALUES (1, 1, NOW(), NOW());
INSERT INTO `orders`
VALUES (2, 2, NOW(), NOW());
INSERT INTO `orders`
VALUES (3, 3, NOW(), NOW());
INSERT INTO `orders`
VALUES (4, 1, NOW(), NOW());
INSERT INTO `orders`
VALUES (5, 1, NOW(), NOW());

-- найдем пользователей, у которы есть заказы
SELECT *
FROM `users` AS `u`
         JOIN `orders` AS `o` ON `u`.`id` = `o`.`user_id`;

-- найдем имена пользователей, у которых есть заказы
SELECT `u`.`id`, `u`.`name`
FROM `users` AS `u`
         JOIN `orders` AS `o` ON `u`.`id` = `o`.`user_id`;

-- найдем имена пользователей, у которых есть заказы без повторений
SELECT DISTINCT `u`.`id`, `u`.`name`
FROM `users` AS `u`
         JOIN `orders` AS `o` ON `u`.`id` = `o`.`user_id`;