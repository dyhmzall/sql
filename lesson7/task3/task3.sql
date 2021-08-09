-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
-- Поля from, to и label содержат английские названия городов, поле name — русское.
-- Выведите список рейсов flights с русскими названиями городов.

-- создадим таблицу flights
DROP TABLE IF EXISTS `flights`;
CREATE TABLE `flights`
(
    `id`   SERIAL PRIMARY KEY,
    `from` VARCHAR(255) NOT NULL,
    `to`   VARCHAR(255) NOT NULL
);

INSERT INTO `flights`
VALUES (NULL, 'moscow', 'omsk'),
       (NULL, 'novgorod', 'kazan'),
       (NULL, 'irkutsk', 'moscow'),
       (NULL, 'omsk', 'irkutsk'),
       (NULL, 'moscow', 'kazan');

SELECT *
FROM `flights`;

-- создадим таблицу cities
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities`
(
    `label` VARCHAR(255) NOT NULL,
    `name`  VARCHAR(255) NOT NULL
);

INSERT INTO `cities`
VALUES ('moscow', 'Москва'),
       ('irkutsk', 'Иркутск'),
       ('novgorod', 'Новгороод'),
       ('kazan', 'Казань'),
       ('omsk', 'Омск');

SELECT *
FROM `cities`;

-- выведем рейсы на русском языке
SELECT `flights`.*, `city_from`.`name` as 'city_from', `city_to`.`name` as 'city_to'
FROM `flights`
         JOIN `cities` AS `city_from` ON `flights`.`from` = `city_from`.`label`
         JOIN `cities` AS `city_to` ON `flights`.`to` = `city_to`.`label`
ORDER BY `flights`.`id`;