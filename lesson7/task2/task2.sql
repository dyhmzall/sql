-- Выведите список товаров products и разделов catalogs, который соответствует товару.

-- товары
SELECT *
FROM `products`;

SELECT `p`.`id`, `p`.`name`, `p`.`price`
FROM `products` AS `p`;

-- разделы
SELECT *
FROM `catalogs`;

SELECT `c`.`name`
FROM `catalogs` AS `c`;


-- товары с названием разделов
SELECT `p`.`id`, `p`.`name`, `p`.`price`, `c`.`name` AS 'catalog_name'
FROM `products` AS `p`
         JOIN `catalogs` AS `c` ON `p`.`catalog_id` = `c`.`id`;