-- Создайте представление, которое выводит название name товарной позиции из таблицы products
-- и соответствующее название каталога name из таблицы catalogs.

USE `shop`;

SELECT *
FROM `products`;

SELECT *
FROM `catalogs`;

CREATE OR REPLACE VIEW `show_products` AS
SELECT `p`.`id` as `id`, `p`.`name` AS product_name, `c`.`name` as `catalog_name`
FROM `products` AS `p`
         JOIN catalogs AS `c` ON `p`.`catalog_id` = `c`.`id`;

SELECT *
FROM show_products;

SELECT *
FROM show_products
WHERE id = 1;